`timescale 1ns/1ns

`include "../Verilog/rtl/dimension.v"

module tb_conv3d_1kernel_1channel;
    // // path on Ubuntu
    // parameter Image_Channel0 = "../Data/3_data_in/data_fp_sun_01_channel_000.txt";
    // parameter Image_Channel1 = "../Data/3_data_in/data_fp_sun_01_channel_001.txt";
    // parameter Image_Channel2 = "../Data/3_data_in/data_fp_sun_01_channel_002.txt";
    // // EXTEND
    parameter Image_Channel0 = "../Data/4_data_out/block3_conv3_temp/modelsim_temp_block3_conv3_daisy_v2_000.txt";
    parameter Image_Channel1 = "../Data/4_data_out/block3_conv3_temp/modelsim_temp_block3_conv3_daisy_v2_001.txt";
    parameter Image_Channel2 = "../Data/4_data_out/block3_conv3_temp/modelsim_temp_block3_conv3_daisy_v2_002.txt";
    parameter Image_Channel3 = "../Data/4_data_out/block3_conv3_temp/modelsim_temp_block3_conv3_daisy_v2_003.txt";
    parameter Image_Channel4 = "../Data/4_data_out/block3_conv3_temp/modelsim_temp_block3_conv3_daisy_v2_004.txt";
    parameter Image_Channel5 = "../Data/4_data_out/block3_conv3_temp/modelsim_temp_block3_conv3_daisy_v2_005.txt";
    parameter Image_Channel6 = "../Data/4_data_out/block3_conv3_temp/modelsim_temp_block3_conv3_daisy_v2_006.txt";
    parameter Image_Channel7 = "../Data/4_data_out/block3_conv3_temp/modelsim_temp_block3_conv3_daisy_v2_007.txt";

    // parameter Image_Channel8  = "../Data/4_data_out/block4_conv1_temp/modelsim_temp_block4_conv1_sun_008.txt";
    // parameter Image_Channel9  = "../Data/4_data_out/block4_conv1_temp/modelsim_temp_block4_conv1_sun_009.txt";
    // parameter Image_Channel10 = "../Data/4_data_out/block4_conv1_temp/modelsim_temp_block4_conv1_sun_0010.txt";
    // parameter Image_Channel11 = "../Data/4_data_out/block4_conv1_temp/modelsim_temp_block4_conv1_sun_0011.txt";
    // parameter Image_Channel12 = "../Data/4_data_out/block4_conv1_temp/modelsim_temp_block4_conv1_sun_0012.txt";
    // parameter Image_Channel13 = "../Data/4_data_out/block4_conv1_temp/modelsim_temp_block4_conv1_sun_0013.txt";
    // parameter Image_Channel14 = "../Data/4_data_out/block4_conv1_temp/modelsim_temp_block4_conv1_sun_0014.txt";
    // parameter Image_Channel15 = "../Data/4_data_out/block4_conv1_temp/modelsim_temp_block4_conv1_sun_0015.txt";
    


    // parameter Outfile_0   = "../Data/4_data_out/block4_to_5_to_pool_temp/sim_temp_block4_to_5_to_pool_sun_000.txt";
    // parameter Outfile_1   = "../Data/4_data_out/block4_to_5_to_pool_temp/sim_temp_block4_to_5_to_pool_sun_001.txt";
    // parameter Outfile_2   = "../Data/4_data_out/block4_to_5_to_pool_temp/sim_temp_block4_to_5_to_pool_sun_002.txt";
    // parameter Outfile_3   = "../Data/4_data_out/block4_to_5_to_pool_temp/sim_temp_block4_to_5_to_pool_sun_003.txt";
    // parameter Outfile_4   = "../Data/4_data_out/block4_to_5_to_pool_temp/sim_temp_block4_to_5_to_pool_sun_004.txt";
    // parameter Outfile_5   = "../Data/4_data_out/block4_to_5_to_pool_temp/sim_temp_block4_to_5_to_pool_sun_005.txt";
    // parameter Outfile_6   = "../Data/4_data_out/block4_to_5_to_pool_temp/sim_temp_block4_to_5_to_pool_sun_006.txt";
    // parameter Outfile_7   = "../Data/4_data_out/block4_to_5_to_pool_temp/sim_temp_block4_to_5_to_pool_sun_007.txt";
    // // // EXTEND
    // parameter Outfile_8    = "../Data/4_data_out/block4_to_5_to_pool_temp/sim_temp_block4_to_5_to_pool_sun_008.txt";
    // parameter Outfile_9    = "../Data/4_data_out/block4_to_5_to_pool_temp/sim_temp_block4_to_5_to_pool_sun_009.txt";
    // parameter Outfile_10   = "../Data/4_data_out/block4_to_5_to_pool_temp/sim_temp_block4_to_5_to_pool_sun_0010.txt";
    // parameter Outfile_11   = "../Data/4_data_out/block4_to_5_to_pool_temp/sim_temp_block4_to_5_to_pool_sun_0011.txt";
    // parameter Outfile_12   = "../Data/4_data_out/block4_to_5_to_pool_temp/sim_temp_block4_to_5_to_pool_sun_0012.txt";
    // parameter Outfile_13   = "../Data/4_data_out/block4_to_5_to_pool_temp/sim_temp_block4_to_5_to_pool_sun_0013.txt";
    // parameter Outfile_14   = "../Data/4_data_out/block4_to_5_to_pool_temp/sim_temp_block4_to_5_to_pool_sun_0014.txt";
    // parameter Outfile_15   = "../Data/4_data_out/block4_to_5_to_pool_temp/sim_temp_block4_to_5_to_pool_sun_0015.txt";

    parameter Outfile   = "../Data/4_data_out/block4_to_5_to_sig_temp/sim_temp_block4_to_5_to_sig_sun.txt";


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

    // wire [31:0] data_in_8 ;
    // wire [31:0] data_in_9 ;
    // wire [31:0] data_in_10;
    // wire [31:0] data_in_11;
    // wire [31:0] data_in_12;
    // wire [31:0] data_in_13;
    // wire [31:0] data_in_14;
    // wire [31:0] data_in_15;



    wire   [DATA_WIDTH-1:0]    data_out;
    wire   image_class;
    wire    valid_out, done, done_ip;

    // wire   [DATA_WIDTH-1:0]    data_out_0;
    // wire   [DATA_WIDTH-1:0]    data_out_1;
    // wire   [DATA_WIDTH-1:0]    data_out_2;
    // wire   [DATA_WIDTH-1:0]    data_out_3;
    // wire   [DATA_WIDTH-1:0]    data_out_4;
    // wire   [DATA_WIDTH-1:0]    data_out_5;
    // wire   [DATA_WIDTH-1:0]    data_out_6;
    // wire   [DATA_WIDTH-1:0]    data_out_7;
    // // // EXTEND
    // wire   [DATA_WIDTH-1:0]    data_out_8 ;
    // wire   [DATA_WIDTH-1:0]    data_out_9 ;
    // wire   [DATA_WIDTH-1:0]    data_out_10;
    // wire   [DATA_WIDTH-1:0]    data_out_11;
    // wire   [DATA_WIDTH-1:0]    data_out_12;
    // wire   [DATA_WIDTH-1:0]    data_out_13;
    // wire   [DATA_WIDTH-1:0]    data_out_14;
    // wire   [DATA_WIDTH-1:0]    data_out_15;




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
        // .input_file(Infile), //-----------
        .input_file_0(Image_Channel0),
        .input_file_1(Image_Channel1),
        .input_file_2(Image_Channel2),
        // // EXTEND
        .input_file_3(Image_Channel3),
        .input_file_4(Image_Channel4),
        .input_file_5(Image_Channel5),
        .input_file_6(Image_Channel6),
        .input_file_7(Image_Channel7),

        // .input_file_8 (Image_Channel8 ),
        // .input_file_9 (Image_Channel9 ),
        // .input_file_10(Image_Channel10),
        // .input_file_11(Image_Channel11),
        // .input_file_12(Image_Channel12),
        // .input_file_13(Image_Channel13),
        // .input_file_14(Image_Channel14),
        // .input_file_15(Image_Channel15),

        .WIDTH(`IMG_WIDTH),
        .HEIGHT(`IMG_HEIGHT),
        .NUM_IMG(`NUM_IMG),
        .NUM_LAYER(6-1)           // Edit here with value = num_layer_conv - 1
    ) generator (
        .clk(clk),
        .resetn(resetn),
        // .fifo_data(data_in),
        .fifo_data_0(data_in_0),
        .fifo_data_1(data_in_1),
        .fifo_data_2(data_in_2),
        // // EXTEND
        .fifo_data_3(data_in_3),
        .fifo_data_4(data_in_4),
        .fifo_data_5(data_in_5),
        .fifo_data_6(data_in_6),
        .fifo_data_7(data_in_7),

        // .fifo_data_8 (data_in_8 ),
        // .fifo_data_9 (data_in_9 ),
        // .fifo_data_10(data_in_10),
        // .fifo_data_11(data_in_11),
        // .fifo_data_12(data_in_12),
        // .fifo_data_13(data_in_13),
        // .fifo_data_14(data_in_14),
        // .fifo_data_15(data_in_15),

        .fifo_wrreq(valid_in)
    );


    // // Edit here for change module

    // // block1_conv1 #(
    // block1_conv2 #(
    // block4_conv1 #(
    // block4_conv2 #(
    block_demo #(
		.DATA_WIDTH(32),
        .WIDTH(`IMG_WIDTH),
        .HEIGHT(`IMG_HEIGHT)
    )
    block1 (
		.clk(clk),
		.resetn(resetn),
		.valid_in(valid_in),
		.data_in_0(data_in_0),             
		.data_in_1(data_in_1),             
		.data_in_2(data_in_2), 
        // // EXTEND
        .data_in_3(data_in_3),             
		.data_in_4(data_in_4),             
		.data_in_5(data_in_5), 
        .data_in_6(data_in_6),             
		.data_in_7(data_in_7),

        // .data_in_8 (data_in_8 ),             
		// .data_in_9 (data_in_9 ),             
		// .data_in_10(data_in_10), 
        // .data_in_11(data_in_11),             
		// .data_in_12(data_in_12), 
        // .data_in_13(data_in_13),             
		// .data_in_14(data_in_14),             
		// .data_in_15(data_in_15), 


        // .data_out_0(data_out_0),
        // .data_out_1(data_out_1),
        // .data_out_2(data_out_2),
        // .data_out_3(data_out_3),
        // .data_out_4(data_out_4),
        // .data_out_5(data_out_5),
        // .data_out_6(data_out_6),
        // .data_out_7(data_out_7),
        // // // EXTEND
        // .data_out_8 (data_out_8 ),
        // .data_out_9 (data_out_9 ),
        // .data_out_10(data_out_10),
        // .data_out_11(data_out_11),
        // .data_out_12(data_out_12),
        // .data_out_13(data_out_13),
        // .data_out_14(data_out_14),
        // .data_out_15(data_out_15),

        .data_out(data_out),
        .image_class(image_class),
		.valid_out(valid_out),
		.done(done_ip)
		);

    // tb_writer_3d #(
    //     // .output_file(Outfile),
    //     .output_file_0(Outfile_0),
    //     .output_file_1(Outfile_1),
    //     .output_file_2(Outfile_2),
    //     .output_file_3(Outfile_3),
    //     .output_file_4(Outfile_4),
    //     .output_file_5(Outfile_5),
    //     .output_file_6(Outfile_6),
    //     .output_file_7(Outfile_7),
    //     // // EXTEND
    //     .output_file_8 (Outfile_8 ),
    //     .output_file_9 (Outfile_9 ),
    //     .output_file_10(Outfile_10),
    //     .output_file_11(Outfile_11),
    //     .output_file_12(Outfile_12),
    //     .output_file_13(Outfile_13),
    //     .output_file_14(Outfile_14),
    //     .output_file_15(Outfile_15),

    //     .WIDTH(`IMG_WIDTH>>2),           // Edit here for max-pooling
    //     .HEIGHT(`IMG_HEIGHT>>2),
    //     // .WIDTH(`IMG_WIDTH),
    //     // .HEIGHT(`IMG_HEIGHT),
    //     .NUM_IMG(`NUM_IMG)
    // ) writer(
    //     .clk(clk),
    //     .resetn(resetn),

    //     .data_in_0(data_out_0),
    //     .data_in_1(data_out_1),
    //     .data_in_2(data_out_2),
    //     .data_in_3(data_out_3),
    //     .data_in_4(data_out_4),
    //     .data_in_5(data_out_5),
    //     .data_in_6(data_out_6),
    //     .data_in_7(data_out_7),
    //     // // EXTEND
    //     .data_in_8 (data_out_8 ),
    //     .data_in_9 (data_out_9 ),
    //     .data_in_10(data_out_10),
    //     .data_in_11(data_out_11),
    //     .data_in_12(data_out_12),
    //     .data_in_13(data_out_13),
    //     .data_in_14(data_out_14),
    //     .data_in_15(data_out_15),


    //     .data_valid_in(valid_out),
    //     .done(done)
    // );



    tb_writer #(
        .output_file(Outfile),
        .WIDTH(`IMG_WIDTH>>2),           // Edit here for max-pooling
        .HEIGHT(`IMG_HEIGHT>>2),         // Edit here for max-pooling
        .NUM_IMG(`NUM_IMG)
    ) writer(
        .clk(clk),
        .resetn(resetn),
        .data_in(data_out),
        .data_valid_in(valid_out),
        .done(done),

        .image_class(image_class)
    );

endmodule
