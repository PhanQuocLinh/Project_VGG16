`timescale 1ns/1ns

`include "../Verilog/rtl/dimension.v"

module top_tb_0;
    // // path on Ubuntu
    // parameter Image_Channel0 = "../Data/3_data_in/0_data/0_data_sun_000.txt";       // Edit index name here
    // parameter Image_Channel1 = "../Data/3_data_in/0_data/0_data_sun_001.txt";       // Edit index name here
    // parameter Image_Channel2 = "../Data/3_data_in/0_data/0_data_sun_002.txt";       // Edit index name here
    // // // EXTEND
    parameter Image_Channel0 = "../Data/4_data_out/3_data/3_block3_conv3_sun_000.txt";
    parameter Image_Channel1 = "../Data/4_data_out/3_data/3_block3_conv3_sun_001.txt";
    parameter Image_Channel2 = "../Data/4_data_out/3_data/3_block3_conv3_sun_002.txt";
    parameter Image_Channel3 = "../Data/4_data_out/3_data/3_block3_conv3_sun_003.txt";
    parameter Image_Channel4 = "../Data/4_data_out/3_data/3_block3_conv3_sun_004.txt";
    parameter Image_Channel5 = "../Data/4_data_out/3_data/3_block3_conv3_sun_005.txt";
    parameter Image_Channel6 = "../Data/4_data_out/3_data/3_block3_conv3_sun_006.txt";
    parameter Image_Channel7 = "../Data/4_data_out/3_data/3_block3_conv3_sun_007.txt";


    parameter Outfile   = "../Data/4_data_out/3_data/50_sun_img.txt";               // Edit index name here


    parameter k = 5;

    parameter DATA_WIDTH = 32;


    reg clk;
    reg resetn;
    wire valid_in;
    wire [31:0] data_in_0;
    wire [31:0] data_in_1;
    wire [31:0] data_in_2;
    // // EXTEND
    wire [31:0] data_in_3;
    wire [31:0] data_in_4;
    wire [31:0] data_in_5;
    wire [31:0] data_in_6;
    wire [31:0] data_in_7;



    wire   [DATA_WIDTH-1:0]    data_out;
    wire   image_class;
    wire   done, done_ip;


    wire data_wrreq, data_full;
    wire data_rdreq;
    wire data_empty;


    initial 
    begin
        $timeformat (-9, 0, " ns.", 5);
        clk = 1'b0;
        resetn = 1'b0;   
        $display("NUM_IMG=%d",`NUM_IMG);
        #(k*3/2) resetn = 1'b1;
    end

    always #k clk = ~clk;

    tb_generator_3d #(
        .DWIDTH(32),
        
        .input_file_0(Image_Channel0),
        .input_file_1(Image_Channel1),
        .input_file_2(Image_Channel2),
        // // // EXTEND
        .input_file_3(Image_Channel3),
        .input_file_4(Image_Channel4),
        .input_file_5(Image_Channel5),
        .input_file_6(Image_Channel6),
        .input_file_7(Image_Channel7),

        .WIDTH(`IMG_WIDTH>>3),
        .HEIGHT(`IMG_HEIGHT>>3),
        .NUM_IMG(`NUM_IMG) //
        // .NUM_LAYER(10-1)           // Edit here with value = num_layer_conv - 1
    ) generator (
        .clk(clk),
        .resetn(resetn),
        .fifo_full(data_full),
        .fifo_data_0(data_in_0),
        .fifo_data_1(data_in_1),
        .fifo_data_2(data_in_2),
        // // // EXTEND
        .fifo_data_3(data_in_3),
        .fifo_data_4(data_in_4),
        .fifo_data_5(data_in_5),
        .fifo_data_6(data_in_6),
        .fifo_data_7(data_in_7),

        .fifo_wrreq(data_wrreq)
    );



    vip_top #(
        .WIDTH(`IMG_WIDTH),
        .HEIGHT(`IMG_HEIGHT)
    ) vip_ins(
    .clock(clk),
    .resetn(resetn),
    //
    // .fifo_in_data  (data_in),
    .fifo_in_data_0(data_in_0),         // Edit here - num input data
    .fifo_in_data_1(data_in_1),
    .fifo_in_data_2(data_in_2),
    .fifo_in_data_3(data_in_3),
    .fifo_in_data_4(data_in_4),
    .fifo_in_data_5(data_in_5),
    .fifo_in_data_6(data_in_6),
    .fifo_in_data_7(data_in_7),

    .fifo_in_wrreq (data_wrreq), 
    .fifo_in_full  (data_full),  
    //
    .fifo_out_data  ({image_class, data_out}),     
    .fifo_out_rdreq (data_rdreq),    
    .fifo_out_empty (data_empty)
    );

    tb_writer #(
        .output_file(Outfile),
        .WIDTH(`IMG_WIDTH>>5),           // Edit here for max-pooling
        .HEIGHT(`IMG_HEIGHT>>5),         // Edit here for max-pooling
        .NUM_IMG(`NUM_IMG)
    ) writer(
        .clk(clk),
        .resetn(resetn),
        .data_in(data_out),
        // .data_valid_in(valid_out),
        .done(done),

        .image_class(image_class),

        .fifo_rdreq(data_rdreq),            // Edit here
        .fifo_empty(data_empty)             // Edit here
    );


endmodule
