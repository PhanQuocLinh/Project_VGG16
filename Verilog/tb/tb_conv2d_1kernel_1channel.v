`timescale 1ns/1ns

`include "../Verilog/rtl/dimension.v"

module tb_conv2d_1kernel_1channel;
    // // path on Window
    // parameter Infile    = "E:/LAB/LAB_20_21_HK_II/CE434-ChuyenDeTKVM/git_vgg16/VGG16/CodePythonCNN/data_image_fp.txt";
    // parameter Outfile   = "E:/LAB/LAB_20_21_HK_II/CE434-ChuyenDeTKVM/git_vgg16/VGG16/CodePythonCNN/modelsim_out_conv2d_1kernel_1channel-02.txt";
    // // path on Ubuntu
    parameter Infile    = "../Data/4_data_out/modelsim_conv2d_sun_000.txt";
    parameter Outfile   = "../Data/4_data_out/modelsim_temp_single_maxpool_sun_000.txt";

    parameter k = 5;

    parameter DATA_WIDTH = 32;

    reg clk;
    reg resetn;
    wire valid_in;
    wire [31:0] data_in;
    wire [31:0] data_out;
    wire valid_out, done;


    initial 
    begin
        clk = 1'b0;
        resetn = 1'b0;
        // valid_in = 1'b1;    
        #(k*3/2) resetn = 1'b1;
    end

    always #k clk = ~clk;

    tb_generator #(
        .DWIDTH(32),
        .input_file(Infile),
        .WIDTH(`IMG_WIDTH),
        .HEIGHT(`IMG_HEIGHT)
    ) generator (
        .clk(clk),
        .resetn(resetn),
        .fifo_data(data_in),
        .fifo_wrreq(valid_in)
    );

    // // testbench cho mach conv2d_1kernel_1channel
    // conv2d_kernel_size_3 #(
    //     .DATA_WIDTH(32),.IMG_WIDTH(`IMG_WIDTH),.IMG_HEIGHT(`IMG_HEIGHT),
    //     .kernelR0( 32'h3f800000 ),
    //     .kernelR1( 32'h3f8ccccd ),
    //     .kernelR2( 32'h3f800000 ),
    //     .kernelR3( 32'h00000000 ),
    //     .kernelR4( 32'h00000000 ),
    //     .kernelR5( 32'h00000000 ),
    //     .kernelR6( 32'hbf800000 ),
    //     .kernelR7( 32'hbf8ccccd ),
    //     .kernelR8( 32'hbf800000 )
    // )
    // conv1_0(
    //     .clk(clk),
    //     .resetn(resetn),
    //     .data_valid_in(valid_in),
    //     .data_in(data_in),
    //     .data_out(data_out),
    //     .valid_out_pixel(valid_out),
    //     .done()
    // );

    wire done_pool;
    max_pooling #(
    .DATA_WIDTH(32),
    .WIDTH(`IMG_WIDTH),
    .HEIGHT(`IMG_HEIGHT)
    )
    pooling (
    .clk(clk),
    .resetn(resetn),
    .valid_in(valid_in),
    .data_in(data_in),
    .data_out(data_out),
    .valid_out(valid_out),
    .done(done_pool)
    );

    tb_writer #(
        .output_file(Outfile),
        .WIDTH(`IMG_WIDTH>>1),
        .HEIGHT(`IMG_HEIGHT>>1)
    ) writer(
        .clk(clk),
        .resetn(resetn),
        .data_in(data_out),
        .data_valid_in(valid_out),
        .done(done)
    );

endmodule