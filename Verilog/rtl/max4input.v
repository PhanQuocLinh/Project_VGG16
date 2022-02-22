module max4input #(
    parameter DATA_WIDTH=32
    )
    (
        clk, resetn, valid_in, in1, in2, in3, in4, out, valid_out
    );
    input clk;
    
    input resetn;
    input valid_in;
    input [DATA_WIDTH-1:0] in1;
    input [DATA_WIDTH-1:0] in2;
    input [DATA_WIDTH-1:0] in3;
    input [DATA_WIDTH-1:0] in4;
    output [DATA_WIDTH-1:0] out;
    output reg valid_out;

    reg [DATA_WIDTH-1:0] maxab,maxcd,max;
    assign out = max;


    // delay_clock #(.DATA_WIDTH(1),.N_CLOCKs(2)) valid_ins(clk,resetn,1'b1,valid_in,valid_out);
    wire stage1;
    delay_clock #(.DATA_WIDTH(1),.N_CLOCKs(1)) st1_ins(clk,resetn,1'b1,valid_in,stage1);


    always @ (posedge clk or negedge resetn) 
    begin
        if (resetn == 1'b0) 
            maxab <= 0;
        else 
            if (valid_in == 1'b1) 
                if ( $signed(in1) > $signed(in2) )
                    maxab <= in1;
                else 
                    maxab <= in2;
            else 
                maxab <= maxab;
    end

    always @ (posedge clk or negedge resetn) 
    begin
        if (resetn == 1'b0)
            maxcd <= 0;
        else 
            if (valid_in == 1'b1) 
                if ( $signed(in3) > $signed(in4) ) 
                    maxcd <= in3;
                else
                    maxcd <= in4;
            else 
                maxcd <= maxcd;
    end

    always @ (posedge clk or negedge resetn) 
    begin
        if (resetn == 1'b0) 
        begin
            max <= 0;
            valid_out <= 1'b0;
        end
        else 
            if (stage1 == 1'b1)
            begin
                if ( $signed(maxab) >= $signed(maxcd) ) 
                    max <= maxab;
                else 
                    max <= maxcd;
                valid_out <= 1'b1; 
            end
            else 
            // if (stage1 == 1'b0) 
            begin
                max <= max;
                valid_out <= 1'b0;
            end 
    end
endmodule