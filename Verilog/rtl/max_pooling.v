`ifndef MAX4INPUT_INCLUDED
    `include "max4input.v"
    `define MAX4INPUT_INCLUDED
`endif
//stride = 2
// use in the scenario W, H is odd and/or even and padding is valid. 

module max_pooling #(
    parameter DATA_WIDTH = 32,
    parameter WIDTH = 56,
    parameter HEIGHT = 56
)(
    clk,
    ack,
    resetn,
    valid_in,
    data_in,
    data_out,
    valid_out,
    done
);
    input clk;
    input ack;
    input resetn;
    input valid_in;
    
    input [DATA_WIDTH-1:0] data_in;
    output [DATA_WIDTH-1:0] data_out;
    output valid_out;
    output done;

    function integer clogb2;
    input [31:0] value;
    integer 	i;
    begin
        clogb2 = 0;
        for(i = 0; 2**i <= value; i = i + 1)
            clogb2 = i + 1;
    end
	endfunction

    localparam W_COUNTER_v = clogb2(2*WIDTH-1);
	localparam W_COUNTER_1 = clogb2(WIDTH-1);
    localparam W_COUNTER_2 = clogb2((HEIGHT>>1) * (WIDTH>>1) -1);
    
    reg enable_count;
    reg counter_h;
    reg [W_COUNTER_v-1:0] counter_v;
    reg [W_COUNTER_2-1:0] counter_2;
    reg [W_COUNTER_1-1:0] counter_1;

    wire valid_max;    
    wire [DATA_WIDTH-1:0] w1,w2,w3,w4;

    wire [DATA_WIDTH-1:0] data_out_max;

    assign odd = (WIDTH%2 != 0)?1:0;
    assign w4 = data_in;
    assign data_out = data_out_max;

    always @ (posedge clk or negedge resetn) 
    begin 
        if(resetn == 1'b0)  
			counter_2 <= 0;
		else 
            if(done == 1'b1) 
                counter_2 <= 0;
            else 
                if (valid_out == 1'b1) 
                    if(counter_2 == ((HEIGHT>>1) * (WIDTH>>1) -1))
                        counter_2 <= 0;
                    else 
                        counter_2 <= counter_2 + 1;
                else 
                    counter_2 <= counter_2;
    end
    
    assign done = (counter_2 == ((HEIGHT-odd)>>1)*((WIDTH-odd)>>1) -1) & valid_out;
    reg sync;

    always @(posedge clk or negedge resetn) 
    begin // day buffer 1 input
		if(resetn == 1'b0) 
        begin
            counter_1 <= 0;
            sync <= 0;
        end
        else
            if(done == 1'b1)
            begin
                sync <= 1;
                counter_1 <= 0;
            end
            else 
            begin
                if (sync == 1'b1)
                begin
                    if (ack == 1'b1)
                    begin
                        sync <= 0;
                        counter_1 <= 0;
                    end
                    else
                    begin
                        sync <= sync;
                        counter_1 <= counter_1;
                    end
                end
                else
                // counter_1 <= 0;
                begin
                    if (valid_in == 1'b1) 
                    begin
                        if(counter_1 == WIDTH -1) 
                            counter_1 <= counter_1;
                        else 
                            counter_1 <= counter_1 + 1;
                    end
                    else 
                        counter_1 <= counter_1;
                    sync <= sync;
                end
            end         
    end

    always @(posedge clk or negedge resetn) 
    begin // day buffer 1 input
		if(resetn == 1'b0)  
            enable_count <= 1'b0;
        else 
            if(done == 1'b1)  
                enable_count <= 1'b0;
            else 
                if (valid_in == 1'b1) 
                    if(counter_1 == WIDTH -1) 
                        enable_count <= 1'b1;
                    else 
                        enable_count <= enable_count;
                else 
                    enable_count <= enable_count;           // NOTE
    end

    //enable counter for max pool
    wire condition_count_h = (odd)?(counter_h == 1'b1 || counter_v == WIDTH - odd || counter_v == 2*WIDTH - odd):(counter_h == 1'b1);
    
    //counter for horizontal 
    always @(posedge clk or negedge resetn) 
    begin
		if(resetn == 1'b0) 
            counter_h <= 1'b0;
        else 
            if(done == 1'b1) 
                counter_h <= 1'b0;
            else 
                if(enable_count == 1'b1) 
                    if(valid_in == 1'b1) 
                        if(condition_count_h)  // 5 // 14-2 = 12
                            counter_h <= 1'b0;
                        else  
                            // counter_h <= counter_h + 1'b1;
                            counter_h <= 1'b1;
                    else
                        counter_h <= counter_h;                
                else 
                // if(enable_count == 1'b0) counter_h <= 0;
                    counter_h <= 1'b0;
                // end
                //else counter_h <= counter_h;
	end

    //counter for vertical 
    always @(posedge clk or negedge resetn) 
    begin
		if(resetn == 1'b0) 
            counter_v <= 0;
        else 
            if(done == 1'b1) 
                counter_v <= 0;
            else 
                if(enable_count == 1'b1)
                    if(valid_in == 1'b1) 
                        if(counter_v == 2*WIDTH -1) 
                            counter_v <= 0;
                        else 
                            counter_v <= counter_v + 1;
                    else 
                    // if(enable_count == 1'b0) 
                        counter_v <= counter_v;
                else 
                    counter_v <= counter_v;
    end

    // max enable signal
    assign valid_max = (counter_v <= WIDTH-odd && counter_h == 1'b1 && valid_in == 1'b1) ?1'b1:1'b0;
    
    
    line_buffer #(.DATA_WIDTH(DATA_WIDTH),.IMG_WIDTH(WIDTH)) 
                  lb_1(
                    clk,
                    resetn,
                    valid_in,
                    w4,
                    w2
                    );
    
    nbit_dff #(DATA_WIDTH) 
                    dff_1(
                    clk,
                    resetn,
                    valid_in,
                    w4,
                    w3
                    );

    nbit_dff #(DATA_WIDTH) 
                    dff_2(
                    clk,
                    resetn,
                    valid_in,
                    w2,
                    w1
                    );

    max4input #(DATA_WIDTH)
        max_inst  (
        clk,
        resetn,
        valid_max,
        w1,
        w2,
        w3,
        w4,
        data_out_max,
        valid_out
        );    

endmodule