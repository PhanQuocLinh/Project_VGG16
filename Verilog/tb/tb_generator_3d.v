module tb_generator_3d (
    clk,
    resetn,
    // fifo write bus
    fifo_full,              
    fifo_data_0,
    fifo_data_1,
    fifo_data_2,
    
    // EXTEND
    fifo_data_3,
    fifo_data_4,
    fifo_data_5,
    fifo_data_6,
    fifo_data_7,

    fifo_wrreq
);
    // paramenters
    parameter DWIDTH = 32;
    parameter input_file_0 = "";
    parameter input_file_1 = "";
    parameter input_file_2 = "";
    // // EXTEND
    parameter input_file_3 = "";
    parameter input_file_4 = "";
    parameter input_file_5 = "";
    parameter input_file_6 = "";
    parameter input_file_7 = "";


    parameter WIDTH = 56;
    parameter HEIGHT = 56;
    parameter NUM_IMG = 1;
    // parameter NUM_LAYER = 1;
    localparam num_data = WIDTH*HEIGHT;

    //portmap
    input clk;
    input resetn;
    input fifo_full;                        
    output [DWIDTH-1:0] fifo_data_0;
    output [DWIDTH-1:0] fifo_data_1;
    output [DWIDTH-1:0] fifo_data_2;
    // EXTEND
    output [DWIDTH-1:0] fifo_data_3;
    output [DWIDTH-1:0] fifo_data_4;
    output [DWIDTH-1:0] fifo_data_5;
    output [DWIDTH-1:0] fifo_data_6;
    output [DWIDTH-1:0] fifo_data_7;


    output reg fifo_wrreq;
    // output reg [7:0] num_data;

    integer file_in_0;
    integer file_in_1;
    integer file_in_2; 
    integer  s_data;
    // EXTEND
    integer file_in_3;
    integer file_in_4;
    integer file_in_5;
    integer file_in_6;
    integer file_in_7; 
    
    initial begin
        file_in_0 <= $fopen(input_file_0,"r"); // Read image file 
        file_in_1 <= $fopen(input_file_1,"r"); // Read image file    
        file_in_2 <= $fopen(input_file_2,"r"); // Read image file    
        // // EXTEND
        file_in_3 <= $fopen(input_file_3,"r"); // Read image file 
        file_in_4 <= $fopen(input_file_4,"r"); // Read image file    
        file_in_5 <= $fopen(input_file_5,"r"); // Read image file
        file_in_6 <= $fopen(input_file_6,"r"); // Read image file 
        file_in_7 <= $fopen(input_file_7,"r"); // Read image file 
    end 

    
    // parameter READ_CFG_STATE = 0;
    // parameter WR_DATA_STATE = 1;
    //
    reg [11:0] data_cnt;
    reg [9:0]  image_cnt;
    reg [DWIDTH-1:0] data_channel_0;          // dung de doc gia tri pixel tu file
    reg [DWIDTH-1:0] data_channel_1;          // dung de doc gia tri pixel tu file
    reg [DWIDTH-1:0] data_channel_2;          // dung de doc gia tri pixel tu file
    // EXTEND
    reg [DWIDTH-1:0] data_channel_3;          // dung de doc gia tri pixel tu file
    reg [DWIDTH-1:0] data_channel_4;          // dung de doc gia tri pixel tu file
    reg [DWIDTH-1:0] data_channel_5;          // dung de doc gia tri pixel tu file
    reg [DWIDTH-1:0] data_channel_6;          // dung de doc gia tri pixel tu file
    reg [DWIDTH-1:0] data_channel_7;          // dung de doc gia tri pixel tu file



    reg [DWIDTH-1:0] data_read_0;             // dung de lay data tren cac channel           
    reg [DWIDTH-1:0] data_read_1;             // dung de lay data tren cac channel
    reg [DWIDTH-1:0] data_read_2;             // dung de lay data tren cac channel
    // // EXTEND
    reg [DWIDTH-1:0] data_read_3;             // dung de lay data tren cac channel           
    reg [DWIDTH-1:0] data_read_4;             // dung de lay data tren cac channel
    reg [DWIDTH-1:0] data_read_5;             // dung de lay data tren cac channel
    reg [DWIDTH-1:0] data_read_6;             // dung de lay data tren cac channel           
    reg [DWIDTH-1:0] data_read_7;             // dung de lay data tren cac channel


    // reg [1:0] state;

    //
    assign fifo_data_0 = data_read_0;
    assign fifo_data_1 = data_read_1;
    assign fifo_data_2 = data_read_2;
    // // // EXTEND
    assign fifo_data_3 = data_read_3;
    assign fifo_data_4 = data_read_4;
    assign fifo_data_5 = data_read_5;
    assign fifo_data_6 = data_read_6;
    assign fifo_data_7 = data_read_7;


    // // generate random value
    // reg[15:0]a;
    // always @(posedge clk) 
    // begin
    //     a <=$urandom%10; 
    // end
    // wire data_valid_in;
    // // assign data_valid_in = a[3] | a[1];


    // reg data_valid_in;
    // reg [10:0] counter;
    // always @(posedge clk or negedge resetn) 
    // begin
    //     if (resetn == 1'b0)
    //     begin
    //         counter <= 10'b0;
    //         data_valid_in <= 1'b0;
    //     end
    //     else
    //     begin
    //         counter <= counter + 1;
    //         if (counter % 10 == 0)
    //             data_valid_in <= 1'b0;
    //         else
    //             data_valid_in <= 1'b1;
    //     end
    // end
    wire data_valid_in;
    assign data_valid_in = 1'b1;


    always @(posedge clk or negedge resetn) begin
        if (resetn == 1'b0) 
        begin
            data_cnt <= 0;
            // data_read <= 0;
            data_read_0 <= 0;
            data_read_1 <= 0;
            data_read_2 <= 0;
            fifo_wrreq <= 0;

            // EXTEND
            data_read_3 <= 0;
            data_read_4 <= 0;
            data_read_5 <= 0;
            data_read_6 <= 0;
            data_read_7 <= 0;

            image_cnt <= 0;
        end
        else 
        begin
            if (data_valid_in==1 && fifo_full == 0 ) 
            begin
                data_cnt <= data_cnt + 1;
                s_data = $fscanf(file_in_0, "%h", data_channel_0);
                s_data = $fscanf(file_in_1, "%h", data_channel_1);
                s_data = $fscanf(file_in_2, "%h", data_channel_2);
                
                // EXTEND
                s_data = $fscanf(file_in_3, "%h", data_channel_3);
                s_data = $fscanf(file_in_4, "%h", data_channel_4);
                s_data = $fscanf(file_in_5, "%h", data_channel_5);
                s_data = $fscanf(file_in_6, "%h", data_channel_6);
                s_data = $fscanf(file_in_7, "%h", data_channel_7);


                if (s_data) 
                begin
                    if(data_cnt < num_data /* * NUM_IMG*/)             
                    begin
                        fifo_wrreq <= 1;
                        //  && data_cnt > (NUM_LAYER*(WIDTH+1))
                        if ( image_cnt > NUM_IMG + 4 )              // Edit here
                        begin
                            // fifo_wrreq <= 0;            // Comment here
                            // data_read <= data;
                            data_read_0 <= 0;
                            data_read_1 <= 0;
                            data_read_2 <= 0;

                            // EXTEND
                            data_read_3 <= 0;
                            data_read_4 <= 0;
                            data_read_5 <= 0;
                            data_read_6 <= 0;
                            data_read_7 <= 0;

                        end
                        else
                        begin
                            // fifo_wrreq <= 1;            // Comment here
                            
                            data_read_0 <= data_channel_0;
                            data_read_1 <= data_channel_1;
                            data_read_2 <= data_channel_2;

                            // EXTEND
                            data_read_3 <= data_channel_3;
                            data_read_4 <= data_channel_4;
                            data_read_5 <= data_channel_5;
                            data_read_6 <= data_channel_6;
                            data_read_7 <= data_channel_7;

                        end

                    end
                    else
                        // if(data_cnt == num_data /* NUM_IMG*/)            
                    begin
                        image_cnt <= image_cnt + 1;
                        data_cnt <= 1;
                        if (image_cnt < NUM_IMG)
                            $display("%t \tSTART IMAGE %d", $time, image_cnt + 1);
                        else
                            if (image_cnt == NUM_IMG) 
                            begin    
                                $display("%t \tEND READ ALL %d IMAGE", $time, image_cnt);
                                $display("%t \tSTART TEMP IMAGE %d", $time, image_cnt + 1);
                            end
                            else
                                $display("%t \tSTART TEMP IMAGE %d", $time, image_cnt + 1);


                        // data_read <= data;
                        data_read_0 <= data_channel_0;
                        data_read_1 <= data_channel_1;
                        data_read_2 <= data_channel_2;

                        fifo_wrreq <= 1;
                        // $display("%t \tend read data", $time);

                        // EXTEND
                        data_read_3 <= data_channel_3;
                        data_read_4 <= data_channel_4;
                        data_read_5 <= data_channel_5;
                        data_read_6 <= data_channel_6;
                        data_read_7 <= data_channel_7;

                    end
                end 
                else 
                begin
                    // data_read <= data_read;
                    data_read_0 <= data_read_0;
                    data_read_1 <= data_read_1;
                    data_read_2 <= data_read_2;
                    fifo_wrreq <= 0;
                                
                    // EXTEND
                    data_read_3 <= data_read_3;
                    data_read_4 <= data_read_4;
                    data_read_5 <= data_read_5;
                    data_read_6 <= data_read_6;
                    data_read_7 <= data_read_7;

                end 
            end 
            else 
            begin
                data_cnt <= data_cnt;
                // data_read <= data_read;
                data_read_0 <= data_read_0;
                data_read_1 <= data_read_1;
                data_read_2 <= data_read_2;
                fifo_wrreq <= 0;

                // EXTEND
                data_read_3 <= data_read_3;
                data_read_4 <= data_read_4;
                data_read_5 <= data_read_5;
                data_read_6 <= data_read_6;
                data_read_7 <= data_read_7;

            end
        end
    end

endmodule