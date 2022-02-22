`ifndef ACTIVATE_INCLUDED
    `include "activate.v"
    `define ACTIVATE_INCLUDED
`endif
`ifndef MAX_POOLING_INCLUDED
    `include "max_pooling.v"
    `define MAX_POOLING_INCLUDED
`endif
`ifndef FC_INCLUDED
    `include "fully_connected_16.v"
    `define FC_INCLUDED
`endif
`ifndef SIGMOID_INCLUDED
    `include "sigmoid.v"
    `define SIGMOID_INCLUDED
`endif

module vgg16_lite_2 #(
    parameter DATA_WIDTH = 32,
    parameter WIDTH = 56,
    parameter HEIGHT = 56,
    parameter CHANNEL_OUT = 8
    ) 
    (
								// LUU Y CHINH LAI WIDTH HEIGT CHANNEL_OUT
    input	clk,
	input	resetn,
	input	valid_in,
	input	[DATA_WIDTH-1:0]	data_in_0,
	input	[DATA_WIDTH-1:0]	data_in_1,
	input	[DATA_WIDTH-1:0]	data_in_2,
	input	[DATA_WIDTH-1:0]	data_in_3,
	input	[DATA_WIDTH-1:0]	data_in_4,
	input	[DATA_WIDTH-1:0]	data_in_5,
	input	[DATA_WIDTH-1:0]	data_in_6,
	input	[DATA_WIDTH-1:0]	data_in_7,


	output	[DATA_WIDTH-1:0]	data_out,
	output 	image_class,
	output	valid_out,
	output	done
    );

	// // block 1111
	// wire [DATA_WIDTH-1:0] conv_out_1_1  [0: CHANNEL_OUT -1];   	// NOTE CHANNEL 
    // wire conv_valid_out_1_1;
    // wire done_conv_1_1;

	// wire [DATA_WIDTH-1:0] conv_out_1_2  [0: CHANNEL_OUT -1];    
    // wire conv_valid_out_1_2;
    // wire done_conv_1_2;

	// wire [DATA_WIDTH-1:0] relu_out_1_2  [0: CHANNEL_OUT -1];

	// wire [DATA_WIDTH-1:0] data_out_pool_1_2 [0: CHANNEL_OUT -1];
    // wire [CHANNEL_OUT -1 : 0] valid_out_pool_1_2;
    // wire [CHANNEL_OUT -1 : 0] done_pool_1_2;



	// // block 2222
	// wire [DATA_WIDTH-1:0] conv_out_2_1  [0: CHANNEL_OUT -1];   	// NOTE CHANNEL 
    // wire conv_valid_out_2_1;
    // wire done_conv_2_1;

	// wire [DATA_WIDTH-1:0] conv_out_2_2  [0: CHANNEL_OUT -1];    
    // wire conv_valid_out_2_2;
    // wire done_conv_2_2;

	// wire [DATA_WIDTH-1:0] relu_out_2_2  [0: CHANNEL_OUT -1];

	// wire [DATA_WIDTH-1:0] data_out_pool_2_2 [0: CHANNEL_OUT -1];
    // wire [CHANNEL_OUT -1 : 0] valid_out_pool_2_2;
    // wire [CHANNEL_OUT -1 : 0] done_pool_2_2;

	// // block 333
    // wire [DATA_WIDTH-1:0] conv_out_3_1  [0: CHANNEL_OUT -1];    
    // wire conv_valid_out_3_1;
    // wire done_conv_3_1;

    // wire [DATA_WIDTH-1:0] conv_out_3_2  [0: CHANNEL_OUT -1];    
    // wire conv_valid_out_3_2;
    // wire done_conv_3_2;

	// wire [DATA_WIDTH-1:0] conv_out_3_3  [0: CHANNEL_OUT -1];    
    // wire conv_valid_out_3_3;
    // wire done_conv_3_3;

	// wire [DATA_WIDTH-1:0] relu_out_3_3  [0: CHANNEL_OUT -1];

	// wire [DATA_WIDTH-1:0] data_out_pool_3_3 [0: CHANNEL_OUT -1];
    // wire [CHANNEL_OUT -1 : 0] valid_out_pool_3_3;
    // wire [CHANNEL_OUT -1 : 0] done_pool_3_3;

	// block 4444444444
    wire [DATA_WIDTH-1:0] conv_out_4_1  [0: CHANNEL_OUT*2 -1];    
    wire conv_valid_out_4_1;
    wire done_conv_4_1;

    wire [DATA_WIDTH-1:0] conv_out_4_2  [0: CHANNEL_OUT*2 -1];    
    wire conv_valid_out_4_2;
    wire done_conv_4_2;

	wire [DATA_WIDTH-1:0] conv_out_4_3  [0: CHANNEL_OUT*2 -1];    
    wire conv_valid_out_4_3;
    wire done_conv_4_3;

	wire [DATA_WIDTH-1:0] relu_out_4_3  [0: CHANNEL_OUT*2 -1];

    wire [DATA_WIDTH-1:0] data_out_pool_4_3 [0: CHANNEL_OUT*2 -1];
    wire [CHANNEL_OUT*2 -1 : 0] valid_out_pool_4_3;
    wire [CHANNEL_OUT*2 -1 : 0] done_pool_4_3;

	// block 5555
	wire [DATA_WIDTH-1:0] conv_out_5_1  [0: CHANNEL_OUT*2 -1];    
    wire conv_valid_out_5_1;
    wire done_conv_5_1;

	wire [DATA_WIDTH-1:0] conv_out_5_2  [0: CHANNEL_OUT*2 -1];    
    wire conv_valid_out_5_2;
    wire done_conv_5_2;

	wire [DATA_WIDTH-1:0] conv_out_5_3  [0: CHANNEL_OUT*2 -1];    
    wire conv_valid_out_5_3;
    wire done_conv_5_3;

    wire [DATA_WIDTH-1:0] relu_out_5_1  [0: CHANNEL_OUT*2 -1];
    wire [DATA_WIDTH-1:0] relu_out_5_2  [0: CHANNEL_OUT*2 -1];
    wire [DATA_WIDTH-1:0] relu_out_5_3  [0: CHANNEL_OUT*2 -1];

    wire [DATA_WIDTH-1:0] data_out_pool_5_3 [0: CHANNEL_OUT*2 -1];
    wire [CHANNEL_OUT*2 -1 : 0] valid_out_pool_5_3;
    wire [CHANNEL_OUT*2 -1 : 0] done_pool_5_3;


	wire done_sigmoid;
	wire [DATA_WIDTH-1:0] data_out_sigmoid;

    // // ASSIGN OUTPUT WITH SIGMOID ACTIVATION
	assign data_out = data_out_sigmoid;
	assign valid_out = done_sigmoid;
	assign done = done_sigmoid;

    genvar i;


    // // ------------ BLOCK 1 ------------
	// conv3d_8_kernel_3_channel_size_3 #(
	// 	.DATA_WIDTH(32),.IMG_WIDTH(WIDTH),.IMG_HEIGHT(HEIGHT),
	// 	.K0_C0_W0(32'h3e03af92), .K0_C0_W1(32'hbe312f96), .K0_C0_W2(32'hbcd59d96), .K0_C0_W3(32'hbd8c2fcf), .K0_C0_W4(32'h3bd5d77e), .K0_C0_W5(32'hbe3864f6), .K0_C0_W6(32'h3e72d9b6), .K0_C0_W7(32'hb9ac13e9), .K0_C0_W8(32'h3e2c9376), 
	// 	.K0_C1_W0(32'h3d4a40c0), .K0_C1_W1(32'h3d451008), .K0_C1_W2(32'hbe0080cb), .K0_C1_W3(32'hbd05f9a6), .K0_C1_W4(32'h3e261d8a), .K0_C1_W5(32'hbe077817), .K0_C1_W6(32'h3e14cb32), .K0_C1_W7(32'h3e2fd1ca), .K0_C1_W8(32'h3e5dddd0), 
	// 	.K0_C2_W0(32'h3dc88f42), .K0_C2_W1(32'hbe82db3a), .K0_C2_W2(32'hbe5ec93c), .K0_C2_W3(32'hbe74195a), .K0_C2_W4(32'hbe3b5440), .K0_C2_W5(32'hbe4fe93b), .K0_C2_W6(32'hbe7b9d22), .K0_C2_W7(32'hbe85a2be), .K0_C2_W8(32'hbce092ee), 
	// 	.K0_BIAS (32'h3cab182a),

	// 	.K1_C0_W0(32'hbe3aa047), .K1_C0_W1(32'hbe22ffd1), .K1_C0_W2(32'hbe3c488e), .K1_C0_W3(32'h3e67b834), .K1_C0_W4(32'h3e2f0022), .K1_C0_W5(32'h3e50f969), .K1_C0_W6(32'hbd2698bc), .K1_C0_W7(32'h3e050f19), .K1_C0_W8(32'h3e4a02a4), 
	// 	.K1_C1_W0(32'h3d5cf514), .K1_C1_W1(32'hbe17a6c0), .K1_C1_W2(32'h3e374ce4), .K1_C1_W3(32'h3dd8680f), .K1_C1_W4(32'hbe559df6), .K1_C1_W5(32'hbd9807c1), .K1_C1_W6(32'hbc350ebd), .K1_C1_W7(32'hbdf987c4), .K1_C1_W8(32'hbce9f649), 
	// 	.K1_C2_W0(32'h3e4e896e), .K1_C2_W1(32'h3e2b709c), .K1_C2_W2(32'hbe48d607), .K1_C2_W3(32'h3d0bb2ab), .K1_C2_W4(32'h3e1566b4), .K1_C2_W5(32'h3e68ef93), .K1_C2_W6(32'h3e520e89), .K1_C2_W7(32'h3e44bfc5), .K1_C2_W8(32'hbe131e67), 
	// 	.K1_BIAS (32'hbd2acfbb),

	// 	.K2_C0_W0(32'hbde3d6d9), .K2_C0_W1(32'h3e2be023), .K2_C0_W2(32'hbe5a5abd), .K2_C0_W3(32'hbe787512), .K2_C0_W4(32'hbd31b193), .K2_C0_W5(32'hbe39025f), .K2_C0_W6(32'h3e65e9ac), .K2_C0_W7(32'h3cec9e40), .K2_C0_W8(32'h3e5778c4), 
	// 	.K2_C1_W0(32'hbe4e6acd), .K2_C1_W1(32'hbd55c70c), .K2_C1_W2(32'h3dea32f4), .K2_C1_W3(32'h3d2a5010), .K2_C1_W4(32'h3e60ff92), .K2_C1_W5(32'h3d9e2189), .K2_C1_W6(32'h3d81bb62), .K2_C1_W7(32'h3e585597), .K2_C1_W8(32'h3e24cae3), 
	// 	.K2_C2_W0(32'h3b295922), .K2_C2_W1(32'hbdfa1351), .K2_C2_W2(32'h3d5d7ea8), .K2_C2_W3(32'hbdf6c2c9), .K2_C2_W4(32'h3ba3bbf5), .K2_C2_W5(32'h3e229301), .K2_C2_W6(32'h3e4380c1), .K2_C2_W7(32'h3e6986f2), .K2_C2_W8(32'h3c38988d), 
	// 	.K2_BIAS (32'hbd303aee),

	// 	.K3_C0_W0(32'h3d6f6dd4), .K3_C0_W1(32'hba8a9dba), .K3_C0_W2(32'h3d3e9bce), .K3_C0_W3(32'hbc920707), .K3_C0_W4(32'hbe71549d), .K3_C0_W5(32'hbdef8f7a), .K3_C0_W6(32'hbe5fcdf6), .K3_C0_W7(32'hbd1be1d7), .K3_C0_W8(32'hbd04d281), 
	// 	.K3_C1_W0(32'hbe2224e2), .K3_C1_W1(32'h3dcce458), .K3_C1_W2(32'hbe2aea2b), .K3_C1_W3(32'hbcdc70c8), .K3_C1_W4(32'hbe407aa9), .K3_C1_W5(32'h3d931ee0), .K3_C1_W6(32'hbd8c3b80), .K3_C1_W7(32'hbd8840d4), .K3_C1_W8(32'hbdec2044), 
	// 	.K3_C2_W0(32'h3e6847e1), .K3_C2_W1(32'h3de0270e), .K3_C2_W2(32'h3e7bf1ee), .K3_C2_W3(32'h3d51d845), .K3_C2_W4(32'hbe04fefb), .K3_C2_W5(32'hbe4ccbdb), .K3_C2_W6(32'h3d865aec), .K3_C2_W7(32'h3e4f2501), .K3_C2_W8(32'hbe0ac2f3), 
	// 	.K3_BIAS (32'hbc364f45),

	// 	.K4_C0_W0(32'hbe65e7a0), .K4_C0_W1(32'hbe73fa0f), .K4_C0_W2(32'hbe409817), .K4_C0_W3(32'h3dd38455), .K4_C0_W4(32'hbcdce87b), .K4_C0_W5(32'hbe71b1dc), .K4_C0_W6(32'hbd957f3d), .K4_C0_W7(32'h3ba86972), .K4_C0_W8(32'h3e2b3d3b), 
	// 	.K4_C1_W0(32'hbe1c7c72), .K4_C1_W1(32'h3e074da3), .K4_C1_W2(32'hbd7f7027), .K4_C1_W3(32'hbb95b79f), .K4_C1_W4(32'hbcead505), .K4_C1_W5(32'hbe271278), .K4_C1_W6(32'hbe42100f), .K4_C1_W7(32'h3d42eca7), .K4_C1_W8(32'h3e414c86), 
	// 	.K4_C2_W0(32'hbd553664), .K4_C2_W1(32'hbe460039), .K4_C2_W2(32'hbda1880c), .K4_C2_W3(32'hbdc2a06e), .K4_C2_W4(32'hbe4cee1e), .K4_C2_W5(32'hbe590e22), .K4_C2_W6(32'hbe5b6c35), .K4_C2_W7(32'h3dad79d7), .K4_C2_W8(32'hbd153384), 
	// 	.K4_BIAS (32'h3db1d5b9),

	// 	.K5_C0_W0(32'hbb0328a3), .K5_C0_W1(32'h3e00f9a8), .K5_C0_W2(32'h3df9e27f), .K5_C0_W3(32'hbbea88ec), .K5_C0_W4(32'hbaa17e91), .K5_C0_W5(32'h3e3d2986), .K5_C0_W6(32'hbe5e85cf), .K5_C0_W7(32'hbd37f3ba), .K5_C0_W8(32'h3e3bd783), 
	// 	.K5_C1_W0(32'hbe54f21f), .K5_C1_W1(32'h3d36dd48), .K5_C1_W2(32'h3e36e8d6), .K5_C1_W3(32'h3e05f992), .K5_C1_W4(32'h3db1e11d), .K5_C1_W5(32'h3e18283c), .K5_C1_W6(32'h3d836982), .K5_C1_W7(32'h3e43dd76), .K5_C1_W8(32'h3cdaeab4), 
	// 	.K5_C2_W0(32'h3d9e4690), .K5_C2_W1(32'hbd6d284d), .K5_C2_W2(32'h3e06101d), .K5_C2_W3(32'hbdf13984), .K5_C2_W4(32'h3e288f64), .K5_C2_W5(32'h3e131d7a), .K5_C2_W6(32'hbbbdf02f), .K5_C2_W7(32'h3e726a1e), .K5_C2_W8(32'h3da24f89), 
	// 	.K5_BIAS (32'hbd023697),

	// 	.K6_C0_W0(32'h3de0489a), .K6_C0_W1(32'h3d7ddc7e), .K6_C0_W2(32'hbd4271a0), .K6_C0_W3(32'h3d79500a), .K6_C0_W4(32'h3d80f05f), .K6_C0_W5(32'hbe5893dd), .K6_C0_W6(32'h3e5ac1cf), .K6_C0_W7(32'hbe0207e8), .K6_C0_W8(32'hbe148bf3), 
	// 	.K6_C1_W0(32'h3d16e19f), .K6_C1_W1(32'hbe0bea29), .K6_C1_W2(32'h3e230fb1), .K6_C1_W3(32'hbd168201), .K6_C1_W4(32'h3d6e4ec5), .K6_C1_W5(32'h3e666725), .K6_C1_W6(32'hbd121e63), .K6_C1_W7(32'h3e83786a), .K6_C1_W8(32'hbc69d90c), 
	// 	.K6_C2_W0(32'h3d534845), .K6_C2_W1(32'hbdd289fc), .K6_C2_W2(32'hbdb19d4c), .K6_C2_W3(32'h3e5b36ce), .K6_C2_W4(32'hbe5961ed), .K6_C2_W5(32'hbe7025cc), .K6_C2_W6(32'h3db48b3f), .K6_C2_W7(32'hbe13f921), .K6_C2_W8(32'hbe3866c4), 
	// 	.K6_BIAS (32'h3c1806d8),

	// 	.K7_C0_W0(32'h3e812242), .K7_C0_W1(32'hbe2943d6), .K7_C0_W2(32'h3e7fe866), .K7_C0_W3(32'hbd748e3c), .K7_C0_W4(32'hbe18999c), .K7_C0_W5(32'h3dab7d0f), .K7_C0_W6(32'hbe4846c6), .K7_C0_W7(32'h3d529ea8), .K7_C0_W8(32'h3d1eca9f), 
	// 	.K7_C1_W0(32'h3e28c13c), .K7_C1_W1(32'h3e806212), .K7_C1_W2(32'h3e0f3a6f), .K7_C1_W3(32'hbe2b6446), .K7_C1_W4(32'h3ce15d5d), .K7_C1_W5(32'hbd9917c0), .K7_C1_W6(32'hbe42c5b8), .K7_C1_W7(32'h3d5d49c6), .K7_C1_W8(32'h3d10764a), 
	// 	.K7_C2_W0(32'hbe7c9a23), .K7_C2_W1(32'h3dbf318d), .K7_C2_W2(32'h3e095cba), .K7_C2_W3(32'hbdec78c8), .K7_C2_W4(32'hbdc97c75), .K7_C2_W5(32'h3e442625), .K7_C2_W6(32'hbe42e725), .K7_C2_W7(32'hbe56a5d4), .K7_C2_W8(32'hbdffe3d1), 
	// 	.K7_BIAS (32'hb9fc0878)
	// 	)
	// 	block1_conv1(
	// 	.clk(clk),
	// 	.resetn(resetn),
	// 	.data_valid_in(valid_in),
	// 	.data_in_0(data_in_0),
	// 	.data_in_1(data_in_1),
	// 	.data_in_2(data_in_2),
	// 	.data_out_conv_0(conv_out_1_1[0]),
	// 	.data_out_conv_1(conv_out_1_1[1]),
	// 	.data_out_conv_2(conv_out_1_1[2]),
	// 	.data_out_conv_3(conv_out_1_1[3]),
	// 	.data_out_conv_4(conv_out_1_1[4]),
	// 	.data_out_conv_5(conv_out_1_1[5]),
	// 	.data_out_conv_6(conv_out_1_1[6]),
	// 	.data_out_conv_7(conv_out_1_1[7]),
	// 	.valid_out_pixel(conv_valid_out_1_1),
	// 	.done(done_conv_1_1)
	// 	);



    
	// conv3d_8_kernel_8_channel_size_3 #(
	// 	.DATA_WIDTH(32),.IMG_WIDTH(WIDTH),.IMG_HEIGHT(HEIGHT),
	// 	.K0_C0_W0(32'h3ccecfc5), .K0_C0_W1(32'hbe3ee4de), .K0_C0_W2(32'h3dca8373), .K0_C0_W3(32'h3e031761), .K0_C0_W4(32'hbe48cc72), .K0_C0_W5(32'h3e38bc63), .K0_C0_W6(32'h3df4c430), .K0_C0_W7(32'hbd08c9bc), .K0_C0_W8(32'hbd73ae30), 
	// 	.K0_C1_W0(32'hbe295179), .K0_C1_W1(32'h3e1818cf), .K0_C1_W2(32'h3dceddf8), .K0_C1_W3(32'h3d301f7e), .K0_C1_W4(32'hbe018b22), .K0_C1_W5(32'h3c795cc2), .K0_C1_W6(32'h3e002475), .K0_C1_W7(32'h3dee39f7), .K0_C1_W8(32'h3e146b21), 
	// 	.K0_C2_W0(32'h3d83425f), .K0_C2_W1(32'hbe431c54), .K0_C2_W2(32'hbd320811), .K0_C2_W3(32'h3e058014), .K0_C2_W4(32'hbdd32eb0), .K0_C2_W5(32'hbccd42d1), .K0_C2_W6(32'h3dd3b694), .K0_C2_W7(32'hbe49e14e), .K0_C2_W8(32'hbd1c0eab), 
	// 	.K0_C3_W0(32'h3dd62dfe), .K0_C3_W1(32'hbd826b69), .K0_C3_W2(32'hbd97a3bb), .K0_C3_W3(32'h3ca69d04), .K0_C3_W4(32'hbd916ad2), .K0_C3_W5(32'h3dbd60c7), .K0_C3_W6(32'hbe124c93), .K0_C3_W7(32'h3dfbcc29), .K0_C3_W8(32'hbe02606e), 
	// 	.K0_C4_W0(32'hbe12a995), .K0_C4_W1(32'h3dc2a28b), .K0_C4_W2(32'h3dcd0649), .K0_C4_W3(32'h3deedb82), .K0_C4_W4(32'h3e22cfce), .K0_C4_W5(32'hbdda45d7), .K0_C4_W6(32'h3dadf7be), .K0_C4_W7(32'hbdfd84b6), .K0_C4_W8(32'h3e483129), 
	// 	.K0_C5_W0(32'h3da226ab), .K0_C5_W1(32'h3dd910bc), .K0_C5_W2(32'h3e2f8871), .K0_C5_W3(32'hbde654d4), .K0_C5_W4(32'h3cfb399c), .K0_C5_W5(32'h3d9944ca), .K0_C5_W6(32'h3e10e53a), .K0_C5_W7(32'h3d94e3e6), .K0_C5_W8(32'hbdf09ec4), 
	// 	.K0_C6_W0(32'h3e16af5a), .K0_C6_W1(32'hbe261959), .K0_C6_W2(32'hbd91e500), .K0_C6_W3(32'h3e0c4134), .K0_C6_W4(32'hbda9e0dc), .K0_C6_W5(32'hbe13c1c1), .K0_C6_W6(32'h3d0047cd), .K0_C6_W7(32'hbdbd90f4), .K0_C6_W8(32'hbc333ba8), 
	// 	.K0_C7_W0(32'h3d591c76), .K0_C7_W1(32'h3e31c707), .K0_C7_W2(32'h3d6d79c0), .K0_C7_W3(32'h3e2c93d4), .K0_C7_W4(32'hbdb360f0), .K0_C7_W5(32'h3dacbcca), .K0_C7_W6(32'hbe0b8e67), .K0_C7_W7(32'h3d9a9b9e), .K0_C7_W8(32'h3e414233), 
	// 	.K0_BIAS (32'hbd0e78a1),

	// 	.K1_C0_W0(32'h3ce07dd2), .K1_C0_W1(32'hbe524c83), .K1_C0_W2(32'h3e1ac0b6), .K1_C0_W3(32'hbdbb5258), .K1_C0_W4(32'hbe1d5966), .K1_C0_W5(32'hbe494684), .K1_C0_W6(32'hbd97b820), .K1_C0_W7(32'h3e300dd9), .K1_C0_W8(32'hbd4f2ea6), 
	// 	.K1_C1_W0(32'h3db275e8), .K1_C1_W1(32'h3e5b2b7d), .K1_C1_W2(32'h3dcc1664), .K1_C1_W3(32'hbd1ab998), .K1_C1_W4(32'h3d08bd76), .K1_C1_W5(32'hbe17a64c), .K1_C1_W6(32'hbd950943), .K1_C1_W7(32'hbe303d8e), .K1_C1_W8(32'h3d0b4fae), 
	// 	.K1_C2_W0(32'h3e4d708c), .K1_C2_W1(32'hbdfb1d50), .K1_C2_W2(32'hbdb9012e), .K1_C2_W3(32'hbe2058f2), .K1_C2_W4(32'h3e22f275), .K1_C2_W5(32'hbd9fef4a), .K1_C2_W6(32'hbcafe35c), .K1_C2_W7(32'hbe41c3f3), .K1_C2_W8(32'h3dabb54d), 
	// 	.K1_C3_W0(32'hbce9cf9a), .K1_C3_W1(32'h3dcd1e2b), .K1_C3_W2(32'h3dc1fd73), .K1_C3_W3(32'h3cc9fd63), .K1_C3_W4(32'h3d83c59e), .K1_C3_W5(32'hbe0cb2c4), .K1_C3_W6(32'h3de61e57), .K1_C3_W7(32'h3db66261), .K1_C3_W8(32'h3e0faa4a), 
	// 	.K1_C4_W0(32'hbdc8ee1e), .K1_C4_W1(32'hbe5dfcb5), .K1_C4_W2(32'h3bb9dfcd), .K1_C4_W3(32'hbe54815e), .K1_C4_W4(32'h3e0d4fea), .K1_C4_W5(32'hbb89945f), .K1_C4_W6(32'h3d1cf714), .K1_C4_W7(32'h3e307eda), .K1_C4_W8(32'h3de359ae), 
	// 	.K1_C5_W0(32'hbd5aaacb), .K1_C5_W1(32'hbd05d3d9), .K1_C5_W2(32'hbc874fd5), .K1_C5_W3(32'hbbb2a13b), .K1_C5_W4(32'h3ddcb0bc), .K1_C5_W5(32'hbdc3ca4e), .K1_C5_W6(32'hbcb493ae), .K1_C5_W7(32'h3deb815f), .K1_C5_W8(32'hbd944e4a), 
	// 	.K1_C6_W0(32'hbd1ba18b), .K1_C6_W1(32'hbd239bf8), .K1_C6_W2(32'hbdb2029b), .K1_C6_W3(32'hbd8eec66), .K1_C6_W4(32'hbe3e2f0a), .K1_C6_W5(32'h3e1b5ede), .K1_C6_W6(32'h3d8d6bb9), .K1_C6_W7(32'hbd03bd31), .K1_C6_W8(32'hbc9042ee), 
	// 	.K1_C7_W0(32'h3de61d5d), .K1_C7_W1(32'hbe3dad10), .K1_C7_W2(32'h3db3da6b), .K1_C7_W3(32'hbe444f02), .K1_C7_W4(32'hbdbeb79b), .K1_C7_W5(32'hbe1eb2fd), .K1_C7_W6(32'h3acaceb7), .K1_C7_W7(32'h3dba3747), .K1_C7_W8(32'hbe0fb55c), 
	// 	.K1_BIAS (32'h3b1aed1d),

	// 	.K2_C0_W0(32'h3c7f1814), .K2_C0_W1(32'h3d6ca048), .K2_C0_W2(32'hbdea31cb), .K2_C0_W3(32'hbe2b6451), .K2_C0_W4(32'h3e37aa12), .K2_C0_W5(32'h3e2e3408), .K2_C0_W6(32'hbe122724), .K2_C0_W7(32'hbd238c07), .K2_C0_W8(32'h3e2e0dd9), 
	// 	.K2_C1_W0(32'hbd16e59a), .K2_C1_W1(32'hbda7398b), .K2_C1_W2(32'hbd9d7c3c), .K2_C1_W3(32'h3d9ffa76), .K2_C1_W4(32'hbe2fabde), .K2_C1_W5(32'hbda2fd9d), .K2_C1_W6(32'hbdc5b02f), .K2_C1_W7(32'h3e44847e), .K2_C1_W8(32'h3e0af18e), 
	// 	.K2_C2_W0(32'h3d3d40a0), .K2_C2_W1(32'hbd95524c), .K2_C2_W2(32'h3e4ae131), .K2_C2_W3(32'hbe1cedc2), .K2_C2_W4(32'hbdfdb925), .K2_C2_W5(32'hbd00fc37), .K2_C2_W6(32'hbe234f7d), .K2_C2_W7(32'h3e443b47), .K2_C2_W8(32'h3dd8c3c7), 
	// 	.K2_C3_W0(32'h3e361835), .K2_C3_W1(32'h3b6d1ff0), .K2_C3_W2(32'hbe19ab9a), .K2_C3_W3(32'hbe261961), .K2_C3_W4(32'h3c0d9f7f), .K2_C3_W5(32'h3d6ea544), .K2_C3_W6(32'h3dd17364), .K2_C3_W7(32'hbe1ca0b2), .K2_C3_W8(32'hbd638e4e), 
	// 	.K2_C4_W0(32'h3d90c25d), .K2_C4_W1(32'h3e0757dd), .K2_C4_W2(32'h3e05331b), .K2_C4_W3(32'hbe2aa740), .K2_C4_W4(32'hbe2dd632), .K2_C4_W5(32'h3e5d8992), .K2_C4_W6(32'hbdd670ab), .K2_C4_W7(32'hbe23adfc), .K2_C4_W8(32'h3dfaf633), 
	// 	.K2_C5_W0(32'h3b06dc62), .K2_C5_W1(32'h3e355090), .K2_C5_W2(32'hbe2bfc2c), .K2_C5_W3(32'hbe3e1e82), .K2_C5_W4(32'h3ce44e90), .K2_C5_W5(32'h3e2e89ea), .K2_C5_W6(32'h3e0f910e), .K2_C5_W7(32'hbdc708b2), .K2_C5_W8(32'h3ddbf071), 
	// 	.K2_C6_W0(32'hbdc43d98), .K2_C6_W1(32'h3dba3b41), .K2_C6_W2(32'hbe0368c2), .K2_C6_W3(32'h3e29367f), .K2_C6_W4(32'h3e27802e), .K2_C6_W5(32'hbd45fcd1), .K2_C6_W6(32'h3e482e84), .K2_C6_W7(32'hbd6c826b), .K2_C6_W8(32'h3e2e652e), 
	// 	.K2_C7_W0(32'hbd7a4d8d), .K2_C7_W1(32'hbe65fb84), .K2_C7_W2(32'hbe3c36e1), .K2_C7_W3(32'hbe1ff463), .K2_C7_W4(32'hbdd49f62), .K2_C7_W5(32'h3e5a51a9), .K2_C7_W6(32'hbe25fb82), .K2_C7_W7(32'h3cddfd13), .K2_C7_W8(32'h3d4f7979), 
	// 	.K2_BIAS (32'h3c146e9a),

	// 	.K3_C0_W0(32'h3e112158), .K3_C0_W1(32'h3d4edb4a), .K3_C0_W2(32'h3e0d70c9), .K3_C0_W3(32'h3dd21a3d), .K3_C0_W4(32'hbc1a6dc6), .K3_C0_W5(32'h3db7ac8c), .K3_C0_W6(32'hbe1e6436), .K3_C0_W7(32'hbc9f55a9), .K3_C0_W8(32'h3e209578), 
	// 	.K3_C1_W0(32'hbd16a936), .K3_C1_W1(32'hbe14b963), .K3_C1_W2(32'h3dd81528), .K3_C1_W3(32'h3d53dfa7), .K3_C1_W4(32'h3e1cb60b), .K3_C1_W5(32'h3e6381f3), .K3_C1_W6(32'hbd85b345), .K3_C1_W7(32'h3ddc9d01), .K3_C1_W8(32'h3e49ec87), 
	// 	.K3_C2_W0(32'hbe2af153), .K3_C2_W1(32'hbc2042c4), .K3_C2_W2(32'hbdb672de), .K3_C2_W3(32'hbdb9ae57), .K3_C2_W4(32'hbd8632d4), .K3_C2_W5(32'hbdaf591c), .K3_C2_W6(32'hbcb721fc), .K3_C2_W7(32'hbe43b182), .K3_C2_W8(32'h3e108898), 
	// 	.K3_C3_W0(32'h3d2aa125), .K3_C3_W1(32'h3e0a257c), .K3_C3_W2(32'hbddb28ef), .K3_C3_W3(32'hbe76ef25), .K3_C3_W4(32'hbde86434), .K3_C3_W5(32'h3de47a34), .K3_C3_W6(32'h3d522ddb), .K3_C3_W7(32'h3d81599c), .K3_C3_W8(32'hbe37a69d), 
	// 	.K3_C4_W0(32'hbd09f419), .K3_C4_W1(32'h3e52579e), .K3_C4_W2(32'h3dde820a), .K3_C4_W3(32'h3e4f760d), .K3_C4_W4(32'h3d68a497), .K3_C4_W5(32'hbd89f3ef), .K3_C4_W6(32'hbe543213), .K3_C4_W7(32'hbe3b672e), .K3_C4_W8(32'hbe6cacd0), 
	// 	.K3_C5_W0(32'hbe4b9576), .K3_C5_W1(32'hbc846b86), .K3_C5_W2(32'h3ace78a0), .K3_C5_W3(32'h3dc3d8f7), .K3_C5_W4(32'hbd4f5b7a), .K3_C5_W5(32'hbd834ad9), .K3_C5_W6(32'hbe117112), .K3_C5_W7(32'h3e59a1e8), .K3_C5_W8(32'hbe140bec), 
	// 	.K3_C6_W0(32'hbe463acb), .K3_C6_W1(32'h3d7db1ca), .K3_C6_W2(32'h3da1def6), .K3_C6_W3(32'hbe43d82b), .K3_C6_W4(32'h3e18367b), .K3_C6_W5(32'h3e2b6b9a), .K3_C6_W6(32'hbceaa7ba), .K3_C6_W7(32'h3c10fe67), .K3_C6_W8(32'hbd97d5ae), 
	// 	.K3_C7_W0(32'hbd922fb8), .K3_C7_W1(32'hbe0d1337), .K3_C7_W2(32'h3dc7912b), .K3_C7_W3(32'hbe4d1055), .K3_C7_W4(32'hbdde80b1), .K3_C7_W5(32'hbe6c651c), .K3_C7_W6(32'hbe02cb2d), .K3_C7_W7(32'h3c48681c), .K3_C7_W8(32'h3db168cc), 
	// 	.K3_BIAS (32'h3d2fb8a8),

	// 	.K4_C0_W0(32'h3e34d55c), .K4_C0_W1(32'hbacd583a), .K4_C0_W2(32'h3e0e3615), .K4_C0_W3(32'h3d3fc658), .K4_C0_W4(32'h3e447756), .K4_C0_W5(32'hbe10f3d7), .K4_C0_W6(32'hbdda511b), .K4_C0_W7(32'h3ddab716), .K4_C0_W8(32'hbcfb4931), 
	// 	.K4_C1_W0(32'hbd41e2dd), .K4_C1_W1(32'h3d09facb), .K4_C1_W2(32'hbe208db1), .K4_C1_W3(32'h3cf930f0), .K4_C1_W4(32'h3e1f3c37), .K4_C1_W5(32'h3e2513c6), .K4_C1_W6(32'hbde30784), .K4_C1_W7(32'h3dc0c3b7), .K4_C1_W8(32'hbccfd2ef), 
	// 	.K4_C2_W0(32'h3e2d991d), .K4_C2_W1(32'h3c841d57), .K4_C2_W2(32'h3dac3001), .K4_C2_W3(32'hbd9d1f42), .K4_C2_W4(32'hbd9b6c93), .K4_C2_W5(32'hbcac9f51), .K4_C2_W6(32'hbd4d15f4), .K4_C2_W7(32'h3d2e1dd5), .K4_C2_W8(32'hbd223bfd), 
	// 	.K4_C3_W0(32'hbdb886e8), .K4_C3_W1(32'hbe43196e), .K4_C3_W2(32'hbe08d271), .K4_C3_W3(32'hbe09b3f4), .K4_C3_W4(32'hbe0ed5f9), .K4_C3_W5(32'hbe562627), .K4_C3_W6(32'h3e2acfa6), .K4_C3_W7(32'hbe527ee4), .K4_C3_W8(32'hbdf8a82d), 
	// 	.K4_C4_W0(32'h3e12f28b), .K4_C4_W1(32'hbdba966e), .K4_C4_W2(32'hbe0cd8eb), .K4_C4_W3(32'hbccfb7bf), .K4_C4_W4(32'hbe01f6ef), .K4_C4_W5(32'hbd61c0fc), .K4_C4_W6(32'hbe12b3bc), .K4_C4_W7(32'hbd64b208), .K4_C4_W8(32'hbd6fde11), 
	// 	.K4_C5_W0(32'hbe396107), .K4_C5_W1(32'hbd10eba8), .K4_C5_W2(32'h3e038404), .K4_C5_W3(32'hbc5b2c4f), .K4_C5_W4(32'hbe0bf77e), .K4_C5_W5(32'h3ceff2e7), .K4_C5_W6(32'hbd11a6be), .K4_C5_W7(32'hbd4dddd0), .K4_C5_W8(32'h3e266b27), 
	// 	.K4_C6_W0(32'h3e55c773), .K4_C6_W1(32'h3e8014f8), .K4_C6_W2(32'h3d7a5ce1), .K4_C6_W3(32'h3cdec394), .K4_C6_W4(32'h3d4a4ac2), .K4_C6_W5(32'h3da8084c), .K4_C6_W6(32'h3dbf2532), .K4_C6_W7(32'hbde1115f), .K4_C6_W8(32'hbca87cc6), 
	// 	.K4_C7_W0(32'h3c8dd883), .K4_C7_W1(32'hbe2b833b), .K4_C7_W2(32'h3e1ce11d), .K4_C7_W3(32'h3c973f7c), .K4_C7_W4(32'h3ddb4e83), .K4_C7_W5(32'h3e1791d1), .K4_C7_W6(32'h3e4b36ad), .K4_C7_W7(32'h3d5316b5), .K4_C7_W8(32'h3bd095cd), 
	// 	.K4_BIAS (32'h3c4410de),

	// 	.K5_C0_W0(32'hbe01a52c), .K5_C0_W1(32'hbde9a228), .K5_C0_W2(32'hbd5f4831), .K5_C0_W3(32'h3be42213), .K5_C0_W4(32'h3cbfa79f), .K5_C0_W5(32'hbce1a844), .K5_C0_W6(32'hbd870f2e), .K5_C0_W7(32'h3a279f78), .K5_C0_W8(32'hbe65b270), 
	// 	.K5_C1_W0(32'h3e44e1f8), .K5_C1_W1(32'hbe05e89c), .K5_C1_W2(32'hbc32a486), .K5_C1_W3(32'h3e4c3f57), .K5_C1_W4(32'h3e42a233), .K5_C1_W5(32'hbd886d36), .K5_C1_W6(32'hbd4c9c42), .K5_C1_W7(32'h3ce4c0f7), .K5_C1_W8(32'h3e38789a), 
	// 	.K5_C2_W0(32'h3e037f25), .K5_C2_W1(32'h3e12a5c4), .K5_C2_W2(32'hbe36b636), .K5_C2_W3(32'h3e3ee5e4), .K5_C2_W4(32'hbe00a366), .K5_C2_W5(32'hbd058fbe), .K5_C2_W6(32'h3e3a9bf1), .K5_C2_W7(32'hbcb396f9), .K5_C2_W8(32'h3da1545b), 
	// 	.K5_C3_W0(32'hbe349152), .K5_C3_W1(32'hbd3e26a9), .K5_C3_W2(32'hbd0a3957), .K5_C3_W3(32'h3e0d2d23), .K5_C3_W4(32'h3dbb1d0a), .K5_C3_W5(32'h3e400c28), .K5_C3_W6(32'h3e4c4106), .K5_C3_W7(32'h3d6928b2), .K5_C3_W8(32'hbe0aa7e8), 
	// 	.K5_C4_W0(32'hbe227a1a), .K5_C4_W1(32'hbdd63631), .K5_C4_W2(32'hbe0d6b6d), .K5_C4_W3(32'hbdbd6068), .K5_C4_W4(32'hbdc098ee), .K5_C4_W5(32'hbd004a69), .K5_C4_W6(32'hbd98b1aa), .K5_C4_W7(32'h3d5e4cce), .K5_C4_W8(32'hbe5b1879), 
	// 	.K5_C5_W0(32'h3e37cd8d), .K5_C5_W1(32'h3bc1bd23), .K5_C5_W2(32'h3e007afe), .K5_C5_W3(32'hbdd29d24), .K5_C5_W4(32'hbc449a07), .K5_C5_W5(32'h3e17b76f), .K5_C5_W6(32'hbc021543), .K5_C5_W7(32'hbe41f3b1), .K5_C5_W8(32'h3d2af432), 
	// 	.K5_C6_W0(32'hbdf8923f), .K5_C6_W1(32'h3db49556), .K5_C6_W2(32'h3d8836be), .K5_C6_W3(32'hbe8f6b15), .K5_C6_W4(32'hbdb9c4fb), .K5_C6_W5(32'hbda2ff0a), .K5_C6_W6(32'hbd291af8), .K5_C6_W7(32'h3ddca398), .K5_C6_W8(32'h3c4d5aa6), 
	// 	.K5_C7_W0(32'h3ddf10f8), .K5_C7_W1(32'hbcc7d42e), .K5_C7_W2(32'hbddd8ef2), .K5_C7_W3(32'h3de67332), .K5_C7_W4(32'hbd9567c4), .K5_C7_W5(32'hbe6dd703), .K5_C7_W6(32'hbd5af61a), .K5_C7_W7(32'hbe06520d), .K5_C7_W8(32'h3cd46cae), 
	// 	.K5_BIAS (32'hbcc74b7d),

	// 	.K6_C0_W0(32'hbd8a0ed6), .K6_C0_W1(32'h3e101741), .K6_C0_W2(32'hbdb22e49), .K6_C0_W3(32'h3ddc8e63), .K6_C0_W4(32'h3d33a25d), .K6_C0_W5(32'hbde31f8c), .K6_C0_W6(32'h3e28c82b), .K6_C0_W7(32'hbe68de06), .K6_C0_W8(32'hbe28defd), 
	// 	.K6_C1_W0(32'h3e2229ca), .K6_C1_W1(32'hbde9204c), .K6_C1_W2(32'h3e50a8b6), .K6_C1_W3(32'h3e180dc3), .K6_C1_W4(32'hbe346850), .K6_C1_W5(32'hbda04994), .K6_C1_W6(32'hbd370d3a), .K6_C1_W7(32'h3dc4c116), .K6_C1_W8(32'h3e69f453), 
	// 	.K6_C2_W0(32'hbe4c77f2), .K6_C2_W1(32'h3d0c94f1), .K6_C2_W2(32'h3e28d408), .K6_C2_W3(32'h3e273709), .K6_C2_W4(32'hbe4a185f), .K6_C2_W5(32'h3db1d6b1), .K6_C2_W6(32'h3db2b37b), .K6_C2_W7(32'h3d8c2a81), .K6_C2_W8(32'hbe10b25c), 
	// 	.K6_C3_W0(32'hbda33507), .K6_C3_W1(32'hbde09883), .K6_C3_W2(32'h3dcb3e41), .K6_C3_W3(32'h3db41f58), .K6_C3_W4(32'hbddb06d0), .K6_C3_W5(32'h3d18f0d7), .K6_C3_W6(32'h3e16a0c4), .K6_C3_W7(32'hbd80b8bf), .K6_C3_W8(32'hbe3fb354), 
	// 	.K6_C4_W0(32'hbe02cc31), .K6_C4_W1(32'hbe2db3c4), .K6_C4_W2(32'hbd328102), .K6_C4_W3(32'h3e308105), .K6_C4_W4(32'h3c1278b2), .K6_C4_W5(32'hbdb57d3e), .K6_C4_W6(32'hbdf93aff), .K6_C4_W7(32'hbcd73943), .K6_C4_W8(32'hbe1dba2c), 
	// 	.K6_C5_W0(32'h3e43e600), .K6_C5_W1(32'hbbac5c18), .K6_C5_W2(32'h3b1d64fa), .K6_C5_W3(32'h3ca8a63f), .K6_C5_W4(32'h3e2a3722), .K6_C5_W5(32'hbdc84b33), .K6_C5_W6(32'hbd44f926), .K6_C5_W7(32'h3df7afee), .K6_C5_W8(32'h3dfbb838), 
	// 	.K6_C6_W0(32'hbdc59a52), .K6_C6_W1(32'hbca91843), .K6_C6_W2(32'h3de9c250), .K6_C6_W3(32'hbe665606), .K6_C6_W4(32'hbdc76314), .K6_C6_W5(32'h3e1a42b0), .K6_C6_W6(32'hbb389d85), .K6_C6_W7(32'hbe537bf3), .K6_C6_W8(32'hbe459e15), 
	// 	.K6_C7_W0(32'hbe6802ad), .K6_C7_W1(32'hbd4d5db6), .K6_C7_W2(32'hbd8bd697), .K6_C7_W3(32'hbe284881), .K6_C7_W4(32'h3e283928), .K6_C7_W5(32'hbdd8bfd1), .K6_C7_W6(32'h3d33e425), .K6_C7_W7(32'h3d0602b4), .K6_C7_W8(32'hbe008112), 
	// 	.K6_BIAS (32'hbd2f824c),

	// 	.K7_C0_W0(32'h3c2b4ff5), .K7_C0_W1(32'h3deef644), .K7_C0_W2(32'hbc11e300), .K7_C0_W3(32'h3c73a02e), .K7_C0_W4(32'h3c1a567d), .K7_C0_W5(32'hbd53bcab), .K7_C0_W6(32'hbe46e574), .K7_C0_W7(32'hbd8ab383), .K7_C0_W8(32'h3e16b313), 
	// 	.K7_C1_W0(32'h3e16111d), .K7_C1_W1(32'h3d86246a), .K7_C1_W2(32'hbdae7cfd), .K7_C1_W3(32'hbdc36a1a), .K7_C1_W4(32'hbe45e8b4), .K7_C1_W5(32'hbdf434ad), .K7_C1_W6(32'h3dfa7788), .K7_C1_W7(32'h3e43f88e), .K7_C1_W8(32'hbdc15aa6), 
	// 	.K7_C2_W0(32'h3d16423b), .K7_C2_W1(32'h3c8b14b8), .K7_C2_W2(32'hbe243c87), .K7_C2_W3(32'h3dfdcf3c), .K7_C2_W4(32'h3d0a5300), .K7_C2_W5(32'h3d8f93b9), .K7_C2_W6(32'hbdeb202d), .K7_C2_W7(32'h3e23b1fb), .K7_C2_W8(32'hbe0c426e), 
	// 	.K7_C3_W0(32'h3da8ffcb), .K7_C3_W1(32'h3e38fadf), .K7_C3_W2(32'h3d41a5b3), .K7_C3_W3(32'hbe4e20f2), .K7_C3_W4(32'h3d806e60), .K7_C3_W5(32'hbe182a14), .K7_C3_W6(32'h3e264bc8), .K7_C3_W7(32'hbd7b7bde), .K7_C3_W8(32'hbe075c5b), 
	// 	.K7_C4_W0(32'h3db9a226), .K7_C4_W1(32'hbe336150), .K7_C4_W2(32'hbd8be0d4), .K7_C4_W3(32'h3d06b995), .K7_C4_W4(32'h3e0cab00), .K7_C4_W5(32'hbd858853), .K7_C4_W6(32'h3e25679a), .K7_C4_W7(32'h3e331455), .K7_C4_W8(32'h3e4b7703), 
	// 	.K7_C5_W0(32'h3e1095dd), .K7_C5_W1(32'hbdf9f67c), .K7_C5_W2(32'hbcf94b9f), .K7_C5_W3(32'h3de96c6e), .K7_C5_W4(32'h3d8288ac), .K7_C5_W5(32'h3e4f95b0), .K7_C5_W6(32'h3d16f6f6), .K7_C5_W7(32'hba4453a4), .K7_C5_W8(32'hbe045b58), 
	// 	.K7_C6_W0(32'hbdbc3595), .K7_C6_W1(32'hbd0a3550), .K7_C6_W2(32'hbe2fe799), .K7_C6_W3(32'hbdf0b54c), .K7_C6_W4(32'hbdb98476), .K7_C6_W5(32'h3e10166b), .K7_C6_W6(32'hbe2885ec), .K7_C6_W7(32'hbda01d9d), .K7_C6_W8(32'hbd5b337c), 
	// 	.K7_C7_W0(32'hbd520671), .K7_C7_W1(32'hbd5dd339), .K7_C7_W2(32'h3e1291af), .K7_C7_W3(32'hbe5d3f43), .K7_C7_W4(32'hbd10382e), .K7_C7_W5(32'hbd8001ee), .K7_C7_W6(32'hbdd01d22), .K7_C7_W7(32'hbe678b5a), .K7_C7_W8(32'hbdaca6d2), 
	// 	.K7_BIAS (32'h3d22f964)
	// 	)
	// 	block1_conv2(
	// 	.clk(clk),
	// 	.resetn(resetn),
	// 	.data_valid_in(conv_valid_out_1_1),
	// 	.data_in_0(conv_out_1_1[0]),
	// 	.data_in_1(conv_out_1_1[1]),
	// 	.data_in_2(conv_out_1_1[2]),
	// 	.data_in_3(conv_out_1_1[3]),
	// 	.data_in_4(conv_out_1_1[4]),
	// 	.data_in_5(conv_out_1_1[5]),
	// 	.data_in_6(conv_out_1_1[6]),
	// 	.data_in_7(conv_out_1_1[7]),
	// 	.data_out_conv_0(conv_out_1_2[0]),
	// 	.data_out_conv_1(conv_out_1_2[1]),
	// 	.data_out_conv_2(conv_out_1_2[2]),
	// 	.data_out_conv_3(conv_out_1_2[3]),
	// 	.data_out_conv_4(conv_out_1_2[4]),
	// 	.data_out_conv_5(conv_out_1_2[5]),
	// 	.data_out_conv_6(conv_out_1_2[6]),
	// 	.data_out_conv_7(conv_out_1_2[7]),
	// 	.valid_out_pixel(conv_valid_out_1_2),
	// 	.done(done_conv_1_2)
	// 	);


    // generate
    // for (i = 0; i < CHANNEL_OUT; i=i+1) 
    // begin : relu_1_2 // needs CHANNEL_OUT relu		// Edit here - name

    //     activate #(
    //         .DATA_WIDTH(32)
    //     )
    //     relu (
    //         .in(conv_out_1_2[i]),			// Edit here
    //         .out(relu_out_1_2[i])
    //     );
    // end
    // endgenerate

    // generate
    // for (i = 0; i < CHANNEL_OUT; i=i+1) 
    // begin : max_pool_1 // needs CHANNEL_OUT max_pooling		// Edit here - name

    //     max_pooling #(
    //         .DATA_WIDTH(32),
    //         .WIDTH(WIDTH),
    //         .HEIGHT(HEIGHT)
    //     )
    //     max_pool(
    //         .clk(clk),
	// 		.ack(done_conv_1_2),					// Edit here
    //         .resetn(resetn),
    //         .valid_in(conv_valid_out_1_2),			// Edit here
    //         .data_in(relu_out_1_2[i]),
    //         .data_out(data_out_pool_1_2[i]),
    //         .valid_out(valid_out_pool_1_2[i]),
    //         .done(done_pool_1_2[i])
    //     );
    // end
    // endgenerate


    // // ------------ BLOCK 2 ------------
	// conv3d_8_kernel_8_channel_size_3 #(
	// 	.DATA_WIDTH(32),.IMG_WIDTH(WIDTH>>1),.IMG_HEIGHT(HEIGHT>>1),
	// 	.K0_C0_W0(32'hbe0af8ac), .K0_C0_W1(32'hbdafd1c5), .K0_C0_W2(32'h3e0928f7), .K0_C0_W3(32'h3d899783), .K0_C0_W4(32'hbe4b9c5c), .K0_C0_W5(32'hbe5e0af4), .K0_C0_W6(32'hbe09b2c9), .K0_C0_W7(32'hbe67cdf3), .K0_C0_W8(32'h3daada5d), 
	// 	.K0_C1_W0(32'hbbd1511b), .K0_C1_W1(32'h3e3b963b), .K0_C1_W2(32'h3d97dce4), .K0_C1_W3(32'h3e4ebc5e), .K0_C1_W4(32'h3da3e058), .K0_C1_W5(32'h3db1223d), .K0_C1_W6(32'h3e3c5a8f), .K0_C1_W7(32'h3d20b438), .K0_C1_W8(32'hbd273373), 
	// 	.K0_C2_W0(32'h3e1987e5), .K0_C2_W1(32'hbce8660e), .K0_C2_W2(32'h3c94c31f), .K0_C2_W3(32'hbd1a9219), .K0_C2_W4(32'h3e37bb6b), .K0_C2_W5(32'hbdf2d082), .K0_C2_W6(32'h3d0c9cad), .K0_C2_W7(32'h3d205be3), .K0_C2_W8(32'hbd3f4adf), 
	// 	.K0_C3_W0(32'hbe54fa8f), .K0_C3_W1(32'hbe5d84ff), .K0_C3_W2(32'hbe5552cf), .K0_C3_W3(32'h3dcea217), .K0_C3_W4(32'hbe271686), .K0_C3_W5(32'hbdece868), .K0_C3_W6(32'h3e2a06ff), .K0_C3_W7(32'h3d9a74f2), .K0_C3_W8(32'h3db574a2), 
	// 	.K0_C4_W0(32'hbd349f99), .K0_C4_W1(32'hbdbba2d7), .K0_C4_W2(32'h3de829d2), .K0_C4_W3(32'hbd00b6ea), .K0_C4_W4(32'h3d72ed9c), .K0_C4_W5(32'hbe4c7193), .K0_C4_W6(32'hbe1214cd), .K0_C4_W7(32'hbdba698a), .K0_C4_W8(32'hbde4be4c), 
	// 	.K0_C5_W0(32'hbdd04585), .K0_C5_W1(32'hbe474cb6), .K0_C5_W2(32'h3e47f2fd), .K0_C5_W3(32'h3e46688e), .K0_C5_W4(32'hbe221187), .K0_C5_W5(32'hbd865fd1), .K0_C5_W6(32'h3e3ef28e), .K0_C5_W7(32'h3e4270a1), .K0_C5_W8(32'h3d419aa9), 
	// 	.K0_C6_W0(32'hbc1726d2), .K0_C6_W1(32'h3dfb3fbe), .K0_C6_W2(32'hbdd1156c), .K0_C6_W3(32'hbc05463d), .K0_C6_W4(32'hbd7ba021), .K0_C6_W5(32'hbbef62de), .K0_C6_W6(32'h3d82676d), .K0_C6_W7(32'hbe4cec1a), .K0_C6_W8(32'hbe3d7fbe), 
	// 	.K0_C7_W0(32'h3ccd9c15), .K0_C7_W1(32'hbe24f83c), .K0_C7_W2(32'h3e027359), .K0_C7_W3(32'h3e2d277c), .K0_C7_W4(32'hbd83bf08), .K0_C7_W5(32'hbd9d94bc), .K0_C7_W6(32'hbc13dc39), .K0_C7_W7(32'h3d243579), .K0_C7_W8(32'hbe0f5aa7), 
	// 	.K0_BIAS (32'hbc6b7a74),

	// 	.K1_C0_W0(32'h3e1a10f3), .K1_C0_W1(32'h3d061187), .K1_C0_W2(32'h3cb7323d), .K1_C0_W3(32'hbe23fa7f), .K1_C0_W4(32'h3e28207f), .K1_C0_W5(32'h3c6f8b14), .K1_C0_W6(32'hbc0c9460), .K1_C0_W7(32'hbd13293f), .K1_C0_W8(32'h3e26fdae), 
	// 	.K1_C1_W0(32'h3e4db4bf), .K1_C1_W1(32'hbd44415a), .K1_C1_W2(32'h3e188d4c), .K1_C1_W3(32'hbe199a27), .K1_C1_W4(32'hbd2ad478), .K1_C1_W5(32'hbbe345e9), .K1_C1_W6(32'hbdbde4e3), .K1_C1_W7(32'h3e40f094), .K1_C1_W8(32'h3d7424dd), 
	// 	.K1_C2_W0(32'h3e348b6b), .K1_C2_W1(32'hbdfe4efb), .K1_C2_W2(32'hbdc22482), .K1_C2_W3(32'hbb6814bd), .K1_C2_W4(32'hbe016e54), .K1_C2_W5(32'h3db8070e), .K1_C2_W6(32'h3e46ac3f), .K1_C2_W7(32'h3e169dde), .K1_C2_W8(32'hbe154a44), 
	// 	.K1_C3_W0(32'hbe21da78), .K1_C3_W1(32'h3e27db6e), .K1_C3_W2(32'h3d9d196d), .K1_C3_W3(32'hbd8e59e5), .K1_C3_W4(32'hbdc5ec05), .K1_C3_W5(32'h3de0909b), .K1_C3_W6(32'h3d0ea0a9), .K1_C3_W7(32'h3e826de2), .K1_C3_W8(32'h3d100851), 
	// 	.K1_C4_W0(32'hba59e265), .K1_C4_W1(32'hbd2535c3), .K1_C4_W2(32'h3c816eea), .K1_C4_W3(32'h3c879afc), .K1_C4_W4(32'hbdd4bd82), .K1_C4_W5(32'hbe27612c), .K1_C4_W6(32'h3e03a722), .K1_C4_W7(32'h3de4558d), .K1_C4_W8(32'hbbd1544f), 
	// 	.K1_C5_W0(32'hbe4d7270), .K1_C5_W1(32'h3e1efa51), .K1_C5_W2(32'hbe56d863), .K1_C5_W3(32'h3e464ed4), .K1_C5_W4(32'hbe46f58b), .K1_C5_W5(32'h3e2d2d55), .K1_C5_W6(32'h3e3c8751), .K1_C5_W7(32'hbcf58d98), .K1_C5_W8(32'hbbce33bd), 
	// 	.K1_C6_W0(32'hbdd85eb2), .K1_C6_W1(32'h3e0143dc), .K1_C6_W2(32'hbcc1135f), .K1_C6_W3(32'h3d396bfb), .K1_C6_W4(32'h3daea43b), .K1_C6_W5(32'hbdd72992), .K1_C6_W6(32'h3e326775), .K1_C6_W7(32'h3d9d3d9d), .K1_C6_W8(32'h3e07eba0), 
	// 	.K1_C7_W0(32'h3bf8bae5), .K1_C7_W1(32'hbc9544b7), .K1_C7_W2(32'h3e69d9c8), .K1_C7_W3(32'hbbffde01), .K1_C7_W4(32'h3e4be0c7), .K1_C7_W5(32'h3dc03a8d), .K1_C7_W6(32'h3e62ca95), .K1_C7_W7(32'hbdfeb22d), .K1_C7_W8(32'h3e711317), 
	// 	.K1_BIAS (32'h3c58294c),

	// 	.K2_C0_W0(32'hbbc9df53), .K2_C0_W1(32'h3dedece2), .K2_C0_W2(32'h3e386762), .K2_C0_W3(32'h3d1af585), .K2_C0_W4(32'hbd5ac8ef), .K2_C0_W5(32'hbe4a9019), .K2_C0_W6(32'h3de2cbec), .K2_C0_W7(32'hbd7d610e), .K2_C0_W8(32'h3e27bef9), 
	// 	.K2_C1_W0(32'hbb224c5f), .K2_C1_W1(32'hbe1eb370), .K2_C1_W2(32'h3d29a4ea), .K2_C1_W3(32'hbd1f6d08), .K2_C1_W4(32'h3d844145), .K2_C1_W5(32'hbe0a3805), .K2_C1_W6(32'h3d4022d5), .K2_C1_W7(32'hbbcc6fee), .K2_C1_W8(32'h3c12a15d), 
	// 	.K2_C2_W0(32'hbd4f9584), .K2_C2_W1(32'h3e3a297a), .K2_C2_W2(32'h3d82d815), .K2_C2_W3(32'hbbd6395a), .K2_C2_W4(32'hbe178cb6), .K2_C2_W5(32'h3ddebcff), .K2_C2_W6(32'h3d226d3f), .K2_C2_W7(32'hbe45ffb1), .K2_C2_W8(32'hbda8b3d3), 
	// 	.K2_C3_W0(32'h3de11a51), .K2_C3_W1(32'hbcdf521e), .K2_C3_W2(32'hbe49c352), .K2_C3_W3(32'hbe22009f), .K2_C3_W4(32'hbde41db8), .K2_C3_W5(32'h3e45802c), .K2_C3_W6(32'h3e60d5ea), .K2_C3_W7(32'h3c7f2a5e), .K2_C3_W8(32'hbd37b96f), 
	// 	.K2_C4_W0(32'h3dde212b), .K2_C4_W1(32'hbe2d1cb4), .K2_C4_W2(32'hbe098ff1), .K2_C4_W3(32'h3d392e75), .K2_C4_W4(32'hbe1547da), .K2_C4_W5(32'h3d872e71), .K2_C4_W6(32'hbdcb9edc), .K2_C4_W7(32'hbe2cbbe5), .K2_C4_W8(32'hbdc5c84c), 
	// 	.K2_C5_W0(32'h3e22e460), .K2_C5_W1(32'h3e65c39d), .K2_C5_W2(32'hbe09653f), .K2_C5_W3(32'hbd6a3da4), .K2_C5_W4(32'h3e0732da), .K2_C5_W5(32'h3d59e950), .K2_C5_W6(32'h3df287bc), .K2_C5_W7(32'hbe01e938), .K2_C5_W8(32'hbe01b00f), 
	// 	.K2_C6_W0(32'h3e38eadc), .K2_C6_W1(32'h3e24541c), .K2_C6_W2(32'hbe085a6a), .K2_C6_W3(32'hbd51d14b), .K2_C6_W4(32'h3e099368), .K2_C6_W5(32'h3d6b1e48), .K2_C6_W6(32'h3e13f437), .K2_C6_W7(32'hbd862c84), .K2_C6_W8(32'hbc449a5c), 
	// 	.K2_C7_W0(32'h3e45f69a), .K2_C7_W1(32'hbd8c915c), .K2_C7_W2(32'h3dc53498), .K2_C7_W3(32'hbe2bc14e), .K2_C7_W4(32'h3bd59392), .K2_C7_W5(32'hbd809fa8), .K2_C7_W6(32'h3db0d2b7), .K2_C7_W7(32'h3d2ede18), .K2_C7_W8(32'hbe4bc317), 
	// 	.K2_BIAS (32'hbc84f60f),

	// 	.K3_C0_W0(32'hbe2929c5), .K3_C0_W1(32'h3ddbc0f0), .K3_C0_W2(32'h3dabd18b), .K3_C0_W3(32'h3e024df0), .K3_C0_W4(32'h3d98f09d), .K3_C0_W5(32'hbe10b6ce), .K3_C0_W6(32'h3ddea1bf), .K3_C0_W7(32'h3d997170), .K3_C0_W8(32'h3d49bd9a), 
	// 	.K3_C1_W0(32'h3cad1997), .K3_C1_W1(32'h3e253918), .K3_C1_W2(32'hbdef4e98), .K3_C1_W3(32'hbe202b4f), .K3_C1_W4(32'h3d99bc99), .K3_C1_W5(32'h3d4673cc), .K3_C1_W6(32'hbe257054), .K3_C1_W7(32'h3d96600d), .K3_C1_W8(32'h3d204e2d), 
	// 	.K3_C2_W0(32'hbe42de4f), .K3_C2_W1(32'hbdfdf98e), .K3_C2_W2(32'h3dd59b92), .K3_C2_W3(32'hbe551625), .K3_C2_W4(32'h3e2c545d), .K3_C2_W5(32'h3e0e310f), .K3_C2_W6(32'hbe532cee), .K3_C2_W7(32'hbdf7219b), .K3_C2_W8(32'hbdb7ffca), 
	// 	.K3_C3_W0(32'hbe4a77cc), .K3_C3_W1(32'hbc967140), .K3_C3_W2(32'hbd74a05c), .K3_C3_W3(32'hbd22b34f), .K3_C3_W4(32'hbbff3d50), .K3_C3_W5(32'h3e21144f), .K3_C3_W6(32'hbda8a71e), .K3_C3_W7(32'h3dcbed93), .K3_C3_W8(32'h3da78b78), 
	// 	.K3_C4_W0(32'hbe431d17), .K3_C4_W1(32'hbdd91d0f), .K3_C4_W2(32'h3e23b6e1), .K3_C4_W3(32'h3b8a5718), .K3_C4_W4(32'hbdf2a210), .K3_C4_W5(32'h3ce1c8d6), .K3_C4_W6(32'h3d239bda), .K3_C4_W7(32'hbe43034b), .K3_C4_W8(32'h3def102a), 
	// 	.K3_C5_W0(32'h3e5ea7ba), .K3_C5_W1(32'h3e3b3e9f), .K3_C5_W2(32'hbe151d52), .K3_C5_W3(32'h3e3ae34b), .K3_C5_W4(32'h3e1fc29e), .K3_C5_W5(32'h3d8364e4), .K3_C5_W6(32'hbe32c25a), .K3_C5_W7(32'h3d2ac439), .K3_C5_W8(32'h3db297e0), 
	// 	.K3_C6_W0(32'h3dd1b9e0), .K3_C6_W1(32'h3d4b4db7), .K3_C6_W2(32'hbe1aa83f), .K3_C6_W3(32'h3e2a9f6c), .K3_C6_W4(32'h3df9a428), .K3_C6_W5(32'h3aa9e58c), .K3_C6_W6(32'h3e067d81), .K3_C6_W7(32'h3c9402e9), .K3_C6_W8(32'hbbb954ba), 
	// 	.K3_C7_W0(32'hbe0465b0), .K3_C7_W1(32'hbce853ef), .K3_C7_W2(32'hbdb9adc2), .K3_C7_W3(32'h3da5b0c4), .K3_C7_W4(32'hbdc07ffe), .K3_C7_W5(32'h3d854944), .K3_C7_W6(32'h3de439f3), .K3_C7_W7(32'hbda18c62), .K3_C7_W8(32'h3e1cc57d), 
	// 	.K3_BIAS (32'hbcbd6d30),

	// 	.K4_C0_W0(32'h3d83eb8d), .K4_C0_W1(32'hbde1b0e9), .K4_C0_W2(32'h3e254b91), .K4_C0_W3(32'h3e05078b), .K4_C0_W4(32'hbda43feb), .K4_C0_W5(32'h3e341da4), .K4_C0_W6(32'h3d5bac72), .K4_C0_W7(32'hbd5ada8c), .K4_C0_W8(32'hbd9ef920), 
	// 	.K4_C1_W0(32'h3d9399f9), .K4_C1_W1(32'hbe31840f), .K4_C1_W2(32'hbdc083f4), .K4_C1_W3(32'hbda3cd4a), .K4_C1_W4(32'hbdf46771), .K4_C1_W5(32'hbe3bc9ba), .K4_C1_W6(32'hbd724324), .K4_C1_W7(32'h3ca84b1c), .K4_C1_W8(32'h3e57f9c2), 
	// 	.K4_C2_W0(32'hbe4f6a7b), .K4_C2_W1(32'h3cea037c), .K4_C2_W2(32'hbd5f5360), .K4_C2_W3(32'hbdaa3b4a), .K4_C2_W4(32'hbdda108e), .K4_C2_W5(32'hbccbd8cf), .K4_C2_W6(32'h3e0d069a), .K4_C2_W7(32'hbe0f5b57), .K4_C2_W8(32'hbc408006), 
	// 	.K4_C3_W0(32'h3d6a56e1), .K4_C3_W1(32'hbd163667), .K4_C3_W2(32'hbdec1c29), .K4_C3_W3(32'hbe66f3b1), .K4_C3_W4(32'hbdf9886f), .K4_C3_W5(32'hbd60470f), .K4_C3_W6(32'hbe3b4812), .K4_C3_W7(32'h3afe0446), .K4_C3_W8(32'h3df43cae), 
	// 	.K4_C4_W0(32'h3c9aab15), .K4_C4_W1(32'h3d377ddf), .K4_C4_W2(32'h3cd44835), .K4_C4_W3(32'hbe0285d9), .K4_C4_W4(32'hbe2387bd), .K4_C4_W5(32'h3e2dd9fb), .K4_C4_W6(32'hbdd620c2), .K4_C4_W7(32'hbe11ca5c), .K4_C4_W8(32'hbe265e4e), 
	// 	.K4_C5_W0(32'hbe0fd7ef), .K4_C5_W1(32'h3d27c96a), .K4_C5_W2(32'h3ca4a13b), .K4_C5_W3(32'hbe371732), .K4_C5_W4(32'hbdcc0072), .K4_C5_W5(32'hbd13f4f2), .K4_C5_W6(32'hbdd94e4f), .K4_C5_W7(32'hbd9f0b62), .K4_C5_W8(32'h3dbc49ef), 
	// 	.K4_C6_W0(32'h3e0fb44b), .K4_C6_W1(32'h3e0c83be), .K4_C6_W2(32'h3e40ff3d), .K4_C6_W3(32'h3dd750e9), .K4_C6_W4(32'hbcb98a93), .K4_C6_W5(32'h3c1fb349), .K4_C6_W6(32'h3b1281fe), .K4_C6_W7(32'h3c4495ee), .K4_C6_W8(32'h3e32a818), 
	// 	.K4_C7_W0(32'h3d59c485), .K4_C7_W1(32'hbb080e7a), .K4_C7_W2(32'h3d8cf352), .K4_C7_W3(32'h3cfdd80a), .K4_C7_W4(32'hbe1ed66e), .K4_C7_W5(32'h3d7c50ae), .K4_C7_W6(32'hbe7872f1), .K4_C7_W7(32'hbe3fff96), .K4_C7_W8(32'hbe14330d), 
	// 	.K4_BIAS (32'h3c81ccd3),

	// 	.K5_C0_W0(32'h3dd0439c), .K5_C0_W1(32'hbe187f75), .K5_C0_W2(32'hbe48c164), .K5_C0_W3(32'h3e081a8c), .K5_C0_W4(32'hbd22c4c8), .K5_C0_W5(32'hbc88b328), .K5_C0_W6(32'h3c91375d), .K5_C0_W7(32'h3dce924f), .K5_C0_W8(32'h3dc0b59e), 
	// 	.K5_C1_W0(32'hbe4793fc), .K5_C1_W1(32'hbe4818f4), .K5_C1_W2(32'hbe210d1c), .K5_C1_W3(32'hbe1e4849), .K5_C1_W4(32'hbe432341), .K5_C1_W5(32'hbe6a95dd), .K5_C1_W6(32'h3d4895ef), .K5_C1_W7(32'hbe10bd3a), .K5_C1_W8(32'hbe46a8b0), 
	// 	.K5_C2_W0(32'h3d339158), .K5_C2_W1(32'h3dc20d8e), .K5_C2_W2(32'hbe0ccdac), .K5_C2_W3(32'h3db70932), .K5_C2_W4(32'hbe3a2d21), .K5_C2_W5(32'h3cd29dbd), .K5_C2_W6(32'hbddaf060), .K5_C2_W7(32'h3dc50084), .K5_C2_W8(32'hbe39aa6c), 
	// 	.K5_C3_W0(32'hbe2a5af7), .K5_C3_W1(32'hbdfc1c76), .K5_C3_W2(32'hbe197c34), .K5_C3_W3(32'hbdde910f), .K5_C3_W4(32'h3e734411), .K5_C3_W5(32'h3e0144e7), .K5_C3_W6(32'hbe2c222a), .K5_C3_W7(32'h3e0b0417), .K5_C3_W8(32'h3e62e365), 
	// 	.K5_C4_W0(32'hbd8ddb3f), .K5_C4_W1(32'h3d71128f), .K5_C4_W2(32'h3e005688), .K5_C4_W3(32'h3be9abdb), .K5_C4_W4(32'h3e389045), .K5_C4_W5(32'hbe026026), .K5_C4_W6(32'hbe25e79f), .K5_C4_W7(32'h3e14329d), .K5_C4_W8(32'h3e4dbec9), 
	// 	.K5_C5_W0(32'hbe478e7f), .K5_C5_W1(32'h3dfafbb0), .K5_C5_W2(32'hbdf441a4), .K5_C5_W3(32'h3d7b4d4d), .K5_C5_W4(32'h3e4cdb69), .K5_C5_W5(32'h3e5c980e), .K5_C5_W6(32'hbe35c71c), .K5_C5_W7(32'h3cbb8bcc), .K5_C5_W8(32'hbdd1986d), 
	// 	.K5_C6_W0(32'hbe420a5a), .K5_C6_W1(32'hbe138a32), .K5_C6_W2(32'hbd8be3f5), .K5_C6_W3(32'hbd8d3151), .K5_C6_W4(32'h3e5da554), .K5_C6_W5(32'h3e2def19), .K5_C6_W6(32'h3d9ca399), .K5_C6_W7(32'h3e33209d), .K5_C6_W8(32'h3e5a43c7), 
	// 	.K5_C7_W0(32'h3d1b7edd), .K5_C7_W1(32'h3d44f4c2), .K5_C7_W2(32'hbb9a16be), .K5_C7_W3(32'h3e6c6d2e), .K5_C7_W4(32'h3e30a968), .K5_C7_W5(32'h3e58174a), .K5_C7_W6(32'h3d343ca5), .K5_C7_W7(32'h3d267e85), .K5_C7_W8(32'h3e48790e), 
	// 	.K5_BIAS (32'hbc83dcb9),

	// 	.K6_C0_W0(32'hbde3ed44), .K6_C0_W1(32'h3dad7ed9), .K6_C0_W2(32'h3c9643f3), .K6_C0_W3(32'h3da83b59), .K6_C0_W4(32'hbe164c39), .K6_C0_W5(32'h3b1b532f), .K6_C0_W6(32'hbe17476a), .K6_C0_W7(32'h3d6b54d2), .K6_C0_W8(32'h3de67d39), 
	// 	.K6_C1_W0(32'hbe48ec64), .K6_C1_W1(32'hbe67efa1), .K6_C1_W2(32'h3db29537), .K6_C1_W3(32'hbdccd674), .K6_C1_W4(32'h3b8b0f63), .K6_C1_W5(32'h3e36ebff), .K6_C1_W6(32'h3dd1365b), .K6_C1_W7(32'hbd9e0a24), .K6_C1_W8(32'h3d1edd19), 
	// 	.K6_C2_W0(32'h3d208798), .K6_C2_W1(32'h3d57dedc), .K6_C2_W2(32'hbe0d9d0b), .K6_C2_W3(32'hbde04a57), .K6_C2_W4(32'hbe353d8f), .K6_C2_W5(32'h3e4d6e09), .K6_C2_W6(32'hbc8a1678), .K6_C2_W7(32'hbccee273), .K6_C2_W8(32'h3d974b55), 
	// 	.K6_C3_W0(32'hbda32d7f), .K6_C3_W1(32'hbc677c8b), .K6_C3_W2(32'h3cd4bfd7), .K6_C3_W3(32'h3e10e570), .K6_C3_W4(32'h3beaa6ad), .K6_C3_W5(32'hbd70696f), .K6_C3_W6(32'hbe55f508), .K6_C3_W7(32'h3c11c584), .K6_C3_W8(32'h3dccfde9), 
	// 	.K6_C4_W0(32'h3951b005), .K6_C4_W1(32'hbde02b33), .K6_C4_W2(32'h3e5eaf33), .K6_C4_W3(32'hbd952bac), .K6_C4_W4(32'hbd27a078), .K6_C4_W5(32'h3e4a264d), .K6_C4_W6(32'h3de03655), .K6_C4_W7(32'h3bfc3b8d), .K6_C4_W8(32'h3cfa53f1), 
	// 	.K6_C5_W0(32'hbd0e3c94), .K6_C5_W1(32'hbd02d18e), .K6_C5_W2(32'h3d94900e), .K6_C5_W3(32'hbbd91c05), .K6_C5_W4(32'hbd05c2e8), .K6_C5_W5(32'hbc3f2089), .K6_C5_W6(32'hbe00feba), .K6_C5_W7(32'hbe44771a), .K6_C5_W8(32'hbd32ecd0), 
	// 	.K6_C6_W0(32'hbd877abb), .K6_C6_W1(32'hbd0411f1), .K6_C6_W2(32'h3df65c4c), .K6_C6_W3(32'h3d4c9286), .K6_C6_W4(32'h3aa56479), .K6_C6_W5(32'hbd88f76b), .K6_C6_W6(32'hbe325fb7), .K6_C6_W7(32'h3e342eaa), .K6_C6_W8(32'h3c6df533), 
	// 	.K6_C7_W0(32'hbdb75184), .K6_C7_W1(32'h3df0868b), .K6_C7_W2(32'hbe1547c9), .K6_C7_W3(32'hbe125c48), .K6_C7_W4(32'h3e19d7c7), .K6_C7_W5(32'hbdb66927), .K6_C7_W6(32'hbddcef69), .K6_C7_W7(32'hbcee8a76), .K6_C7_W8(32'hbe63f4a6), 
	// 	.K6_BIAS (32'h3c841271),

	// 	.K7_C0_W0(32'hbcfa8237), .K7_C0_W1(32'h3d9f8872), .K7_C0_W2(32'hbc58bf09), .K7_C0_W3(32'hbd9b1884), .K7_C0_W4(32'hbdfb0002), .K7_C0_W5(32'h3d924611), .K7_C0_W6(32'h3d98c1b2), .K7_C0_W7(32'h3e4ffe8b), .K7_C0_W8(32'h3d472f42), 
	// 	.K7_C1_W0(32'h3dfa49a8), .K7_C1_W1(32'hbe535b9f), .K7_C1_W2(32'h3de6b6a6), .K7_C1_W3(32'hbc28b96c), .K7_C1_W4(32'h3dd770b5), .K7_C1_W5(32'hbd434a8a), .K7_C1_W6(32'hbe3cf96a), .K7_C1_W7(32'hbe2a9fa0), .K7_C1_W8(32'hbd97e607), 
	// 	.K7_C2_W0(32'hbe19985f), .K7_C2_W1(32'h3d1e8c94), .K7_C2_W2(32'h3d4255ab), .K7_C2_W3(32'h3d9e2fdf), .K7_C2_W4(32'h3d53cacd), .K7_C2_W5(32'h3da3f0dc), .K7_C2_W6(32'h3e4eb3ec), .K7_C2_W7(32'hbb37f96e), .K7_C2_W8(32'h3cb6dc04), 
	// 	.K7_C3_W0(32'hbe2f78b8), .K7_C3_W1(32'h3e18868d), .K7_C3_W2(32'hbdd8b45d), .K7_C3_W3(32'hbe81c5a3), .K7_C3_W4(32'hbe6dab40), .K7_C3_W5(32'hbd9666b0), .K7_C3_W6(32'hbe19f062), .K7_C3_W7(32'hbd3bf591), .K7_C3_W8(32'hbb82bdb8), 
	// 	.K7_C4_W0(32'hbc99326c), .K7_C4_W1(32'h3d463c4c), .K7_C4_W2(32'h3dacfd48), .K7_C4_W3(32'h3df75f16), .K7_C4_W4(32'hbe1034b8), .K7_C4_W5(32'hbc286b03), .K7_C4_W6(32'h3d86496a), .K7_C4_W7(32'h3d6f3244), .K7_C4_W8(32'h3d8e57bd), 
	// 	.K7_C5_W0(32'hbe193da9), .K7_C5_W1(32'h3dbebfd9), .K7_C5_W2(32'h3e146422), .K7_C5_W3(32'hbe2d0f89), .K7_C5_W4(32'hbd0eef93), .K7_C5_W5(32'hbde0d877), .K7_C5_W6(32'hbe25c555), .K7_C5_W7(32'h3dc97bcb), .K7_C5_W8(32'h3d85fa20), 
	// 	.K7_C6_W0(32'hbdd81657), .K7_C6_W1(32'hbaba11f9), .K7_C6_W2(32'hbdbda5fd), .K7_C6_W3(32'hbe3b026b), .K7_C6_W4(32'hbd07543c), .K7_C6_W5(32'hbcd3b62e), .K7_C6_W6(32'h3e11964d), .K7_C6_W7(32'hbd0662b3), .K7_C6_W8(32'hbd98519c), 
	// 	.K7_C7_W0(32'hbe4b9d3a), .K7_C7_W1(32'hbe0e1565), .K7_C7_W2(32'h3e1d10fb), .K7_C7_W3(32'h3d11e11d), .K7_C7_W4(32'hbe6c5562), .K7_C7_W5(32'h3b734691), .K7_C7_W6(32'hbe0c0288), .K7_C7_W7(32'h3dfdf592), .K7_C7_W8(32'hbe35e5a9), 
	// 	.K7_BIAS (32'h3cdf7df0)
	// 	)
	// 	block2_conv1(
	// 	.clk(clk),
	// 	.resetn(resetn),
	// 	.data_valid_in(valid_out_pool_1_2[0]),
	// 	.data_in_0(data_out_pool_1_2[0]),
	// 	.data_in_1(data_out_pool_1_2[1]),
	// 	.data_in_2(data_out_pool_1_2[2]),
	// 	.data_in_3(data_out_pool_1_2[3]),
	// 	.data_in_4(data_out_pool_1_2[4]),
	// 	.data_in_5(data_out_pool_1_2[5]),
	// 	.data_in_6(data_out_pool_1_2[6]),
	// 	.data_in_7(data_out_pool_1_2[7]),
	// 	.data_out_conv_0(conv_out_2_1[0]),
	// 	.data_out_conv_1(conv_out_2_1[1]),
	// 	.data_out_conv_2(conv_out_2_1[2]),
	// 	.data_out_conv_3(conv_out_2_1[3]),
	// 	.data_out_conv_4(conv_out_2_1[4]),
	// 	.data_out_conv_5(conv_out_2_1[5]),
	// 	.data_out_conv_6(conv_out_2_1[6]),
	// 	.data_out_conv_7(conv_out_2_1[7]),
	// 	.valid_out_pixel(conv_valid_out_2_1),
	// 	.done(done_conv_2_1)
	// 	);


	
	// conv3d_8_kernel_8_channel_size_3 #(
	// 	.DATA_WIDTH(32),.IMG_WIDTH(WIDTH>>1),.IMG_HEIGHT(HEIGHT>>1),
	// 	.K0_C0_W0(32'hbe0da359), .K0_C0_W1(32'h3dfc8ad7), .K0_C0_W2(32'hbd1af968), .K0_C0_W3(32'h3e2b761a), .K0_C0_W4(32'h3e152f6f), .K0_C0_W5(32'h3d53c402), .K0_C0_W6(32'h3dc2a129), .K0_C0_W7(32'hbd6a699a), .K0_C0_W8(32'hbd4dd614), 
	// 	.K0_C1_W0(32'hbd0d36cb), .K0_C1_W1(32'h3ceb81ed), .K0_C1_W2(32'hbd8cb5d3), .K0_C1_W3(32'hbdf9384c), .K0_C1_W4(32'hbdc5b5b4), .K0_C1_W5(32'hbe1d35ef), .K0_C1_W6(32'h3d8ef6d8), .K0_C1_W7(32'h3e2e0506), .K0_C1_W8(32'hbb832405), 
	// 	.K0_C2_W0(32'h3deff8e4), .K0_C2_W1(32'h3e2d4aa9), .K0_C2_W2(32'h3e599465), .K0_C2_W3(32'hbc4cd25f), .K0_C2_W4(32'hbcc30dc5), .K0_C2_W5(32'h3e565a90), .K0_C2_W6(32'h3e2c0f1d), .K0_C2_W7(32'h3d81d908), .K0_C2_W8(32'h3e0498b7), 
	// 	.K0_C3_W0(32'h3e459a2e), .K0_C3_W1(32'h3dbf1576), .K0_C3_W2(32'h3b36d9c6), .K0_C3_W3(32'hbe308358), .K0_C3_W4(32'h3db5fdb0), .K0_C3_W5(32'hbd40c069), .K0_C3_W6(32'h3dca2a85), .K0_C3_W7(32'h3e057e63), .K0_C3_W8(32'h3e4d93f8), 
	// 	.K0_C4_W0(32'h3dc7b6eb), .K0_C4_W1(32'hbe5b8fad), .K0_C4_W2(32'hbd928b80), .K0_C4_W3(32'h3da26eef), .K0_C4_W4(32'hbd574e59), .K0_C4_W5(32'hbcc4c014), .K0_C4_W6(32'hbceac551), .K0_C4_W7(32'h3ddbc38a), .K0_C4_W8(32'hbceedda4), 
	// 	.K0_C5_W0(32'hbcc7b397), .K0_C5_W1(32'hbd00765d), .K0_C5_W2(32'hbe0fadfe), .K0_C5_W3(32'h3e140e7b), .K0_C5_W4(32'h3de73545), .K0_C5_W5(32'hbe0b124a), .K0_C5_W6(32'hbdb1b41a), .K0_C5_W7(32'h3d6a67a3), .K0_C5_W8(32'hbe3dae41), 
	// 	.K0_C6_W0(32'hbe17145b), .K0_C6_W1(32'h3e07512f), .K0_C6_W2(32'h3e11d893), .K0_C6_W3(32'hbe048462), .K0_C6_W4(32'h3c2d8708), .K0_C6_W5(32'hbcfd822a), .K0_C6_W6(32'hbdbd4b3c), .K0_C6_W7(32'hbdad77ec), .K0_C6_W8(32'hbe3a05ba), 
	// 	.K0_C7_W0(32'h3e069210), .K0_C7_W1(32'h3da6e275), .K0_C7_W2(32'hbcd5c330), .K0_C7_W3(32'h3e246fc3), .K0_C7_W4(32'hbe19c55c), .K0_C7_W5(32'h3d871b2f), .K0_C7_W6(32'hbe415395), .K0_C7_W7(32'hbd85db42), .K0_C7_W8(32'hbd990ff0), 
	// 	.K0_BIAS (32'hbc18ec33),

	// 	.K1_C0_W0(32'h3e0a1943), .K1_C0_W1(32'h3e2fc3df), .K1_C0_W2(32'h3ca44fd5), .K1_C0_W3(32'hbe388da2), .K1_C0_W4(32'h3d7ecb2f), .K1_C0_W5(32'hbe128807), .K1_C0_W6(32'h3e0a1282), .K1_C0_W7(32'h3d25bd48), .K1_C0_W8(32'h3dc6b317), 
	// 	.K1_C1_W0(32'hbc1ef402), .K1_C1_W1(32'h3db983be), .K1_C1_W2(32'h3de69538), .K1_C1_W3(32'hbe3f1a5a), .K1_C1_W4(32'h3d136ff3), .K1_C1_W5(32'hbe18c015), .K1_C1_W6(32'h3de4102d), .K1_C1_W7(32'hbe0eb0b6), .K1_C1_W8(32'h3cf761b9), 
	// 	.K1_C2_W0(32'hbdd52614), .K1_C2_W1(32'hbd93dae1), .K1_C2_W2(32'h3d5f2995), .K1_C2_W3(32'hbbfeaee9), .K1_C2_W4(32'hbda16be7), .K1_C2_W5(32'h3ccfe053), .K1_C2_W6(32'h3d36e2da), .K1_C2_W7(32'hbc851421), .K1_C2_W8(32'h3d38720b), 
	// 	.K1_C3_W0(32'hbd19345c), .K1_C3_W1(32'h3db32c8f), .K1_C3_W2(32'hbe0ab4ba), .K1_C3_W3(32'hbce6d1f4), .K1_C3_W4(32'h3de5852c), .K1_C3_W5(32'hbde888ec), .K1_C3_W6(32'h3e0a5b33), .K1_C3_W7(32'hbe0ce7a7), .K1_C3_W8(32'hbe0d6649), 
	// 	.K1_C4_W0(32'h3e4fcf1b), .K1_C4_W1(32'h3dae1d31), .K1_C4_W2(32'hbd805788), .K1_C4_W3(32'hbb03ed8f), .K1_C4_W4(32'h3d2a2572), .K1_C4_W5(32'hbe74b8b9), .K1_C4_W6(32'h3dc0eb32), .K1_C4_W7(32'h3e05af85), .K1_C4_W8(32'hbe554afe), 
	// 	.K1_C5_W0(32'h3da2471e), .K1_C5_W1(32'hbe21b19a), .K1_C5_W2(32'hbe329a29), .K1_C5_W3(32'h3aa2dc3d), .K1_C5_W4(32'h3e514221), .K1_C5_W5(32'h3d8bc52f), .K1_C5_W6(32'hbe4c7906), .K1_C5_W7(32'h3df86086), .K1_C5_W8(32'h3d9ebd5b), 
	// 	.K1_C6_W0(32'hbdb623f0), .K1_C6_W1(32'h3e3c5f4e), .K1_C6_W2(32'hbe2f9a7f), .K1_C6_W3(32'h3dbc2f8d), .K1_C6_W4(32'hbd550727), .K1_C6_W5(32'h3dbaaee9), .K1_C6_W6(32'h3e0f2335), .K1_C6_W7(32'h3e051eec), .K1_C6_W8(32'h3e5b671f), 
	// 	.K1_C7_W0(32'h3d893273), .K1_C7_W1(32'hbdc6490c), .K1_C7_W2(32'h3de85d2d), .K1_C7_W3(32'h3e2a74f4), .K1_C7_W4(32'h3e228470), .K1_C7_W5(32'hbd94822f), .K1_C7_W6(32'h3b07a973), .K1_C7_W7(32'h3dec1991), .K1_C7_W8(32'hbd9c8ee0), 
	// 	.K1_BIAS (32'h3c9c7489),

	// 	.K2_C0_W0(32'hbced4b5e), .K2_C0_W1(32'hbe05678e), .K2_C0_W2(32'h3dce3535), .K2_C0_W3(32'h3c965888), .K2_C0_W4(32'hbe1ce403), .K2_C0_W5(32'hbd936049), .K2_C0_W6(32'h3d34a48a), .K2_C0_W7(32'hbd161c1e), .K2_C0_W8(32'h3c965fdd), 
	// 	.K2_C1_W0(32'h3d7bf94a), .K2_C1_W1(32'h3dfda5c8), .K2_C1_W2(32'h3e49d701), .K2_C1_W3(32'hbe3601a3), .K2_C1_W4(32'h3e15c264), .K2_C1_W5(32'h3dab5273), .K2_C1_W6(32'hbcc973d9), .K2_C1_W7(32'h3db35da8), .K2_C1_W8(32'h3d59f284), 
	// 	.K2_C2_W0(32'hbdb68848), .K2_C2_W1(32'h3d8ae1ba), .K2_C2_W2(32'h3e02e244), .K2_C2_W3(32'h3d96e907), .K2_C2_W4(32'h3da21fde), .K2_C2_W5(32'h3e23acd5), .K2_C2_W6(32'h3e6573c2), .K2_C2_W7(32'hbd2f6fff), .K2_C2_W8(32'h3d325889), 
	// 	.K2_C3_W0(32'hbe25c291), .K2_C3_W1(32'hbdb2562b), .K2_C3_W2(32'h3d26070f), .K2_C3_W3(32'hbdd4d04e), .K2_C3_W4(32'h3e04600d), .K2_C3_W5(32'h3dafe218), .K2_C3_W6(32'h3d65f761), .K2_C3_W7(32'hbd9c6920), .K2_C3_W8(32'h3e13f470), 
	// 	.K2_C4_W0(32'hbdb2a9a9), .K2_C4_W1(32'hbcb87181), .K2_C4_W2(32'hbe4bd119), .K2_C4_W3(32'hbe225c3e), .K2_C4_W4(32'hbdfc4d90), .K2_C4_W5(32'hbe4af657), .K2_C4_W6(32'h3dd79aca), .K2_C4_W7(32'hbd495de1), .K2_C4_W8(32'hbde3b18e), 
	// 	.K2_C5_W0(32'hbe391f26), .K2_C5_W1(32'h3e337505), .K2_C5_W2(32'h3b491086), .K2_C5_W3(32'hbd70e27d), .K2_C5_W4(32'hbd3d1887), .K2_C5_W5(32'hbe0a2ff3), .K2_C5_W6(32'hbd2c6ab9), .K2_C5_W7(32'h3be14e41), .K2_C5_W8(32'h3e0fd549), 
	// 	.K2_C6_W0(32'h3d9a25c7), .K2_C6_W1(32'hbdb6bff4), .K2_C6_W2(32'h3d0bb37b), .K2_C6_W3(32'h3ddf274c), .K2_C6_W4(32'hbe599b4c), .K2_C6_W5(32'hbdec1238), .K2_C6_W6(32'h3da2b52f), .K2_C6_W7(32'h3d5531b6), .K2_C6_W8(32'h3df002dc), 
	// 	.K2_C7_W0(32'hbe594fcb), .K2_C7_W1(32'hbd96f366), .K2_C7_W2(32'hbe32d478), .K2_C7_W3(32'h3d8452c2), .K2_C7_W4(32'h3dc29df7), .K2_C7_W5(32'hbe6d0e4e), .K2_C7_W6(32'h3d93e9d2), .K2_C7_W7(32'hbe23a575), .K2_C7_W8(32'hbca1862c), 
	// 	.K2_BIAS (32'hbcfc30c7),

	// 	.K3_C0_W0(32'hbd2792a3), .K3_C0_W1(32'hbd8ea36a), .K3_C0_W2(32'h3e5f52b7), .K3_C0_W3(32'hbd622ee0), .K3_C0_W4(32'hbc72b449), .K3_C0_W5(32'h3c0f1251), .K3_C0_W6(32'hbdaafc80), .K3_C0_W7(32'hbdb4b93e), .K3_C0_W8(32'h3ae59764), 
	// 	.K3_C1_W0(32'hbe039f4e), .K3_C1_W1(32'h3d913729), .K3_C1_W2(32'h3d45eb98), .K3_C1_W3(32'h3d066206), .K3_C1_W4(32'h3e560772), .K3_C1_W5(32'h3d1d5b60), .K3_C1_W6(32'h3dc75649), .K3_C1_W7(32'hbe2e387c), .K3_C1_W8(32'h3e0ac2bc), 
	// 	.K3_C2_W0(32'hbdade07d), .K3_C2_W1(32'hbe43cc3a), .K3_C2_W2(32'hbd92cd1b), .K3_C2_W3(32'h3de6fad0), .K3_C2_W4(32'h3e1c6479), .K3_C2_W5(32'h3d83325f), .K3_C2_W6(32'hbd44621d), .K3_C2_W7(32'hbb394170), .K3_C2_W8(32'h3e27a926), 
	// 	.K3_C3_W0(32'hbd8234ce), .K3_C3_W1(32'hbd989b0a), .K3_C3_W2(32'h3d8601ae), .K3_C3_W3(32'hbd930a12), .K3_C3_W4(32'hbd6f64a0), .K3_C3_W5(32'h3e4d2e27), .K3_C3_W6(32'h3e24b414), .K3_C3_W7(32'hbe3b3b34), .K3_C3_W8(32'h3d70d893), 
	// 	.K3_C4_W0(32'h3d6459c6), .K3_C4_W1(32'h3e051723), .K3_C4_W2(32'hbdba5a5e), .K3_C4_W3(32'h3d96b3d2), .K3_C4_W4(32'hbcd8ab2f), .K3_C4_W5(32'hbdd5c58f), .K3_C4_W6(32'h3deacd16), .K3_C4_W7(32'h3d1cfdd3), .K3_C4_W8(32'hbe5178af), 
	// 	.K3_C5_W0(32'hbd1a9c2a), .K3_C5_W1(32'h3e4d14bb), .K3_C5_W2(32'hbdec41ed), .K3_C5_W3(32'h3dc57a9d), .K3_C5_W4(32'hbd356d9b), .K3_C5_W5(32'hbc911fae), .K3_C5_W6(32'h3e24c557), .K3_C5_W7(32'h3e3733b5), .K3_C5_W8(32'hbd9ac0b0), 
	// 	.K3_C6_W0(32'h3dc0b204), .K3_C6_W1(32'hbe157a13), .K3_C6_W2(32'hbe5db530), .K3_C6_W3(32'h3d810588), .K3_C6_W4(32'h3dd738de), .K3_C6_W5(32'hbdf54191), .K3_C6_W6(32'hbe0500b2), .K3_C6_W7(32'hbd72e4b0), .K3_C6_W8(32'hbddd6cc8), 
	// 	.K3_C7_W0(32'h3e1b97ed), .K3_C7_W1(32'h3c0e5a52), .K3_C7_W2(32'h3e124b96), .K3_C7_W3(32'h3e2e8529), .K3_C7_W4(32'h3c054720), .K3_C7_W5(32'hbd192ffe), .K3_C7_W6(32'h3e32d176), .K3_C7_W7(32'h3e2548ce), .K3_C7_W8(32'hbe290d51), 
	// 	.K3_BIAS (32'hbc776d52),

	// 	.K4_C0_W0(32'hbce23415), .K4_C0_W1(32'h3de899e9), .K4_C0_W2(32'h3e0d5168), .K4_C0_W3(32'hbceea09e), .K4_C0_W4(32'h3e41a9f3), .K4_C0_W5(32'hbc76e0a4), .K4_C0_W6(32'h3df22ca8), .K4_C0_W7(32'hbe3b62e7), .K4_C0_W8(32'hba8f2a87), 
	// 	.K4_C1_W0(32'h3d11aa41), .K4_C1_W1(32'hbdf48cb7), .K4_C1_W2(32'h3e1b02ee), .K4_C1_W3(32'h3d519232), .K4_C1_W4(32'h3e4c9e53), .K4_C1_W5(32'hbe3eb907), .K4_C1_W6(32'hbe2e0c37), .K4_C1_W7(32'hbe1ffc71), .K4_C1_W8(32'hbdf48436), 
	// 	.K4_C2_W0(32'hbdf9bf45), .K4_C2_W1(32'hbe0b8dbd), .K4_C2_W2(32'hbd947040), .K4_C2_W3(32'h3c5ed208), .K4_C2_W4(32'hbdd7d51e), .K4_C2_W5(32'h3df5008c), .K4_C2_W6(32'hbd73ed47), .K4_C2_W7(32'h3c76b28a), .K4_C2_W8(32'hbc4dcc68), 
	// 	.K4_C3_W0(32'hbe2d12e8), .K4_C3_W1(32'hbd9cfc5a), .K4_C3_W2(32'hbe0ce1ac), .K4_C3_W3(32'h3e566b13), .K4_C3_W4(32'h3e49f62c), .K4_C3_W5(32'h3d649963), .K4_C3_W6(32'h3e4b2209), .K4_C3_W7(32'h3d1a1b20), .K4_C3_W8(32'h3e5ba41f), 
	// 	.K4_C4_W0(32'hbe1cdf0e), .K4_C4_W1(32'h3e031e54), .K4_C4_W2(32'h3dc81c15), .K4_C4_W3(32'h3d89a77a), .K4_C4_W4(32'hbde1b56e), .K4_C4_W5(32'h3e2424ad), .K4_C4_W6(32'hbddfd3e7), .K4_C4_W7(32'hbe232d58), .K4_C4_W8(32'h3e57152c), 
	// 	.K4_C5_W0(32'h3e1da66a), .K4_C5_W1(32'h3e068f50), .K4_C5_W2(32'h3e460dc9), .K4_C5_W3(32'hbd33d179), .K4_C5_W4(32'h389c6143), .K4_C5_W5(32'h3e54496d), .K4_C5_W6(32'hbe266e06), .K4_C5_W7(32'hbc2cf39b), .K4_C5_W8(32'h3d9c7175), 
	// 	.K4_C6_W0(32'hbd2fa3db), .K4_C6_W1(32'hbca6ffef), .K4_C6_W2(32'hbd86851d), .K4_C6_W3(32'h3c8a5315), .K4_C6_W4(32'h3d5a4b92), .K4_C6_W5(32'hbe5b6bff), .K4_C6_W6(32'hbbe84e0b), .K4_C6_W7(32'hbdcf6b9f), .K4_C6_W8(32'hbd94449c), 
	// 	.K4_C7_W0(32'hbd21cb35), .K4_C7_W1(32'hbd712490), .K4_C7_W2(32'hbe041031), .K4_C7_W3(32'hbe0d091d), .K4_C7_W4(32'hbe3ffb95), .K4_C7_W5(32'h3c228ba6), .K4_C7_W6(32'hbe087d06), .K4_C7_W7(32'hbe04f735), .K4_C7_W8(32'h3e0339ed), 
	// 	.K4_BIAS (32'hbcf8946f),

	// 	.K5_C0_W0(32'hbdbc8f9b), .K5_C0_W1(32'h3e1954a1), .K5_C0_W2(32'hbd5578ea), .K5_C0_W3(32'h3d406111), .K5_C0_W4(32'h3d7639d8), .K5_C0_W5(32'hbdba3ce0), .K5_C0_W6(32'hbd39c352), .K5_C0_W7(32'h3d3b29c4), .K5_C0_W8(32'h3bb7a538), 
	// 	.K5_C1_W0(32'h3d989808), .K5_C1_W1(32'hbde83e49), .K5_C1_W2(32'h3e2ad7ea), .K5_C1_W3(32'hbe143611), .K5_C1_W4(32'h39b4a2ae), .K5_C1_W5(32'h3e4a760d), .K5_C1_W6(32'h3cf4fa84), .K5_C1_W7(32'hbca0e61d), .K5_C1_W8(32'h3df5fe61), 
	// 	.K5_C2_W0(32'hbda45f26), .K5_C2_W1(32'h3d46e658), .K5_C2_W2(32'hbd2d33f0), .K5_C2_W3(32'h3ddb68e2), .K5_C2_W4(32'hbdd014de), .K5_C2_W5(32'h3d396a2b), .K5_C2_W6(32'hbe5bcd5d), .K5_C2_W7(32'hbde2b556), .K5_C2_W8(32'hbe33d48f), 
	// 	.K5_C3_W0(32'hbe1dd332), .K5_C3_W1(32'h3d630015), .K5_C3_W2(32'h3d84bfe4), .K5_C3_W3(32'hbe3459f4), .K5_C3_W4(32'hbe2e06e7), .K5_C3_W5(32'h3decd583), .K5_C3_W6(32'hbce61e73), .K5_C3_W7(32'h3cf40911), .K5_C3_W8(32'h3e3988a4), 
	// 	.K5_C4_W0(32'h3d32cf87), .K5_C4_W1(32'hbe2b0348), .K5_C4_W2(32'hbccef6d9), .K5_C4_W3(32'hbd5663c3), .K5_C4_W4(32'hbe5dbdca), .K5_C4_W5(32'h3da1bb70), .K5_C4_W6(32'hbd521d38), .K5_C4_W7(32'hbe161435), .K5_C4_W8(32'h3e11b948), 
	// 	.K5_C5_W0(32'h3de2d8ce), .K5_C5_W1(32'hbd71e599), .K5_C5_W2(32'hbd8f1819), .K5_C5_W3(32'h3da872c7), .K5_C5_W4(32'h3e4b26d0), .K5_C5_W5(32'hbe09509a), .K5_C5_W6(32'hbbeb5517), .K5_C5_W7(32'h3d8504c3), .K5_C5_W8(32'hbc12c6ad), 
	// 	.K5_C6_W0(32'h3be6fe75), .K5_C6_W1(32'h3d4d41d5), .K5_C6_W2(32'hbe0f3ee3), .K5_C6_W3(32'hbe0d900d), .K5_C6_W4(32'h3e30930f), .K5_C6_W5(32'hbbd84ad4), .K5_C6_W6(32'h3e4bb3bd), .K5_C6_W7(32'hbc5756f6), .K5_C6_W8(32'h3e45af03), 
	// 	.K5_C7_W0(32'hbd55d5fe), .K5_C7_W1(32'hbd841202), .K5_C7_W2(32'h3d60d641), .K5_C7_W3(32'hbdbcc135), .K5_C7_W4(32'h3dec8d70), .K5_C7_W5(32'hbe2ffc1c), .K5_C7_W6(32'h3e1e2594), .K5_C7_W7(32'hbdfb683d), .K5_C7_W8(32'h3e45b762), 
	// 	.K5_BIAS (32'h3d10ec02),

	// 	.K6_C0_W0(32'hbdb769dc), .K6_C0_W1(32'hbdb1739b), .K6_C0_W2(32'h3ca7610a), .K6_C0_W3(32'hbd585595), .K6_C0_W4(32'hbe28bd7d), .K6_C0_W5(32'hbdfb3cf0), .K6_C0_W6(32'hbe2fd953), .K6_C0_W7(32'h3d8b9c2d), .K6_C0_W8(32'h3da20da9), 
	// 	.K6_C1_W0(32'h3dfcb3a6), .K6_C1_W1(32'h3e2b8e35), .K6_C1_W2(32'h3da91a2d), .K6_C1_W3(32'h3dff3153), .K6_C1_W4(32'h3e5a455a), .K6_C1_W5(32'hbe3c03c5), .K6_C1_W6(32'h3e05fa35), .K6_C1_W7(32'h3dbc5c40), .K6_C1_W8(32'hbcf9e812), 
	// 	.K6_C2_W0(32'hbe2a79c5), .K6_C2_W1(32'hbdb17ccf), .K6_C2_W2(32'hbd8c12f2), .K6_C2_W3(32'hbc4015f4), .K6_C2_W4(32'hbdaecf12), .K6_C2_W5(32'hbde48065), .K6_C2_W6(32'h3e282c57), .K6_C2_W7(32'h3e04e9f5), .K6_C2_W8(32'hbe17af44), 
	// 	.K6_C3_W0(32'h3e13c0e9), .K6_C3_W1(32'h3d7840f4), .K6_C3_W2(32'hbe2c0f6d), .K6_C3_W3(32'hbbee69d1), .K6_C3_W4(32'hbe099876), .K6_C3_W5(32'hbd5467aa), .K6_C3_W6(32'hbe33e230), .K6_C3_W7(32'hbdf68f54), .K6_C3_W8(32'h3d72272a), 
	// 	.K6_C4_W0(32'hbe32eb09), .K6_C4_W1(32'hbe09b869), .K6_C4_W2(32'hbe25bd07), .K6_C4_W3(32'h3e3e4cf5), .K6_C4_W4(32'hbe392c97), .K6_C4_W5(32'h3e2687d1), .K6_C4_W6(32'h3cacbe23), .K6_C4_W7(32'h3cc6defa), .K6_C4_W8(32'hbe0bb69f), 
	// 	.K6_C5_W0(32'h3dff9c1d), .K6_C5_W1(32'h3e13c10a), .K6_C5_W2(32'h3d3651be), .K6_C5_W3(32'h3d54fc45), .K6_C5_W4(32'hbdc74e55), .K6_C5_W5(32'h3de3dd4f), .K6_C5_W6(32'h3dfcaa64), .K6_C5_W7(32'h3dd3b880), .K6_C5_W8(32'h3d2ab51b), 
	// 	.K6_C6_W0(32'hbe54654d), .K6_C6_W1(32'h3e33c5d8), .K6_C6_W2(32'hbe1e7c75), .K6_C6_W3(32'h3cdd1813), .K6_C6_W4(32'h3df4105d), .K6_C6_W5(32'hbe1d3e0a), .K6_C6_W6(32'h3d3d3ae7), .K6_C6_W7(32'h3d8f969e), .K6_C6_W8(32'hbd03f19b), 
	// 	.K6_C7_W0(32'h3db52392), .K6_C7_W1(32'hbdd52312), .K6_C7_W2(32'hbe07359b), .K6_C7_W3(32'hbd9bdfcf), .K6_C7_W4(32'h3cacec7b), .K6_C7_W5(32'h3da9c483), .K6_C7_W6(32'h3d9dee49), .K6_C7_W7(32'hbd8ec5d8), .K6_C7_W8(32'h3e2fc868), 
	// 	.K6_BIAS (32'h3bdc1f75),

	// 	.K7_C0_W0(32'h3cb7efc3), .K7_C0_W1(32'h3dc12ef7), .K7_C0_W2(32'h3d10666c), .K7_C0_W3(32'hbd18cbd7), .K7_C0_W4(32'h3b63c09f), .K7_C0_W5(32'hbe277b26), .K7_C0_W6(32'h3e0dd1a9), .K7_C0_W7(32'h3d85fb04), .K7_C0_W8(32'hbd52967e), 
	// 	.K7_C1_W0(32'hbdf427ed), .K7_C1_W1(32'hbde2b8ec), .K7_C1_W2(32'hbdf14d77), .K7_C1_W3(32'h3de28d99), .K7_C1_W4(32'h3e136df8), .K7_C1_W5(32'h3a9e5422), .K7_C1_W6(32'hba625718), .K7_C1_W7(32'h3e007244), .K7_C1_W8(32'h3a7cd5c9), 
	// 	.K7_C2_W0(32'h3dc4b1c1), .K7_C2_W1(32'hbdfd70a1), .K7_C2_W2(32'h3e0938dd), .K7_C2_W3(32'h3dee78d9), .K7_C2_W4(32'h3d07b869), .K7_C2_W5(32'hbdcfc927), .K7_C2_W6(32'h3d9461f2), .K7_C2_W7(32'hbe440465), .K7_C2_W8(32'h3d89cda5), 
	// 	.K7_C3_W0(32'h3dcf7ffb), .K7_C3_W1(32'h3ddb03ea), .K7_C3_W2(32'h3e5276bd), .K7_C3_W3(32'hbe09bdbf), .K7_C3_W4(32'hbe4a75a4), .K7_C3_W5(32'hbdca147d), .K7_C3_W6(32'hbe23b69c), .K7_C3_W7(32'hbe2b6b10), .K7_C3_W8(32'h3dba96f8), 
	// 	.K7_C4_W0(32'h3cff514c), .K7_C4_W1(32'hbd8f043f), .K7_C4_W2(32'h3e1ead8a), .K7_C4_W3(32'h3d8687ef), .K7_C4_W4(32'hbd728383), .K7_C4_W5(32'hbc8b2f8c), .K7_C4_W6(32'hbdd438dc), .K7_C4_W7(32'hb9b46fca), .K7_C4_W8(32'h3dddffb8), 
	// 	.K7_C5_W0(32'h3dcab78b), .K7_C5_W1(32'h3e004060), .K7_C5_W2(32'h3e376280), .K7_C5_W3(32'hbe18e835), .K7_C5_W4(32'hbe086ac5), .K7_C5_W5(32'h3e37cf84), .K7_C5_W6(32'hbe6534a4), .K7_C5_W7(32'hbe113054), .K7_C5_W8(32'h3dfd2632), 
	// 	.K7_C6_W0(32'h3e07e846), .K7_C6_W1(32'h3da54159), .K7_C6_W2(32'h3e3a999f), .K7_C6_W3(32'hbdbd7638), .K7_C6_W4(32'hbc317a87), .K7_C6_W5(32'hbdd127ac), .K7_C6_W6(32'h3d8cbfae), .K7_C6_W7(32'h3def5d70), .K7_C6_W8(32'h3e4a624f), 
	// 	.K7_C7_W0(32'h3e40f6d8), .K7_C7_W1(32'hbe49c989), .K7_C7_W2(32'h3e467127), .K7_C7_W3(32'h3d9ad112), .K7_C7_W4(32'hbdaf5671), .K7_C7_W5(32'hbd9eb4f2), .K7_C7_W6(32'h3e45b7b1), .K7_C7_W7(32'h3dd40bac), .K7_C7_W8(32'h3e2bd4c4), 
	// 	.K7_BIAS (32'hbd110f03)
	// 	)
	// 	block2_conv2(
	// 	.clk(clk),
	// 	.resetn(resetn),
	// 	.data_valid_in(conv_valid_out_2_1),
	// 	.data_in_0(conv_out_2_1[0]),
	// 	.data_in_1(conv_out_2_1[1]),
	// 	.data_in_2(conv_out_2_1[2]),
	// 	.data_in_3(conv_out_2_1[3]),
	// 	.data_in_4(conv_out_2_1[4]),
	// 	.data_in_5(conv_out_2_1[5]),
	// 	.data_in_6(conv_out_2_1[6]),
	// 	.data_in_7(conv_out_2_1[7]),
	// 	.data_out_conv_0(conv_out_2_2[0]),
	// 	.data_out_conv_1(conv_out_2_2[1]),
	// 	.data_out_conv_2(conv_out_2_2[2]),
	// 	.data_out_conv_3(conv_out_2_2[3]),
	// 	.data_out_conv_4(conv_out_2_2[4]),
	// 	.data_out_conv_5(conv_out_2_2[5]),
	// 	.data_out_conv_6(conv_out_2_2[6]),
	// 	.data_out_conv_7(conv_out_2_2[7]),
	// 	.valid_out_pixel(conv_valid_out_2_2),
	// 	.done(done_conv_2_2)
	// 	);

	// generate
    // for (i = 0; i < CHANNEL_OUT; i=i+1) 
    // begin : relu_2_2 // needs CHANNEL_OUT relu		// Edit here - name

    //     activate #(
    //         .DATA_WIDTH(32)
    //     )
    //     relu (
    //         .in(conv_out_2_2[i]),			// Edit here
    //         .out(relu_out_2_2[i])
    //     );
    // end
    // endgenerate

    // generate
    // for (i = 0; i < CHANNEL_OUT; i=i+1) 
    // begin : max_pool_2 // needs CHANNEL_OUT max_pooling		// Edit here - name

    //     max_pooling #(
    //         .DATA_WIDTH(32),
    //         .WIDTH(WIDTH),
    //         .HEIGHT(HEIGHT)
    //     )
    //     max_pool(
    //         .clk(clk),
	// 		.ack(done_conv_2_2),					// Edit here
    //         .resetn(resetn),
    //         .valid_in(conv_valid_out_2_2),			// Edit here
    //         .data_in(relu_out_2_2[i]),
    //         .data_out(data_out_pool_2_2[i]),
    //         .valid_out(valid_out_pool_2_2[i]),
    //         .done(done_pool_2_2[i])
    //     );
    // end
    // endgenerate


    // // ------------ BLOCK 3 ------------
	// conv3d_8_kernel_8_channel_size_3 #(
	// 	.DATA_WIDTH(32),.IMG_WIDTH(WIDTH>>2),.IMG_HEIGHT(HEIGHT>>2),
	// 	.K0_C0_W0(32'h3e2e9b62), .K0_C0_W1(32'h3e0f5996), .K0_C0_W2(32'hbd9cd5a0), .K0_C0_W3(32'h3e0f733f), .K0_C0_W4(32'h3e2c113f), .K0_C0_W5(32'hbe2e2112), .K0_C0_W6(32'hbd8924e9), .K0_C0_W7(32'h3e796e41), .K0_C0_W8(32'h3e617e63), 
	// 	.K0_C1_W0(32'hbde29c3c), .K0_C1_W1(32'hbc876419), .K0_C1_W2(32'h3e375bbd), .K0_C1_W3(32'h3cd5ecfb), .K0_C1_W4(32'hbe043b24), .K0_C1_W5(32'h3e23f6e0), .K0_C1_W6(32'h3e1cfb38), .K0_C1_W7(32'hbdccd648), .K0_C1_W8(32'hbe2f2311), 
	// 	.K0_C2_W0(32'hbe599262), .K0_C2_W1(32'h3e01bab4), .K0_C2_W2(32'h3da61ecd), .K0_C2_W3(32'h3e24a9d3), .K0_C2_W4(32'hbc5457a1), .K0_C2_W5(32'hbd66c781), .K0_C2_W6(32'h3d1080fa), .K0_C2_W7(32'h3e0dd78d), .K0_C2_W8(32'hbe026846), 
	// 	.K0_C3_W0(32'hbe2bf942), .K0_C3_W1(32'h3d030e52), .K0_C3_W2(32'hbc2141b0), .K0_C3_W3(32'h3dc99d1b), .K0_C3_W4(32'h3dc88a8b), .K0_C3_W5(32'h3dec1ed2), .K0_C3_W6(32'hbe2ce8a0), .K0_C3_W7(32'h3d91e1ef), .K0_C3_W8(32'hbe3d5c41), 
	// 	.K0_C4_W0(32'hbe369453), .K0_C4_W1(32'hbd1f8145), .K0_C4_W2(32'hbdbcd894), .K0_C4_W3(32'h3de61641), .K0_C4_W4(32'hbdb4c491), .K0_C4_W5(32'h3cc0423d), .K0_C4_W6(32'hbc4d4e26), .K0_C4_W7(32'h3d7bd520), .K0_C4_W8(32'hbbba43f8), 
	// 	.K0_C5_W0(32'hbe285a5a), .K0_C5_W1(32'hbdfa4140), .K0_C5_W2(32'h3d3b286c), .K0_C5_W3(32'h3cef6ceb), .K0_C5_W4(32'h3dc1e74e), .K0_C5_W5(32'hbe4557bc), .K0_C5_W6(32'h3dfd0cd3), .K0_C5_W7(32'h3dcbedbb), .K0_C5_W8(32'hbe193edb), 
	// 	.K0_C6_W0(32'h3cb55a3f), .K0_C6_W1(32'hbdde772a), .K0_C6_W2(32'h3e17d2fc), .K0_C6_W3(32'hbe32f29b), .K0_C6_W4(32'hbe46c677), .K0_C6_W5(32'h3d86bf2c), .K0_C6_W6(32'hbe0ee46e), .K0_C6_W7(32'hbe5f633f), .K0_C6_W8(32'h3dbcceba), 
	// 	.K0_C7_W0(32'h3d4fd217), .K0_C7_W1(32'h3e4803b6), .K0_C7_W2(32'h3e518107), .K0_C7_W3(32'h3e1bfe8a), .K0_C7_W4(32'h3e425843), .K0_C7_W5(32'h3dd2b134), .K0_C7_W6(32'hbdf776c7), .K0_C7_W7(32'hbdad0979), .K0_C7_W8(32'h3d8f5fb9), 
	// 	.K0_BIAS (32'hbcb6a174),

	// 	.K1_C0_W0(32'h3d941846), .K1_C0_W1(32'h3d106e9d), .K1_C0_W2(32'hbe2bfb12), .K1_C0_W3(32'hbe10508f), .K1_C0_W4(32'hbe0c4656), .K1_C0_W5(32'hbce25afa), .K1_C0_W6(32'h3d8ffc7f), .K1_C0_W7(32'h3e4885d3), .K1_C0_W8(32'h3d0fc435), 
	// 	.K1_C1_W0(32'h3dbcb435), .K1_C1_W1(32'h3d5674c4), .K1_C1_W2(32'hbd7da07f), .K1_C1_W3(32'hbc2e8941), .K1_C1_W4(32'hbd1517d6), .K1_C1_W5(32'h3e27cfd0), .K1_C1_W6(32'h3ceb11a4), .K1_C1_W7(32'hbdd8b581), .K1_C1_W8(32'h3db1023c), 
	// 	.K1_C2_W0(32'hbca4ccb1), .K1_C2_W1(32'h3e403c3d), .K1_C2_W2(32'h3e27e947), .K1_C2_W3(32'h3d64451f), .K1_C2_W4(32'hbe395c39), .K1_C2_W5(32'h3d60cb1c), .K1_C2_W6(32'hbe518ae9), .K1_C2_W7(32'hbddef321), .K1_C2_W8(32'hbe39f02c), 
	// 	.K1_C3_W0(32'h3de2b9e2), .K1_C3_W1(32'hbe597e8a), .K1_C3_W2(32'h3c0af39c), .K1_C3_W3(32'h3da1d8d9), .K1_C3_W4(32'h3d73c99c), .K1_C3_W5(32'hbe2bba92), .K1_C3_W6(32'hbd8b408a), .K1_C3_W7(32'hbe27c78d), .K1_C3_W8(32'hbde3f101), 
	// 	.K1_C4_W0(32'hbe42a079), .K1_C4_W1(32'hbdaa6cf7), .K1_C4_W2(32'h3e130fe4), .K1_C4_W3(32'hbdd18dda), .K1_C4_W4(32'hbd3893f2), .K1_C4_W5(32'hbd37a6fc), .K1_C4_W6(32'hbd9ed558), .K1_C4_W7(32'h3d96fe02), .K1_C4_W8(32'hbe503469), 
	// 	.K1_C5_W0(32'h3e395212), .K1_C5_W1(32'h3e242522), .K1_C5_W2(32'h3dfe63e0), .K1_C5_W3(32'h3d01f56f), .K1_C5_W4(32'hbe07dd55), .K1_C5_W5(32'h3d9d9b70), .K1_C5_W6(32'hbca42af2), .K1_C5_W7(32'hbd384185), .K1_C5_W8(32'hbca53566), 
	// 	.K1_C6_W0(32'h3db0a8d7), .K1_C6_W1(32'h3e5972d7), .K1_C6_W2(32'hbe002769), .K1_C6_W3(32'h3e0aa88c), .K1_C6_W4(32'hbd1f134e), .K1_C6_W5(32'h3dcbf57c), .K1_C6_W6(32'h3e155bc4), .K1_C6_W7(32'hbcf02eb3), .K1_C6_W8(32'hbe0feb96), 
	// 	.K1_C7_W0(32'h3e2b040b), .K1_C7_W1(32'h3dab67bd), .K1_C7_W2(32'hbdbd74bc), .K1_C7_W3(32'h3e03498a), .K1_C7_W4(32'h3cd28ccc), .K1_C7_W5(32'h3e049bbd), .K1_C7_W6(32'hbd927877), .K1_C7_W7(32'hbe283144), .K1_C7_W8(32'hbda70b15), 
	// 	.K1_BIAS (32'h3d76a30e),

	// 	.K2_C0_W0(32'h3e48be1b), .K2_C0_W1(32'h3e357ac5), .K2_C0_W2(32'h3e53000e), .K2_C0_W3(32'hbda8718d), .K2_C0_W4(32'h3da1d9ea), .K2_C0_W5(32'h3e396a74), .K2_C0_W6(32'h3e26db66), .K2_C0_W7(32'h3e122841), .K2_C0_W8(32'h3df42350), 
	// 	.K2_C1_W0(32'hbcff530f), .K2_C1_W1(32'h3e459ba1), .K2_C1_W2(32'hbe18f2a1), .K2_C1_W3(32'h3d8b044f), .K2_C1_W4(32'h3e0da0e8), .K2_C1_W5(32'h3cbfc053), .K2_C1_W6(32'h3d8d680c), .K2_C1_W7(32'hbe409576), .K2_C1_W8(32'hbcbe8243), 
	// 	.K2_C2_W0(32'hbe2d938f), .K2_C2_W1(32'h3e4e52b0), .K2_C2_W2(32'hbe1c6bba), .K2_C2_W3(32'hbe369833), .K2_C2_W4(32'h3c8d3f34), .K2_C2_W5(32'hba8bfc87), .K2_C2_W6(32'h3e395619), .K2_C2_W7(32'h3e04f5b4), .K2_C2_W8(32'h3da7ba02), 
	// 	.K2_C3_W0(32'h3d870f3d), .K2_C3_W1(32'hbe196e2c), .K2_C3_W2(32'hbce91d6d), .K2_C3_W3(32'h3cf01fa0), .K2_C3_W4(32'h3d0c132e), .K2_C3_W5(32'h3dba498d), .K2_C3_W6(32'h3e417f37), .K2_C3_W7(32'h3b4ef31d), .K2_C3_W8(32'h3dbc46b9), 
	// 	.K2_C4_W0(32'hbd7a8305), .K2_C4_W1(32'h3d9ea07c), .K2_C4_W2(32'h3bed4663), .K2_C4_W3(32'hbd5fcb29), .K2_C4_W4(32'hbda42858), .K2_C4_W5(32'hbc99ee08), .K2_C4_W6(32'hbdd85c04), .K2_C4_W7(32'h3db9328f), .K2_C4_W8(32'h3db4a4cf), 
	// 	.K2_C5_W0(32'h3d00da76), .K2_C5_W1(32'hbe300c6a), .K2_C5_W2(32'hbe4f07ca), .K2_C5_W3(32'h3ddb01e8), .K2_C5_W4(32'h3dd5dfdc), .K2_C5_W5(32'h3daa8004), .K2_C5_W6(32'hbb152342), .K2_C5_W7(32'hbe19f85d), .K2_C5_W8(32'h3ddf60f1), 
	// 	.K2_C6_W0(32'hbe0ff59f), .K2_C6_W1(32'h3e1be064), .K2_C6_W2(32'hbe033144), .K2_C6_W3(32'h3bc77e79), .K2_C6_W4(32'hbd879862), .K2_C6_W5(32'h3d91d6d4), .K2_C6_W6(32'hbc18b95e), .K2_C6_W7(32'hbd3ef532), .K2_C6_W8(32'h3e30a01a), 
	// 	.K2_C7_W0(32'hbde5ce56), .K2_C7_W1(32'h3dad682d), .K2_C7_W2(32'hbd29e470), .K2_C7_W3(32'hbd9d2805), .K2_C7_W4(32'h3db5a2c9), .K2_C7_W5(32'h3d0e4fa5), .K2_C7_W6(32'h3e63ea36), .K2_C7_W7(32'h3dd8bd0f), .K2_C7_W8(32'h3d491349), 
	// 	.K2_BIAS (32'hbd32014c),

	// 	.K3_C0_W0(32'hbd4791e9), .K3_C0_W1(32'hbc13caab), .K3_C0_W2(32'hbe0ae5a9), .K3_C0_W3(32'h3ddaa60a), .K3_C0_W4(32'h3d94d43e), .K3_C0_W5(32'hbdde278c), .K3_C0_W6(32'hbe315a0a), .K3_C0_W7(32'hbe1d4eef), .K3_C0_W8(32'hbe2b1f6f), 
	// 	.K3_C1_W0(32'hbe329ee7), .K3_C1_W1(32'hbe40b5bf), .K3_C1_W2(32'hbe743d3c), .K3_C1_W3(32'h3e1a43d3), .K3_C1_W4(32'hbe0b92d0), .K3_C1_W5(32'hbe1e84b3), .K3_C1_W6(32'h3df84502), .K3_C1_W7(32'hbe12bd2a), .K3_C1_W8(32'hbdffe39a), 
	// 	.K3_C2_W0(32'hbe0f590d), .K3_C2_W1(32'h3e16d18d), .K3_C2_W2(32'h3e10ef83), .K3_C2_W3(32'hbcfafd62), .K3_C2_W4(32'hbe3059a6), .K3_C2_W5(32'h3e33828d), .K3_C2_W6(32'hbd789aba), .K3_C2_W7(32'hbdd227eb), .K3_C2_W8(32'h3e1adcf6), 
	// 	.K3_C3_W0(32'h3d837c50), .K3_C3_W1(32'h3e424421), .K3_C3_W2(32'h3d17cd69), .K3_C3_W3(32'hbddd8eba), .K3_C3_W4(32'hbc8846bf), .K3_C3_W5(32'hbd4d2fbb), .K3_C3_W6(32'h3e2ab26b), .K3_C3_W7(32'hbe2b84cd), .K3_C3_W8(32'h3e08793e), 
	// 	.K3_C4_W0(32'hbe20f668), .K3_C4_W1(32'h3d650a1a), .K3_C4_W2(32'hbe092380), .K3_C4_W3(32'h3df4ece6), .K3_C4_W4(32'h3e46df14), .K3_C4_W5(32'h3dd0c386), .K3_C4_W6(32'h3d39008a), .K3_C4_W7(32'hbc519abb), .K3_C4_W8(32'h3d9356e5), 
	// 	.K3_C5_W0(32'h3c4246c1), .K3_C5_W1(32'hbd98bf94), .K3_C5_W2(32'h3e273862), .K3_C5_W3(32'hbda28078), .K3_C5_W4(32'h3e301f92), .K3_C5_W5(32'h3d1d7d2a), .K3_C5_W6(32'h3c25318c), .K3_C5_W7(32'h3c74fd73), .K3_C5_W8(32'hbe164b94), 
	// 	.K3_C6_W0(32'hbd021133), .K3_C6_W1(32'h3d71139d), .K3_C6_W2(32'h3e0c504e), .K3_C6_W3(32'h3e4da414), .K3_C6_W4(32'hbe0ad5f3), .K3_C6_W5(32'h3e3c6b67), .K3_C6_W6(32'hbdc5fc03), .K3_C6_W7(32'hbb9e22f8), .K3_C6_W8(32'h3e1aa83f), 
	// 	.K3_C7_W0(32'hbd30339d), .K3_C7_W1(32'h3e2eb713), .K3_C7_W2(32'h3e207c56), .K3_C7_W3(32'h3e4c7528), .K3_C7_W4(32'h3db799d1), .K3_C7_W5(32'h3e5d7e45), .K3_C7_W6(32'h3c5ba024), .K3_C7_W7(32'h3d19c270), .K3_C7_W8(32'hbc79fb2f), 
	// 	.K3_BIAS (32'hbcac6ba1),

	// 	.K4_C0_W0(32'h3dd8f95d), .K4_C0_W1(32'hbe389bcb), .K4_C0_W2(32'h3d7ea09f), .K4_C0_W3(32'hbe2f4dd4), .K4_C0_W4(32'h3e446c5f), .K4_C0_W5(32'hbd859a48), .K4_C0_W6(32'hbe21ea8e), .K4_C0_W7(32'h3e4ba546), .K4_C0_W8(32'h3e2ffef5), 
	// 	.K4_C1_W0(32'h3c18fb24), .K4_C1_W1(32'h3dbb0896), .K4_C1_W2(32'hbe0d415c), .K4_C1_W3(32'hbd672018), .K4_C1_W4(32'h3dbccfca), .K4_C1_W5(32'h3cadd506), .K4_C1_W6(32'hbda402ee), .K4_C1_W7(32'h3e098084), .K4_C1_W8(32'hbddb1c23), 
	// 	.K4_C2_W0(32'h3df5ad57), .K4_C2_W1(32'hbdcb0d7a), .K4_C2_W2(32'h3e02c386), .K4_C2_W3(32'hbcfe3a3f), .K4_C2_W4(32'h3d8a4f70), .K4_C2_W5(32'h3e17fbb3), .K4_C2_W6(32'h3e40bbe5), .K4_C2_W7(32'hbbf329de), .K4_C2_W8(32'h3dfb59eb), 
	// 	.K4_C3_W0(32'hbe1ce0df), .K4_C3_W1(32'hbc83b0be), .K4_C3_W2(32'h3da1a30f), .K4_C3_W3(32'h3e4467a7), .K4_C3_W4(32'hbe3b1fc6), .K4_C3_W5(32'hbe3b103a), .K4_C3_W6(32'hbe3b945c), .K4_C3_W7(32'h3d1c8fe4), .K4_C3_W8(32'h3e0d50b9), 
	// 	.K4_C4_W0(32'h3d319bc1), .K4_C4_W1(32'h3e5d5fef), .K4_C4_W2(32'h3e1cd257), .K4_C4_W3(32'h3e281b01), .K4_C4_W4(32'h3c6ef865), .K4_C4_W5(32'h3e595bc2), .K4_C4_W6(32'hbe118a43), .K4_C4_W7(32'h3e5044f6), .K4_C4_W8(32'h3e183831), 
	// 	.K4_C5_W0(32'hbcfed49a), .K4_C5_W1(32'hbe0b9bfd), .K4_C5_W2(32'h3d4e3f67), .K4_C5_W3(32'hbdfecfa9), .K4_C5_W4(32'hbb71ab64), .K4_C5_W5(32'h3d6004e8), .K4_C5_W6(32'h3cc6e41d), .K4_C5_W7(32'h3d957cb9), .K4_C5_W8(32'h3e0f669d), 
	// 	.K4_C6_W0(32'hbdf9417e), .K4_C6_W1(32'h3cce974e), .K4_C6_W2(32'h3e1b95bf), .K4_C6_W3(32'h3e097a62), .K4_C6_W4(32'h3d800bfa), .K4_C6_W5(32'hbe1c1025), .K4_C6_W6(32'hbd940e42), .K4_C6_W7(32'hbe1c66e9), .K4_C6_W8(32'hbda54df6), 
	// 	.K4_C7_W0(32'h3ddbc1f9), .K4_C7_W1(32'hbd95a0cf), .K4_C7_W2(32'h3e5d0b2d), .K4_C7_W3(32'h3d20a755), .K4_C7_W4(32'h3d997b59), .K4_C7_W5(32'h3e598fbc), .K4_C7_W6(32'hbe0a2cc3), .K4_C7_W7(32'h3e452241), .K4_C7_W8(32'h3e00de0e), 
	// 	.K4_BIAS (32'hbd0ba20b),

	// 	.K5_C0_W0(32'hbe0432eb), .K5_C0_W1(32'hbd254488), .K5_C0_W2(32'h3e103149), .K5_C0_W3(32'hbdf0cb03), .K5_C0_W4(32'h3e125062), .K5_C0_W5(32'hbe027552), .K5_C0_W6(32'h3e1bbba2), .K5_C0_W7(32'h3e023c9a), .K5_C0_W8(32'hbe29f45a), 
	// 	.K5_C1_W0(32'hbda119ff), .K5_C1_W1(32'h3d9d5159), .K5_C1_W2(32'h3d312e75), .K5_C1_W3(32'h3cb7105b), .K5_C1_W4(32'hbe687f95), .K5_C1_W5(32'h3da7383a), .K5_C1_W6(32'h3e16f98a), .K5_C1_W7(32'hbe0bec4b), .K5_C1_W8(32'h3e3f6c35), 
	// 	.K5_C2_W0(32'hbdb75677), .K5_C2_W1(32'h3d91e3b0), .K5_C2_W2(32'hbddf331e), .K5_C2_W3(32'h3da6cb8a), .K5_C2_W4(32'h3de6e10e), .K5_C2_W5(32'h3e078956), .K5_C2_W6(32'hbb5f94ce), .K5_C2_W7(32'h3e5af306), .K5_C2_W8(32'hbe016ad3), 
	// 	.K5_C3_W0(32'hbd9f5f29), .K5_C3_W1(32'h3e4b6448), .K5_C3_W2(32'hbe44cb75), .K5_C3_W3(32'hbdfbeaff), .K5_C3_W4(32'h3e1e40bc), .K5_C3_W5(32'hbe4ec6f7), .K5_C3_W6(32'h3cbe96c0), .K5_C3_W7(32'h3e53f5ce), .K5_C3_W8(32'h3e44cecf), 
	// 	.K5_C4_W0(32'h3c1b2ff6), .K5_C4_W1(32'hbdfb89db), .K5_C4_W2(32'hbd8aaf6a), .K5_C4_W3(32'h3e57b788), .K5_C4_W4(32'hbdac4597), .K5_C4_W5(32'hbcc471df), .K5_C4_W6(32'hbb07c68d), .K5_C4_W7(32'hbe316fbf), .K5_C4_W8(32'hbdbc6d53), 
	// 	.K5_C5_W0(32'hbd3a9a2c), .K5_C5_W1(32'hbc1d3a4b), .K5_C5_W2(32'hbe24cd96), .K5_C5_W3(32'h3e0e42b2), .K5_C5_W4(32'hbd1f0a51), .K5_C5_W5(32'h3d82dffc), .K5_C5_W6(32'h3bb970d2), .K5_C5_W7(32'h3deadea2), .K5_C5_W8(32'h3dfa47a5), 
	// 	.K5_C6_W0(32'hbdfd33a6), .K5_C6_W1(32'hbe2f4547), .K5_C6_W2(32'h3d097b3e), .K5_C6_W3(32'h3e3eed13), .K5_C6_W4(32'h3dfa9e6c), .K5_C6_W5(32'h3e091dbe), .K5_C6_W6(32'hbe2a21ea), .K5_C6_W7(32'h3e344ba4), .K5_C6_W8(32'h3e0b155a), 
	// 	.K5_C7_W0(32'hbe1d13f6), .K5_C7_W1(32'hbe2cfd5c), .K5_C7_W2(32'h3e1d2d04), .K5_C7_W3(32'h3d83dba3), .K5_C7_W4(32'hbd997534), .K5_C7_W5(32'hbe37a090), .K5_C7_W6(32'hbe306fc1), .K5_C7_W7(32'hbce4cb8a), .K5_C7_W8(32'hbdc89da8), 
	// 	.K5_BIAS (32'h3ce4dbb6),

	// 	.K6_C0_W0(32'hbde31158), .K6_C0_W1(32'hbe0e1dee), .K6_C0_W2(32'hbdbc489d), .K6_C0_W3(32'h3de8136d), .K6_C0_W4(32'hbe2b8982), .K6_C0_W5(32'hbdd97c21), .K6_C0_W6(32'hbe636ffc), .K6_C0_W7(32'h3dfeb464), .K6_C0_W8(32'hbe1751e8), 
	// 	.K6_C1_W0(32'hbdb6f13e), .K6_C1_W1(32'hbe441dd1), .K6_C1_W2(32'hbd2b4ad5), .K6_C1_W3(32'h3db3f86e), .K6_C1_W4(32'hbcd85a6b), .K6_C1_W5(32'hbe43353e), .K6_C1_W6(32'hbcd073f2), .K6_C1_W7(32'h3e1f0af8), .K6_C1_W8(32'h3cf40fef), 
	// 	.K6_C2_W0(32'hbe1f6712), .K6_C2_W1(32'h3e359b7b), .K6_C2_W2(32'hbddd9866), .K6_C2_W3(32'hbe0d42e7), .K6_C2_W4(32'h3ac8f8a4), .K6_C2_W5(32'hbcdee264), .K6_C2_W6(32'hbe463982), .K6_C2_W7(32'h3d90ae49), .K6_C2_W8(32'h3d2e07bb), 
	// 	.K6_C3_W0(32'h3e472780), .K6_C3_W1(32'h3cb24b66), .K6_C3_W2(32'h3be6682a), .K6_C3_W3(32'h3e692bdf), .K6_C3_W4(32'h3e488254), .K6_C3_W5(32'h3dc50636), .K6_C3_W6(32'h3dc649a7), .K6_C3_W7(32'hbc6b2b06), .K6_C3_W8(32'hbd554fac), 
	// 	.K6_C4_W0(32'hbd04e602), .K6_C4_W1(32'h3dd67d1f), .K6_C4_W2(32'hbd168646), .K6_C4_W3(32'h3d326768), .K6_C4_W4(32'h3e034d5f), .K6_C4_W5(32'h3e0d75ef), .K6_C4_W6(32'h3daa14cb), .K6_C4_W7(32'hbd7ac7b9), .K6_C4_W8(32'hbd239922), 
	// 	.K6_C5_W0(32'h3cc7f006), .K6_C5_W1(32'h3e56a8ec), .K6_C5_W2(32'h3dd90387), .K6_C5_W3(32'h3df892c0), .K6_C5_W4(32'hbd918d8b), .K6_C5_W5(32'hbdc84ba0), .K6_C5_W6(32'h3b70cc4f), .K6_C5_W7(32'h3cbeffc9), .K6_C5_W8(32'h3dee3e90), 
	// 	.K6_C6_W0(32'hbe569969), .K6_C6_W1(32'h3bd1bde9), .K6_C6_W2(32'hbdfdac39), .K6_C6_W3(32'h3de65070), .K6_C6_W4(32'hbd822075), .K6_C6_W5(32'hbc5b8388), .K6_C6_W6(32'h3e045086), .K6_C6_W7(32'h3e35dd6b), .K6_C6_W8(32'h3cea8b66), 
	// 	.K6_C7_W0(32'h3e43fe8b), .K6_C7_W1(32'h3e159b75), .K6_C7_W2(32'h3d92f505), .K6_C7_W3(32'hbe481bf8), .K6_C7_W4(32'h3d0a7eb9), .K6_C7_W5(32'h3d92024f), .K6_C7_W6(32'hbda984a1), .K6_C7_W7(32'hbe51b588), .K6_C7_W8(32'h3ddc0007), 
	// 	.K6_BIAS (32'h399b13f1),

	// 	.K7_C0_W0(32'hbe263af9), .K7_C0_W1(32'hbd9e3fe9), .K7_C0_W2(32'hbc999c8e), .K7_C0_W3(32'h3cfa517b), .K7_C0_W4(32'h3d85524c), .K7_C0_W5(32'h3d81902f), .K7_C0_W6(32'h3df26798), .K7_C0_W7(32'hbe2c6f60), .K7_C0_W8(32'hbbb50481), 
	// 	.K7_C1_W0(32'h3d901d34), .K7_C1_W1(32'h3d45ba9f), .K7_C1_W2(32'h3dc9ae0d), .K7_C1_W3(32'hbd9870fe), .K7_C1_W4(32'h3d6009b4), .K7_C1_W5(32'h3e3ba4ed), .K7_C1_W6(32'hbde04c7c), .K7_C1_W7(32'h3c8e085f), .K7_C1_W8(32'h3e66e88c), 
	// 	.K7_C2_W0(32'h3d202d2c), .K7_C2_W1(32'hbe46f7cc), .K7_C2_W2(32'hbe09b48c), .K7_C2_W3(32'hbe4b94a8), .K7_C2_W4(32'hbe479b69), .K7_C2_W5(32'h3e094a61), .K7_C2_W6(32'hbdbe8475), .K7_C2_W7(32'hbe473a47), .K7_C2_W8(32'h3d99dcf8), 
	// 	.K7_C3_W0(32'h3d0dd46f), .K7_C3_W1(32'hbe4b9ee6), .K7_C3_W2(32'hbe3e4a80), .K7_C3_W3(32'h3dade172), .K7_C3_W4(32'hbe2420a5), .K7_C3_W5(32'hbda722c7), .K7_C3_W6(32'h3e639770), .K7_C3_W7(32'hbd359ef3), .K7_C3_W8(32'hbe0632ff), 
	// 	.K7_C4_W0(32'h3cec9c0a), .K7_C4_W1(32'h3dec9e5d), .K7_C4_W2(32'hbddbbe9a), .K7_C4_W3(32'hbe189db2), .K7_C4_W4(32'h3d2a03aa), .K7_C4_W5(32'h3e475f9d), .K7_C4_W6(32'hbc7f4ff5), .K7_C4_W7(32'h3e507d9a), .K7_C4_W8(32'h3dca5b8d), 
	// 	.K7_C5_W0(32'h3b821644), .K7_C5_W1(32'h3e4f6f57), .K7_C5_W2(32'hbbaf3ee0), .K7_C5_W3(32'h3e2d4243), .K7_C5_W4(32'hbe11f536), .K7_C5_W5(32'h3dcf46b5), .K7_C5_W6(32'hbe16b0f4), .K7_C5_W7(32'h3e093d87), .K7_C5_W8(32'h3e2f63af), 
	// 	.K7_C6_W0(32'h3d2b7a78), .K7_C6_W1(32'h3e074df2), .K7_C6_W2(32'hbe46cae1), .K7_C6_W3(32'hbe563edb), .K7_C6_W4(32'h3df372e8), .K7_C6_W5(32'hbd85ce1b), .K7_C6_W6(32'h3e4707c4), .K7_C6_W7(32'h3db7af27), .K7_C6_W8(32'hbda9ab41), 
	// 	.K7_C7_W0(32'hbda978f7), .K7_C7_W1(32'hbd98d676), .K7_C7_W2(32'hbd9185ca), .K7_C7_W3(32'h3d9e7e6b), .K7_C7_W4(32'h3e52dad0), .K7_C7_W5(32'hbdcbb470), .K7_C7_W6(32'hbce3b81b), .K7_C7_W7(32'h3da62683), .K7_C7_W8(32'hbd78eacb), 
	// 	.K7_BIAS (32'h3c43974d)
	// 	)
	// 	block3_conv1(
	// 	.clk(clk),
	// 	.resetn(resetn),
	// 	.data_valid_in(valid_in),		// Edit here
	// 	.data_in_0(data_in_0),			// Edit here
	// 	.data_in_1(data_in_1),			// Edit here
	// 	.data_in_2(data_in_2),			// Edit here
	// 	.data_in_3(data_in_3),			// Edit here
	// 	.data_in_4(data_in_4),			// Edit here
	// 	.data_in_5(data_in_5),			// Edit here
	// 	.data_in_6(data_in_6),			// Edit here
	// 	.data_in_7(data_in_7),			// Edit here
	// 	.data_out_conv_0(conv_out_3_1[0]),
	// 	.data_out_conv_1(conv_out_3_1[1]),
	// 	.data_out_conv_2(conv_out_3_1[2]),
	// 	.data_out_conv_3(conv_out_3_1[3]),
	// 	.data_out_conv_4(conv_out_3_1[4]),
	// 	.data_out_conv_5(conv_out_3_1[5]),
	// 	.data_out_conv_6(conv_out_3_1[6]),
	// 	.data_out_conv_7(conv_out_3_1[7]),
	// 	.valid_out_pixel(conv_valid_out_3_1),
	// 	.done(done_conv_3_1)
	// 	);
	


	// conv3d_8_kernel_8_channel_size_3 #(
	// 	.DATA_WIDTH(32),.IMG_WIDTH(WIDTH>>2),.IMG_HEIGHT(HEIGHT>>2),
	// 	.K0_C0_W0(32'h3ca607a8), .K0_C0_W1(32'h3de96376), .K0_C0_W2(32'h3d85f7cc), .K0_C0_W3(32'h3dddfa44), .K0_C0_W4(32'hbdaaf5c6), .K0_C0_W5(32'h3adb76fb), .K0_C0_W6(32'h3de05fb4), .K0_C0_W7(32'hbdf87687), .K0_C0_W8(32'h3dd6fcd5), 
	// 	.K0_C1_W0(32'h3d4ddbf1), .K0_C1_W1(32'hbd2d7388), .K0_C1_W2(32'h3d1b32db), .K0_C1_W3(32'h3e022e25), .K0_C1_W4(32'h3e46b4d7), .K0_C1_W5(32'hbdd6ab31), .K0_C1_W6(32'hbdc3e90b), .K0_C1_W7(32'hbe532cba), .K0_C1_W8(32'hbe3c81c7), 
	// 	.K0_C2_W0(32'h3c7ce30a), .K0_C2_W1(32'hbd89f129), .K0_C2_W2(32'hbdd6429c), .K0_C2_W3(32'hbd7222a9), .K0_C2_W4(32'hbe266b01), .K0_C2_W5(32'hbe1c8285), .K0_C2_W6(32'h3e020195), .K0_C2_W7(32'h3e4a36bf), .K0_C2_W8(32'h3e014e88), 
	// 	.K0_C3_W0(32'hbe3fa808), .K0_C3_W1(32'hbcd7dd7d), .K0_C3_W2(32'hbde09fda), .K0_C3_W3(32'h3d531ebe), .K0_C3_W4(32'hbe2ae9e9), .K0_C3_W5(32'h3c6faf3d), .K0_C3_W6(32'hbcf69033), .K0_C3_W7(32'hbd94ae7f), .K0_C3_W8(32'h3dbbf134), 
	// 	.K0_C4_W0(32'hbe195083), .K0_C4_W1(32'hbe29a9e2), .K0_C4_W2(32'hbd02a1d3), .K0_C4_W3(32'h3d218c80), .K0_C4_W4(32'h3ce7afc3), .K0_C4_W5(32'h3e3cbb92), .K0_C4_W6(32'hbc11743c), .K0_C4_W7(32'hbe22360b), .K0_C4_W8(32'h3e46f010), 
	// 	.K0_C5_W0(32'hbd8ffcbf), .K0_C5_W1(32'hbe36b284), .K0_C5_W2(32'hbe4e9bb2), .K0_C5_W3(32'hbca2944a), .K0_C5_W4(32'hbd8c2af8), .K0_C5_W5(32'hbbe061c8), .K0_C5_W6(32'hbdcebb8b), .K0_C5_W7(32'hba9d17d6), .K0_C5_W8(32'hbc8cf8f8), 
	// 	.K0_C6_W0(32'hbdc9ba03), .K0_C6_W1(32'hbd6447e7), .K0_C6_W2(32'h3e37d488), .K0_C6_W3(32'h3dad1512), .K0_C6_W4(32'hbe478bab), .K0_C6_W5(32'h3d7fee07), .K0_C6_W6(32'h3de270b5), .K0_C6_W7(32'hbe22f560), .K0_C6_W8(32'h3e4f0b60), 
	// 	.K0_C7_W0(32'h3da4336f), .K0_C7_W1(32'h3d802eb5), .K0_C7_W2(32'h3cce1305), .K0_C7_W3(32'h3e2377dd), .K0_C7_W4(32'h3ddd8134), .K0_C7_W5(32'h3ded0828), .K0_C7_W6(32'h3e05d8df), .K0_C7_W7(32'h3dc2415f), .K0_C7_W8(32'hbd86dc1a), 
	// 	.K0_BIAS (32'h3c068884),

	// 	.K1_C0_W0(32'hbdce9ce0), .K1_C0_W1(32'hbe049e32), .K1_C0_W2(32'hbe16097e), .K1_C0_W3(32'h3d3c26d2), .K1_C0_W4(32'hbd883246), .K1_C0_W5(32'hbe1bf3b4), .K1_C0_W6(32'hbe8afca5), .K1_C0_W7(32'h3e0c74ac), .K1_C0_W8(32'hbe4d0fa3), 
	// 	.K1_C1_W0(32'hbdb9abf5), .K1_C1_W1(32'h3e3dcecf), .K1_C1_W2(32'hbe1c0aa4), .K1_C1_W3(32'h3dce755c), .K1_C1_W4(32'hbe30847f), .K1_C1_W5(32'h3e3bfae4), .K1_C1_W6(32'hbdb181c2), .K1_C1_W7(32'h3d70b3af), .K1_C1_W8(32'hbe4dcec6), 
	// 	.K1_C2_W0(32'hbd4a4610), .K1_C2_W1(32'hbddf9312), .K1_C2_W2(32'hbda83ddf), .K1_C2_W3(32'hbd8754dc), .K1_C2_W4(32'h3caab8b2), .K1_C2_W5(32'hbd9fde86), .K1_C2_W6(32'h3e209dff), .K1_C2_W7(32'h3e328afb), .K1_C2_W8(32'h3e321df8), 
	// 	.K1_C3_W0(32'hbe52ad33), .K1_C3_W1(32'hbe1db51c), .K1_C3_W2(32'h3c20557b), .K1_C3_W3(32'hbdcff90f), .K1_C3_W4(32'h3d24c4bc), .K1_C3_W5(32'hbc9a85e8), .K1_C3_W6(32'h3c8176f0), .K1_C3_W7(32'hbde10879), .K1_C3_W8(32'h3d1956be), 
	// 	.K1_C4_W0(32'h3e174bc9), .K1_C4_W1(32'h3d307fbc), .K1_C4_W2(32'hbcb4dd2d), .K1_C4_W3(32'hbe4d12e9), .K1_C4_W4(32'hbc178a0c), .K1_C4_W5(32'hbe4616b8), .K1_C4_W6(32'h3d366bf9), .K1_C4_W7(32'h3c1f28b3), .K1_C4_W8(32'hbce82413), 
	// 	.K1_C5_W0(32'hbd930a9c), .K1_C5_W1(32'h3e464a3f), .K1_C5_W2(32'h3caba3a5), .K1_C5_W3(32'hbd547cc9), .K1_C5_W4(32'h3dd023c8), .K1_C5_W5(32'h3c9daed9), .K1_C5_W6(32'h3e557339), .K1_C5_W7(32'h3dc5a06f), .K1_C5_W8(32'h3e241dff), 
	// 	.K1_C6_W0(32'hbe0478d5), .K1_C6_W1(32'hbc74d9db), .K1_C6_W2(32'hbd45d381), .K1_C6_W3(32'hbdf17300), .K1_C6_W4(32'h3e0bbba1), .K1_C6_W5(32'h3e134bea), .K1_C6_W6(32'h3d1e5138), .K1_C6_W7(32'h3c74acc4), .K1_C6_W8(32'hbe343d3a), 
	// 	.K1_C7_W0(32'h3d893b9b), .K1_C7_W1(32'hbe40c7e7), .K1_C7_W2(32'h3e48739b), .K1_C7_W3(32'hbe41f150), .K1_C7_W4(32'hbe416f26), .K1_C7_W5(32'h3d7754e1), .K1_C7_W6(32'h3e20bbfb), .K1_C7_W7(32'hbe4607ed), .K1_C7_W8(32'hbdd7b579), 
	// 	.K1_BIAS (32'h3cd3cf03),

	// 	.K2_C0_W0(32'hbdc81bfc), .K2_C0_W1(32'h3e3fded1), .K2_C0_W2(32'h3b26794d), .K2_C0_W3(32'h3da77c5b), .K2_C0_W4(32'h3d9458d8), .K2_C0_W5(32'h3d9368bb), .K2_C0_W6(32'hbd05eeb5), .K2_C0_W7(32'h3e34062c), .K2_C0_W8(32'h3e470db1), 
	// 	.K2_C1_W0(32'h3df53572), .K2_C1_W1(32'h3cec8e6c), .K2_C1_W2(32'h3e001eb4), .K2_C1_W3(32'h3da138f5), .K2_C1_W4(32'h3da9328b), .K2_C1_W5(32'h3d50c007), .K2_C1_W6(32'h3d4c0b80), .K2_C1_W7(32'h3de2fea3), .K2_C1_W8(32'h3df40865), 
	// 	.K2_C2_W0(32'hbe2b0f7c), .K2_C2_W1(32'hbe54cc12), .K2_C2_W2(32'h3e0ddc71), .K2_C2_W3(32'h3e2fb7aa), .K2_C2_W4(32'h3e513ade), .K2_C2_W5(32'h3e26849d), .K2_C2_W6(32'h3e2b14c7), .K2_C2_W7(32'hbc8546b1), .K2_C2_W8(32'h3e35e2f7), 
	// 	.K2_C3_W0(32'h3e442861), .K2_C3_W1(32'hbdd12670), .K2_C3_W2(32'hbdbee694), .K2_C3_W3(32'hbe534e11), .K2_C3_W4(32'hbddbc8b1), .K2_C3_W5(32'h3c555ba7), .K2_C3_W6(32'hbc48c36a), .K2_C3_W7(32'hbbc1a170), .K2_C3_W8(32'hbdfb59e5), 
	// 	.K2_C4_W0(32'hbd92c137), .K2_C4_W1(32'h3dbc25df), .K2_C4_W2(32'h3e218358), .K2_C4_W3(32'hbdb906a1), .K2_C4_W4(32'h3df0735f), .K2_C4_W5(32'h3df4c74c), .K2_C4_W6(32'h3b43f5b6), .K2_C4_W7(32'hbc4b96de), .K2_C4_W8(32'hbdf80304), 
	// 	.K2_C5_W0(32'hbcbe82ef), .K2_C5_W1(32'hbddf230b), .K2_C5_W2(32'h3e254fe1), .K2_C5_W3(32'hbd4fec4a), .K2_C5_W4(32'hbdbf6585), .K2_C5_W5(32'hbd954de3), .K2_C5_W6(32'hbe1804f1), .K2_C5_W7(32'hbda33467), .K2_C5_W8(32'h3d454af9), 
	// 	.K2_C6_W0(32'hbd85673f), .K2_C6_W1(32'h3d06772e), .K2_C6_W2(32'hbc74c789), .K2_C6_W3(32'hbcf57939), .K2_C6_W4(32'h3df9a157), .K2_C6_W5(32'h3bf182b1), .K2_C6_W6(32'h3cc0c12f), .K2_C6_W7(32'h3d940a7d), .K2_C6_W8(32'h3d61e238), 
	// 	.K2_C7_W0(32'hbe200d4a), .K2_C7_W1(32'h3db52ecb), .K2_C7_W2(32'hbd414c48), .K2_C7_W3(32'h3e3f3b55), .K2_C7_W4(32'hbe2ea40d), .K2_C7_W5(32'hbbff0b14), .K2_C7_W6(32'hbd43ea92), .K2_C7_W7(32'hbda12e9a), .K2_C7_W8(32'h3de34122), 
	// 	.K2_BIAS (32'hbc95b58d),

	// 	.K3_C0_W0(32'hbe70397d), .K3_C0_W1(32'h3e138efa), .K3_C0_W2(32'hbe505586), .K3_C0_W3(32'h3d83d748), .K3_C0_W4(32'h3c9b689d), .K3_C0_W5(32'h3cd30466), .K3_C0_W6(32'h3de94dfb), .K3_C0_W7(32'hbd6b0083), .K3_C0_W8(32'hbd114f65), 
	// 	.K3_C1_W0(32'hbe41bd84), .K3_C1_W1(32'hbde8cfcc), .K3_C1_W2(32'hbdaa1649), .K3_C1_W3(32'hbe4e0190), .K3_C1_W4(32'h3ca63ffe), .K3_C1_W5(32'h3da499d9), .K3_C1_W6(32'h3ddfca9f), .K3_C1_W7(32'hbe290b6b), .K3_C1_W8(32'h3e38c7dc), 
	// 	.K3_C2_W0(32'h3c5bc0d2), .K3_C2_W1(32'h3e54549f), .K3_C2_W2(32'h3cf5ecaf), .K3_C2_W3(32'hbe3af1d5), .K3_C2_W4(32'hbdb0dfc8), .K3_C2_W5(32'h3e335cb4), .K3_C2_W6(32'h3e117a20), .K3_C2_W7(32'h3d1c2620), .K3_C2_W8(32'h3e1b216b), 
	// 	.K3_C3_W0(32'h3dd1d248), .K3_C3_W1(32'hbdb04af1), .K3_C3_W2(32'hbdacac45), .K3_C3_W3(32'h3e7dfffc), .K3_C3_W4(32'h3d3f6dcb), .K3_C3_W5(32'h3e227f64), .K3_C3_W6(32'hbe2f6cad), .K3_C3_W7(32'hbd327ebb), .K3_C3_W8(32'h3dbe23cf), 
	// 	.K3_C4_W0(32'h3e2f142a), .K3_C4_W1(32'h3c236c0d), .K3_C4_W2(32'hbe35ff7f), .K3_C4_W3(32'hbde0563d), .K3_C4_W4(32'h3e6a6b1c), .K3_C4_W5(32'h3d1bf0cd), .K3_C4_W6(32'h3e0a23e4), .K3_C4_W7(32'h3e750b69), .K3_C4_W8(32'h3e29a9f8), 
	// 	.K3_C5_W0(32'hbe0987ab), .K3_C5_W1(32'hbda6f5ff), .K3_C5_W2(32'h3e43335c), .K3_C5_W3(32'hbdeb3e39), .K3_C5_W4(32'h3dbbed5d), .K3_C5_W5(32'hbd5518f2), .K3_C5_W6(32'hbdd58d05), .K3_C5_W7(32'h3e1293bd), .K3_C5_W8(32'hbc9fb2d2), 
	// 	.K3_C6_W0(32'h3dd432ff), .K3_C6_W1(32'h3e063647), .K3_C6_W2(32'h3e242554), .K3_C6_W3(32'h3e2a81d5), .K3_C6_W4(32'h3e04c79b), .K3_C6_W5(32'h3db0f6e3), .K3_C6_W6(32'h3d990de0), .K3_C6_W7(32'h3e34bec0), .K3_C6_W8(32'hbcb84229), 
	// 	.K3_C7_W0(32'hbe0abe9b), .K3_C7_W1(32'h3e0022c5), .K3_C7_W2(32'h3d4f11d7), .K3_C7_W3(32'hbd5e247c), .K3_C7_W4(32'h3c94e0df), .K3_C7_W5(32'hbe456197), .K3_C7_W6(32'hbd9fb147), .K3_C7_W7(32'h3dce35f3), .K3_C7_W8(32'hbb0d56b4), 
	// 	.K3_BIAS (32'hbc56eb83),

	// 	.K4_C0_W0(32'hbe2ca45b), .K4_C0_W1(32'h3d315c7a), .K4_C0_W2(32'hbe17d2a6), .K4_C0_W3(32'hbcccea01), .K4_C0_W4(32'hbbd06234), .K4_C0_W5(32'h3d515d8d), .K4_C0_W6(32'hbd820742), .K4_C0_W7(32'h3e2c526c), .K4_C0_W8(32'hbd1a988d), 
	// 	.K4_C1_W0(32'hbc8a5586), .K4_C1_W1(32'h3e07a9fb), .K4_C1_W2(32'hbdcb148d), .K4_C1_W3(32'hbdbda847), .K4_C1_W4(32'hbc75519e), .K4_C1_W5(32'hbd20b63e), .K4_C1_W6(32'h3dda5556), .K4_C1_W7(32'h3e33c83e), .K4_C1_W8(32'hbdb3b4b6), 
	// 	.K4_C2_W0(32'h3d1f43b7), .K4_C2_W1(32'hbe3f6e5d), .K4_C2_W2(32'h3e495810), .K4_C2_W3(32'h3c95c8f6), .K4_C2_W4(32'h3e198922), .K4_C2_W5(32'hbcb0ad95), .K4_C2_W6(32'h3e30d076), .K4_C2_W7(32'hbe1f6e5e), .K4_C2_W8(32'hbdb0f5e3), 
	// 	.K4_C3_W0(32'hbd4a9557), .K4_C3_W1(32'hbe240100), .K4_C3_W2(32'h3e2e5191), .K4_C3_W3(32'h3e3e222b), .K4_C3_W4(32'h3de3c4f9), .K4_C3_W5(32'h3e20c879), .K4_C3_W6(32'h3c15e8e6), .K4_C3_W7(32'hbe385549), .K4_C3_W8(32'hbdd4d82a), 
	// 	.K4_C4_W0(32'hbe0464a8), .K4_C4_W1(32'h3d11f87e), .K4_C4_W2(32'hbd0982a1), .K4_C4_W3(32'h3db93bbb), .K4_C4_W4(32'h3c1a736a), .K4_C4_W5(32'hbe085478), .K4_C4_W6(32'hbe1f6359), .K4_C4_W7(32'hbd8d1e6e), .K4_C4_W8(32'h3dafe1e8), 
	// 	.K4_C5_W0(32'hbab28c24), .K4_C5_W1(32'hbe449d79), .K4_C5_W2(32'h3d19c0e1), .K4_C5_W3(32'h3e1aa2b6), .K4_C5_W4(32'h3d8c0cab), .K4_C5_W5(32'hbdf5c458), .K4_C5_W6(32'hbd0bfee3), .K4_C5_W7(32'h3df5d2e9), .K4_C5_W8(32'hbcd5bf9f), 
	// 	.K4_C6_W0(32'hbafcccb8), .K4_C6_W1(32'h3d014cf7), .K4_C6_W2(32'h3d87f837), .K4_C6_W3(32'hbe2f1a25), .K4_C6_W4(32'hbe3bbe37), .K4_C6_W5(32'hbe599081), .K4_C6_W6(32'hbe044dd0), .K4_C6_W7(32'hbdc5c612), .K4_C6_W8(32'hbe4be8bb), 
	// 	.K4_C7_W0(32'hbdf8697b), .K4_C7_W1(32'hbe095198), .K4_C7_W2(32'hbd109d69), .K4_C7_W3(32'hbd83433c), .K4_C7_W4(32'h3db0c15c), .K4_C7_W5(32'h3dc85ec2), .K4_C7_W6(32'h3e0a80f4), .K4_C7_W7(32'hbe288266), .K4_C7_W8(32'h3e4139c5), 
	// 	.K4_BIAS (32'hbca500eb),

	// 	.K5_C0_W0(32'h3d68e892), .K5_C0_W1(32'hbe1d7d7b), .K5_C0_W2(32'h3d956667), .K5_C0_W3(32'h3e069e3a), .K5_C0_W4(32'h3ceaf635), .K5_C0_W5(32'h3d4e0f83), .K5_C0_W6(32'h3dc461bf), .K5_C0_W7(32'h3d265b27), .K5_C0_W8(32'hbe345a9e), 
	// 	.K5_C1_W0(32'hbe6054a7), .K5_C1_W1(32'hbdb8d168), .K5_C1_W2(32'hbe02571c), .K5_C1_W3(32'hbcd6ad89), .K5_C1_W4(32'hbdeca2e8), .K5_C1_W5(32'hbd665ccb), .K5_C1_W6(32'h3e31465d), .K5_C1_W7(32'h3d40ab4a), .K5_C1_W8(32'hbe51fd27), 
	// 	.K5_C2_W0(32'hbcb39d35), .K5_C2_W1(32'hbcfe6ed0), .K5_C2_W2(32'h3d880907), .K5_C2_W3(32'h3c540798), .K5_C2_W4(32'h3e3b52e6), .K5_C2_W5(32'h3ccecbd6), .K5_C2_W6(32'hbdefc6f1), .K5_C2_W7(32'hbbace01a), .K5_C2_W8(32'hbdb38636), 
	// 	.K5_C3_W0(32'hbe048e0b), .K5_C3_W1(32'hbd8c7491), .K5_C3_W2(32'h3e231c04), .K5_C3_W3(32'hbd4256e1), .K5_C3_W4(32'hbd5c621a), .K5_C3_W5(32'hbe45cbb7), .K5_C3_W6(32'h3d99beb1), .K5_C3_W7(32'hbd32b2db), .K5_C3_W8(32'hbe278869), 
	// 	.K5_C4_W0(32'h3e592700), .K5_C4_W1(32'h3d28df5a), .K5_C4_W2(32'hbdebf58b), .K5_C4_W3(32'h3ddf3490), .K5_C4_W4(32'h3e1c3efe), .K5_C4_W5(32'h3e09dbf9), .K5_C4_W6(32'hbdab2146), .K5_C4_W7(32'h3e592b40), .K5_C4_W8(32'hbd886a96), 
	// 	.K5_C5_W0(32'hbd872380), .K5_C5_W1(32'h3e047def), .K5_C5_W2(32'h3b738879), .K5_C5_W3(32'h3d7abc3c), .K5_C5_W4(32'h3e3e8747), .K5_C5_W5(32'h3dde53ea), .K5_C5_W6(32'hbd8eb557), .K5_C5_W7(32'hbe5dfa47), .K5_C5_W8(32'hbe696363), 
	// 	.K5_C6_W0(32'hbe19d216), .K5_C6_W1(32'hbc35dd45), .K5_C6_W2(32'hbd6db2bf), .K5_C6_W3(32'h3e469082), .K5_C6_W4(32'hbddc347b), .K5_C6_W5(32'hbd5f7456), .K5_C6_W6(32'hbca61cdb), .K5_C6_W7(32'hbe007c15), .K5_C6_W8(32'hbcb400a9), 
	// 	.K5_C7_W0(32'hbe143670), .K5_C7_W1(32'h3e2082ed), .K5_C7_W2(32'h3d8ec92e), .K5_C7_W3(32'h3df837ca), .K5_C7_W4(32'h3c20750b), .K5_C7_W5(32'hbde9952c), .K5_C7_W6(32'hbd863179), .K5_C7_W7(32'hbe28a225), .K5_C7_W8(32'hbd9ef4ce), 
	// 	.K5_BIAS (32'hbcc9887b),

	// 	.K6_C0_W0(32'hbe33b8a8), .K6_C0_W1(32'hbe13ceb2), .K6_C0_W2(32'h3ca13299), .K6_C0_W3(32'hbdde9b4a), .K6_C0_W4(32'hbd78097c), .K6_C0_W5(32'h3d0ad880), .K6_C0_W6(32'hbdcf8cf7), .K6_C0_W7(32'hbe754082), .K6_C0_W8(32'h3e3ca984), 
	// 	.K6_C1_W0(32'h3e29297e), .K6_C1_W1(32'h3e0d4c5b), .K6_C1_W2(32'hbe1f4177), .K6_C1_W3(32'h3ddac4a9), .K6_C1_W4(32'h3d7babdb), .K6_C1_W5(32'hbd1780fa), .K6_C1_W6(32'h3e4ffbac), .K6_C1_W7(32'h3cd4dd01), .K6_C1_W8(32'hbde908fc), 
	// 	.K6_C2_W0(32'h3e054e76), .K6_C2_W1(32'h3d9619fe), .K6_C2_W2(32'h3dcca3ed), .K6_C2_W3(32'hbe0c736c), .K6_C2_W4(32'h3cbdd547), .K6_C2_W5(32'hbc19f149), .K6_C2_W6(32'hbe712698), .K6_C2_W7(32'hbe2c1a1b), .K6_C2_W8(32'h3e1798cf), 
	// 	.K6_C3_W0(32'h3d24e0c1), .K6_C3_W1(32'hbd114268), .K6_C3_W2(32'h3ddd55bb), .K6_C3_W3(32'h3def1b9f), .K6_C3_W4(32'h3dc5e75b), .K6_C3_W5(32'h3e18686f), .K6_C3_W6(32'hbcc54aa9), .K6_C3_W7(32'h3d996e38), .K6_C3_W8(32'hbe1060c1), 
	// 	.K6_C4_W0(32'h3e0b7cb9), .K6_C4_W1(32'hbdef3b00), .K6_C4_W2(32'hbd05bc83), .K6_C4_W3(32'h3e129764), .K6_C4_W4(32'hbe33cb17), .K6_C4_W5(32'hbe54e9c4), .K6_C4_W6(32'hbe47c3b8), .K6_C4_W7(32'h3e43e0a8), .K6_C4_W8(32'hbd207828), 
	// 	.K6_C5_W0(32'h3d999fa3), .K6_C5_W1(32'hbd41b273), .K6_C5_W2(32'h3e0895e2), .K6_C5_W3(32'h3d80be15), .K6_C5_W4(32'hbdc2a428), .K6_C5_W5(32'h3e095371), .K6_C5_W6(32'hbd64d964), .K6_C5_W7(32'h3e0ffed5), .K6_C5_W8(32'hbd13e115), 
	// 	.K6_C6_W0(32'hbe027db2), .K6_C6_W1(32'hbdc0fae5), .K6_C6_W2(32'hbe459fd4), .K6_C6_W3(32'h3dfe9844), .K6_C6_W4(32'h3e27d8aa), .K6_C6_W5(32'hbe23d29a), .K6_C6_W6(32'hbd78721f), .K6_C6_W7(32'hbc65fe13), .K6_C6_W8(32'h3c8b56eb), 
	// 	.K6_C7_W0(32'hbc66401e), .K6_C7_W1(32'h3d959fa8), .K6_C7_W2(32'h3e0ec7d5), .K6_C7_W3(32'h3d8e2d27), .K6_C7_W4(32'hbdb956d2), .K6_C7_W5(32'h3e30f676), .K6_C7_W6(32'hbe11e868), .K6_C7_W7(32'hbe0afe5e), .K6_C7_W8(32'h3d5a1629), 
	// 	.K6_BIAS (32'h3ca09608),

	// 	.K7_C0_W0(32'hbd8864e1), .K7_C0_W1(32'hbd4f8c7b), .K7_C0_W2(32'hbd22a676), .K7_C0_W3(32'h3e21e14a), .K7_C0_W4(32'h3db58819), .K7_C0_W5(32'h3d4ce6fd), .K7_C0_W6(32'hbd89c55c), .K7_C0_W7(32'h3d562107), .K7_C0_W8(32'h3e459d8e), 
	// 	.K7_C1_W0(32'h3e35cdfb), .K7_C1_W1(32'hbd23f87a), .K7_C1_W2(32'h3e4b1834), .K7_C1_W3(32'hbe04c40c), .K7_C1_W4(32'h3e3df8e1), .K7_C1_W5(32'hbdca4fe5), .K7_C1_W6(32'hbe744510), .K7_C1_W7(32'hbd6d7a7f), .K7_C1_W8(32'h3cc31582), 
	// 	.K7_C2_W0(32'hbdf0a2ee), .K7_C2_W1(32'hbe32cf8f), .K7_C2_W2(32'hbd7104f2), .K7_C2_W3(32'hbe3a00e5), .K7_C2_W4(32'h3c9ffd70), .K7_C2_W5(32'hbdd7d380), .K7_C2_W6(32'h3e2bbad2), .K7_C2_W7(32'h3e2a8d61), .K7_C2_W8(32'h3d065bb9), 
	// 	.K7_C3_W0(32'hbd92576a), .K7_C3_W1(32'hbe371bae), .K7_C3_W2(32'hbd65e46a), .K7_C3_W3(32'h3e0110ca), .K7_C3_W4(32'h3dc2bbe9), .K7_C3_W5(32'hbdc6dc7d), .K7_C3_W6(32'h3de48857), .K7_C3_W7(32'h3e2c3123), .K7_C3_W8(32'hbe37b479), 
	// 	.K7_C4_W0(32'h3e0d86c8), .K7_C4_W1(32'hbc41b9e0), .K7_C4_W2(32'hbe2f79d2), .K7_C4_W3(32'h3d57d4a8), .K7_C4_W4(32'hbe5e7a37), .K7_C4_W5(32'hbdfbabd8), .K7_C4_W6(32'h3d2dfb91), .K7_C4_W7(32'hbd7fbec5), .K7_C4_W8(32'h3d1409f8), 
	// 	.K7_C5_W0(32'h3e21c9c4), .K7_C5_W1(32'h3d0c9364), .K7_C5_W2(32'hbc604fb7), .K7_C5_W3(32'h3dfbf845), .K7_C5_W4(32'h3e493dcd), .K7_C5_W5(32'h3e411b7f), .K7_C5_W6(32'h3e17a23c), .K7_C5_W7(32'hbe089aa9), .K7_C5_W8(32'h3ce464f2), 
	// 	.K7_C6_W0(32'hbdbfee77), .K7_C6_W1(32'hbb0af69d), .K7_C6_W2(32'hbe22a876), .K7_C6_W3(32'h3e1675ba), .K7_C6_W4(32'hbcc0fd1f), .K7_C6_W5(32'hbe332dc6), .K7_C6_W6(32'hbe218ac0), .K7_C6_W7(32'h3e20eb20), .K7_C6_W8(32'hbe150d4c), 
	// 	.K7_C7_W0(32'hbe00cd78), .K7_C7_W1(32'hbe3b6747), .K7_C7_W2(32'h3d136aab), .K7_C7_W3(32'hbe2df31b), .K7_C7_W4(32'hbba0753b), .K7_C7_W5(32'h3e38045f), .K7_C7_W6(32'h3d62e264), .K7_C7_W7(32'hbe108a2f), .K7_C7_W8(32'h3e413438), 
	// 	.K7_BIAS (32'h3c8702ff)
	// 	)
	// 	block3_conv2(
	// 	.clk(clk),
	// 	.resetn(resetn),
	// 	.data_valid_in(conv_valid_out_3_1),
	// 	.data_in_0(conv_out_3_1[0]),
	// 	.data_in_1(conv_out_3_1[1]),
	// 	.data_in_2(conv_out_3_1[2]),
	// 	.data_in_3(conv_out_3_1[3]),
	// 	.data_in_4(conv_out_3_1[4]),
	// 	.data_in_5(conv_out_3_1[5]),
	// 	.data_in_6(conv_out_3_1[6]),
	// 	.data_in_7(conv_out_3_1[7]),
	// 	.data_out_conv_0(conv_out_3_2[0]),
	// 	.data_out_conv_1(conv_out_3_2[1]),
	// 	.data_out_conv_2(conv_out_3_2[2]),
	// 	.data_out_conv_3(conv_out_3_2[3]),
	// 	.data_out_conv_4(conv_out_3_2[4]),
	// 	.data_out_conv_5(conv_out_3_2[5]),
	// 	.data_out_conv_6(conv_out_3_2[6]),
	// 	.data_out_conv_7(conv_out_3_2[7]),
	// 	.valid_out_pixel(conv_valid_out_3_2),
	// 	.done(done_conv_3_2)
	// 	);



	// conv3d_8_kernel_8_channel_size_3 #(
	// 	.DATA_WIDTH(32),.IMG_WIDTH(WIDTH>>2),.IMG_HEIGHT(HEIGHT>>2),
	// 	.K0_C0_W0(32'h3da18e86), .K0_C0_W1(32'h3bb38bce), .K0_C0_W2(32'hbe0f300f), .K0_C0_W3(32'h3dab8d90), .K0_C0_W4(32'hbe10aec5), .K0_C0_W5(32'hbd80dc2b), .K0_C0_W6(32'hbdbdde5e), .K0_C0_W7(32'hbdad3186), .K0_C0_W8(32'h3c848b30), 
	// 	.K0_C1_W0(32'h3d66b415), .K0_C1_W1(32'hbda4f64f), .K0_C1_W2(32'h3e14e79f), .K0_C1_W3(32'hbdb33263), .K0_C1_W4(32'hbe380a86), .K0_C1_W5(32'hbe16b37e), .K0_C1_W6(32'hbcf141b0), .K0_C1_W7(32'hbe1048a7), .K0_C1_W8(32'hbe106987), 
	// 	.K0_C2_W0(32'hbd8fef8a), .K0_C2_W1(32'hbcd4b102), .K0_C2_W2(32'hbd290a86), .K0_C2_W3(32'h3d4c4507), .K0_C2_W4(32'h3ae2b1bd), .K0_C2_W5(32'h3e19c9aa), .K0_C2_W6(32'h3e772a6d), .K0_C2_W7(32'h3e6d8797), .K0_C2_W8(32'hbe25430c), 
	// 	.K0_C3_W0(32'h3e47c559), .K0_C3_W1(32'h3e650277), .K0_C3_W2(32'hbdf1f3e2), .K0_C3_W3(32'hbd0dd6da), .K0_C3_W4(32'hbe0c1238), .K0_C3_W5(32'hbafa7110), .K0_C3_W6(32'h3d3b75ab), .K0_C3_W7(32'hbe2e5b7c), .K0_C3_W8(32'h3d050e57), 
	// 	.K0_C4_W0(32'h3da2dda9), .K0_C4_W1(32'h3c82c9e6), .K0_C4_W2(32'h3e169c11), .K0_C4_W3(32'h3dbb4266), .K0_C4_W4(32'h3d48310d), .K0_C4_W5(32'h3e02aa3d), .K0_C4_W6(32'h3df36490), .K0_C4_W7(32'h3df4c350), .K0_C4_W8(32'hbd901f4d), 
	// 	.K0_C5_W0(32'h3e49592c), .K0_C5_W1(32'h3d481245), .K0_C5_W2(32'h3e4ae5de), .K0_C5_W3(32'hbda38b5a), .K0_C5_W4(32'h3dc6fac8), .K0_C5_W5(32'h3e3e70b5), .K0_C5_W6(32'hbe33bfc8), .K0_C5_W7(32'h3d5f736a), .K0_C5_W8(32'h3d0c1b04), 
	// 	.K0_C6_W0(32'h3d604078), .K0_C6_W1(32'hbd29c980), .K0_C6_W2(32'hbd3bedf1), .K0_C6_W3(32'hbc33c0f6), .K0_C6_W4(32'hbdbde286), .K0_C6_W5(32'hbddf813a), .K0_C6_W6(32'h3cb164ac), .K0_C6_W7(32'hbcabfbfa), .K0_C6_W8(32'hbd05e542), 
	// 	.K0_C7_W0(32'hbe3b4dd7), .K0_C7_W1(32'hbda7fe2e), .K0_C7_W2(32'hbe45f0b2), .K0_C7_W3(32'hbdeba5d9), .K0_C7_W4(32'h3c3b333c), .K0_C7_W5(32'hbe1a08ef), .K0_C7_W6(32'h3d9ba903), .K0_C7_W7(32'hbe487c5f), .K0_C7_W8(32'hbcb66565), 
	// 	.K0_BIAS (32'hbc95915c),

	// 	.K1_C0_W0(32'hbe2f85bd), .K1_C0_W1(32'hbe13e16f), .K1_C0_W2(32'hbe0f1b35), .K1_C0_W3(32'h3d3f31a4), .K1_C0_W4(32'h3e288014), .K1_C0_W5(32'hbdfd0469), .K1_C0_W6(32'h3d028b1e), .K1_C0_W7(32'h3de679a5), .K1_C0_W8(32'h3d4b7697), 
	// 	.K1_C1_W0(32'h3cc80a74), .K1_C1_W1(32'h3e155405), .K1_C1_W2(32'h3df7885a), .K1_C1_W3(32'h3e3476d5), .K1_C1_W4(32'h3da8bbe4), .K1_C1_W5(32'h3b3483d8), .K1_C1_W6(32'h3d3ddefc), .K1_C1_W7(32'hbdc48c1f), .K1_C1_W8(32'h3cde6a39), 
	// 	.K1_C2_W0(32'hbe32552c), .K1_C2_W1(32'hbde8442f), .K1_C2_W2(32'h3e34e765), .K1_C2_W3(32'hbd56439e), .K1_C2_W4(32'hbe059411), .K1_C2_W5(32'h3e242bca), .K1_C2_W6(32'h3dff0259), .K1_C2_W7(32'hbb3b580d), .K1_C2_W8(32'h3de90d34), 
	// 	.K1_C3_W0(32'h3dd24f14), .K1_C3_W1(32'h3db81ad2), .K1_C3_W2(32'h3cab8c0f), .K1_C3_W3(32'hbe3cd6d1), .K1_C3_W4(32'hbd2d2f48), .K1_C3_W5(32'h3cd032a6), .K1_C3_W6(32'hbe3a1640), .K1_C3_W7(32'h3dc9c43e), .K1_C3_W8(32'hbcdce648), 
	// 	.K1_C4_W0(32'h3ce6d4b5), .K1_C4_W1(32'hbe4b08b6), .K1_C4_W2(32'hbdeb35b3), .K1_C4_W3(32'h3e206532), .K1_C4_W4(32'h3e29bcb6), .K1_C4_W5(32'h3df13e5d), .K1_C4_W6(32'h3b093155), .K1_C4_W7(32'h3dd22b01), .K1_C4_W8(32'hbe129530), 
	// 	.K1_C5_W0(32'h3de8cbcc), .K1_C5_W1(32'h3cabfa79), .K1_C5_W2(32'h3d99293a), .K1_C5_W3(32'hbd82748c), .K1_C5_W4(32'hbd88d44e), .K1_C5_W5(32'hbe34d76c), .K1_C5_W6(32'hbe0f60bc), .K1_C5_W7(32'hbe2edd21), .K1_C5_W8(32'h3e0230c3), 
	// 	.K1_C6_W0(32'h3e319699), .K1_C6_W1(32'h3d883272), .K1_C6_W2(32'h3e32af6a), .K1_C6_W3(32'h3d8765b5), .K1_C6_W4(32'hbbea40f0), .K1_C6_W5(32'h3e53af11), .K1_C6_W6(32'h3e5d0ce1), .K1_C6_W7(32'h3d30cb70), .K1_C6_W8(32'h3e404ede), 
	// 	.K1_C7_W0(32'h3d757b3e), .K1_C7_W1(32'hbd32fff6), .K1_C7_W2(32'hbd53fd9c), .K1_C7_W3(32'h3c1e21ca), .K1_C7_W4(32'hbe00557a), .K1_C7_W5(32'hbd846a95), .K1_C7_W6(32'h3e08aa8b), .K1_C7_W7(32'h3d90b5ac), .K1_C7_W8(32'hbdf7b80b), 
	// 	.K1_BIAS (32'h3cdda2df),

	// 	.K2_C0_W0(32'h3df06c9c), .K2_C0_W1(32'h3dfb6780), .K2_C0_W2(32'hbd34c4ad), .K2_C0_W3(32'h3e11bd40), .K2_C0_W4(32'h3e5b77e6), .K2_C0_W5(32'h3cb5c214), .K2_C0_W6(32'h3e22e23d), .K2_C0_W7(32'hbd3491a4), .K2_C0_W8(32'h3e1214ff), 
	// 	.K2_C1_W0(32'hbd89b706), .K2_C1_W1(32'h3deece35), .K2_C1_W2(32'h3d72edfd), .K2_C1_W3(32'hbe077323), .K2_C1_W4(32'hbde9d651), .K2_C1_W5(32'h3e640e22), .K2_C1_W6(32'hbda3f141), .K2_C1_W7(32'h3e38fcb9), .K2_C1_W8(32'h3e3c6300), 
	// 	.K2_C2_W0(32'hbd67d089), .K2_C2_W1(32'h3e230900), .K2_C2_W2(32'hbe4881f8), .K2_C2_W3(32'hbe2a7f29), .K2_C2_W4(32'h3be95c53), .K2_C2_W5(32'h3cfa9c6b), .K2_C2_W6(32'h3c938666), .K2_C2_W7(32'hbd0b05f3), .K2_C2_W8(32'hbdb2d624), 
	// 	.K2_C3_W0(32'hbd766cc8), .K2_C3_W1(32'h3e2c229f), .K2_C3_W2(32'hbe155ae3), .K2_C3_W3(32'hbe23f99d), .K2_C3_W4(32'hbdd6eefc), .K2_C3_W5(32'h3d696ab9), .K2_C3_W6(32'h3d5a0428), .K2_C3_W7(32'h3d41d2d6), .K2_C3_W8(32'h3e3808db), 
	// 	.K2_C4_W0(32'h3d30958e), .K2_C4_W1(32'hbdedce7f), .K2_C4_W2(32'h3dd38866), .K2_C4_W3(32'hbd68fb6d), .K2_C4_W4(32'h3d1da6ff), .K2_C4_W5(32'h3c83d62c), .K2_C4_W6(32'hbd76ce90), .K2_C4_W7(32'hbe5db3e7), .K2_C4_W8(32'hbdfc7a44), 
	// 	.K2_C5_W0(32'h3de44298), .K2_C5_W1(32'hbe1a4277), .K2_C5_W2(32'h3e05a6cd), .K2_C5_W3(32'hbdfd3c7f), .K2_C5_W4(32'hbd591fcd), .K2_C5_W5(32'hbd9e00b0), .K2_C5_W6(32'hbe498f9d), .K2_C5_W7(32'hbe1f584e), .K2_C5_W8(32'hbae07bb3), 
	// 	.K2_C6_W0(32'h3dc7912f), .K2_C6_W1(32'h3d9cc984), .K2_C6_W2(32'hbe3e8c78), .K2_C6_W3(32'hbc9d222f), .K2_C6_W4(32'h3d1733b5), .K2_C6_W5(32'h3e44774f), .K2_C6_W6(32'h3db2d83f), .K2_C6_W7(32'hbe1a9382), .K2_C6_W8(32'h3d962346), 
	// 	.K2_C7_W0(32'hbe2a32e3), .K2_C7_W1(32'h3e3473ca), .K2_C7_W2(32'h3d97d781), .K2_C7_W3(32'h3e5f46b7), .K2_C7_W4(32'hbe35911a), .K2_C7_W5(32'hbe461b57), .K2_C7_W6(32'h3da9c883), .K2_C7_W7(32'h3dd3830d), .K2_C7_W8(32'h3e47a016), 
	// 	.K2_BIAS (32'h3cf2eb27),

	// 	.K3_C0_W0(32'h3d97786b), .K3_C0_W1(32'hbb617466), .K3_C0_W2(32'h3d22491e), .K3_C0_W3(32'hbdb555fc), .K3_C0_W4(32'hbe33a92b), .K3_C0_W5(32'hbd7bafc4), .K3_C0_W6(32'h3e27f018), .K3_C0_W7(32'h3db91766), .K3_C0_W8(32'h3d8e8287), 
	// 	.K3_C1_W0(32'hbe1a94bd), .K3_C1_W1(32'h3e0fa5ea), .K3_C1_W2(32'hbd0810da), .K3_C1_W3(32'hbcdc6433), .K3_C1_W4(32'hbda9de08), .K3_C1_W5(32'hbd16a624), .K3_C1_W6(32'h3e608d55), .K3_C1_W7(32'h3dcc8df8), .K3_C1_W8(32'h3e684a9c), 
	// 	.K3_C2_W0(32'h3d8ca254), .K3_C2_W1(32'h3cd858a2), .K3_C2_W2(32'h3d0335eb), .K3_C2_W3(32'h3e25fca9), .K3_C2_W4(32'hbdbbe076), .K3_C2_W5(32'h3e0649ca), .K3_C2_W6(32'hbe0615c7), .K3_C2_W7(32'h3dbe196d), .K3_C2_W8(32'h3d86a987), 
	// 	.K3_C3_W0(32'h3e662efb), .K3_C3_W1(32'hbc7b059a), .K3_C3_W2(32'hbde147de), .K3_C3_W3(32'h3dd62000), .K3_C3_W4(32'hbe2ce852), .K3_C3_W5(32'hbe45df93), .K3_C3_W6(32'hbe2786f7), .K3_C3_W7(32'h3df0c6fb), .K3_C3_W8(32'hbe161fe4), 
	// 	.K3_C4_W0(32'hbe688120), .K3_C4_W1(32'hbc44190f), .K3_C4_W2(32'h3ded50fd), .K3_C4_W3(32'hbdd7e04d), .K3_C4_W4(32'h3e132936), .K3_C4_W5(32'hbd57db4f), .K3_C4_W6(32'hbdc05e18), .K3_C4_W7(32'h3c0395c6), .K3_C4_W8(32'h3e1da4f0), 
	// 	.K3_C5_W0(32'h3e4fc943), .K3_C5_W1(32'hbcf19f44), .K3_C5_W2(32'h3dc4b8d7), .K3_C5_W3(32'hbe3320cd), .K3_C5_W4(32'hbdb9d732), .K3_C5_W5(32'hbcfc3f55), .K3_C5_W6(32'h3e380fb7), .K3_C5_W7(32'h3e498c30), .K3_C5_W8(32'hbcc236c0), 
	// 	.K3_C6_W0(32'hbcc2d9f8), .K3_C6_W1(32'hbd948c92), .K3_C6_W2(32'h3b13e8e6), .K3_C6_W3(32'h3e07b5bd), .K3_C6_W4(32'h3e263703), .K3_C6_W5(32'h3daf1989), .K3_C6_W6(32'h3d245e7f), .K3_C6_W7(32'h3db6302a), .K3_C6_W8(32'hbd887400), 
	// 	.K3_C7_W0(32'hbdb01e5d), .K3_C7_W1(32'hbdb446b0), .K3_C7_W2(32'h3d9fed67), .K3_C7_W3(32'hbce5ddad), .K3_C7_W4(32'hbda8e6a9), .K3_C7_W5(32'h3d5739ec), .K3_C7_W6(32'h3e4e6662), .K3_C7_W7(32'h3e1f0261), .K3_C7_W8(32'h3e4022f2), 
	// 	.K3_BIAS (32'hbc2b5ff3),

	// 	.K4_C0_W0(32'h3cfe4fb3), .K4_C0_W1(32'hbdc865d0), .K4_C0_W2(32'h3e479366), .K4_C0_W3(32'hbe39a71c), .K4_C0_W4(32'h3e52bde5), .K4_C0_W5(32'h3e03f395), .K4_C0_W6(32'h3c24c16a), .K4_C0_W7(32'hbd75ab41), .K4_C0_W8(32'h3df78539), 
	// 	.K4_C1_W0(32'hbe038b67), .K4_C1_W1(32'hbd158308), .K4_C1_W2(32'hbd0d0cb8), .K4_C1_W3(32'h3e48d4d0), .K4_C1_W4(32'h3d61a0b9), .K4_C1_W5(32'h3e04d26a), .K4_C1_W6(32'hbdb8de6a), .K4_C1_W7(32'h3e0f3798), .K4_C1_W8(32'hbd035f2e), 
	// 	.K4_C2_W0(32'hbe47a562), .K4_C2_W1(32'hbd35bc20), .K4_C2_W2(32'h3e4080ba), .K4_C2_W3(32'hbe107b57), .K4_C2_W4(32'h3df1caf5), .K4_C2_W5(32'h3e352ce6), .K4_C2_W6(32'h3deef7dd), .K4_C2_W7(32'h3dcb7d46), .K4_C2_W8(32'h3d8dab46), 
	// 	.K4_C3_W0(32'hbde2cb0c), .K4_C3_W1(32'hbe039f0f), .K4_C3_W2(32'h3d5b2453), .K4_C3_W3(32'hbbdeeaba), .K4_C3_W4(32'hbd82e294), .K4_C3_W5(32'hbe314735), .K4_C3_W6(32'h3e2773d6), .K4_C3_W7(32'hbded0313), .K4_C3_W8(32'h3dcac8b8), 
	// 	.K4_C4_W0(32'hbcbc20c2), .K4_C4_W1(32'hbe32deb1), .K4_C4_W2(32'hbdffd118), .K4_C4_W3(32'hbde67268), .K4_C4_W4(32'h3bacee84), .K4_C4_W5(32'hbca13624), .K4_C4_W6(32'h3cb94940), .K4_C4_W7(32'hbe33bf80), .K4_C4_W8(32'h3d33801d), 
	// 	.K4_C5_W0(32'h3e1bbb10), .K4_C5_W1(32'hbe209a00), .K4_C5_W2(32'hbdaed0d3), .K4_C5_W3(32'hbe4786b3), .K4_C5_W4(32'hbdd219bb), .K4_C5_W5(32'h3e0f623d), .K4_C5_W6(32'h3dee4063), .K4_C5_W7(32'h3e147151), .K4_C5_W8(32'h3b22a97b), 
	// 	.K4_C6_W0(32'hbde51a13), .K4_C6_W1(32'h3dafece3), .K4_C6_W2(32'hbdc392eb), .K4_C6_W3(32'h3e1c333e), .K4_C6_W4(32'hbd81cd56), .K4_C6_W5(32'h3dde550c), .K4_C6_W6(32'h3e3f8229), .K4_C6_W7(32'hbcbd1ad7), .K4_C6_W8(32'hbd443d39), 
	// 	.K4_C7_W0(32'hbdd520ee), .K4_C7_W1(32'hbe431766), .K4_C7_W2(32'hbda79f88), .K4_C7_W3(32'h3d622cf8), .K4_C7_W4(32'hbda886fd), .K4_C7_W5(32'hbd320a12), .K4_C7_W6(32'h3c784377), .K4_C7_W7(32'hbe04dd9c), .K4_C7_W8(32'hbdc3f8e8), 
	// 	.K4_BIAS (32'h3c4cc76f),

	// 	.K5_C0_W0(32'hbc39aac8), .K5_C0_W1(32'hbe4611c5), .K5_C0_W2(32'hbe47db4f), .K5_C0_W3(32'hbe00a071), .K5_C0_W4(32'h3d85d952), .K5_C0_W5(32'hbb09ea5c), .K5_C0_W6(32'h3df77050), .K5_C0_W7(32'h3de8ff7d), .K5_C0_W8(32'h3e465144), 
	// 	.K5_C1_W0(32'h3de880d5), .K5_C1_W1(32'hbd17cb80), .K5_C1_W2(32'hbe4cbb5e), .K5_C1_W3(32'h3e3936f8), .K5_C1_W4(32'h3dab95a0), .K5_C1_W5(32'h3d8ea96e), .K5_C1_W6(32'h3cbcfb21), .K5_C1_W7(32'hbe49fe9d), .K5_C1_W8(32'h3d037587), 
	// 	.K5_C2_W0(32'hbe5eed78), .K5_C2_W1(32'h3c1b97c1), .K5_C2_W2(32'h3d933c6f), .K5_C2_W3(32'hbc0c8dcb), .K5_C2_W4(32'hbe2e3cd0), .K5_C2_W5(32'hbe200a8b), .K5_C2_W6(32'hbdbf5c02), .K5_C2_W7(32'h3e40d269), .K5_C2_W8(32'hbca2497f), 
	// 	.K5_C3_W0(32'hbc5f2508), .K5_C3_W1(32'hbcc11019), .K5_C3_W2(32'h3cf774c8), .K5_C3_W3(32'hbe114c72), .K5_C3_W4(32'hbe27effd), .K5_C3_W5(32'h3e39e893), .K5_C3_W6(32'hbe03a479), .K5_C3_W7(32'hbe03b926), .K5_C3_W8(32'h3d8361ea), 
	// 	.K5_C4_W0(32'hbca027d7), .K5_C4_W1(32'h3d8a9ed8), .K5_C4_W2(32'hbdbeeeba), .K5_C4_W3(32'h3c65731e), .K5_C4_W4(32'h3dc2d235), .K5_C4_W5(32'h3ba49e8f), .K5_C4_W6(32'hbc409061), .K5_C4_W7(32'h3c606d6a), .K5_C4_W8(32'hbdf474d8), 
	// 	.K5_C5_W0(32'h3d701ef6), .K5_C5_W1(32'hbd963ce1), .K5_C5_W2(32'h3e016869), .K5_C5_W3(32'h3cc23247), .K5_C5_W4(32'hbe56de5a), .K5_C5_W5(32'hbddc075b), .K5_C5_W6(32'hbb13003f), .K5_C5_W7(32'hbd37c56c), .K5_C5_W8(32'hbe5ea80a), 
	// 	.K5_C6_W0(32'hbe052cd8), .K5_C6_W1(32'h3d42a50f), .K5_C6_W2(32'h3df9dbd6), .K5_C6_W3(32'h3bd55c4a), .K5_C6_W4(32'hbc3294c4), .K5_C6_W5(32'hbd9bb117), .K5_C6_W6(32'h3e19a00f), .K5_C6_W7(32'hbcf93096), .K5_C6_W8(32'h3d114ae7), 
	// 	.K5_C7_W0(32'h3d2395db), .K5_C7_W1(32'hbe40bd24), .K5_C7_W2(32'hbc8ec8ac), .K5_C7_W3(32'h3e333342), .K5_C7_W4(32'hbd868bdb), .K5_C7_W5(32'h3dd45aa1), .K5_C7_W6(32'h3e58eb11), .K5_C7_W7(32'hbe103c05), .K5_C7_W8(32'hb99b9436), 
	// 	.K5_BIAS (32'h3c658832),

	// 	.K6_C0_W0(32'h3e4be71e), .K6_C0_W1(32'h3d871f18), .K6_C0_W2(32'h3d674af7), .K6_C0_W3(32'h3e1d1926), .K6_C0_W4(32'hbd561af9), .K6_C0_W5(32'h3e21d81a), .K6_C0_W6(32'hbde16a30), .K6_C0_W7(32'hbdef6e8c), .K6_C0_W8(32'h3c0e3043), 
	// 	.K6_C1_W0(32'h3d105744), .K6_C1_W1(32'hbd9bfcca), .K6_C1_W2(32'hbe547aba), .K6_C1_W3(32'hbdc3ab9b), .K6_C1_W4(32'h3e1670b3), .K6_C1_W5(32'hbe11cb30), .K6_C1_W6(32'h3e2e8d22), .K6_C1_W7(32'h3d80133a), .K6_C1_W8(32'h3e85d374), 
	// 	.K6_C2_W0(32'hbe1fbb19), .K6_C2_W1(32'hbdec4dfe), .K6_C2_W2(32'h3e68861f), .K6_C2_W3(32'hbdbcfed4), .K6_C2_W4(32'h3e098f75), .K6_C2_W5(32'h3c517423), .K6_C2_W6(32'hbe1ad3d9), .K6_C2_W7(32'h3dc52719), .K6_C2_W8(32'h3db2e17d), 
	// 	.K6_C3_W0(32'hbe4718f6), .K6_C3_W1(32'h3a394258), .K6_C3_W2(32'hbc9320f5), .K6_C3_W3(32'h3dd6edab), .K6_C3_W4(32'hbe19dbbc), .K6_C3_W5(32'hbd28eee0), .K6_C3_W6(32'hbd51d58b), .K6_C3_W7(32'hbe1c1ef5), .K6_C3_W8(32'h3e238e70), 
	// 	.K6_C4_W0(32'h3d82f840), .K6_C4_W1(32'h3e2ec4cc), .K6_C4_W2(32'hba41c82c), .K6_C4_W3(32'hbe1376d6), .K6_C4_W4(32'h3d570705), .K6_C4_W5(32'hbe11acfb), .K6_C4_W6(32'hbe347757), .K6_C4_W7(32'hbe00e457), .K6_C4_W8(32'hbe2cc6f6), 
	// 	.K6_C5_W0(32'hbcbb8c4d), .K6_C5_W1(32'hbe262e78), .K6_C5_W2(32'hbe22c206), .K6_C5_W3(32'h3e210dcb), .K6_C5_W4(32'h3db23622), .K6_C5_W5(32'hbe033d2a), .K6_C5_W6(32'h3b13f1bf), .K6_C5_W7(32'hbd82f24f), .K6_C5_W8(32'hbd7375ce), 
	// 	.K6_C6_W0(32'hbe5524b5), .K6_C6_W1(32'h3dd7be46), .K6_C6_W2(32'hbd813dad), .K6_C6_W3(32'h3d00867b), .K6_C6_W4(32'hbdb388c5), .K6_C6_W5(32'hbe4affc8), .K6_C6_W6(32'h3d50e8e8), .K6_C6_W7(32'hbe38d75e), .K6_C6_W8(32'hbe3b3b7e), 
	// 	.K6_C7_W0(32'hbd0df552), .K6_C7_W1(32'hbdf363b1), .K6_C7_W2(32'h3e34b0ee), .K6_C7_W3(32'h3e3e0dab), .K6_C7_W4(32'hbc18860f), .K6_C7_W5(32'h3d8e4afb), .K6_C7_W6(32'hbd267c4d), .K6_C7_W7(32'h3da5fc1e), .K6_C7_W8(32'h3e6e0f7a), 
	// 	.K6_BIAS (32'h3b4f2a1f),

	// 	.K7_C0_W0(32'hbde05ae0), .K7_C0_W1(32'h3e087d6a), .K7_C0_W2(32'hbd5c334d), .K7_C0_W3(32'hbe04639b), .K7_C0_W4(32'h3c8d691b), .K7_C0_W5(32'hbe55aefa), .K7_C0_W6(32'h3dc920be), .K7_C0_W7(32'h3e0247e0), .K7_C0_W8(32'h3dfe806a), 
	// 	.K7_C1_W0(32'h3e01cd16), .K7_C1_W1(32'hbe5035d2), .K7_C1_W2(32'hbe62a577), .K7_C1_W3(32'hbe259f7b), .K7_C1_W4(32'hbe5f0933), .K7_C1_W5(32'h3d157bf0), .K7_C1_W6(32'hbc2d6645), .K7_C1_W7(32'hbdfc52fd), .K7_C1_W8(32'hbdc4c663), 
	// 	.K7_C2_W0(32'hbdc2aa71), .K7_C2_W1(32'hbdf21de4), .K7_C2_W2(32'h3e515133), .K7_C2_W3(32'h3e3a5158), .K7_C2_W4(32'hbdd14753), .K7_C2_W5(32'hba71a9c1), .K7_C2_W6(32'h3c2d5e0c), .K7_C2_W7(32'h3ca60d13), .K7_C2_W8(32'h3d7c7dff), 
	// 	.K7_C3_W0(32'h3dc4176e), .K7_C3_W1(32'hbe2565e9), .K7_C3_W2(32'h3dfdabc9), .K7_C3_W3(32'hbe102260), .K7_C3_W4(32'h3ceb277a), .K7_C3_W5(32'hbda03eb4), .K7_C3_W6(32'hbd8bbcb5), .K7_C3_W7(32'hbe29c8f6), .K7_C3_W8(32'hbdda8929), 
	// 	.K7_C4_W0(32'h3be98f67), .K7_C4_W1(32'hbe54fb9e), .K7_C4_W2(32'hbdf52475), .K7_C4_W3(32'h3e15035c), .K7_C4_W4(32'h3e2e0dac), .K7_C4_W5(32'hbe43f2dc), .K7_C4_W6(32'hbb91080e), .K7_C4_W7(32'h39a89979), .K7_C4_W8(32'hbc20722f), 
	// 	.K7_C5_W0(32'h3defefd6), .K7_C5_W1(32'hbdb80424), .K7_C5_W2(32'hbe480d05), .K7_C5_W3(32'hbd9151a9), .K7_C5_W4(32'hb9e6c8fa), .K7_C5_W5(32'hbe3a39e7), .K7_C5_W6(32'hbe402201), .K7_C5_W7(32'hbdefc620), .K7_C5_W8(32'hba90c946), 
	// 	.K7_C6_W0(32'hbe263fcb), .K7_C6_W1(32'hbe1e5be3), .K7_C6_W2(32'hbe450f0d), .K7_C6_W3(32'h3e188512), .K7_C6_W4(32'h3d9677ad), .K7_C6_W5(32'h3e21397d), .K7_C6_W6(32'h3e03bf92), .K7_C6_W7(32'h3dbe2e4e), .K7_C6_W8(32'hbe13f14b), 
	// 	.K7_C7_W0(32'h3c6a35e0), .K7_C7_W1(32'h3df3c420), .K7_C7_W2(32'hbdf18e05), .K7_C7_W3(32'hbe2f01f1), .K7_C7_W4(32'h3e03b019), .K7_C7_W5(32'hbe2f81dd), .K7_C7_W6(32'hbe0cb970), .K7_C7_W7(32'hbc8b5975), .K7_C7_W8(32'hbdeb5375), 
	// 	.K7_BIAS (32'h3cddcdf8)
	// 	)
	// 	block3_conv3(
	// 	.clk(clk),
	// 	.resetn(resetn),
	// 	.data_valid_in(conv_valid_out_3_2),
	// 	.data_in_0(conv_out_3_2[0]),
	// 	.data_in_1(conv_out_3_2[1]),
	// 	.data_in_2(conv_out_3_2[2]),
	// 	.data_in_3(conv_out_3_2[3]),
	// 	.data_in_4(conv_out_3_2[4]),
	// 	.data_in_5(conv_out_3_2[5]),
	// 	.data_in_6(conv_out_3_2[6]),
	// 	.data_in_7(conv_out_3_2[7]),
	// 	.data_out_conv_0(conv_out_3_3[0]),
	// 	.data_out_conv_1(conv_out_3_3[1]),
	// 	.data_out_conv_2(conv_out_3_3[2]),
	// 	.data_out_conv_3(conv_out_3_3[3]),
	// 	.data_out_conv_4(conv_out_3_3[4]),
	// 	.data_out_conv_5(conv_out_3_3[5]),
	// 	.data_out_conv_6(conv_out_3_3[6]),
	// 	.data_out_conv_7(conv_out_3_3[7]),
	// 	.valid_out_pixel(conv_valid_out_3_3),
	// 	.done(done_conv_3_3)
	// 	);

	// generate
    // for (i = 0; i < CHANNEL_OUT; i=i+1) 
    // begin : relu_3_3 // needs CHANNEL_OUT*2 relu		// Edit here - name

    //     activate #(
    //         .DATA_WIDTH(32)
    //     )
    //     relu (
    //         .in(conv_out_3_3[i]),			// Edit here
    //         .out(relu_out_3_3[i])
    //     );
    // end
    // endgenerate

    // generate
    // for (i = 0; i < CHANNEL_OUT; i=i+1) 
    // begin : max_pool_3 // needs CHANNEL_OUT*2 max_pooling		// Edit here - name

    //     max_pooling #(
    //         .DATA_WIDTH(32),
    //         .WIDTH(WIDTH),
    //         .HEIGHT(HEIGHT)
    //     )
    //     max_pool(
    //         .clk(clk),
	// 		.ack(done_conv_3_3),					// Edit here
    //         .resetn(resetn),
    //         .valid_in(conv_valid_out_3_3),			// Edit here
    //         .data_in(relu_out_3_3[i]),
    //         .data_out(data_out_pool_3_3[i]),
    //         .valid_out(valid_out_pool_3_3[i]),
    //         .done(done_pool_3_3[i])
    //     );
    // end
    // endgenerate



    // ------------ BLOCK 4 ------------
	conv3d_16_kernel_8_channel_size_3 #(
		.DATA_WIDTH(32),.IMG_WIDTH(WIDTH/8),.IMG_HEIGHT(HEIGHT/8),
		.K0_C0_W0(32'h3d3f35fd), .K0_C0_W1(32'h3d811f77), .K0_C0_W2(32'hbe1d022a), .K0_C0_W3(32'h3e161386), .K0_C0_W4(32'h3d1a89c4), .K0_C0_W5(32'h3db4d8a3), .K0_C0_W6(32'h3e0e3a1a), .K0_C0_W7(32'h3cc9dd22), .K0_C0_W8(32'hbe34e767), 
		.K0_C1_W0(32'hbcbbcb57), .K0_C1_W1(32'h3dae3dca), .K0_C1_W2(32'h3c905611), .K0_C1_W3(32'hbc847bed), .K0_C1_W4(32'hbd61f3a6), .K0_C1_W5(32'hbda9bab2), .K0_C1_W6(32'hbd45a29e), .K0_C1_W7(32'hbe31d201), .K0_C1_W8(32'h3d79d165), 
		.K0_C2_W0(32'h3e5b6f5b), .K0_C2_W1(32'h3d253094), .K0_C2_W2(32'hbda1a404), .K0_C2_W3(32'h3d8586f9), .K0_C2_W4(32'hbd07c599), .K0_C2_W5(32'h3dfb1b50), .K0_C2_W6(32'h3dbb036d), .K0_C2_W7(32'hbdc29740), .K0_C2_W8(32'h3d214c8c), 
		.K0_C3_W0(32'h3e447eae), .K0_C3_W1(32'hbd3bb6d5), .K0_C3_W2(32'h3d8dd03f), .K0_C3_W3(32'hbd8f6fc4), .K0_C3_W4(32'h3da6db66), .K0_C3_W5(32'h3dd33b70), .K0_C3_W6(32'h3e26c7e7), .K0_C3_W7(32'h3df61a28), .K0_C3_W8(32'h3d84f053), 
		.K0_C4_W0(32'h3e325a9e), .K0_C4_W1(32'h3d8c3135), .K0_C4_W2(32'h3d963617), .K0_C4_W3(32'hbb683e92), .K0_C4_W4(32'h3cdef154), .K0_C4_W5(32'h3dc4b775), .K0_C4_W6(32'hbd1b4cab), .K0_C4_W7(32'h3d8cdf3e), .K0_C4_W8(32'h3e00bc05), 
		.K0_C5_W0(32'h3e12961a), .K0_C5_W1(32'hbdd01ec4), .K0_C5_W2(32'hbcc46adf), .K0_C5_W3(32'h3c8d2e91), .K0_C5_W4(32'hbe4222b9), .K0_C5_W5(32'hbd55e588), .K0_C5_W6(32'h3d501afd), .K0_C5_W7(32'hbe2271fd), .K0_C5_W8(32'hbe1958fc), 
		.K0_C6_W0(32'hbe0ea4a4), .K0_C6_W1(32'hbd3a00ca), .K0_C6_W2(32'h3e0d752c), .K0_C6_W3(32'hbe20584c), .K0_C6_W4(32'h3db49aec), .K0_C6_W5(32'h3d1ab6fd), .K0_C6_W6(32'hbdc2c87d), .K0_C6_W7(32'h3e2310aa), .K0_C6_W8(32'hbda25e0b), 
		.K0_C7_W0(32'h3d2dfc15), .K0_C7_W1(32'h3e04f176), .K0_C7_W2(32'h3daaa9b4), .K0_C7_W3(32'h3dfc30ef), .K0_C7_W4(32'hbd1da773), .K0_C7_W5(32'hbdf3e429), .K0_C7_W6(32'hbdfc99e3), .K0_C7_W7(32'hbe2c8330), .K0_C7_W8(32'hbe228cdf), 
		.K0_BIAS (32'hbd2963c5),

		.K1_C0_W0(32'h3bf5f6e0), .K1_C0_W1(32'h3dc4b5ba), .K1_C0_W2(32'hbd464263), .K1_C0_W3(32'h3dceb546), .K1_C0_W4(32'hbd968c86), .K1_C0_W5(32'hbb9ae053), .K1_C0_W6(32'hbe0185ee), .K1_C0_W7(32'hbdac3667), .K1_C0_W8(32'hbd22cba5), 
		.K1_C1_W0(32'h3b7a25b1), .K1_C1_W1(32'h3e41d0b9), .K1_C1_W2(32'hbd6a762c), .K1_C1_W3(32'hbc8d6d2b), .K1_C1_W4(32'hbcf35a5c), .K1_C1_W5(32'hbd2ca837), .K1_C1_W6(32'h3e3798a2), .K1_C1_W7(32'h3df673b4), .K1_C1_W8(32'h3d00648f), 
		.K1_C2_W0(32'hbe16525c), .K1_C2_W1(32'hbe0d14dd), .K1_C2_W2(32'h3d72954d), .K1_C2_W3(32'hbe058c7d), .K1_C2_W4(32'hbe40f228), .K1_C2_W5(32'hbdcff9f7), .K1_C2_W6(32'hbd386cd6), .K1_C2_W7(32'hbbae557d), .K1_C2_W8(32'h3b67c301), 
		.K1_C3_W0(32'h3dcadaf5), .K1_C3_W1(32'hbd48409b), .K1_C3_W2(32'hbc3e2551), .K1_C3_W3(32'hbb93be82), .K1_C3_W4(32'hbe0cff6c), .K1_C3_W5(32'hbdeaf903), .K1_C3_W6(32'hbd8664bc), .K1_C3_W7(32'hbd2ad5ca), .K1_C3_W8(32'h3d95dd5c), 
		.K1_C4_W0(32'hbcb7bcc3), .K1_C4_W1(32'h3cc586e0), .K1_C4_W2(32'h3dba60b5), .K1_C4_W3(32'h3db93869), .K1_C4_W4(32'h3cdbd72e), .K1_C4_W5(32'h3cb08afb), .K1_C4_W6(32'hbd7172bd), .K1_C4_W7(32'hbdba50a3), .K1_C4_W8(32'hbd1389e9), 
		.K1_C5_W0(32'h3c8b98fb), .K1_C5_W1(32'h3e36fee3), .K1_C5_W2(32'h3dc51262), .K1_C5_W3(32'hbdaa8a3b), .K1_C5_W4(32'h3e5a0217), .K1_C5_W5(32'hbe1e3695), .K1_C5_W6(32'hbd16faf3), .K1_C5_W7(32'hbce0e489), .K1_C5_W8(32'hbe02ba37), 
		.K1_C6_W0(32'hbe1adca8), .K1_C6_W1(32'hbd80871e), .K1_C6_W2(32'h3dce5259), .K1_C6_W3(32'h3d3a7da3), .K1_C6_W4(32'hbcbf8fe1), .K1_C6_W5(32'hbe087476), .K1_C6_W6(32'hbdaae47c), .K1_C6_W7(32'h3e1c1a64), .K1_C6_W8(32'hbc284315), 
		.K1_C7_W0(32'h3d9c4b00), .K1_C7_W1(32'hbd6d6edc), .K1_C7_W2(32'hbda8efc8), .K1_C7_W3(32'h3db060ae), .K1_C7_W4(32'h3b045649), .K1_C7_W5(32'hbe25fc5f), .K1_C7_W6(32'h3d0dc39d), .K1_C7_W7(32'hbd85d5ac), .K1_C7_W8(32'hbcb05310), 
		.K1_BIAS (32'h3d04c919),

		.K2_C0_W0(32'hbca95003), .K2_C0_W1(32'hbdaaa070), .K2_C0_W2(32'h3e0aeeb5), .K2_C0_W3(32'h3b085408), .K2_C0_W4(32'hbd926adc), .K2_C0_W5(32'hbdabdf09), .K2_C0_W6(32'h3df13ebb), .K2_C0_W7(32'hbd4e75f0), .K2_C0_W8(32'hbdc23856), 
		.K2_C1_W0(32'hbd472d12), .K2_C1_W1(32'hbdf98b7e), .K2_C1_W2(32'h3e27dc35), .K2_C1_W3(32'h3d64ff4e), .K2_C1_W4(32'h3c2dd180), .K2_C1_W5(32'h3e30d316), .K2_C1_W6(32'hbdddb8c0), .K2_C1_W7(32'h3e03dd7d), .K2_C1_W8(32'hbd9bec0a), 
		.K2_C2_W0(32'hbdbee88b), .K2_C2_W1(32'hbd31bf9b), .K2_C2_W2(32'hbdf143d2), .K2_C2_W3(32'hbdd4acb1), .K2_C2_W4(32'h3dfe1706), .K2_C2_W5(32'h3e3af9cc), .K2_C2_W6(32'h3d090965), .K2_C2_W7(32'hbe114c48), .K2_C2_W8(32'hbe213dfb), 
		.K2_C3_W0(32'hbae15dda), .K2_C3_W1(32'hbe17b4b7), .K2_C3_W2(32'hbe32f31d), .K2_C3_W3(32'h3d9312cc), .K2_C3_W4(32'h3b72f034), .K2_C3_W5(32'h3d96eb02), .K2_C3_W6(32'hbd5bc10b), .K2_C3_W7(32'hbe1221f1), .K2_C3_W8(32'h3d829cdb), 
		.K2_C4_W0(32'hbdbe68a5), .K2_C4_W1(32'hbe16ab93), .K2_C4_W2(32'h3e088fd7), .K2_C4_W3(32'h3cb1ebcd), .K2_C4_W4(32'hbcaed313), .K2_C4_W5(32'hbded3f19), .K2_C4_W6(32'hbdc3bea4), .K2_C4_W7(32'hbcdbeea4), .K2_C4_W8(32'hbe02392c), 
		.K2_C5_W0(32'hbddebc72), .K2_C5_W1(32'h3d6c6eeb), .K2_C5_W2(32'hbdf37409), .K2_C5_W3(32'h3deb3256), .K2_C5_W4(32'h3cbb7b7e), .K2_C5_W5(32'h3e1248e2), .K2_C5_W6(32'h3db98d79), .K2_C5_W7(32'hbe25699a), .K2_C5_W8(32'hbe10fb49), 
		.K2_C6_W0(32'h3d8783a8), .K2_C6_W1(32'h3d235240), .K2_C6_W2(32'h3d3fafd1), .K2_C6_W3(32'hbe12e773), .K2_C6_W4(32'hbd5b7fb9), .K2_C6_W5(32'hbdb933b6), .K2_C6_W6(32'hbdc976f9), .K2_C6_W7(32'h3df74e05), .K2_C6_W8(32'h3e24f268), 
		.K2_C7_W0(32'hbe25e90b), .K2_C7_W1(32'hbe24087d), .K2_C7_W2(32'h3d89a449), .K2_C7_W3(32'hbe0d6682), .K2_C7_W4(32'h3e120168), .K2_C7_W5(32'h3dfd1c5c), .K2_C7_W6(32'hbd096230), .K2_C7_W7(32'hbdd01420), .K2_C7_W8(32'h3d7528b1), 
		.K2_BIAS (32'h3d4b2c00),

		.K3_C0_W0(32'h3c2c4231), .K3_C0_W1(32'h3dec1be4), .K3_C0_W2(32'h3e5a8eed), .K3_C0_W3(32'hbe1c1a30), .K3_C0_W4(32'hbddb2cd5), .K3_C0_W5(32'h3dbd2fe0), .K3_C0_W6(32'hbd3e1e51), .K3_C0_W7(32'hbd932813), .K3_C0_W8(32'hbe2baeab), 
		.K3_C1_W0(32'h3d9658ba), .K3_C1_W1(32'hbc6380d5), .K3_C1_W2(32'h3db2100e), .K3_C1_W3(32'hbc8210d6), .K3_C1_W4(32'hbd9a2fc4), .K3_C1_W5(32'h3c0eae2c), .K3_C1_W6(32'hbd861ab4), .K3_C1_W7(32'h3dad79d7), .K3_C1_W8(32'h3ced611b), 
		.K3_C2_W0(32'hbd5092bb), .K3_C2_W1(32'h3d0a3132), .K3_C2_W2(32'h3db03663), .K3_C2_W3(32'hbda3f5e9), .K3_C2_W4(32'hbdba9faf), .K3_C2_W5(32'hbe1878f1), .K3_C2_W6(32'hbc8c2be4), .K3_C2_W7(32'h3c2dbdc5), .K3_C2_W8(32'h3cd46a28), 
		.K3_C3_W0(32'hbd8c5cf2), .K3_C3_W1(32'hbe331ce4), .K3_C3_W2(32'hbd596579), .K3_C3_W3(32'h3d82abb1), .K3_C3_W4(32'h3deac40f), .K3_C3_W5(32'h3e0bafef), .K3_C3_W6(32'hbe30690d), .K3_C3_W7(32'hbd764d36), .K3_C3_W8(32'hbdacc4c2), 
		.K3_C4_W0(32'hbe1843ac), .K3_C4_W1(32'h3dd32cff), .K3_C4_W2(32'hbe0441cf), .K3_C4_W3(32'h3c9ea3ea), .K3_C4_W4(32'h3d0930ef), .K3_C4_W5(32'h3c824841), .K3_C4_W6(32'h3e0b1df4), .K3_C4_W7(32'hbdb72356), .K3_C4_W8(32'h3da97b9c), 
		.K3_C5_W0(32'hbde69efe), .K3_C5_W1(32'hbd76959b), .K3_C5_W2(32'h3d0d43cb), .K3_C5_W3(32'h3e0641e7), .K3_C5_W4(32'hbd264aa1), .K3_C5_W5(32'hbc2f186b), .K3_C5_W6(32'h3e25afe7), .K3_C5_W7(32'h3d08bfc4), .K3_C5_W8(32'h3d34b8af), 
		.K3_C6_W0(32'h3d56e21c), .K3_C6_W1(32'hbdb74610), .K3_C6_W2(32'hbe2a12c6), .K3_C6_W3(32'h3e12c031), .K3_C6_W4(32'h3d8d1d97), .K3_C6_W5(32'h3de375f9), .K3_C6_W6(32'hbe46e08c), .K3_C6_W7(32'hbe3f5073), .K3_C6_W8(32'hbe0d6948), 
		.K3_C7_W0(32'h3e426426), .K3_C7_W1(32'h3cddc4ab), .K3_C7_W2(32'hbd8029d4), .K3_C7_W3(32'h3d75a2f8), .K3_C7_W4(32'hbd8040e2), .K3_C7_W5(32'hbe06d189), .K3_C7_W6(32'hbe126bd4), .K3_C7_W7(32'hbcf76c11), .K3_C7_W8(32'h3d79c02b), 
		.K3_BIAS (32'h3c5148c7),

		.K4_C0_W0(32'h3df1f6f2), .K4_C0_W1(32'hbdd37c65), .K4_C0_W2(32'hbe236573), .K4_C0_W3(32'h3ca965ca), .K4_C0_W4(32'h3e17ec14), .K4_C0_W5(32'h3e1555ff), .K4_C0_W6(32'h3e155505), .K4_C0_W7(32'hbdab320b), .K4_C0_W8(32'hbdfeeaa3), 
		.K4_C1_W0(32'h3cf9ff82), .K4_C1_W1(32'h3da38e9e), .K4_C1_W2(32'h3d82a660), .K4_C1_W3(32'h3d87b79c), .K4_C1_W4(32'hbd72b386), .K4_C1_W5(32'h3c7b95a8), .K4_C1_W6(32'h3e07b5b1), .K4_C1_W7(32'h3e050319), .K4_C1_W8(32'h3d56b4e0), 
		.K4_C2_W0(32'hbc527012), .K4_C2_W1(32'h3aa0626d), .K4_C2_W2(32'h3cd6259b), .K4_C2_W3(32'h3c8fa69d), .K4_C2_W4(32'hbd8c9751), .K4_C2_W5(32'h3d15d4f5), .K4_C2_W6(32'h3dcc8c96), .K4_C2_W7(32'h3d92783b), .K4_C2_W8(32'h3d2f1be2), 
		.K4_C3_W0(32'h3d152b7f), .K4_C3_W1(32'h3c6db8e0), .K4_C3_W2(32'hbd1170db), .K4_C3_W3(32'h3dc6eaa5), .K4_C3_W4(32'hbddbac56), .K4_C3_W5(32'h3d267892), .K4_C3_W6(32'h3dbca7fb), .K4_C3_W7(32'h3e2265d8), .K4_C3_W8(32'h3e0d1342), 
		.K4_C4_W0(32'hbdb6b787), .K4_C4_W1(32'h3d4171e3), .K4_C4_W2(32'hbbe23058), .K4_C4_W3(32'hbdb8905c), .K4_C4_W4(32'h3d838382), .K4_C4_W5(32'hbb39ca0a), .K4_C4_W6(32'h3c249639), .K4_C4_W7(32'h3dc9f974), .K4_C4_W8(32'h3d62b9c7), 
		.K4_C5_W0(32'hbd07d229), .K4_C5_W1(32'hbc3353bd), .K4_C5_W2(32'hbd932e43), .K4_C5_W3(32'hbe16a328), .K4_C5_W4(32'h3e02707e), .K4_C5_W5(32'hbd7387eb), .K4_C5_W6(32'hbc2399d5), .K4_C5_W7(32'h3d65b6b3), .K4_C5_W8(32'hbcf7be7c), 
		.K4_C6_W0(32'hbdc98b64), .K4_C6_W1(32'h3e27d45a), .K4_C6_W2(32'hbdcbda86), .K4_C6_W3(32'hbdd1c454), .K4_C6_W4(32'hbdefa5ec), .K4_C6_W5(32'h3dcd947a), .K4_C6_W6(32'hbe0791a8), .K4_C6_W7(32'hbe05c53c), .K4_C6_W8(32'hbcb4d981), 
		.K4_C7_W0(32'h3df5ecc8), .K4_C7_W1(32'hbd79ac62), .K4_C7_W2(32'h3e20a1b9), .K4_C7_W3(32'h3cac2d29), .K4_C7_W4(32'h3c7c36d1), .K4_C7_W5(32'hbd8a3a46), .K4_C7_W6(32'hbd45804b), .K4_C7_W7(32'hbe101264), .K4_C7_W8(32'h3dbe7d12), 
		.K4_BIAS (32'hbd85273a),

		.K5_C0_W0(32'hbdbf24d9), .K5_C0_W1(32'hbe1c860b), .K5_C0_W2(32'h3cf77d2f), .K5_C0_W3(32'h3e2b095a), .K5_C0_W4(32'h3db6145d), .K5_C0_W5(32'hbe2fe021), .K5_C0_W6(32'h3d5ae3eb), .K5_C0_W7(32'hbdf2ff18), .K5_C0_W8(32'h3d5944a4), 
		.K5_C1_W0(32'h3d4c42b2), .K5_C1_W1(32'h3df90696), .K5_C1_W2(32'hbd856212), .K5_C1_W3(32'h3dcbf3f7), .K5_C1_W4(32'h3e36bb6b), .K5_C1_W5(32'hbdfbd6ad), .K5_C1_W6(32'h3c6a7bfc), .K5_C1_W7(32'h3dfef6c2), .K5_C1_W8(32'h3da27fc2), 
		.K5_C2_W0(32'h3d156aa9), .K5_C2_W1(32'hbc168d5b), .K5_C2_W2(32'hbd93504e), .K5_C2_W3(32'hbd047d99), .K5_C2_W4(32'h3d5f4028), .K5_C2_W5(32'hbe448ceb), .K5_C2_W6(32'hbd9a7e09), .K5_C2_W7(32'hbe483566), .K5_C2_W8(32'hbe1d1185), 
		.K5_C3_W0(32'hbd955177), .K5_C3_W1(32'hbdd5d39a), .K5_C3_W2(32'h3bb65b7e), .K5_C3_W3(32'hbdd48a75), .K5_C3_W4(32'hbd98c5fa), .K5_C3_W5(32'hbe12d82a), .K5_C3_W6(32'h3dc3e41b), .K5_C3_W7(32'hbe0a5dac), .K5_C3_W8(32'hbdad567f), 
		.K5_C4_W0(32'h3e3c0f83), .K5_C4_W1(32'hbdcdea92), .K5_C4_W2(32'h3e0f447c), .K5_C4_W3(32'h3d264e04), .K5_C4_W4(32'h3df884ad), .K5_C4_W5(32'h3de72ce7), .K5_C4_W6(32'hbdbf8dce), .K5_C4_W7(32'hbcdec684), .K5_C4_W8(32'hbdcef85d), 
		.K5_C5_W0(32'hbd6c166e), .K5_C5_W1(32'hbc87f2bd), .K5_C5_W2(32'hbd9bafc5), .K5_C5_W3(32'h3dff4527), .K5_C5_W4(32'h3e467462), .K5_C5_W5(32'hbdaac7f2), .K5_C5_W6(32'hbe25d7f4), .K5_C5_W7(32'hbbfdf75c), .K5_C5_W8(32'hbc466ae8), 
		.K5_C6_W0(32'hbd827093), .K5_C6_W1(32'hbc080025), .K5_C6_W2(32'h3de22d42), .K5_C6_W3(32'hbdd9340e), .K5_C6_W4(32'h3d4ccd32), .K5_C6_W5(32'h3b1a5820), .K5_C6_W6(32'hbd2944c0), .K5_C6_W7(32'hbc958072), .K5_C6_W8(32'hbe2e16bd), 
		.K5_C7_W0(32'hbe2a041f), .K5_C7_W1(32'h3de6a7e8), .K5_C7_W2(32'hbc3ae60d), .K5_C7_W3(32'hbdd4015e), .K5_C7_W4(32'h3d671a67), .K5_C7_W5(32'hbd85d9d8), .K5_C7_W6(32'h3c1b07e6), .K5_C7_W7(32'h3d6c282a), .K5_C7_W8(32'hbd96e66f), 
		.K5_BIAS (32'h3d0723d2),

		.K6_C0_W0(32'hbd58ad18), .K6_C0_W1(32'hbb9391fb), .K6_C0_W2(32'hbe1ae452), .K6_C0_W3(32'h3c6e5e5d), .K6_C0_W4(32'hba1e4b26), .K6_C0_W5(32'hbd9f8e23), .K6_C0_W6(32'hbce2bf48), .K6_C0_W7(32'h3e20b544), .K6_C0_W8(32'h3e10f556), 
		.K6_C1_W0(32'hbe1c4d3b), .K6_C1_W1(32'hbd26420d), .K6_C1_W2(32'h3cba98a6), .K6_C1_W3(32'h3d0e76bc), .K6_C1_W4(32'h3e2cb598), .K6_C1_W5(32'h3e092a57), .K6_C1_W6(32'hbe37ef88), .K6_C1_W7(32'hbd4c7f3b), .K6_C1_W8(32'h3e0fcc38), 
		.K6_C2_W0(32'hbcaf790e), .K6_C2_W1(32'h3d9745ef), .K6_C2_W2(32'h3e5b8807), .K6_C2_W3(32'hbd3795e5), .K6_C2_W4(32'h3dfa00a8), .K6_C2_W5(32'h3e33e2d5), .K6_C2_W6(32'hbdd87356), .K6_C2_W7(32'hbdf0d3a8), .K6_C2_W8(32'h3db0eb84), 
		.K6_C3_W0(32'h3dd4df79), .K6_C3_W1(32'hbe0966a6), .K6_C3_W2(32'h3d9e3ae0), .K6_C3_W3(32'hbe1e9d08), .K6_C3_W4(32'hbe16261b), .K6_C3_W5(32'h3e0110b4), .K6_C3_W6(32'hbcb1c787), .K6_C3_W7(32'h3d8fd2dc), .K6_C3_W8(32'h3de8389d), 
		.K6_C4_W0(32'h3de90ebf), .K6_C4_W1(32'h3dd3b86e), .K6_C4_W2(32'h3c9fe010), .K6_C4_W3(32'hbdf37cc1), .K6_C4_W4(32'hbdadbf30), .K6_C4_W5(32'hbdf1d908), .K6_C4_W6(32'hbd6a5415), .K6_C4_W7(32'h3d4ae819), .K6_C4_W8(32'hbe170255), 
		.K6_C5_W0(32'h3d0984c5), .K6_C5_W1(32'hbdc8b134), .K6_C5_W2(32'h3d06f584), .K6_C5_W3(32'h3d5980bd), .K6_C5_W4(32'h3d840fe9), .K6_C5_W5(32'h3df69448), .K6_C5_W6(32'h3da9cc39), .K6_C5_W7(32'h3da50cb0), .K6_C5_W8(32'hbd911512), 
		.K6_C6_W0(32'hbdc8cf5b), .K6_C6_W1(32'h3d85e0bf), .K6_C6_W2(32'hbb889de8), .K6_C6_W3(32'h3d18a557), .K6_C6_W4(32'hbb9301c9), .K6_C6_W5(32'hbc1565b5), .K6_C6_W6(32'h3d525984), .K6_C6_W7(32'h3cc9aed4), .K6_C6_W8(32'hbd12e78b), 
		.K6_C7_W0(32'hbd2671cc), .K6_C7_W1(32'h3af3f0a8), .K6_C7_W2(32'h3d80fe25), .K6_C7_W3(32'hbc8ab449), .K6_C7_W4(32'hbe1f80d4), .K6_C7_W5(32'hbdd26234), .K6_C7_W6(32'h3cec14ac), .K6_C7_W7(32'hbcd44810), .K6_C7_W8(32'hbd32521b), 
		.K6_BIAS (32'hbb0eeeee),

		.K7_C0_W0(32'hbdf81c76), .K7_C0_W1(32'h3de287eb), .K7_C0_W2(32'h3ce6bab9), .K7_C0_W3(32'hbdfc2d3f), .K7_C0_W4(32'hbd9bf7aa), .K7_C0_W5(32'hbdbff99e), .K7_C0_W6(32'h3b1c2e2d), .K7_C0_W7(32'hbd4e6808), .K7_C0_W8(32'hbccd62f0), 
		.K7_C1_W0(32'hbdb2ffe9), .K7_C1_W1(32'h3e1653d0), .K7_C1_W2(32'h3d851a72), .K7_C1_W3(32'h3dd92aa1), .K7_C1_W4(32'h3dcf62c0), .K7_C1_W5(32'hbdcc7de0), .K7_C1_W6(32'h3d659d14), .K7_C1_W7(32'h3e199414), .K7_C1_W8(32'hbd9f26e0), 
		.K7_C2_W0(32'hbe160723), .K7_C2_W1(32'h3e407372), .K7_C2_W2(32'hbdbdb8e9), .K7_C2_W3(32'hbc5d7b46), .K7_C2_W4(32'hbd4a86c5), .K7_C2_W5(32'h3e54fa2b), .K7_C2_W6(32'hbd99a51d), .K7_C2_W7(32'hbde6a2e5), .K7_C2_W8(32'h3e202577), 
		.K7_C3_W0(32'hbd7b8e8b), .K7_C3_W1(32'h3e024fa0), .K7_C3_W2(32'h3d8a1d0e), .K7_C3_W3(32'hbd81c84d), .K7_C3_W4(32'hbd84d3c4), .K7_C3_W5(32'h3d8d86d4), .K7_C3_W6(32'hbe00a4a8), .K7_C3_W7(32'hbd893cdc), .K7_C3_W8(32'h3e000676), 
		.K7_C4_W0(32'hbe12f2fa), .K7_C4_W1(32'hbd697bb1), .K7_C4_W2(32'h3e3df082), .K7_C4_W3(32'h3c3a6fc4), .K7_C4_W4(32'h3e2d488f), .K7_C4_W5(32'hbdd7840c), .K7_C4_W6(32'h3de4bf5d), .K7_C4_W7(32'h3e3ef070), .K7_C4_W8(32'hbdc8fec5), 
		.K7_C5_W0(32'hbd58ea49), .K7_C5_W1(32'hbdfca7e7), .K7_C5_W2(32'h3e337be2), .K7_C5_W3(32'hbe0840c9), .K7_C5_W4(32'hbe04c9c5), .K7_C5_W5(32'h3d2beead), .K7_C5_W6(32'h3d305400), .K7_C5_W7(32'h3cf9b88d), .K7_C5_W8(32'hbd57562e), 
		.K7_C6_W0(32'h3be41aae), .K7_C6_W1(32'hbdfa34c1), .K7_C6_W2(32'hbe249aed), .K7_C6_W3(32'h3e328679), .K7_C6_W4(32'h3b916702), .K7_C6_W5(32'h3dd52069), .K7_C6_W6(32'hbe313b1b), .K7_C6_W7(32'hbd9bbd21), .K7_C6_W8(32'hbd9b1aee), 
		.K7_C7_W0(32'hbe240bc2), .K7_C7_W1(32'hbdc028ea), .K7_C7_W2(32'hbd1dee37), .K7_C7_W3(32'h3d359fc0), .K7_C7_W4(32'h3dcf1f41), .K7_C7_W5(32'h3d9e6b77), .K7_C7_W6(32'h3e0f9a65), .K7_C7_W7(32'hbd0e250c), .K7_C7_W8(32'hbddf4eea), 
		.K7_BIAS (32'h3d5a813c),

		.K8_C0_W0(32'hbc8df81e), .K8_C0_W1(32'h3e276657), .K8_C0_W2(32'hbd231c97), .K8_C0_W3(32'hbe2ec898), .K8_C0_W4(32'h3e11ae1b), .K8_C0_W5(32'h3e013ebf), .K8_C0_W6(32'hbe2aed16), .K8_C0_W7(32'h3ca4ed72), .K8_C0_W8(32'h3d6f8dd8), 
		.K8_C1_W0(32'h3ddfdd75), .K8_C1_W1(32'hbe1a8584), .K8_C1_W2(32'hbd48d9fd), .K8_C1_W3(32'h3de76de5), .K8_C1_W4(32'hbd9bd974), .K8_C1_W5(32'h3e033e49), .K8_C1_W6(32'h3d98277e), .K8_C1_W7(32'hbb7ac556), .K8_C1_W8(32'h3cb33994), 
		.K8_C2_W0(32'hbd8b1ead), .K8_C2_W1(32'h3df0a41b), .K8_C2_W2(32'hbe50143f), .K8_C2_W3(32'hbe0599bb), .K8_C2_W4(32'h3db29513), .K8_C2_W5(32'h3dc25e77), .K8_C2_W6(32'hbe52510b), .K8_C2_W7(32'hbe45d4f2), .K8_C2_W8(32'h3d6568c3), 
		.K8_C3_W0(32'h3dca1753), .K8_C3_W1(32'h3dde53ad), .K8_C3_W2(32'h3ddea9f3), .K8_C3_W3(32'hbd183fff), .K8_C3_W4(32'h3d85b083), .K8_C3_W5(32'hbdaa02c1), .K8_C3_W6(32'hbd5404a6), .K8_C3_W7(32'h3c6b4ac6), .K8_C3_W8(32'h3e4099b7), 
		.K8_C4_W0(32'h3c9ed02b), .K8_C4_W1(32'h3d4b2e1e), .K8_C4_W2(32'hbd8f2211), .K8_C4_W3(32'hbe06aeca), .K8_C4_W4(32'hbd4e6823), .K8_C4_W5(32'h3e0ec14a), .K8_C4_W6(32'h3e1a1037), .K8_C4_W7(32'h3ddd1365), .K8_C4_W8(32'h3df48fa2), 
		.K8_C5_W0(32'h3d1db158), .K8_C5_W1(32'hbdd4e0ab), .K8_C5_W2(32'hbdbb6f6a), .K8_C5_W3(32'hbe2af1e4), .K8_C5_W4(32'hbdde72d5), .K8_C5_W5(32'hbd753f31), .K8_C5_W6(32'h3e08b468), .K8_C5_W7(32'h3e31213b), .K8_C5_W8(32'h3e1e6fe2), 
		.K8_C6_W0(32'hbddddf65), .K8_C6_W1(32'hbdd882df), .K8_C6_W2(32'h3e0fc638), .K8_C6_W3(32'h3e11d069), .K8_C6_W4(32'h3e0d1a01), .K8_C6_W5(32'hbdf070eb), .K8_C6_W6(32'h3d652722), .K8_C6_W7(32'hbe5ea9e4), .K8_C6_W8(32'hbd97aa20), 
		.K8_C7_W0(32'h3e3492a3), .K8_C7_W1(32'h3ddd2214), .K8_C7_W2(32'h3d8d9482), .K8_C7_W3(32'h3e5e4ed2), .K8_C7_W4(32'h3e02beb3), .K8_C7_W5(32'h3d2d8193), .K8_C7_W6(32'h3e3559c8), .K8_C7_W7(32'h3e034d14), .K8_C7_W8(32'h3e4b2fdd), 
		.K8_BIAS (32'hbcd436db),

		.K9_C0_W0(32'hbdac8109), .K9_C0_W1(32'hbe1df15a), .K9_C0_W2(32'hbe2591b5), .K9_C0_W3(32'hbae3f4f3), .K9_C0_W4(32'h3ce2202d), .K9_C0_W5(32'h3cec0668), .K9_C0_W6(32'h3dbdc7bb), .K9_C0_W7(32'h3d47f9c4), .K9_C0_W8(32'h3e29d86b), 
		.K9_C1_W0(32'h3e27535e), .K9_C1_W1(32'h3d9ca88b), .K9_C1_W2(32'hbe33af9f), .K9_C1_W3(32'hbdcbab21), .K9_C1_W4(32'hbd8d0765), .K9_C1_W5(32'hbe03c834), .K9_C1_W6(32'hbd696741), .K9_C1_W7(32'h3cff0b8e), .K9_C1_W8(32'hbe0df647), 
		.K9_C2_W0(32'hbcc78a5c), .K9_C2_W1(32'h3d03d5b8), .K9_C2_W2(32'h3e296425), .K9_C2_W3(32'h3da3d716), .K9_C2_W4(32'h3d922277), .K9_C2_W5(32'h3d5c9498), .K9_C2_W6(32'h3dd88748), .K9_C2_W7(32'h3e338afc), .K9_C2_W8(32'h3e45ca14), 
		.K9_C3_W0(32'h3d77e774), .K9_C3_W1(32'hbdb05569), .K9_C3_W2(32'h3e262892), .K9_C3_W3(32'hbdcd69ef), .K9_C3_W4(32'h3cf7275a), .K9_C3_W5(32'hbe24bda1), .K9_C3_W6(32'hbe1b4447), .K9_C3_W7(32'h3e18a0c8), .K9_C3_W8(32'h3d232e38), 
		.K9_C4_W0(32'hbd5e0fe8), .K9_C4_W1(32'hbdf4e7c7), .K9_C4_W2(32'hbcc7d809), .K9_C4_W3(32'hbc82914a), .K9_C4_W4(32'hba04b2c0), .K9_C4_W5(32'hbd7311d0), .K9_C4_W6(32'hba9359ab), .K9_C4_W7(32'h3d9b1f86), .K9_C4_W8(32'h3a9ecfc7), 
		.K9_C5_W0(32'h3d3f1f54), .K9_C5_W1(32'hbddc86f8), .K9_C5_W2(32'h3c543e2b), .K9_C5_W3(32'h3dad0002), .K9_C5_W4(32'hbd4cced9), .K9_C5_W5(32'h3dd6484c), .K9_C5_W6(32'h3e078411), .K9_C5_W7(32'hbe093400), .K9_C5_W8(32'h3e0e390a), 
		.K9_C6_W0(32'hbbdd2888), .K9_C6_W1(32'hbd510c33), .K9_C6_W2(32'hbdf3fcb9), .K9_C6_W3(32'h3d3641e5), .K9_C6_W4(32'h3e07edb4), .K9_C6_W5(32'h3dbeb3c8), .K9_C6_W6(32'hbd68a50e), .K9_C6_W7(32'h3e404d82), .K9_C6_W8(32'hbcd4224c), 
		.K9_C7_W0(32'hbe2714d2), .K9_C7_W1(32'hbe09bfa3), .K9_C7_W2(32'h3d7e71c7), .K9_C7_W3(32'hbdf5df71), .K9_C7_W4(32'h3d0f76dc), .K9_C7_W5(32'hbdde2aa1), .K9_C7_W6(32'hbdbdceba), .K9_C7_W7(32'h3ddc9fc1), .K9_C7_W8(32'hbd3503b4), 
		.K9_BIAS (32'h3cd2cbce),

		.K10_C0_W0(32'h3dc1c247), .K10_C0_W1(32'h3d5ce5b4), .K10_C0_W2(32'h3dbb0912), .K10_C0_W3(32'hbdbb9409), .K10_C0_W4(32'hbe1a5048), .K10_C0_W5(32'hbe08a0ee), .K10_C0_W6(32'hbe3630b6), .K10_C0_W7(32'hbd38214b), .K10_C0_W8(32'h3de5b5f5), 
		.K10_C1_W0(32'hbc646093), .K10_C1_W1(32'h3bba8afe), .K10_C1_W2(32'h3e4778fc), .K10_C1_W3(32'h3dccb5c5), .K10_C1_W4(32'h3d56fa63), .K10_C1_W5(32'hbcd7b8f2), .K10_C1_W6(32'hbd8e2a56), .K10_C1_W7(32'hbbb0fc3a), .K10_C1_W8(32'hbe112a6c), 
		.K10_C2_W0(32'hbc635e49), .K10_C2_W1(32'h3db43669), .K10_C2_W2(32'hbe361c2c), .K10_C2_W3(32'hbd99dac4), .K10_C2_W4(32'h3de8016b), .K10_C2_W5(32'h3e17723a), .K10_C2_W6(32'h3c8a7ffb), .K10_C2_W7(32'hbd730f81), .K10_C2_W8(32'hbd158bbb), 
		.K10_C3_W0(32'h3d140dcc), .K10_C3_W1(32'hbe2b01f9), .K10_C3_W2(32'hbbe9dc3e), .K10_C3_W3(32'hbe015542), .K10_C3_W4(32'hbd434a60), .K10_C3_W5(32'hbdbd9623), .K10_C3_W6(32'hbda11bae), .K10_C3_W7(32'h3e06e44b), .K10_C3_W8(32'hbdd95b34), 
		.K10_C4_W0(32'h3deb0f72), .K10_C4_W1(32'h3e0db731), .K10_C4_W2(32'hbce1fcee), .K10_C4_W3(32'hbd983224), .K10_C4_W4(32'hbd935e0d), .K10_C4_W5(32'h3e55a67c), .K10_C4_W6(32'hbdfe408b), .K10_C4_W7(32'h3e0703c1), .K10_C4_W8(32'h3d650cff), 
		.K10_C5_W0(32'h3df18351), .K10_C5_W1(32'h3de1079f), .K10_C5_W2(32'h3e35a239), .K10_C5_W3(32'h3d98392b), .K10_C5_W4(32'h3dd9adbd), .K10_C5_W5(32'h3ae22ced), .K10_C5_W6(32'hbe1ac940), .K10_C5_W7(32'hbdbd2989), .K10_C5_W8(32'hbdaadda4), 
		.K10_C6_W0(32'hbe05c9c5), .K10_C6_W1(32'h3d0388b0), .K10_C6_W2(32'hbd63aff3), .K10_C6_W3(32'hbd99b20e), .K10_C6_W4(32'h3d7e8b68), .K10_C6_W5(32'hbe07dba4), .K10_C6_W6(32'hbe53f59b), .K10_C6_W7(32'h3dba39e8), .K10_C6_W8(32'h3dc0c55f), 
		.K10_C7_W0(32'h3d97eaaa), .K10_C7_W1(32'h3d4e7363), .K10_C7_W2(32'hbd5fe99e), .K10_C7_W3(32'hbdccccb5), .K10_C7_W4(32'h3d468063), .K10_C7_W5(32'h3c2ea129), .K10_C7_W6(32'h3dbcb8cc), .K10_C7_W7(32'hbd8f3eab), .K10_C7_W8(32'hbe4c003c), 
		.K10_BIAS (32'h3cf2ccd2),

		.K11_C0_W0(32'hbd685ff4), .K11_C0_W1(32'h3d93b49b), .K11_C0_W2(32'h3e2b957a), .K11_C0_W3(32'h3d182bbb), .K11_C0_W4(32'h3c513b12), .K11_C0_W5(32'hbdafb57a), .K11_C0_W6(32'hbcff9e66), .K11_C0_W7(32'h3c88a1c5), .K11_C0_W8(32'hbce2e039), 
		.K11_C1_W0(32'hbd003b2a), .K11_C1_W1(32'hbe18d07c), .K11_C1_W2(32'hbc9f8075), .K11_C1_W3(32'h3c2c7cbc), .K11_C1_W4(32'hbce1e185), .K11_C1_W5(32'hbdb6776b), .K11_C1_W6(32'h3d6a132f), .K11_C1_W7(32'h3e191809), .K11_C1_W8(32'h3e1f0eb3), 
		.K11_C2_W0(32'hbdedf09c), .K11_C2_W1(32'h3defc5e0), .K11_C2_W2(32'hbc1fda1b), .K11_C2_W3(32'hbe15b1f9), .K11_C2_W4(32'hbc27cd63), .K11_C2_W5(32'h3dd91534), .K11_C2_W6(32'hbd1e34b1), .K11_C2_W7(32'h3d0fd199), .K11_C2_W8(32'hb9f1e1c8), 
		.K11_C3_W0(32'h3e320b47), .K11_C3_W1(32'h3d98decc), .K11_C3_W2(32'hbd081839), .K11_C3_W3(32'h3d1c1ecc), .K11_C3_W4(32'h3dbf7409), .K11_C3_W5(32'hbe1349e2), .K11_C3_W6(32'hbc5119b1), .K11_C3_W7(32'hbdc9cc8a), .K11_C3_W8(32'hbd9c603d), 
		.K11_C4_W0(32'hbd828791), .K11_C4_W1(32'hbd94ab28), .K11_C4_W2(32'hbe2058d3), .K11_C4_W3(32'h3e2339d4), .K11_C4_W4(32'h3da2c135), .K11_C4_W5(32'hbe0d1210), .K11_C4_W6(32'hbdd7ae21), .K11_C4_W7(32'h3da1c651), .K11_C4_W8(32'hbda651ab), 
		.K11_C5_W0(32'h3d85a49e), .K11_C5_W1(32'hbdd0ff3e), .K11_C5_W2(32'hbd727f8d), .K11_C5_W3(32'hbe15d260), .K11_C5_W4(32'h3e05727f), .K11_C5_W5(32'h3e0f62dd), .K11_C5_W6(32'hbd740511), .K11_C5_W7(32'hbe070936), .K11_C5_W8(32'h3c9d0f36), 
		.K11_C6_W0(32'h3e0f06db), .K11_C6_W1(32'hbc4a15ae), .K11_C6_W2(32'hbde9ed83), .K11_C6_W3(32'hbd8e7430), .K11_C6_W4(32'hbd91721a), .K11_C6_W5(32'h3e08c43e), .K11_C6_W6(32'h3e12ba0d), .K11_C6_W7(32'hbe1978f7), .K11_C6_W8(32'h3c2c4cac), 
		.K11_C7_W0(32'h3d33bec6), .K11_C7_W1(32'h3dbe0e19), .K11_C7_W2(32'h3da84853), .K11_C7_W3(32'h3dd8af3e), .K11_C7_W4(32'h3e282cc2), .K11_C7_W5(32'hbcaa053a), .K11_C7_W6(32'hbd478e03), .K11_C7_W7(32'hbde0bb6e), .K11_C7_W8(32'h3df39801), 
		.K11_BIAS (32'hbc93f8d3),

		.K12_C0_W0(32'h3d1cf06f), .K12_C0_W1(32'hbd8829ea), .K12_C0_W2(32'hbc8f0065), .K12_C0_W3(32'hbd86ba70), .K12_C0_W4(32'h3d6187d8), .K12_C0_W5(32'hba34a764), .K12_C0_W6(32'h3dd24465), .K12_C0_W7(32'h3dc132f7), .K12_C0_W8(32'hbb37af59), 
		.K12_C1_W0(32'hbc400d0d), .K12_C1_W1(32'hbd1c4d66), .K12_C1_W2(32'hbd12a334), .K12_C1_W3(32'h3dacb923), .K12_C1_W4(32'h3c2a6f57), .K12_C1_W5(32'h3dc49d8a), .K12_C1_W6(32'h3e0525e8), .K12_C1_W7(32'h3df79a6a), .K12_C1_W8(32'hbdb7fd13), 
		.K12_C2_W0(32'h3e775491), .K12_C2_W1(32'h3d8707ea), .K12_C2_W2(32'hbdb55214), .K12_C2_W3(32'h3c8333c7), .K12_C2_W4(32'h39d31e96), .K12_C2_W5(32'hbe25a6ed), .K12_C2_W6(32'hbc0b535b), .K12_C2_W7(32'hbde174c2), .K12_C2_W8(32'h3dc4d6d3), 
		.K12_C3_W0(32'h3e27887c), .K12_C3_W1(32'h3e394561), .K12_C3_W2(32'hbd461ff2), .K12_C3_W3(32'hbd9d85fc), .K12_C3_W4(32'h3e1febc9), .K12_C3_W5(32'hbd688658), .K12_C3_W6(32'h3d847b6e), .K12_C3_W7(32'h3d0d89db), .K12_C3_W8(32'h3db344a1), 
		.K12_C4_W0(32'hbe07611c), .K12_C4_W1(32'h3df599ce), .K12_C4_W2(32'hbd88850f), .K12_C4_W3(32'h3db67f83), .K12_C4_W4(32'hbe353bb8), .K12_C4_W5(32'h3c1002be), .K12_C4_W6(32'hbd408acc), .K12_C4_W7(32'h3c5d6de3), .K12_C4_W8(32'hbce4907d), 
		.K12_C5_W0(32'h3d8abb41), .K12_C5_W1(32'hbe0f0143), .K12_C5_W2(32'hbd67eaf9), .K12_C5_W3(32'h3daf59c9), .K12_C5_W4(32'h3de1b855), .K12_C5_W5(32'hbc652f41), .K12_C5_W6(32'h3dd4c7ee), .K12_C5_W7(32'h3d858d22), .K12_C5_W8(32'hbcd769f0), 
		.K12_C6_W0(32'hbcf8918e), .K12_C6_W1(32'h3be71e71), .K12_C6_W2(32'h3e3cc499), .K12_C6_W3(32'h3d4ca24d), .K12_C6_W4(32'h3e1ba8c9), .K12_C6_W5(32'h3e387a9e), .K12_C6_W6(32'hbe44e7f9), .K12_C6_W7(32'hbe4fd78e), .K12_C6_W8(32'hbe318969), 
		.K12_C7_W0(32'hbe0c8f86), .K12_C7_W1(32'hbd10c746), .K12_C7_W2(32'h3da4a368), .K12_C7_W3(32'h3d07ccad), .K12_C7_W4(32'h3c556923), .K12_C7_W5(32'h3cf77eaf), .K12_C7_W6(32'h3c78c91f), .K12_C7_W7(32'h3dd7b450), .K12_C7_W8(32'hbe09e6f7), 
		.K12_BIAS (32'hbcf530be),

		.K13_C0_W0(32'h3e04a90e), .K13_C0_W1(32'h3cb04d94), .K13_C0_W2(32'hbe0980fb), .K13_C0_W3(32'h3e07e8ba), .K13_C0_W4(32'h3e282673), .K13_C0_W5(32'h3e008992), .K13_C0_W6(32'hbdb93be4), .K13_C0_W7(32'h3d906541), .K13_C0_W8(32'h3da192ad), 
		.K13_C1_W0(32'hbdf500a3), .K13_C1_W1(32'hbd9044cf), .K13_C1_W2(32'hbd446db1), .K13_C1_W3(32'hbdce905a), .K13_C1_W4(32'h3d4111a8), .K13_C1_W5(32'h3d643a12), .K13_C1_W6(32'hbdf93d23), .K13_C1_W7(32'h3d4e9d29), .K13_C1_W8(32'hbbe26aa3), 
		.K13_C2_W0(32'hbd54477a), .K13_C2_W1(32'hbe2c7a44), .K13_C2_W2(32'h3d6967cf), .K13_C2_W3(32'hbdad6e88), .K13_C2_W4(32'hbd25697a), .K13_C2_W5(32'h3db634bd), .K13_C2_W6(32'h3d0f3d31), .K13_C2_W7(32'hbe2019ad), .K13_C2_W8(32'hbd8b5af2), 
		.K13_C3_W0(32'h3e06fed5), .K13_C3_W1(32'h3e032ca6), .K13_C3_W2(32'hbd4de381), .K13_C3_W3(32'hbd86e865), .K13_C3_W4(32'h3d23339f), .K13_C3_W5(32'hbdcef961), .K13_C3_W6(32'hbd67e807), .K13_C3_W7(32'h3d2f375e), .K13_C3_W8(32'h3e28c31b), 
		.K13_C4_W0(32'h3d59c91b), .K13_C4_W1(32'hbe0b17fd), .K13_C4_W2(32'h3b10c1fa), .K13_C4_W3(32'hbdee6c7c), .K13_C4_W4(32'hbd8aed31), .K13_C4_W5(32'hbc668c4b), .K13_C4_W6(32'hbdbc7068), .K13_C4_W7(32'hbe094552), .K13_C4_W8(32'h3e2bc0b4), 
		.K13_C5_W0(32'h3e1b650e), .K13_C5_W1(32'h3ddbac99), .K13_C5_W2(32'h3d8b9794), .K13_C5_W3(32'hbd83eeb7), .K13_C5_W4(32'h3e2fa336), .K13_C5_W5(32'hbd641adc), .K13_C5_W6(32'hbd351018), .K13_C5_W7(32'h3e20b6f4), .K13_C5_W8(32'h3e038fdf), 
		.K13_C6_W0(32'hbe148228), .K13_C6_W1(32'hbdc80a85), .K13_C6_W2(32'hbd8f4fd4), .K13_C6_W3(32'h3e3702dd), .K13_C6_W4(32'h3dd44011), .K13_C6_W5(32'hbcc793f4), .K13_C6_W6(32'h3dfd9a34), .K13_C6_W7(32'h3d2a53f6), .K13_C6_W8(32'hbd44a8ff), 
		.K13_C7_W0(32'hbc848907), .K13_C7_W1(32'hba7ec877), .K13_C7_W2(32'h3d809df0), .K13_C7_W3(32'h3e1f3e17), .K13_C7_W4(32'hbd9b2b87), .K13_C7_W5(32'hbd938e1e), .K13_C7_W6(32'hbd26d658), .K13_C7_W7(32'hbdee2819), .K13_C7_W8(32'h3c518970), 
		.K13_BIAS (32'hbceec530),

		.K14_C0_W0(32'hbdf1a440), .K14_C0_W1(32'h3dacd125), .K14_C0_W2(32'h3e1c4c7a), .K14_C0_W3(32'h3e18c184), .K14_C0_W4(32'hbe0c77d0), .K14_C0_W5(32'hbccffbfe), .K14_C0_W6(32'h3e3f497c), .K14_C0_W7(32'hbe1a0f3a), .K14_C0_W8(32'hbddb6518), 
		.K14_C1_W0(32'hbdca28d3), .K14_C1_W1(32'h3d9becdb), .K14_C1_W2(32'h3dfae6f9), .K14_C1_W3(32'hbc95fb69), .K14_C1_W4(32'h3c486c05), .K14_C1_W5(32'h3d44e84f), .K14_C1_W6(32'hbe26149b), .K14_C1_W7(32'h3c85d0bd), .K14_C1_W8(32'h3dcb2f32), 
		.K14_C2_W0(32'hbdc5aa96), .K14_C2_W1(32'hbe07352e), .K14_C2_W2(32'hbd37c5ae), .K14_C2_W3(32'h3d5c29ca), .K14_C2_W4(32'hbe0e0bb8), .K14_C2_W5(32'hbde89807), .K14_C2_W6(32'hbcc7cd1f), .K14_C2_W7(32'hbd2035bd), .K14_C2_W8(32'h3d281798), 
		.K14_C3_W0(32'hbd49f8d0), .K14_C3_W1(32'hbd34af31), .K14_C3_W2(32'h3e0af9ff), .K14_C3_W3(32'hbdc81ab7), .K14_C3_W4(32'hbdbb9277), .K14_C3_W5(32'hbd51d4e8), .K14_C3_W6(32'h3da57fdd), .K14_C3_W7(32'hbceafe0c), .K14_C3_W8(32'hbda2e9d3), 
		.K14_C4_W0(32'hbe1fcafc), .K14_C4_W1(32'h3d9329fe), .K14_C4_W2(32'hbd6f8a98), .K14_C4_W3(32'hbe2e0a75), .K14_C4_W4(32'hbe09016f), .K14_C4_W5(32'hbc44a5c2), .K14_C4_W6(32'h3a41c5ac), .K14_C4_W7(32'hbcbdf369), .K14_C4_W8(32'h3e307ef1), 
		.K14_C5_W0(32'h3d3deb57), .K14_C5_W1(32'hbdccdce5), .K14_C5_W2(32'h3dfb047e), .K14_C5_W3(32'hbe07ae39), .K14_C5_W4(32'h3d8f0233), .K14_C5_W5(32'hbdf8d611), .K14_C5_W6(32'hbe325a9f), .K14_C5_W7(32'h3cafda71), .K14_C5_W8(32'hbe2094c0), 
		.K14_C6_W0(32'hbe1a10be), .K14_C6_W1(32'h3ca7eb74), .K14_C6_W2(32'hbe2b2a79), .K14_C6_W3(32'h3d50bd02), .K14_C6_W4(32'hbcc8976f), .K14_C6_W5(32'h3dee2e29), .K14_C6_W6(32'hbd0f504d), .K14_C6_W7(32'hbd951e5a), .K14_C6_W8(32'hbd0c3336), 
		.K14_C7_W0(32'hbe22821b), .K14_C7_W1(32'h3d998dff), .K14_C7_W2(32'h3d846192), .K14_C7_W3(32'h3d2e28ab), .K14_C7_W4(32'h3e38bf17), .K14_C7_W5(32'h3e3e0cc3), .K14_C7_W6(32'h3d7fc125), .K14_C7_W7(32'hbcb2d319), .K14_C7_W8(32'h3e00eea7), 
		.K14_BIAS (32'hbb80d1f9),

		.K15_C0_W0(32'h3dc06f78), .K15_C0_W1(32'h3dcdf944), .K15_C0_W2(32'h3daf3151), .K15_C0_W3(32'h3de11fa7), .K15_C0_W4(32'h3dd20359), .K15_C0_W5(32'hbd212509), .K15_C0_W6(32'hbdf60245), .K15_C0_W7(32'h3df53491), .K15_C0_W8(32'hbdd51628), 
		.K15_C1_W0(32'hbd14fa24), .K15_C1_W1(32'hbd93b814), .K15_C1_W2(32'hbdc5317e), .K15_C1_W3(32'h3e257438), .K15_C1_W4(32'hbd003158), .K15_C1_W5(32'hbcda0b86), .K15_C1_W6(32'h3c72e4dd), .K15_C1_W7(32'h3dabfc98), .K15_C1_W8(32'h3dfe3bdb), 
		.K15_C2_W0(32'h3d298831), .K15_C2_W1(32'hbd67c0e2), .K15_C2_W2(32'hbb1d47be), .K15_C2_W3(32'h3dc62134), .K15_C2_W4(32'hbdf1d0d5), .K15_C2_W5(32'hbdf56b9f), .K15_C2_W6(32'h3d09f5ea), .K15_C2_W7(32'hbe39b131), .K15_C2_W8(32'hbe201dbc), 
		.K15_C3_W0(32'h3e07adb3), .K15_C3_W1(32'hbda5ba6f), .K15_C3_W2(32'hbb56baad), .K15_C3_W3(32'hbd0009d2), .K15_C3_W4(32'h3e1abdd9), .K15_C3_W5(32'h3e5e8210), .K15_C3_W6(32'h3d5d7a2c), .K15_C3_W7(32'hbe0f9d17), .K15_C3_W8(32'hbde10488), 
		.K15_C4_W0(32'hbe1fbc7c), .K15_C4_W1(32'h3e20f11b), .K15_C4_W2(32'hbdc2f4ef), .K15_C4_W3(32'h3d1759a6), .K15_C4_W4(32'h3e2dfc7d), .K15_C4_W5(32'hbc608175), .K15_C4_W6(32'hbd46ad0f), .K15_C4_W7(32'h3d79c35b), .K15_C4_W8(32'hbdedd9e4), 
		.K15_C5_W0(32'h3e187ed1), .K15_C5_W1(32'hbde28e1b), .K15_C5_W2(32'hbd91a009), .K15_C5_W3(32'hbd9a462e), .K15_C5_W4(32'h3e052989), .K15_C5_W5(32'hbdc39c38), .K15_C5_W6(32'h3d9ab74a), .K15_C5_W7(32'h3e3cadaa), .K15_C5_W8(32'h3d84825d), 
		.K15_C6_W0(32'hbd97cb24), .K15_C6_W1(32'hbe0756f4), .K15_C6_W2(32'hbd9e2bde), .K15_C6_W3(32'hbda3bc12), .K15_C6_W4(32'hbe0d65ee), .K15_C6_W5(32'hbda346b2), .K15_C6_W6(32'hbc97eb80), .K15_C6_W7(32'hbcb785ba), .K15_C6_W8(32'hbb98da6a), 
		.K15_C7_W0(32'h3c827f28), .K15_C7_W1(32'hbac4a192), .K15_C7_W2(32'h3db778cd), .K15_C7_W3(32'hbd2313c6), .K15_C7_W4(32'h3d86816c), .K15_C7_W5(32'h3e20a0a3), .K15_C7_W6(32'hbe1d8f95), .K15_C7_W7(32'h3e3a3eaf), .K15_C7_W8(32'hbc60d034), 
		.K15_BIAS (32'h3c3d7ea9)
		)
		block4_conv1(
		.clk(clk),
		.resetn(resetn),
		.data_valid_in(valid_in),
		.data_in_0(data_in_0),
		.data_in_1(data_in_1),
		.data_in_2(data_in_2),
		.data_in_3(data_in_3),
		.data_in_4(data_in_4),
		.data_in_5(data_in_5),
		.data_in_6(data_in_6),
		.data_in_7(data_in_7),
		.data_out_conv_0(conv_out_4_1[0]),
		.data_out_conv_1(conv_out_4_1[1]),
		.data_out_conv_2(conv_out_4_1[2]),
		.data_out_conv_3(conv_out_4_1[3]),
		.data_out_conv_4(conv_out_4_1[4]),
		.data_out_conv_5(conv_out_4_1[5]),
		.data_out_conv_6(conv_out_4_1[6]),
		.data_out_conv_7(conv_out_4_1[7]),
		.data_out_conv_8(conv_out_4_1[8]),
		.data_out_conv_9(conv_out_4_1[9]),
		.data_out_conv_10(conv_out_4_1[10]),
		.data_out_conv_11(conv_out_4_1[11]),
		.data_out_conv_12(conv_out_4_1[12]),
		.data_out_conv_13(conv_out_4_1[13]),
		.data_out_conv_14(conv_out_4_1[14]),
		.data_out_conv_15(conv_out_4_1[15]),
		.valid_out_pixel(conv_valid_out_4_1),
		.done(done_conv_4_1)
		);   





	conv3d_16_kernel_16_channel_size_3 #(
		.DATA_WIDTH(32),.IMG_WIDTH(WIDTH/8),.IMG_HEIGHT(HEIGHT/8),
		.K0_C0_W0(32'h3db42524), .K0_C0_W1(32'hbe137928), .K0_C0_W2(32'h3cb68062), .K0_C0_W3(32'hbe2091d5), .K0_C0_W4(32'hbd927ef5), .K0_C0_W5(32'h3de56c8a), .K0_C0_W6(32'h3c841ece), .K0_C0_W7(32'h3c98ae5b), .K0_C0_W8(32'hbd67f492), 
		.K0_C1_W0(32'hbd975271), .K0_C1_W1(32'hbd13fb91), .K0_C1_W2(32'h3ddab69a), .K0_C1_W3(32'h3df50350), .K0_C1_W4(32'hbddf3c8e), .K0_C1_W5(32'h3db9e3d5), .K0_C1_W6(32'hbb67b877), .K0_C1_W7(32'hbd9bf183), .K0_C1_W8(32'h3e15f132), 
		.K0_C2_W0(32'hbe0d012d), .K0_C2_W1(32'hbd0bf445), .K0_C2_W2(32'hbde408db), .K0_C2_W3(32'h3c87e623), .K0_C2_W4(32'hbd32f11f), .K0_C2_W5(32'h3c6938c6), .K0_C2_W6(32'hbdf4798f), .K0_C2_W7(32'h3d265b34), .K0_C2_W8(32'h3d64ecf9), 
		.K0_C3_W0(32'hbccfa8d3), .K0_C3_W1(32'h3b1f7ea5), .K0_C3_W2(32'hbd6d915d), .K0_C3_W3(32'hbdc26561), .K0_C3_W4(32'hbd8721c8), .K0_C3_W5(32'h3dbcf23b), .K0_C3_W6(32'h3da9e268), .K0_C3_W7(32'hbdbffdbc), .K0_C3_W8(32'hbe096088), 
		.K0_C4_W0(32'h3d71083c), .K0_C4_W1(32'hbdd08959), .K0_C4_W2(32'hbc439d7c), .K0_C4_W3(32'hbe11beb8), .K0_C4_W4(32'h3d9abf7f), .K0_C4_W5(32'h3dcf164b), .K0_C4_W6(32'h3c162d34), .K0_C4_W7(32'h3e0c9a16), .K0_C4_W8(32'hbde897d0), 
		.K0_C5_W0(32'h3d973355), .K0_C5_W1(32'hbddd6cb8), .K0_C5_W2(32'h3d0090ba), .K0_C5_W3(32'h3e191ec4), .K0_C5_W4(32'h3e1964d9), .K0_C5_W5(32'hbd4c19ad), .K0_C5_W6(32'h3caa4183), .K0_C5_W7(32'hbd7de357), .K0_C5_W8(32'hbdd3d730), 
		.K0_C6_W0(32'hbac9fcc7), .K0_C6_W1(32'hbd7d441d), .K0_C6_W2(32'h3b2654bc), .K0_C6_W3(32'hbd0232fb), .K0_C6_W4(32'hbd32b25e), .K0_C6_W5(32'h3de6e41d), .K0_C6_W6(32'hbdb5f28c), .K0_C6_W7(32'hbcc1fc7c), .K0_C6_W8(32'h3d997f5f), 
		.K0_C7_W0(32'h3cdaace6), .K0_C7_W1(32'h3dac4377), .K0_C7_W2(32'h3d45ee25), .K0_C7_W3(32'hbd4240ad), .K0_C7_W4(32'h3cf9ee14), .K0_C7_W5(32'hbe0527c9), .K0_C7_W6(32'h3d366eb4), .K0_C7_W7(32'h3dba649f), .K0_C7_W8(32'hbdee128b), 
		.K0_C8_W0(32'hbbd561be), .K0_C8_W1(32'hbdd64a39), .K0_C8_W2(32'h3e014958), .K0_C8_W3(32'h3cb227e0), .K0_C8_W4(32'hbded85f9), .K0_C8_W5(32'h3dbe3ca6), .K0_C8_W6(32'hbdfae2d6), .K0_C8_W7(32'h3d1f63b0), .K0_C8_W8(32'h3d84d082), 
		.K0_C9_W0(32'hbdc73eab), .K0_C9_W1(32'h3db139d3), .K0_C9_W2(32'h3cee2b4a), .K0_C9_W3(32'hbdfae943), .K0_C9_W4(32'hbdafd917), .K0_C9_W5(32'hbdb7790f), .K0_C9_W6(32'hbc9da99c), .K0_C9_W7(32'hbb8c7306), .K0_C9_W8(32'hbde26914), 
		.K0_C10_W0(32'hbddf25af), .K0_C10_W1(32'hbd067c76), .K0_C10_W2(32'hbdbc901d), .K0_C10_W3(32'hb9e637cd), .K0_C10_W4(32'h3c854457), .K0_C10_W5(32'h3d43eff1), .K0_C10_W6(32'h3d46838c), .K0_C10_W7(32'h3d96de4f), .K0_C10_W8(32'h3d4733a0), 
		.K0_C11_W0(32'h3e0fd04b), .K0_C11_W1(32'h3daf4b78), .K0_C11_W2(32'hbca87aee), .K0_C11_W3(32'hbaa5aa79), .K0_C11_W4(32'hbc5173e7), .K0_C11_W5(32'h3da90185), .K0_C11_W6(32'h3da7edee), .K0_C11_W7(32'hbcfafb0a), .K0_C11_W8(32'hbd4ebb57), 
		.K0_C12_W0(32'h3e1bd117), .K0_C12_W1(32'h3dcadb0c), .K0_C12_W2(32'h3de994e4), .K0_C12_W3(32'hbd8c3458), .K0_C12_W4(32'h3d5fe752), .K0_C12_W5(32'h3e131da8), .K0_C12_W6(32'hbcf605e1), .K0_C12_W7(32'h3ba4e8eb), .K0_C12_W8(32'hbe0f6a10), 
		.K0_C13_W0(32'hbe117fe4), .K0_C13_W1(32'hbd231651), .K0_C13_W2(32'h3d671e6b), .K0_C13_W3(32'hbc51d5f0), .K0_C13_W4(32'hbe0ad761), .K0_C13_W5(32'hbd1619d6), .K0_C13_W6(32'hbe199ec5), .K0_C13_W7(32'h3ca17876), .K0_C13_W8(32'hbdc81da9), 
		.K0_C14_W0(32'hbddaaeb4), .K0_C14_W1(32'hbcf83d15), .K0_C14_W2(32'hbc662459), .K0_C14_W3(32'hbc649c3f), .K0_C14_W4(32'hbde5e8bb), .K0_C14_W5(32'hbc94500b), .K0_C14_W6(32'h3dc23112), .K0_C14_W7(32'hbc5aa234), .K0_C14_W8(32'h3c15340f), 
		.K0_C15_W0(32'hbc67b69a), .K0_C15_W1(32'h3d8cbdfb), .K0_C15_W2(32'hbdc24bfb), .K0_C15_W3(32'h3dda5ab6), .K0_C15_W4(32'hbaedb720), .K0_C15_W5(32'hbda2b0e4), .K0_C15_W6(32'h3cee3fc8), .K0_C15_W7(32'hbc65974b), .K0_C15_W8(32'h3d86e83b), 
		.K0_BIAS (32'h3ca0475d),

		.K1_C0_W0(32'h3e03f1f2), .K1_C0_W1(32'hbe0824d3), .K1_C0_W2(32'hbe3058d6), .K1_C0_W3(32'hbde21627), .K1_C0_W4(32'hbd17a0e3), .K1_C0_W5(32'hbda5ca14), .K1_C0_W6(32'hbe0000c1), .K1_C0_W7(32'hbacfe0cc), .K1_C0_W8(32'h3b8efb29), 
		.K1_C1_W0(32'h3c25141b), .K1_C1_W1(32'h3d691403), .K1_C1_W2(32'h3d0d614f), .K1_C1_W3(32'h3e04bf56), .K1_C1_W4(32'hbd813449), .K1_C1_W5(32'h3d31e387), .K1_C1_W6(32'hbddaccd7), .K1_C1_W7(32'hbde5a95f), .K1_C1_W8(32'h3d4974a4), 
		.K1_C2_W0(32'h3e06a862), .K1_C2_W1(32'h3bf5b250), .K1_C2_W2(32'hbdfec480), .K1_C2_W3(32'h3de923c5), .K1_C2_W4(32'h3bc7eba0), .K1_C2_W5(32'hbddeb2f2), .K1_C2_W6(32'hbd825740), .K1_C2_W7(32'hbdefcba2), .K1_C2_W8(32'h3d3cd8fc), 
		.K1_C3_W0(32'hbbd1824c), .K1_C3_W1(32'h3d114910), .K1_C3_W2(32'h3df575b2), .K1_C3_W3(32'h3de42c95), .K1_C3_W4(32'h3d899d09), .K1_C3_W5(32'h3e04972c), .K1_C3_W6(32'hbdf92033), .K1_C3_W7(32'hbdeba4dd), .K1_C3_W8(32'h3b7002d5), 
		.K1_C4_W0(32'h3c1c45f0), .K1_C4_W1(32'hbbbc8358), .K1_C4_W2(32'h3db6669f), .K1_C4_W3(32'hbdf95d6b), .K1_C4_W4(32'h3ca529af), .K1_C4_W5(32'hbe04bb03), .K1_C4_W6(32'hbd74e315), .K1_C4_W7(32'h3cad589d), .K1_C4_W8(32'hbde476f4), 
		.K1_C5_W0(32'h3df62d65), .K1_C5_W1(32'h3db79f9c), .K1_C5_W2(32'h3cd7ec34), .K1_C5_W3(32'h3d08442a), .K1_C5_W4(32'h3daaa97d), .K1_C5_W5(32'h3d366e45), .K1_C5_W6(32'h3962b188), .K1_C5_W7(32'hbd22b433), .K1_C5_W8(32'h3da5bba0), 
		.K1_C6_W0(32'h3cdd2c27), .K1_C6_W1(32'hbd5306f2), .K1_C6_W2(32'hbd9fbac9), .K1_C6_W3(32'h3d1662fc), .K1_C6_W4(32'h3d4ed406), .K1_C6_W5(32'h3cfc6d09), .K1_C6_W6(32'hbd92b152), .K1_C6_W7(32'hbdada4c9), .K1_C6_W8(32'hbd4cf682), 
		.K1_C7_W0(32'h3c2ab086), .K1_C7_W1(32'h3e18e091), .K1_C7_W2(32'h3dead7ad), .K1_C7_W3(32'h3cd6f99d), .K1_C7_W4(32'hbcc4a8ec), .K1_C7_W5(32'h3d9f3e44), .K1_C7_W6(32'hbe08b5fc), .K1_C7_W7(32'h3dfff981), .K1_C7_W8(32'hbdf6f37f), 
		.K1_C8_W0(32'h3d562bbb), .K1_C8_W1(32'h3c2ec47d), .K1_C8_W2(32'h3e08370d), .K1_C8_W3(32'hbcaabc8d), .K1_C8_W4(32'h3d57d799), .K1_C8_W5(32'h3ce0768e), .K1_C8_W6(32'hbdcb81fe), .K1_C8_W7(32'hbdc9c339), .K1_C8_W8(32'h3d85ccbf), 
		.K1_C9_W0(32'hbdd15ac3), .K1_C9_W1(32'h3d924a19), .K1_C9_W2(32'hbd234360), .K1_C9_W3(32'h3e1ec250), .K1_C9_W4(32'h3e01f0a4), .K1_C9_W5(32'hbe0acc3e), .K1_C9_W6(32'hbdea7b95), .K1_C9_W7(32'hbcf0cf5b), .K1_C9_W8(32'hbd87747e), 
		.K1_C10_W0(32'h3ce64554), .K1_C10_W1(32'h3dfcbf6c), .K1_C10_W2(32'h3b83fa8d), .K1_C10_W3(32'hbde5e324), .K1_C10_W4(32'h3cedb27a), .K1_C10_W5(32'h3c7b5e10), .K1_C10_W6(32'h3ce83a75), .K1_C10_W7(32'hbda84f1a), .K1_C10_W8(32'h3e047c76), 
		.K1_C11_W0(32'hbded9dcb), .K1_C11_W1(32'hbd25c49c), .K1_C11_W2(32'hbde935d9), .K1_C11_W3(32'h3d1df2f5), .K1_C11_W4(32'h3e1d1fce), .K1_C11_W5(32'h3c6929b0), .K1_C11_W6(32'hbe1a26be), .K1_C11_W7(32'hbd6239d6), .K1_C11_W8(32'h3bfb5871), 
		.K1_C12_W0(32'h3db10a89), .K1_C12_W1(32'hbddef42f), .K1_C12_W2(32'hbdd11aa3), .K1_C12_W3(32'h3d87e9ee), .K1_C12_W4(32'hbc85fea5), .K1_C12_W5(32'h3ceffd2a), .K1_C12_W6(32'hbc0f98d2), .K1_C12_W7(32'hbde64718), .K1_C12_W8(32'h3d178f08), 
		.K1_C13_W0(32'h3dfa73fa), .K1_C13_W1(32'h3dc4abbd), .K1_C13_W2(32'h3d79bf8c), .K1_C13_W3(32'hbd589d97), .K1_C13_W4(32'hbd71cf27), .K1_C13_W5(32'hbd5655fc), .K1_C13_W6(32'hbcf00dcf), .K1_C13_W7(32'hbdfab526), .K1_C13_W8(32'h3d7ee223), 
		.K1_C14_W0(32'hbd561503), .K1_C14_W1(32'hbd97c9ab), .K1_C14_W2(32'hbcd83b50), .K1_C14_W3(32'h3dc9f8ad), .K1_C14_W4(32'h3cb1adcc), .K1_C14_W5(32'hbd85c13c), .K1_C14_W6(32'hbdcad0cb), .K1_C14_W7(32'hbdd3ffd8), .K1_C14_W8(32'h3d5730d2), 
		.K1_C15_W0(32'hbdd9c548), .K1_C15_W1(32'hbd4623f1), .K1_C15_W2(32'hbe0d6ff5), .K1_C15_W3(32'hbce272e8), .K1_C15_W4(32'h3c21b727), .K1_C15_W5(32'h3d33319c), .K1_C15_W6(32'hbdb770bf), .K1_C15_W7(32'hbd1d9895), .K1_C15_W8(32'hbba7dad0), 
		.K1_BIAS (32'hbc007778),

		.K2_C0_W0(32'h3e0d6a66), .K2_C0_W1(32'h3d5db55f), .K2_C0_W2(32'h3d8d348e), .K2_C0_W3(32'h3d03c93c), .K2_C0_W4(32'hbdb228b9), .K2_C0_W5(32'h3d699555), .K2_C0_W6(32'h3cb4b7fd), .K2_C0_W7(32'hbccb8d83), .K2_C0_W8(32'h3e027439), 
		.K2_C1_W0(32'hbc219ecc), .K2_C1_W1(32'h3cf829ab), .K2_C1_W2(32'h3dce43b1), .K2_C1_W3(32'hbddac4ae), .K2_C1_W4(32'hbbc5a772), .K2_C1_W5(32'h3de858b7), .K2_C1_W6(32'hbaf88183), .K2_C1_W7(32'h3d78da5a), .K2_C1_W8(32'h3e08543d), 
		.K2_C2_W0(32'hbd0ccd3b), .K2_C2_W1(32'h3bfb0e7c), .K2_C2_W2(32'hbd3dc960), .K2_C2_W3(32'h3e268cd0), .K2_C2_W4(32'hbda64629), .K2_C2_W5(32'h3b2bfef2), .K2_C2_W6(32'hbe1734dc), .K2_C2_W7(32'hbe088c7f), .K2_C2_W8(32'h3dbd7743), 
		.K2_C3_W0(32'h3db7c4ce), .K2_C3_W1(32'hbdefb086), .K2_C3_W2(32'h3c72b89c), .K2_C3_W3(32'h3d9159a9), .K2_C3_W4(32'hbde8eb96), .K2_C3_W5(32'h3dd6ccb3), .K2_C3_W6(32'hbe1bf70e), .K2_C3_W7(32'hbda89052), .K2_C3_W8(32'hbdb7564b), 
		.K2_C4_W0(32'h3e1c5e13), .K2_C4_W1(32'h3d65bf7d), .K2_C4_W2(32'hbda4f891), .K2_C4_W3(32'h3d71e999), .K2_C4_W4(32'h3d3ed825), .K2_C4_W5(32'hbb3c3496), .K2_C4_W6(32'h3dbe40bf), .K2_C4_W7(32'h3d47a870), .K2_C4_W8(32'h3d7b8ca6), 
		.K2_C5_W0(32'hbe2e4e0a), .K2_C5_W1(32'hbd6b4fae), .K2_C5_W2(32'hbdf0b3ac), .K2_C5_W3(32'hbde8c7d6), .K2_C5_W4(32'hbdd2fba6), .K2_C5_W5(32'h3d47634d), .K2_C5_W6(32'h3d2ae2eb), .K2_C5_W7(32'hbda31aa9), .K2_C5_W8(32'hbdd242e6), 
		.K2_C6_W0(32'h3d12df27), .K2_C6_W1(32'hbdc96cc5), .K2_C6_W2(32'hbe132952), .K2_C6_W3(32'hbd66296a), .K2_C6_W4(32'hbda65ae3), .K2_C6_W5(32'h3de98f4f), .K2_C6_W6(32'hbdb93cd1), .K2_C6_W7(32'hbc62a671), .K2_C6_W8(32'hbc0f40d2), 
		.K2_C7_W0(32'hbd7503db), .K2_C7_W1(32'hbe094bea), .K2_C7_W2(32'h3d8fe39e), .K2_C7_W3(32'hbc939702), .K2_C7_W4(32'h3d2aa339), .K2_C7_W5(32'hbd89d5a7), .K2_C7_W6(32'hbe0b3368), .K2_C7_W7(32'hbe0aff2c), .K2_C7_W8(32'h3d3beba0), 
		.K2_C8_W0(32'hbce2d5c7), .K2_C8_W1(32'h3da3514f), .K2_C8_W2(32'hbc83c6d2), .K2_C8_W3(32'h3c77d052), .K2_C8_W4(32'h3d72d9a5), .K2_C8_W5(32'hbe017b4b), .K2_C8_W6(32'hbc9b49e1), .K2_C8_W7(32'h3da7facb), .K2_C8_W8(32'hbb2c6643), 
		.K2_C9_W0(32'hbde97907), .K2_C9_W1(32'hbc0ed706), .K2_C9_W2(32'hbc4e1f15), .K2_C9_W3(32'hbd4bf228), .K2_C9_W4(32'hbdda66b6), .K2_C9_W5(32'h3e053cfd), .K2_C9_W6(32'hbd8609f6), .K2_C9_W7(32'hbd9d567a), .K2_C9_W8(32'h3d825a40), 
		.K2_C10_W0(32'h3cf2b721), .K2_C10_W1(32'h3bf16a3e), .K2_C10_W2(32'h3d606535), .K2_C10_W3(32'h3e01d985), .K2_C10_W4(32'h3de2b414), .K2_C10_W5(32'hbdb3da14), .K2_C10_W6(32'hbdafb51e), .K2_C10_W7(32'h3d9ede76), .K2_C10_W8(32'h3cfa9286), 
		.K2_C11_W0(32'hbbc47771), .K2_C11_W1(32'h3e0b4690), .K2_C11_W2(32'h3de06121), .K2_C11_W3(32'h3c6a9ff2), .K2_C11_W4(32'h3d9b60f4), .K2_C11_W5(32'h3df73b1c), .K2_C11_W6(32'hbdd7ac3f), .K2_C11_W7(32'h3b85de2d), .K2_C11_W8(32'h3d952251), 
		.K2_C12_W0(32'h3d986fb9), .K2_C12_W1(32'h3da6c31c), .K2_C12_W2(32'hbca6c8e1), .K2_C12_W3(32'h3d48712c), .K2_C12_W4(32'h3d912c4d), .K2_C12_W5(32'hbd84e085), .K2_C12_W6(32'hbd42870a), .K2_C12_W7(32'hbc417437), .K2_C12_W8(32'h3c477a52), 
		.K2_C13_W0(32'h3d6a6202), .K2_C13_W1(32'hbe110da9), .K2_C13_W2(32'hbdf62631), .K2_C13_W3(32'hbde800fc), .K2_C13_W4(32'h3c600e2f), .K2_C13_W5(32'hbdd8b1c2), .K2_C13_W6(32'hbdc9e82d), .K2_C13_W7(32'hbd1d803b), .K2_C13_W8(32'h3d7de73c), 
		.K2_C14_W0(32'hbdf28df4), .K2_C14_W1(32'h3da7e4f7), .K2_C14_W2(32'hbddd7d9a), .K2_C14_W3(32'h3db5ba0b), .K2_C14_W4(32'h3e12f9ba), .K2_C14_W5(32'h3d5f4fe8), .K2_C14_W6(32'hbe12ce32), .K2_C14_W7(32'hbdca9a2c), .K2_C14_W8(32'h3cb8e5ad), 
		.K2_C15_W0(32'h3c37e1ec), .K2_C15_W1(32'h3e012fe0), .K2_C15_W2(32'h3e1bf461), .K2_C15_W3(32'h3e0cf3f1), .K2_C15_W4(32'hbced1be2), .K2_C15_W5(32'hbe20bcdf), .K2_C15_W6(32'h3df50600), .K2_C15_W7(32'hbccd6a82), .K2_C15_W8(32'hbda4c344), 
		.K2_BIAS (32'hbd11c529),

		.K3_C0_W0(32'h3de71966), .K3_C0_W1(32'h3c4e54c9), .K3_C0_W2(32'hbb200845), .K3_C0_W3(32'h3d14b66f), .K3_C0_W4(32'h3e008213), .K3_C0_W5(32'h3de0a198), .K3_C0_W6(32'hbe144726), .K3_C0_W7(32'h3de2cff1), .K3_C0_W8(32'hbd5264f8), 
		.K3_C1_W0(32'hbd03e19e), .K3_C1_W1(32'hbd7b3487), .K3_C1_W2(32'hbb9299b0), .K3_C1_W3(32'hbd812833), .K3_C1_W4(32'h3df631f7), .K3_C1_W5(32'hbd935a40), .K3_C1_W6(32'h3c6527ff), .K3_C1_W7(32'h3c958556), .K3_C1_W8(32'h3c489d0c), 
		.K3_C2_W0(32'hbdf25a68), .K3_C2_W1(32'hbcf8a739), .K3_C2_W2(32'h3dea2917), .K3_C2_W3(32'hbca0f332), .K3_C2_W4(32'h3c80b710), .K3_C2_W5(32'hbd983013), .K3_C2_W6(32'h3d967886), .K3_C2_W7(32'h3d1b1fcc), .K3_C2_W8(32'h3cd0765b), 
		.K3_C3_W0(32'h3d78c072), .K3_C3_W1(32'h3d75dc98), .K3_C3_W2(32'hbd8e59d3), .K3_C3_W3(32'h3dddedc6), .K3_C3_W4(32'hbe0cfcd2), .K3_C3_W5(32'h3dc3589b), .K3_C3_W6(32'h3e00c0f1), .K3_C3_W7(32'h3ca0629e), .K3_C3_W8(32'h3db9d850), 
		.K3_C4_W0(32'hbe0c492f), .K3_C4_W1(32'h3d0a1068), .K3_C4_W2(32'h3d175ab3), .K3_C4_W3(32'hbce1c9e2), .K3_C4_W4(32'h3e1d001e), .K3_C4_W5(32'h3aea4694), .K3_C4_W6(32'hbda80798), .K3_C4_W7(32'h3db4e52a), .K3_C4_W8(32'h3de9f5c9), 
		.K3_C5_W0(32'hbb487888), .K3_C5_W1(32'hbdd567dd), .K3_C5_W2(32'hbe217042), .K3_C5_W3(32'hbe4dfd6b), .K3_C5_W4(32'h3dc69121), .K3_C5_W5(32'hbc963c5d), .K3_C5_W6(32'hbe02a843), .K3_C5_W7(32'hbdb1964e), .K3_C5_W8(32'h3df9660d), 
		.K3_C6_W0(32'hbddc4284), .K3_C6_W1(32'h3d5f47c8), .K3_C6_W2(32'hbacfcf95), .K3_C6_W3(32'hbdcac846), .K3_C6_W4(32'hbdbbbbd3), .K3_C6_W5(32'hbd10c802), .K3_C6_W6(32'hbd97a721), .K3_C6_W7(32'hbd86a943), .K3_C6_W8(32'h3ddc49f6), 
		.K3_C7_W0(32'h3da1f76d), .K3_C7_W1(32'h3db6e7db), .K3_C7_W2(32'hbd9400f0), .K3_C7_W3(32'hbd91f388), .K3_C7_W4(32'hbd5fd51f), .K3_C7_W5(32'h3db7039a), .K3_C7_W6(32'hbdfc147e), .K3_C7_W7(32'h3d4114f7), .K3_C7_W8(32'hbd77d8b8), 
		.K3_C8_W0(32'hbd8b5531), .K3_C8_W1(32'h3d9192c2), .K3_C8_W2(32'hbde4875c), .K3_C8_W3(32'h3dcc229a), .K3_C8_W4(32'h3c44e486), .K3_C8_W5(32'h3dd0a01a), .K3_C8_W6(32'h3ddb38d5), .K3_C8_W7(32'hbd2c9d79), .K3_C8_W8(32'hbd5497ce), 
		.K3_C9_W0(32'hbdefb227), .K3_C9_W1(32'hbb28e33f), .K3_C9_W2(32'hbdc0bd04), .K3_C9_W3(32'hbdf7a228), .K3_C9_W4(32'h3ddf64f4), .K3_C9_W5(32'h3d50741d), .K3_C9_W6(32'hbe09949f), .K3_C9_W7(32'hbce08f1d), .K3_C9_W8(32'h3e0f0c0f), 
		.K3_C10_W0(32'h3d8c842c), .K3_C10_W1(32'h3e0cebdd), .K3_C10_W2(32'hbdfde30d), .K3_C10_W3(32'h3ca29213), .K3_C10_W4(32'hbe14ab77), .K3_C10_W5(32'hbd9626b1), .K3_C10_W6(32'hbd6fc79e), .K3_C10_W7(32'h3d94ba85), .K3_C10_W8(32'hbddaa7e7), 
		.K3_C11_W0(32'h3e025c7f), .K3_C11_W1(32'h3e11cf34), .K3_C11_W2(32'hbcbdbf6c), .K3_C11_W3(32'h3bebe990), .K3_C11_W4(32'h3db59929), .K3_C11_W5(32'hbdb55df5), .K3_C11_W6(32'h3dd189ed), .K3_C11_W7(32'h3c645877), .K3_C11_W8(32'h3b17a42b), 
		.K3_C12_W0(32'h3d6fa46e), .K3_C12_W1(32'h3dae1890), .K3_C12_W2(32'hbdb1bf9d), .K3_C12_W3(32'h3cfe2a05), .K3_C12_W4(32'h3dc23ee6), .K3_C12_W5(32'h3c2ddfc8), .K3_C12_W6(32'hbe0de6ca), .K3_C12_W7(32'hbc3f0187), .K3_C12_W8(32'h3d6b6963), 
		.K3_C13_W0(32'hbd937f0b), .K3_C13_W1(32'hbcd15af3), .K3_C13_W2(32'hbca6d011), .K3_C13_W3(32'h3ddd8274), .K3_C13_W4(32'hbdc836fb), .K3_C13_W5(32'hbe08fb5c), .K3_C13_W6(32'h3ddc5396), .K3_C13_W7(32'hbbef6939), .K3_C13_W8(32'h3d12ccbf), 
		.K3_C14_W0(32'h3d74485d), .K3_C14_W1(32'h3e0bcd83), .K3_C14_W2(32'h3da3cb57), .K3_C14_W3(32'hbe121b77), .K3_C14_W4(32'hbdaabb83), .K3_C14_W5(32'h3d8f9362), .K3_C14_W6(32'h3dcdf994), .K3_C14_W7(32'h3df579d9), .K3_C14_W8(32'h3ddbdead), 
		.K3_C15_W0(32'hbd345122), .K3_C15_W1(32'hbc81785d), .K3_C15_W2(32'hbe010d6d), .K3_C15_W3(32'h3d9ae5df), .K3_C15_W4(32'h3de05984), .K3_C15_W5(32'hbd8ba64e), .K3_C15_W6(32'hbd4333ae), .K3_C15_W7(32'h3d9a7ccd), .K3_C15_W8(32'h3d8fc3b7), 
		.K3_BIAS (32'hbd30d3d2),

		.K4_C0_W0(32'hbe08ade2), .K4_C0_W1(32'h3d7df7f2), .K4_C0_W2(32'hbe0d3410), .K4_C0_W3(32'h3d048b16), .K4_C0_W4(32'h3d527c5c), .K4_C0_W5(32'hbde982f3), .K4_C0_W6(32'hb9ebf0c5), .K4_C0_W7(32'h3d4f4a83), .K4_C0_W8(32'hbcac41a8), 
		.K4_C1_W0(32'h3b15d3be), .K4_C1_W1(32'hbe0abc1a), .K4_C1_W2(32'h3c55e871), .K4_C1_W3(32'hbcaf2386), .K4_C1_W4(32'h3dc140a4), .K4_C1_W5(32'hbde57c4d), .K4_C1_W6(32'hbbb176bc), .K4_C1_W7(32'h3db2a526), .K4_C1_W8(32'h3c31f5e8), 
		.K4_C2_W0(32'hbd54334e), .K4_C2_W1(32'h3b998466), .K4_C2_W2(32'hbd342466), .K4_C2_W3(32'h3e32a92c), .K4_C2_W4(32'hbd14e984), .K4_C2_W5(32'hbdb11c20), .K4_C2_W6(32'hbd8b9626), .K4_C2_W7(32'h3dac886a), .K4_C2_W8(32'h3cc75bf2), 
		.K4_C3_W0(32'h3dc96ad6), .K4_C3_W1(32'h3c9b98e1), .K4_C3_W2(32'hbe07ca6d), .K4_C3_W3(32'hbd0188bc), .K4_C3_W4(32'hbd1ec18b), .K4_C3_W5(32'hbca2dea7), .K4_C3_W6(32'hbdbc9ac2), .K4_C3_W7(32'hbbd726b0), .K4_C3_W8(32'hbdfd252f), 
		.K4_C4_W0(32'hbdaf0f57), .K4_C4_W1(32'h3d94088f), .K4_C4_W2(32'h3e1c3c1e), .K4_C4_W3(32'h3cce8eb2), .K4_C4_W4(32'hbe09d416), .K4_C4_W5(32'hbd8dc10a), .K4_C4_W6(32'h3d3388f1), .K4_C4_W7(32'h3d73724c), .K4_C4_W8(32'hbdcb3ad2), 
		.K4_C5_W0(32'hbd971f7e), .K4_C5_W1(32'h3d4aaa38), .K4_C5_W2(32'hbdb65812), .K4_C5_W3(32'hbd17da72), .K4_C5_W4(32'hbd17363f), .K4_C5_W5(32'h3dd4fab8), .K4_C5_W6(32'h3cfaac79), .K4_C5_W7(32'hbda1ccde), .K4_C5_W8(32'hbca74510), 
		.K4_C6_W0(32'hbdce9e19), .K4_C6_W1(32'h3df0e38c), .K4_C6_W2(32'h3c1799ec), .K4_C6_W3(32'hbd1403b3), .K4_C6_W4(32'hbd293f85), .K4_C6_W5(32'h3dc85ee7), .K4_C6_W6(32'hbd36db78), .K4_C6_W7(32'h3e12f089), .K4_C6_W8(32'hbd4a5d8d), 
		.K4_C7_W0(32'hbca38708), .K4_C7_W1(32'h3c964902), .K4_C7_W2(32'h3dd978d7), .K4_C7_W3(32'h3d258883), .K4_C7_W4(32'h3b1510e5), .K4_C7_W5(32'h3d05e81e), .K4_C7_W6(32'hbd2d214b), .K4_C7_W7(32'h3d7365d6), .K4_C7_W8(32'hbb91faf8), 
		.K4_C8_W0(32'hbda81680), .K4_C8_W1(32'h3d271e50), .K4_C8_W2(32'hbd75b5a0), .K4_C8_W3(32'hbd884596), .K4_C8_W4(32'h3d3b1c54), .K4_C8_W5(32'h3e030bdf), .K4_C8_W6(32'h3b50c0d0), .K4_C8_W7(32'h3d0d918a), .K4_C8_W8(32'hbd5a8127), 
		.K4_C9_W0(32'h3dbdd780), .K4_C9_W1(32'hbdf37374), .K4_C9_W2(32'h3c8006e7), .K4_C9_W3(32'hbd9f2563), .K4_C9_W4(32'h3d2c13a7), .K4_C9_W5(32'h3db207dd), .K4_C9_W6(32'h3e1715c3), .K4_C9_W7(32'h3e30e42f), .K4_C9_W8(32'h3df74165), 
		.K4_C10_W0(32'h3ddd3342), .K4_C10_W1(32'h3d908132), .K4_C10_W2(32'hbe106f42), .K4_C10_W3(32'h3df33c47), .K4_C10_W4(32'hbda3fac8), .K4_C10_W5(32'hbd0fea60), .K4_C10_W6(32'hbdd91451), .K4_C10_W7(32'hbc860eb7), .K4_C10_W8(32'hbda55ea2), 
		.K4_C11_W0(32'h3de47e5a), .K4_C11_W1(32'hbdd4038a), .K4_C11_W2(32'hbdd56bfe), .K4_C11_W3(32'hbd51dac1), .K4_C11_W4(32'h3daac608), .K4_C11_W5(32'h3c41c049), .K4_C11_W6(32'hbe01c50d), .K4_C11_W7(32'hbb0cb4a2), .K4_C11_W8(32'hbdd0e1a9), 
		.K4_C12_W0(32'hbe09f545), .K4_C12_W1(32'h3e001e79), .K4_C12_W2(32'hbbf76e21), .K4_C12_W3(32'hbd4712fc), .K4_C12_W4(32'hbe05090d), .K4_C12_W5(32'h3dbee7b2), .K4_C12_W6(32'h3dae0beb), .K4_C12_W7(32'hbd6422e6), .K4_C12_W8(32'h3cea01b0), 
		.K4_C13_W0(32'hbccd6e70), .K4_C13_W1(32'hbdd8c3a1), .K4_C13_W2(32'hbdb42a8e), .K4_C13_W3(32'h3de0f6a5), .K4_C13_W4(32'hbe20f047), .K4_C13_W5(32'hbe0c16e6), .K4_C13_W6(32'hbddf9cde), .K4_C13_W7(32'hbe08a6b0), .K4_C13_W8(32'h3e0e62a8), 
		.K4_C14_W0(32'h3dac62ea), .K4_C14_W1(32'h3d8f2664), .K4_C14_W2(32'h3b1b2b27), .K4_C14_W3(32'h3cdaf1f9), .K4_C14_W4(32'h3dbb036e), .K4_C14_W5(32'hbdbbc1f5), .K4_C14_W6(32'hbdac8b74), .K4_C14_W7(32'h3d74e3dd), .K4_C14_W8(32'h3d04e637), 
		.K4_C15_W0(32'hbc9185c0), .K4_C15_W1(32'hbe14dd19), .K4_C15_W2(32'hbcd5b0b1), .K4_C15_W3(32'h3e0a2cbb), .K4_C15_W4(32'h3da0da03), .K4_C15_W5(32'h3dae33a0), .K4_C15_W6(32'hbdcfcb62), .K4_C15_W7(32'hbc170599), .K4_C15_W8(32'h3d87cba4), 
		.K4_BIAS (32'h3d23b5d8),

		.K5_C0_W0(32'h3c3f10bc), .K5_C0_W1(32'h3e14e232), .K5_C0_W2(32'h3db0c696), .K5_C0_W3(32'h3e26d929), .K5_C0_W4(32'h3d80dd6c), .K5_C0_W5(32'h3e2fc3bd), .K5_C0_W6(32'h3e2f82c5), .K5_C0_W7(32'hbd815184), .K5_C0_W8(32'h3cd9f59a), 
		.K5_C1_W0(32'hbe0b57af), .K5_C1_W1(32'h3de531f3), .K5_C1_W2(32'h3dec77f2), .K5_C1_W3(32'h3c0d87d4), .K5_C1_W4(32'h3cf61733), .K5_C1_W5(32'hbdad6f0e), .K5_C1_W6(32'h3dfec6ac), .K5_C1_W7(32'hbd9e422a), .K5_C1_W8(32'h3d285d1d), 
		.K5_C2_W0(32'h3d9968e6), .K5_C2_W1(32'h3bd4c98f), .K5_C2_W2(32'hbd0b7788), .K5_C2_W3(32'h3c55fe52), .K5_C2_W4(32'h3c9bc008), .K5_C2_W5(32'h3d6229b3), .K5_C2_W6(32'hbcbb0a18), .K5_C2_W7(32'h3dcab95d), .K5_C2_W8(32'hbd598fd4), 
		.K5_C3_W0(32'hbdd6c5d5), .K5_C3_W1(32'hbd1926bb), .K5_C3_W2(32'hbd5542ec), .K5_C3_W3(32'hbdd1fd4d), .K5_C3_W4(32'hbd66e33d), .K5_C3_W5(32'h3d497704), .K5_C3_W6(32'hbcc50630), .K5_C3_W7(32'hbe1a68a1), .K5_C3_W8(32'h3dc45e76), 
		.K5_C4_W0(32'hbd0e37d9), .K5_C4_W1(32'h3e20c842), .K5_C4_W2(32'hbd470aba), .K5_C4_W3(32'hbd873588), .K5_C4_W4(32'hbc980314), .K5_C4_W5(32'h3c184a4a), .K5_C4_W6(32'h3d4c5b22), .K5_C4_W7(32'hbdf80bb3), .K5_C4_W8(32'hbe02b40d), 
		.K5_C5_W0(32'hbdb81b0f), .K5_C5_W1(32'hbd9adee1), .K5_C5_W2(32'h3ddc7c7a), .K5_C5_W3(32'hbd94fc11), .K5_C5_W4(32'hbd09f6ef), .K5_C5_W5(32'h3db58e8a), .K5_C5_W6(32'hbdcd78ae), .K5_C5_W7(32'h3d61578d), .K5_C5_W8(32'hbb8bcb00), 
		.K5_C6_W0(32'hbc26513f), .K5_C6_W1(32'hbd90eeb5), .K5_C6_W2(32'hbd2dfae0), .K5_C6_W3(32'hbc7a3396), .K5_C6_W4(32'h3e03bccb), .K5_C6_W5(32'hbc68232d), .K5_C6_W6(32'hbda53874), .K5_C6_W7(32'h3d7ccc73), .K5_C6_W8(32'hbdf78434), 
		.K5_C7_W0(32'h3b3f1328), .K5_C7_W1(32'hbc974ff2), .K5_C7_W2(32'h3d770b81), .K5_C7_W3(32'hbc2ff856), .K5_C7_W4(32'hbdffcf9a), .K5_C7_W5(32'h3de470ac), .K5_C7_W6(32'hbe0bf31c), .K5_C7_W7(32'h3d7fb742), .K5_C7_W8(32'hbdadb4a4), 
		.K5_C8_W0(32'hbdfe99e1), .K5_C8_W1(32'hbd97d343), .K5_C8_W2(32'hbd303dc6), .K5_C8_W3(32'hbe27c3b7), .K5_C8_W4(32'hbda84036), .K5_C8_W5(32'hbdd4224d), .K5_C8_W6(32'h3cf5ea33), .K5_C8_W7(32'hbe2964f9), .K5_C8_W8(32'hbd6f0e10), 
		.K5_C9_W0(32'h3d730d95), .K5_C9_W1(32'hbd9c2a57), .K5_C9_W2(32'hbd1f6781), .K5_C9_W3(32'h3c922e0a), .K5_C9_W4(32'h3d5f73a0), .K5_C9_W5(32'hbd186756), .K5_C9_W6(32'h3c733e75), .K5_C9_W7(32'h3e187bca), .K5_C9_W8(32'h3e02a414), 
		.K5_C10_W0(32'hbd51396c), .K5_C10_W1(32'h3e06c691), .K5_C10_W2(32'h3d8d3553), .K5_C10_W3(32'h3dd627ce), .K5_C10_W4(32'hbda78f4c), .K5_C10_W5(32'hbd0c7858), .K5_C10_W6(32'hbe02ed78), .K5_C10_W7(32'hbd85a871), .K5_C10_W8(32'hbe175c6b), 
		.K5_C11_W0(32'h3d8e3ab0), .K5_C11_W1(32'hbe0b0352), .K5_C11_W2(32'hbdc5ebeb), .K5_C11_W3(32'hbc8c624b), .K5_C11_W4(32'hbdf27ad0), .K5_C11_W5(32'hbdd5c527), .K5_C11_W6(32'h3ca79768), .K5_C11_W7(32'hbda8e369), .K5_C11_W8(32'hbd522d2c), 
		.K5_C12_W0(32'hbcd431dc), .K5_C12_W1(32'hbdd4ed82), .K5_C12_W2(32'h3d8e068c), .K5_C12_W3(32'hbdb64bfb), .K5_C12_W4(32'h3df0674f), .K5_C12_W5(32'h3cb44dec), .K5_C12_W6(32'h3d03e5e3), .K5_C12_W7(32'h3da4802e), .K5_C12_W8(32'h3d893ab6), 
		.K5_C13_W0(32'hbc41fae6), .K5_C13_W1(32'h3df1af7b), .K5_C13_W2(32'h3dd0acbc), .K5_C13_W3(32'hbc809aae), .K5_C13_W4(32'hbc6ec45d), .K5_C13_W5(32'hbc37cc9f), .K5_C13_W6(32'hbbfb7843), .K5_C13_W7(32'hbdb35744), .K5_C13_W8(32'hbdc6468b), 
		.K5_C14_W0(32'h3de3e923), .K5_C14_W1(32'hbdd27301), .K5_C14_W2(32'h3d6e1e70), .K5_C14_W3(32'hbd215492), .K5_C14_W4(32'hbd63c3dd), .K5_C14_W5(32'h3bb223fd), .K5_C14_W6(32'h3d94ac38), .K5_C14_W7(32'hbb19fbeb), .K5_C14_W8(32'hbdb01cf3), 
		.K5_C15_W0(32'hbdd32bf4), .K5_C15_W1(32'hbd4ac41e), .K5_C15_W2(32'hbd81c730), .K5_C15_W3(32'h3c2cad43), .K5_C15_W4(32'h3d53716e), .K5_C15_W5(32'hbd2316de), .K5_C15_W6(32'hbdf923d6), .K5_C15_W7(32'h3bfe14ed), .K5_C15_W8(32'hbd7cc74a), 
		.K5_BIAS (32'hbcc1bc3e),

		.K6_C0_W0(32'hbdeaac23), .K6_C0_W1(32'h3cbcbd65), .K6_C0_W2(32'h3d413e37), .K6_C0_W3(32'hbdcd0db7), .K6_C0_W4(32'hbd8992ca), .K6_C0_W5(32'h3d0f5418), .K6_C0_W6(32'h3cdea13b), .K6_C0_W7(32'h3dce5d23), .K6_C0_W8(32'hbcf8e580), 
		.K6_C1_W0(32'h3dffc004), .K6_C1_W1(32'h3e11d505), .K6_C1_W2(32'h3dcf54a8), .K6_C1_W3(32'h3cbc5d41), .K6_C1_W4(32'hbd81a468), .K6_C1_W5(32'hbd7c7ee6), .K6_C1_W6(32'hbce09e07), .K6_C1_W7(32'hbdcdc4bb), .K6_C1_W8(32'hbd6d8007), 
		.K6_C2_W0(32'h3d8108dc), .K6_C2_W1(32'h3dcca3ca), .K6_C2_W2(32'h3deb45cb), .K6_C2_W3(32'h3d4d5de6), .K6_C2_W4(32'hbda91172), .K6_C2_W5(32'hbded6264), .K6_C2_W6(32'hbdc0d0d7), .K6_C2_W7(32'hbdcff946), .K6_C2_W8(32'hbcd58a7c), 
		.K6_C3_W0(32'hbceedc59), .K6_C3_W1(32'hbde576ac), .K6_C3_W2(32'hbc0cfe27), .K6_C3_W3(32'h3e022a87), .K6_C3_W4(32'hbd306b48), .K6_C3_W5(32'h3e014ba6), .K6_C3_W6(32'hbce98b04), .K6_C3_W7(32'h3d5682fd), .K6_C3_W8(32'hbd99f5dc), 
		.K6_C4_W0(32'h3d6a9f9c), .K6_C4_W1(32'h3c0810b8), .K6_C4_W2(32'hbd2a0dbf), .K6_C4_W3(32'hbd8475bf), .K6_C4_W4(32'hbe0b0b58), .K6_C4_W5(32'hbd83e9a8), .K6_C4_W6(32'h3cd73a38), .K6_C4_W7(32'hbe003cdf), .K6_C4_W8(32'h3cf4cf17), 
		.K6_C5_W0(32'hbddc5508), .K6_C5_W1(32'hbe2a5d71), .K6_C5_W2(32'h3cbd7300), .K6_C5_W3(32'hbc1754f8), .K6_C5_W4(32'hbe1b09d7), .K6_C5_W5(32'hbd2705b7), .K6_C5_W6(32'hbd45d01b), .K6_C5_W7(32'hbe1024ac), .K6_C5_W8(32'hbe2353d5), 
		.K6_C6_W0(32'hbdaace9b), .K6_C6_W1(32'h3e07b2d5), .K6_C6_W2(32'hbd8a888d), .K6_C6_W3(32'h3cd389fb), .K6_C6_W4(32'h3c6eef00), .K6_C6_W5(32'h3ddfa0ef), .K6_C6_W6(32'h3c09d199), .K6_C6_W7(32'h3e167069), .K6_C6_W8(32'h3d026410), 
		.K6_C7_W0(32'hbdfed26b), .K6_C7_W1(32'hbd7e05a1), .K6_C7_W2(32'hbe043fea), .K6_C7_W3(32'h3e138f7e), .K6_C7_W4(32'hbd9ef7b9), .K6_C7_W5(32'hbd9b3ba9), .K6_C7_W6(32'h3db803f2), .K6_C7_W7(32'h3e059e4e), .K6_C7_W8(32'h3d461777), 
		.K6_C8_W0(32'h3dcf9fb3), .K6_C8_W1(32'hbc5b1c8c), .K6_C8_W2(32'hbd91be69), .K6_C8_W3(32'h3d9a17de), .K6_C8_W4(32'hbdd8ce0f), .K6_C8_W5(32'h3d9ad010), .K6_C8_W6(32'h3e1cb683), .K6_C8_W7(32'h3c4993ea), .K6_C8_W8(32'h3d1a521d), 
		.K6_C9_W0(32'hbd0b1e0f), .K6_C9_W1(32'hbc93313d), .K6_C9_W2(32'hbe0297d0), .K6_C9_W3(32'h3e1713ed), .K6_C9_W4(32'h3e176213), .K6_C9_W5(32'h3c20485d), .K6_C9_W6(32'h3e13ff5c), .K6_C9_W7(32'h3d677bcf), .K6_C9_W8(32'h3d49a2c3), 
		.K6_C10_W0(32'h3db16d97), .K6_C10_W1(32'h3cdc8118), .K6_C10_W2(32'hbdac3a71), .K6_C10_W3(32'h3dfcf107), .K6_C10_W4(32'hbde03133), .K6_C10_W5(32'hbc7feb93), .K6_C10_W6(32'hbde6c39b), .K6_C10_W7(32'hbd0acfb0), .K6_C10_W8(32'hbd029172), 
		.K6_C11_W0(32'h3d0efecd), .K6_C11_W1(32'h3d5e9b84), .K6_C11_W2(32'h3ded985d), .K6_C11_W3(32'h3c2538d9), .K6_C11_W4(32'h3e05c025), .K6_C11_W5(32'hbd3c0918), .K6_C11_W6(32'hbd980d6a), .K6_C11_W7(32'h3e109981), .K6_C11_W8(32'hbe059039), 
		.K6_C12_W0(32'hbe0d9b70), .K6_C12_W1(32'hbe06811b), .K6_C12_W2(32'h3dcb8cde), .K6_C12_W3(32'hbc9ff027), .K6_C12_W4(32'h3e00ee70), .K6_C12_W5(32'h3dfd8519), .K6_C12_W6(32'hbc3ce3e2), .K6_C12_W7(32'h3be72d1f), .K6_C12_W8(32'hbb89a982), 
		.K6_C13_W0(32'hbd0a1513), .K6_C13_W1(32'h3d39a140), .K6_C13_W2(32'hbd1aa89c), .K6_C13_W3(32'hbd4b452d), .K6_C13_W4(32'hbca83244), .K6_C13_W5(32'hbd63ef59), .K6_C13_W6(32'hbdf60a9f), .K6_C13_W7(32'h3af49e06), .K6_C13_W8(32'h3e0b10aa), 
		.K6_C14_W0(32'h3c143138), .K6_C14_W1(32'hbe18e50e), .K6_C14_W2(32'hbd9764f0), .K6_C14_W3(32'h3da5354a), .K6_C14_W4(32'h3d5ad566), .K6_C14_W5(32'hbd8ea386), .K6_C14_W6(32'hbcaf4b28), .K6_C14_W7(32'h3d0e9d18), .K6_C14_W8(32'h3dc4a734), 
		.K6_C15_W0(32'hbe0bb494), .K6_C15_W1(32'h3d42eaf0), .K6_C15_W2(32'h3c8f796f), .K6_C15_W3(32'h3c050038), .K6_C15_W4(32'hbb98601e), .K6_C15_W5(32'hbe0dd7e4), .K6_C15_W6(32'hbd52899c), .K6_C15_W7(32'h3d4d6ed3), .K6_C15_W8(32'hbd7d35c6), 
		.K6_BIAS (32'h3c139d17),

		.K7_C0_W0(32'h3d9f3baa), .K7_C0_W1(32'h3de0fccf), .K7_C0_W2(32'h3d3d520f), .K7_C0_W3(32'h3de453e6), .K7_C0_W4(32'h3dce258d), .K7_C0_W5(32'hbdf49198), .K7_C0_W6(32'h3df13229), .K7_C0_W7(32'h3d74b89e), .K7_C0_W8(32'hbdc77495), 
		.K7_C1_W0(32'h3d87dd9d), .K7_C1_W1(32'hbdb1603c), .K7_C1_W2(32'hbdcff5a8), .K7_C1_W3(32'hbdb3bf18), .K7_C1_W4(32'h3cbe1857), .K7_C1_W5(32'h3d66f0c7), .K7_C1_W6(32'h3d33197a), .K7_C1_W7(32'h3de12d9a), .K7_C1_W8(32'hbc9755aa), 
		.K7_C2_W0(32'hbcee2b78), .K7_C2_W1(32'h3e14af2a), .K7_C2_W2(32'h3d4e56a1), .K7_C2_W3(32'hbdab1f41), .K7_C2_W4(32'h3da216be), .K7_C2_W5(32'h3dfe37e7), .K7_C2_W6(32'h3befa107), .K7_C2_W7(32'h3dfc6aca), .K7_C2_W8(32'h3dcd8edd), 
		.K7_C3_W0(32'h3bd980d6), .K7_C3_W1(32'hbd347827), .K7_C3_W2(32'h3d41516c), .K7_C3_W3(32'h3d5814dd), .K7_C3_W4(32'h3e1c3cb5), .K7_C3_W5(32'hbd87b4a8), .K7_C3_W6(32'h3c9e057b), .K7_C3_W7(32'hbde2ae6f), .K7_C3_W8(32'hbc91c630), 
		.K7_C4_W0(32'h3defb562), .K7_C4_W1(32'h3c6b3c9c), .K7_C4_W2(32'hbde2b5f6), .K7_C4_W3(32'hbd8130dc), .K7_C4_W4(32'hbe18924f), .K7_C4_W5(32'h3a50765b), .K7_C4_W6(32'h3c1a0d32), .K7_C4_W7(32'hbd8db15b), .K7_C4_W8(32'hbdba8c36), 
		.K7_C5_W0(32'h3df59dbe), .K7_C5_W1(32'hbe096f55), .K7_C5_W2(32'hbe0f4ea8), .K7_C5_W3(32'hbdc6894d), .K7_C5_W4(32'hbce5bba3), .K7_C5_W5(32'hbd8af31d), .K7_C5_W6(32'hbdd748d5), .K7_C5_W7(32'h3e0ca7bc), .K7_C5_W8(32'hbc9c2b95), 
		.K7_C6_W0(32'hbe0883b3), .K7_C6_W1(32'h3c9668b1), .K7_C6_W2(32'h3d6456dc), .K7_C6_W3(32'hbdb72fdc), .K7_C6_W4(32'h3cf15790), .K7_C6_W5(32'h3bfb984d), .K7_C6_W6(32'h3caafe4a), .K7_C6_W7(32'h3b363904), .K7_C6_W8(32'h3dad507b), 
		.K7_C7_W0(32'h3dfd2fdf), .K7_C7_W1(32'hbd8fd408), .K7_C7_W2(32'hbde0d670), .K7_C7_W3(32'hbdca8c49), .K7_C7_W4(32'h3df19729), .K7_C7_W5(32'h3d1e5b44), .K7_C7_W6(32'hbbc7f49e), .K7_C7_W7(32'h3c737c75), .K7_C7_W8(32'hbe00c9fc), 
		.K7_C8_W0(32'hbb32c679), .K7_C8_W1(32'h3d31581c), .K7_C8_W2(32'hbda06fe0), .K7_C8_W3(32'hbe11d63e), .K7_C8_W4(32'hbcf7b21a), .K7_C8_W5(32'hbdfaac61), .K7_C8_W6(32'hbe0b1327), .K7_C8_W7(32'h3ddb2ff3), .K7_C8_W8(32'hbde60240), 
		.K7_C9_W0(32'hbe1c80f1), .K7_C9_W1(32'h3bd50168), .K7_C9_W2(32'h3d12351b), .K7_C9_W3(32'h3b24cdd5), .K7_C9_W4(32'hbd560615), .K7_C9_W5(32'hbe12d342), .K7_C9_W6(32'h3ccb0896), .K7_C9_W7(32'h3de73926), .K7_C9_W8(32'hbdee5c4b), 
		.K7_C10_W0(32'h3d2f6546), .K7_C10_W1(32'h3bf53b61), .K7_C10_W2(32'h3d939e68), .K7_C10_W3(32'hbdcbf99a), .K7_C10_W4(32'h3d9dd4ac), .K7_C10_W5(32'h3d95a17d), .K7_C10_W6(32'h3dbf2468), .K7_C10_W7(32'hbc921dcf), .K7_C10_W8(32'h3d877ba0), 
		.K7_C11_W0(32'hbd40a3d7), .K7_C11_W1(32'h3da73015), .K7_C11_W2(32'hbda51564), .K7_C11_W3(32'h3df29502), .K7_C11_W4(32'h3da91749), .K7_C11_W5(32'h3de98a1e), .K7_C11_W6(32'hbd99411f), .K7_C11_W7(32'hbc8f88eb), .K7_C11_W8(32'hbce5e45d), 
		.K7_C12_W0(32'h3c13a990), .K7_C12_W1(32'hbdbe2e6d), .K7_C12_W2(32'hbe21fb20), .K7_C12_W3(32'hbd7f47cc), .K7_C12_W4(32'hbe0e71b9), .K7_C12_W5(32'hbdd5c3bd), .K7_C12_W6(32'hbd6d3f4a), .K7_C12_W7(32'hbdd833c9), .K7_C12_W8(32'h3dbde849), 
		.K7_C13_W0(32'hbd110fb3), .K7_C13_W1(32'hbe159e93), .K7_C13_W2(32'hbdc8bd3c), .K7_C13_W3(32'hbe17e8a5), .K7_C13_W4(32'hbe21c0ef), .K7_C13_W5(32'h3c5ad325), .K7_C13_W6(32'hbdb8fb30), .K7_C13_W7(32'hbe18889f), .K7_C13_W8(32'hbe01887e), 
		.K7_C14_W0(32'h3d1005b7), .K7_C14_W1(32'h3e031976), .K7_C14_W2(32'hbcc70ed3), .K7_C14_W3(32'hbc8f5334), .K7_C14_W4(32'hbd90bb35), .K7_C14_W5(32'h3e12218f), .K7_C14_W6(32'h3d9a3f17), .K7_C14_W7(32'hbe1c4cea), .K7_C14_W8(32'h3d29b8b3), 
		.K7_C15_W0(32'h3de24c4d), .K7_C15_W1(32'hbd8535af), .K7_C15_W2(32'h3db04e29), .K7_C15_W3(32'h3ce2c676), .K7_C15_W4(32'hbd8e4a58), .K7_C15_W5(32'hbd07cbf0), .K7_C15_W6(32'h3cf309ed), .K7_C15_W7(32'h3d036b5e), .K7_C15_W8(32'hbc18f7bd), 
		.K7_BIAS (32'hbaa82ac9),

		.K8_C0_W0(32'h3dbd6642), .K8_C0_W1(32'h3ca94a00), .K8_C0_W2(32'hbdadddc3), .K8_C0_W3(32'hbd48e2c8), .K8_C0_W4(32'hbcf39be8), .K8_C0_W5(32'hbd43a1e9), .K8_C0_W6(32'hbd1846e2), .K8_C0_W7(32'h3e0943b2), .K8_C0_W8(32'h3d9bc349), 
		.K8_C1_W0(32'h3dab8472), .K8_C1_W1(32'h3e09f0b8), .K8_C1_W2(32'hbdf87a0f), .K8_C1_W3(32'hbde9ec2f), .K8_C1_W4(32'h3c85f2e5), .K8_C1_W5(32'hba2c9c3a), .K8_C1_W6(32'hbc42a9a5), .K8_C1_W7(32'h3e062a61), .K8_C1_W8(32'h3e062c1c), 
		.K8_C2_W0(32'h3d9f7a23), .K8_C2_W1(32'hbdfe5fbc), .K8_C2_W2(32'hbdd649c3), .K8_C2_W3(32'h3d324c6c), .K8_C2_W4(32'h3e0fe1bc), .K8_C2_W5(32'hbe041386), .K8_C2_W6(32'h3d7096b0), .K8_C2_W7(32'h3cffde47), .K8_C2_W8(32'h3e04005a), 
		.K8_C3_W0(32'hbd07f75f), .K8_C3_W1(32'h3dc9ebfb), .K8_C3_W2(32'h3d7593bf), .K8_C3_W3(32'h3dba560a), .K8_C3_W4(32'h3ca180ca), .K8_C3_W5(32'h3da12882), .K8_C3_W6(32'h3d675ae7), .K8_C3_W7(32'hbd901dba), .K8_C3_W8(32'hbdaa52b5), 
		.K8_C4_W0(32'hbd824d1e), .K8_C4_W1(32'hbd224ea6), .K8_C4_W2(32'h3e25955a), .K8_C4_W3(32'hbd3e3116), .K8_C4_W4(32'hbdbd4d83), .K8_C4_W5(32'hbda7f0b6), .K8_C4_W6(32'h3de72f43), .K8_C4_W7(32'h3e0f73b0), .K8_C4_W8(32'hbde1fda8), 
		.K8_C5_W0(32'h3df04676), .K8_C5_W1(32'h3d3a3a23), .K8_C5_W2(32'h3c82d870), .K8_C5_W3(32'hbd943b28), .K8_C5_W4(32'h3d3ce2b1), .K8_C5_W5(32'hbe04fae9), .K8_C5_W6(32'h3db53c6a), .K8_C5_W7(32'h3cbdcf03), .K8_C5_W8(32'h3dd7323a), 
		.K8_C6_W0(32'h3dd59c42), .K8_C6_W1(32'h3dc570c1), .K8_C6_W2(32'hbcc5c297), .K8_C6_W3(32'hbda84223), .K8_C6_W4(32'hbde2894d), .K8_C6_W5(32'h3e1289b6), .K8_C6_W6(32'hbda0fb80), .K8_C6_W7(32'hbe0261b7), .K8_C6_W8(32'hbca6063e), 
		.K8_C7_W0(32'hbda632d4), .K8_C7_W1(32'h3d1d740c), .K8_C7_W2(32'hbbf82ef3), .K8_C7_W3(32'hbda621b5), .K8_C7_W4(32'hbd9ccac2), .K8_C7_W5(32'hbc8b1664), .K8_C7_W6(32'h3dca5aad), .K8_C7_W7(32'h3d3efe3d), .K8_C7_W8(32'h3dde66b0), 
		.K8_C8_W0(32'hbd829f64), .K8_C8_W1(32'h3d29a686), .K8_C8_W2(32'h3e195524), .K8_C8_W3(32'h3cdf2adc), .K8_C8_W4(32'h3e0d09b0), .K8_C8_W5(32'hbdf7733f), .K8_C8_W6(32'hbd222694), .K8_C8_W7(32'hbdb799ec), .K8_C8_W8(32'hbd930e78), 
		.K8_C9_W0(32'h3d128032), .K8_C9_W1(32'h3da38857), .K8_C9_W2(32'hbe069963), .K8_C9_W3(32'hbc56b70b), .K8_C9_W4(32'hbdad0a5e), .K8_C9_W5(32'hbe17fc59), .K8_C9_W6(32'hbe2be754), .K8_C9_W7(32'h3c07d9fe), .K8_C9_W8(32'hbc8de9d1), 
		.K8_C10_W0(32'hbce9c349), .K8_C10_W1(32'hbda58915), .K8_C10_W2(32'h3dbdebb8), .K8_C10_W3(32'hbde598e1), .K8_C10_W4(32'hbdc176fd), .K8_C10_W5(32'hbd81a3a6), .K8_C10_W6(32'h3e1408df), .K8_C10_W7(32'hbd05b6a9), .K8_C10_W8(32'h3d7a7027), 
		.K8_C11_W0(32'h3da8134b), .K8_C11_W1(32'h3e09d78a), .K8_C11_W2(32'h3d280957), .K8_C11_W3(32'h3aef69d7), .K8_C11_W4(32'h3d1e9bf6), .K8_C11_W5(32'h3e05a629), .K8_C11_W6(32'h3c9282f5), .K8_C11_W7(32'h3d569456), .K8_C11_W8(32'hbe0151fd), 
		.K8_C12_W0(32'h3b8caffb), .K8_C12_W1(32'hbc955b8e), .K8_C12_W2(32'h3e168b40), .K8_C12_W3(32'h3d6d581c), .K8_C12_W4(32'h3df40868), .K8_C12_W5(32'hbde8ff83), .K8_C12_W6(32'h3de9a597), .K8_C12_W7(32'h3d4b81a3), .K8_C12_W8(32'hbdcdbe13), 
		.K8_C13_W0(32'h3dece77a), .K8_C13_W1(32'h3dc7c0da), .K8_C13_W2(32'h3d9f1260), .K8_C13_W3(32'h3e04eeff), .K8_C13_W4(32'h3da0c5ca), .K8_C13_W5(32'h3c4e35f3), .K8_C13_W6(32'h3d9b43c1), .K8_C13_W7(32'hbb50e551), .K8_C13_W8(32'hbdaa2544), 
		.K8_C14_W0(32'h3a757852), .K8_C14_W1(32'h3d05c049), .K8_C14_W2(32'hbd4cfe14), .K8_C14_W3(32'h3d7f63fc), .K8_C14_W4(32'hbd9c2aa2), .K8_C14_W5(32'hbd924906), .K8_C14_W6(32'h3daa3e28), .K8_C14_W7(32'hbd829e14), .K8_C14_W8(32'hbd66e293), 
		.K8_C15_W0(32'h3e0896ae), .K8_C15_W1(32'h3e0e4f16), .K8_C15_W2(32'h3d624544), .K8_C15_W3(32'hbe0e2265), .K8_C15_W4(32'h3db54f80), .K8_C15_W5(32'h3d0459db), .K8_C15_W6(32'hbd8dfb15), .K8_C15_W7(32'h3dece10a), .K8_C15_W8(32'hbd4449e3), 
		.K8_BIAS (32'h3cc37411),

		.K9_C0_W0(32'h3b15ca9b), .K9_C0_W1(32'hbd813b65), .K9_C0_W2(32'hbd43a9e6), .K9_C0_W3(32'h3d76ce7d), .K9_C0_W4(32'h3d804c65), .K9_C0_W5(32'hbdb73706), .K9_C0_W6(32'h3d0c6b2c), .K9_C0_W7(32'hbdc89c99), .K9_C0_W8(32'hbcb926f5), 
		.K9_C1_W0(32'h3db992be), .K9_C1_W1(32'h3d9caf13), .K9_C1_W2(32'hbdd2a4f6), .K9_C1_W3(32'hbd7622c6), .K9_C1_W4(32'hbd68c8ce), .K9_C1_W5(32'hbe05cf9d), .K9_C1_W6(32'hbe0533a7), .K9_C1_W7(32'h3ca12e80), .K9_C1_W8(32'h3d336035), 
		.K9_C2_W0(32'hbdfc475a), .K9_C2_W1(32'h3d56602c), .K9_C2_W2(32'h3e08e516), .K9_C2_W3(32'h3d4ddc81), .K9_C2_W4(32'h3d196b0f), .K9_C2_W5(32'hbe0ff03c), .K9_C2_W6(32'h3cee31b6), .K9_C2_W7(32'h3de44dd6), .K9_C2_W8(32'h3c6a200b), 
		.K9_C3_W0(32'hbdbce0d2), .K9_C3_W1(32'hbdc17885), .K9_C3_W2(32'hbccfd685), .K9_C3_W3(32'h3c94cf77), .K9_C3_W4(32'h3db5ae7a), .K9_C3_W5(32'h3d093d39), .K9_C3_W6(32'hbda68e64), .K9_C3_W7(32'hbe05cdb6), .K9_C3_W8(32'hbc9909cf), 
		.K9_C4_W0(32'hbc32d3a9), .K9_C4_W1(32'h3dc46f77), .K9_C4_W2(32'hbc8e5e1b), .K9_C4_W3(32'h3b3dd8e6), .K9_C4_W4(32'hbb363b30), .K9_C4_W5(32'hbd070808), .K9_C4_W6(32'h3da5597c), .K9_C4_W7(32'h3d33f8d5), .K9_C4_W8(32'hbc933a09), 
		.K9_C5_W0(32'h3dfd9ad2), .K9_C5_W1(32'hbe075fab), .K9_C5_W2(32'h3e18b318), .K9_C5_W3(32'h3ce5c083), .K9_C5_W4(32'h3be47d4e), .K9_C5_W5(32'h3ddc8312), .K9_C5_W6(32'hbd2c87ed), .K9_C5_W7(32'hbdc0cd5d), .K9_C5_W8(32'h3caf9f66), 
		.K9_C6_W0(32'hbcd6bc7d), .K9_C6_W1(32'h3c542ba2), .K9_C6_W2(32'h3c362ba2), .K9_C6_W3(32'hbcdeafde), .K9_C6_W4(32'hbddea7b4), .K9_C6_W5(32'h3cef55eb), .K9_C6_W6(32'h3ddf0e33), .K9_C6_W7(32'h3da2e708), .K9_C6_W8(32'h3db0b1f6), 
		.K9_C7_W0(32'h3de04ea8), .K9_C7_W1(32'hbd3f826c), .K9_C7_W2(32'hbddde051), .K9_C7_W3(32'h3e168900), .K9_C7_W4(32'h3d76fc3b), .K9_C7_W5(32'h3e0994e7), .K9_C7_W6(32'h3daeb8fe), .K9_C7_W7(32'h3dfcd91c), .K9_C7_W8(32'h3d86bf8a), 
		.K9_C8_W0(32'hbdf78afe), .K9_C8_W1(32'h3cd51e9f), .K9_C8_W2(32'hbe0c4d8c), .K9_C8_W3(32'hbd8ebe88), .K9_C8_W4(32'h3ddb2c38), .K9_C8_W5(32'h3e0c2bce), .K9_C8_W6(32'h3e0aec2c), .K9_C8_W7(32'hbd373e3e), .K9_C8_W8(32'hbcebe8b6), 
		.K9_C9_W0(32'h3dd5b749), .K9_C9_W1(32'h3d2a0457), .K9_C9_W2(32'h3d873f43), .K9_C9_W3(32'h3e13e787), .K9_C9_W4(32'h3df087dc), .K9_C9_W5(32'hbd908196), .K9_C9_W6(32'h3e1f7591), .K9_C9_W7(32'hbddfb2d5), .K9_C9_W8(32'h3e25956f), 
		.K9_C10_W0(32'h3e0c39ac), .K9_C10_W1(32'hbc8bd2d8), .K9_C10_W2(32'h3e004519), .K9_C10_W3(32'h3c591907), .K9_C10_W4(32'hbd8b7a6b), .K9_C10_W5(32'hbd841bcf), .K9_C10_W6(32'h3d732c83), .K9_C10_W7(32'hbcbfd89d), .K9_C10_W8(32'hbd720180), 
		.K9_C11_W0(32'hbe34ee8f), .K9_C11_W1(32'hbd36b270), .K9_C11_W2(32'hbde8b88a), .K9_C11_W3(32'hbde31e26), .K9_C11_W4(32'h3bdcc82b), .K9_C11_W5(32'hbd0bddb6), .K9_C11_W6(32'hbc9602e6), .K9_C11_W7(32'hbbefd07f), .K9_C11_W8(32'h3d4db713), 
		.K9_C12_W0(32'h3dd937d9), .K9_C12_W1(32'hbe1f870f), .K9_C12_W2(32'hbd29b09e), .K9_C12_W3(32'h3d5b06d5), .K9_C12_W4(32'hbcc78566), .K9_C12_W5(32'hbd2f79d7), .K9_C12_W6(32'h3bf0d43c), .K9_C12_W7(32'h3e0d1472), .K9_C12_W8(32'h3dc8bfe8), 
		.K9_C13_W0(32'hbdd995e5), .K9_C13_W1(32'h3dfc2b93), .K9_C13_W2(32'hbca4f4fa), .K9_C13_W3(32'h3d89a172), .K9_C13_W4(32'hbd51e682), .K9_C13_W5(32'h3c9ff5d2), .K9_C13_W6(32'hbd21697e), .K9_C13_W7(32'hbd8dfa93), .K9_C13_W8(32'hbdd9194f), 
		.K9_C14_W0(32'hbde59f61), .K9_C14_W1(32'h3e0ca896), .K9_C14_W2(32'h3debb508), .K9_C14_W3(32'h3d0fd85c), .K9_C14_W4(32'hbc579327), .K9_C14_W5(32'hbdef38d3), .K9_C14_W6(32'hbdf1e35f), .K9_C14_W7(32'hbcbc7e0c), .K9_C14_W8(32'hbde9f9de), 
		.K9_C15_W0(32'h3d2618b4), .K9_C15_W1(32'hbd2faa28), .K9_C15_W2(32'hbe215442), .K9_C15_W3(32'h3d8cd7b9), .K9_C15_W4(32'h3d191120), .K9_C15_W5(32'h3d3eb5fb), .K9_C15_W6(32'hbdb2301d), .K9_C15_W7(32'hbdfdb450), .K9_C15_W8(32'hbdb7c0aa), 
		.K9_BIAS (32'h3cd7bdbc),

		.K10_C0_W0(32'hbd135362), .K10_C0_W1(32'hbe070d6d), .K10_C0_W2(32'hbdad79eb), .K10_C0_W3(32'hbc39b5fc), .K10_C0_W4(32'hbc2ce1c1), .K10_C0_W5(32'h3dfb9cb0), .K10_C0_W6(32'h3ccea2e4), .K10_C0_W7(32'h3dea4393), .K10_C0_W8(32'h3dc1d2a5), 
		.K10_C1_W0(32'h3d17dc49), .K10_C1_W1(32'hbde843fc), .K10_C1_W2(32'hbcfe9ff3), .K10_C1_W3(32'h3dc50210), .K10_C1_W4(32'h3de4bf97), .K10_C1_W5(32'h3dbbc33a), .K10_C1_W6(32'hbd87a52d), .K10_C1_W7(32'hbda5760f), .K10_C1_W8(32'hbd44319c), 
		.K10_C2_W0(32'h3d993d33), .K10_C2_W1(32'hbdc6f3ab), .K10_C2_W2(32'h3dcd4cf0), .K10_C2_W3(32'hbd8559dd), .K10_C2_W4(32'h3e162dba), .K10_C2_W5(32'h3e31e6b1), .K10_C2_W6(32'hbdef8787), .K10_C2_W7(32'h3db0001a), .K10_C2_W8(32'hbd59ea0e), 
		.K10_C3_W0(32'h3d2b5b1d), .K10_C3_W1(32'hbddd0bd2), .K10_C3_W2(32'hbd278e49), .K10_C3_W3(32'hbcd077c7), .K10_C3_W4(32'hbda51886), .K10_C3_W5(32'h3d943e0a), .K10_C3_W6(32'hbe0b152b), .K10_C3_W7(32'h3dc3456c), .K10_C3_W8(32'hbd04c3be), 
		.K10_C4_W0(32'hbe2c8ce8), .K10_C4_W1(32'h3d364817), .K10_C4_W2(32'h3e02f205), .K10_C4_W3(32'hbc8a5538), .K10_C4_W4(32'hbd8f0193), .K10_C4_W5(32'hbdb9ae67), .K10_C4_W6(32'hbd8bbb47), .K10_C4_W7(32'h3d776f52), .K10_C4_W8(32'hbc27d60d), 
		.K10_C5_W0(32'hbd320761), .K10_C5_W1(32'h3debb0ae), .K10_C5_W2(32'hbdfe3217), .K10_C5_W3(32'h3d71e75e), .K10_C5_W4(32'hbdab1c7c), .K10_C5_W5(32'hbe21d25e), .K10_C5_W6(32'h3e03eeba), .K10_C5_W7(32'h3e1aec43), .K10_C5_W8(32'hbd375681), 
		.K10_C6_W0(32'hbe179606), .K10_C6_W1(32'hbc0156cd), .K10_C6_W2(32'hbdb2df02), .K10_C6_W3(32'hbdd119fd), .K10_C6_W4(32'hbd0bbc97), .K10_C6_W5(32'hbc01ae43), .K10_C6_W6(32'hbdf531bf), .K10_C6_W7(32'h3dad53e2), .K10_C6_W8(32'h3d9a3a03), 
		.K10_C7_W0(32'hbd56a811), .K10_C7_W1(32'hbdd132ca), .K10_C7_W2(32'hbe0f344a), .K10_C7_W3(32'hbd9f6b74), .K10_C7_W4(32'h3d953960), .K10_C7_W5(32'h3d6c405a), .K10_C7_W6(32'hbe098d96), .K10_C7_W7(32'h3b032578), .K10_C7_W8(32'h3d16fa2f), 
		.K10_C8_W0(32'hbd6751a9), .K10_C8_W1(32'h3d942108), .K10_C8_W2(32'h3d20206f), .K10_C8_W3(32'hbe07b589), .K10_C8_W4(32'hbdae354c), .K10_C8_W5(32'hbd036f0a), .K10_C8_W6(32'hbd707c28), .K10_C8_W7(32'hbda76a85), .K10_C8_W8(32'h3e2c05e7), 
		.K10_C9_W0(32'hbd39d13e), .K10_C9_W1(32'hbdf39326), .K10_C9_W2(32'hbd7d4f92), .K10_C9_W3(32'hba9fb95c), .K10_C9_W4(32'hbd4402ab), .K10_C9_W5(32'h3e15905f), .K10_C9_W6(32'hbd9068cb), .K10_C9_W7(32'hbc25db3a), .K10_C9_W8(32'h3e348fec), 
		.K10_C10_W0(32'hbceb5237), .K10_C10_W1(32'h3cfd9c1c), .K10_C10_W2(32'hbd9f8c4f), .K10_C10_W3(32'hbba7d794), .K10_C10_W4(32'h3d11b5d9), .K10_C10_W5(32'h3de258e1), .K10_C10_W6(32'h3dc7ae81), .K10_C10_W7(32'h3d90a867), .K10_C10_W8(32'hbe1d94a0), 
		.K10_C11_W0(32'h3d0e3932), .K10_C11_W1(32'hbdd85be2), .K10_C11_W2(32'hbd943c81), .K10_C11_W3(32'hbe09a8af), .K10_C11_W4(32'hb81b31f2), .K10_C11_W5(32'hbdb7bf2b), .K10_C11_W6(32'h3df3e45d), .K10_C11_W7(32'h3dbd30f4), .K10_C11_W8(32'hbd6fef1e), 
		.K10_C12_W0(32'hbdd2d27d), .K10_C12_W1(32'h3df569a4), .K10_C12_W2(32'hbcda86e0), .K10_C12_W3(32'hbd909695), .K10_C12_W4(32'hbe051a5b), .K10_C12_W5(32'hbe0a9d22), .K10_C12_W6(32'hbce08abc), .K10_C12_W7(32'hbe014f0d), .K10_C12_W8(32'hbd93577c), 
		.K10_C13_W0(32'hbc7bb7c3), .K10_C13_W1(32'hbe145707), .K10_C13_W2(32'h3dcc878f), .K10_C13_W3(32'hbc3669c4), .K10_C13_W4(32'h3d891474), .K10_C13_W5(32'hbdd2d7a4), .K10_C13_W6(32'h3d3c0ee6), .K10_C13_W7(32'hbd8791ba), .K10_C13_W8(32'h3d4a2f32), 
		.K10_C14_W0(32'hbd960cab), .K10_C14_W1(32'h3c0d83d2), .K10_C14_W2(32'hbdaaadeb), .K10_C14_W3(32'hbdb6e09b), .K10_C14_W4(32'hbdac3322), .K10_C14_W5(32'h3de8a803), .K10_C14_W6(32'h3d66503c), .K10_C14_W7(32'hbe1edc94), .K10_C14_W8(32'h3d861b2e), 
		.K10_C15_W0(32'h3a92cd42), .K10_C15_W1(32'hbd78b2c3), .K10_C15_W2(32'h3d3c119e), .K10_C15_W3(32'hbd46d7a1), .K10_C15_W4(32'hbc9bfe50), .K10_C15_W5(32'h3d7707f8), .K10_C15_W6(32'hbdda7d43), .K10_C15_W7(32'hbd93a011), .K10_C15_W8(32'h3da7b0b2), 
		.K10_BIAS (32'hbc87fe07),

		.K11_C0_W0(32'h3d38063a), .K11_C0_W1(32'hbccf5499), .K11_C0_W2(32'h3d93f450), .K11_C0_W3(32'hbe0ac36b), .K11_C0_W4(32'h3d718ef2), .K11_C0_W5(32'hbcd91902), .K11_C0_W6(32'hbd016f86), .K11_C0_W7(32'h3dd7713d), .K11_C0_W8(32'hbddabffc), 
		.K11_C1_W0(32'hbe197af1), .K11_C1_W1(32'hbdfc7a59), .K11_C1_W2(32'hbdd8829a), .K11_C1_W3(32'hbdbf47ad), .K11_C1_W4(32'h3905928e), .K11_C1_W5(32'h3def559e), .K11_C1_W6(32'hbc8565eb), .K11_C1_W7(32'h3c2c8bcb), .K11_C1_W8(32'hbd4c423c), 
		.K11_C2_W0(32'hbd7f9445), .K11_C2_W1(32'hbe0a3ec3), .K11_C2_W2(32'h3e008bbf), .K11_C2_W3(32'hbe175fc1), .K11_C2_W4(32'hbe041a23), .K11_C2_W5(32'h3d4d7852), .K11_C2_W6(32'hbd9b0c6f), .K11_C2_W7(32'hbd5d1a76), .K11_C2_W8(32'hbd91a05b), 
		.K11_C3_W0(32'h3e2c6441), .K11_C3_W1(32'hbdd6149b), .K11_C3_W2(32'hbda81f00), .K11_C3_W3(32'hbd2665ad), .K11_C3_W4(32'hbd70a6e9), .K11_C3_W5(32'hbc9fe5b9), .K11_C3_W6(32'h3e0d7417), .K11_C3_W7(32'h3e283bb4), .K11_C3_W8(32'h3d7105a7), 
		.K11_C4_W0(32'hbe430bb9), .K11_C4_W1(32'h3bdf09e4), .K11_C4_W2(32'h3d85c319), .K11_C4_W3(32'h3e121f4d), .K11_C4_W4(32'hbde6311e), .K11_C4_W5(32'hbd89bd2e), .K11_C4_W6(32'h3e06f346), .K11_C4_W7(32'h3dbc1dad), .K11_C4_W8(32'hbc6b8ec4), 
		.K11_C5_W0(32'hbdb991db), .K11_C5_W1(32'hbdca3d61), .K11_C5_W2(32'h3ddee1dc), .K11_C5_W3(32'hbdbf0407), .K11_C5_W4(32'hbcd76736), .K11_C5_W5(32'h3dc9aa78), .K11_C5_W6(32'hbd949ac5), .K11_C5_W7(32'h3d862f37), .K11_C5_W8(32'h3db2f00b), 
		.K11_C6_W0(32'hbba57122), .K11_C6_W1(32'hbd4c5e4c), .K11_C6_W2(32'hbd861017), .K11_C6_W3(32'h3d303f52), .K11_C6_W4(32'h3d9f97c1), .K11_C6_W5(32'hbceeee6e), .K11_C6_W6(32'hbd0c3640), .K11_C6_W7(32'h3dafe3c8), .K11_C6_W8(32'hbd765c28), 
		.K11_C7_W0(32'h3c245d63), .K11_C7_W1(32'h3cff6dea), .K11_C7_W2(32'hbd0824fe), .K11_C7_W3(32'h3e121bf6), .K11_C7_W4(32'h3d124154), .K11_C7_W5(32'hbdb83d38), .K11_C7_W6(32'hbc7cdafb), .K11_C7_W7(32'h3df2c1ef), .K11_C7_W8(32'hbdb425b4), 
		.K11_C8_W0(32'h3de14672), .K11_C8_W1(32'h3e0f3032), .K11_C8_W2(32'h3ca43352), .K11_C8_W3(32'h3d2bcbe2), .K11_C8_W4(32'h3d34267b), .K11_C8_W5(32'hbcd45192), .K11_C8_W6(32'h3ca89400), .K11_C8_W7(32'hbd08daee), .K11_C8_W8(32'hbd6af962), 
		.K11_C9_W0(32'hbe07c447), .K11_C9_W1(32'hbd3b90cc), .K11_C9_W2(32'hbd89047a), .K11_C9_W3(32'h3bce3179), .K11_C9_W4(32'h3c9b01b2), .K11_C9_W5(32'hbd564794), .K11_C9_W6(32'hbe0535fd), .K11_C9_W7(32'h3ddbea46), .K11_C9_W8(32'h3db0d627), 
		.K11_C10_W0(32'h3dde15fd), .K11_C10_W1(32'hbd402de5), .K11_C10_W2(32'h3d5f8e82), .K11_C10_W3(32'hbe12bdba), .K11_C10_W4(32'hbdb2f9dd), .K11_C10_W5(32'hbde8b23a), .K11_C10_W6(32'hbde0a1ee), .K11_C10_W7(32'h3db5342d), .K11_C10_W8(32'h3bdefca2), 
		.K11_C11_W0(32'h3d46ea5a), .K11_C11_W1(32'h3dd53985), .K11_C11_W2(32'hbde18358), .K11_C11_W3(32'h3dbe538c), .K11_C11_W4(32'hbce2e211), .K11_C11_W5(32'hbdfc9fc6), .K11_C11_W6(32'h3e01787c), .K11_C11_W7(32'h3da58140), .K11_C11_W8(32'hbda1945e), 
		.K11_C12_W0(32'h3dbd7255), .K11_C12_W1(32'hbd236842), .K11_C12_W2(32'h3e2036e8), .K11_C12_W3(32'hbdaa6014), .K11_C12_W4(32'hbc684582), .K11_C12_W5(32'h3da4ed5d), .K11_C12_W6(32'hbdbc4216), .K11_C12_W7(32'hbcb933dc), .K11_C12_W8(32'hbe205bb9), 
		.K11_C13_W0(32'h3d7bbbbd), .K11_C13_W1(32'h3d54e5bf), .K11_C13_W2(32'h3d9cf30a), .K11_C13_W3(32'hbdc07535), .K11_C13_W4(32'h3e08fc31), .K11_C13_W5(32'h3df7131c), .K11_C13_W6(32'h3d9db21f), .K11_C13_W7(32'hbe05af34), .K11_C13_W8(32'h3c24412e), 
		.K11_C14_W0(32'hbe0aaf49), .K11_C14_W1(32'hbddb64ca), .K11_C14_W2(32'h3d2c0570), .K11_C14_W3(32'h3c62f135), .K11_C14_W4(32'h3ddffd3d), .K11_C14_W5(32'h3dc89d97), .K11_C14_W6(32'h3b0d09bd), .K11_C14_W7(32'h3e41980b), .K11_C14_W8(32'hbda790ff), 
		.K11_C15_W0(32'hbdf93d49), .K11_C15_W1(32'h3dfbe7a2), .K11_C15_W2(32'h3dd21c85), .K11_C15_W3(32'hbe10da01), .K11_C15_W4(32'h3abc35cb), .K11_C15_W5(32'hbdce9a41), .K11_C15_W6(32'h3e1f548d), .K11_C15_W7(32'h3d9ea6cb), .K11_C15_W8(32'hbd87475d), 
		.K11_BIAS (32'hbd19e8c5),

		.K12_C0_W0(32'hbc1ff207), .K12_C0_W1(32'hbbe856ad), .K12_C0_W2(32'h3e130eaa), .K12_C0_W3(32'h3d1b75fe), .K12_C0_W4(32'hbe25d687), .K12_C0_W5(32'hbc9fc80b), .K12_C0_W6(32'hbdafb8e4), .K12_C0_W7(32'h3de7be7d), .K12_C0_W8(32'hbd049ab1), 
		.K12_C1_W0(32'h3b0d77ee), .K12_C1_W1(32'hbe0ef315), .K12_C1_W2(32'h3c0491c7), .K12_C1_W3(32'hbe23b548), .K12_C1_W4(32'hbdb6a948), .K12_C1_W5(32'h3d1e90fa), .K12_C1_W6(32'hbe2d5c89), .K12_C1_W7(32'h3deca442), .K12_C1_W8(32'h3d191903), 
		.K12_C2_W0(32'h3d739d7d), .K12_C2_W1(32'hbdbf0bca), .K12_C2_W2(32'hbd54a8b9), .K12_C2_W3(32'h3e1265d3), .K12_C2_W4(32'h3df31f22), .K12_C2_W5(32'hbce60da8), .K12_C2_W6(32'hbdccca74), .K12_C2_W7(32'hbbe4ef09), .K12_C2_W8(32'hbd848126), 
		.K12_C3_W0(32'h3d05b537), .K12_C3_W1(32'hbc886954), .K12_C3_W2(32'hbcceabac), .K12_C3_W3(32'h3db7bb8d), .K12_C3_W4(32'hbb56bd78), .K12_C3_W5(32'hbd3e91c8), .K12_C3_W6(32'hbc14605f), .K12_C3_W7(32'h3db1dba3), .K12_C3_W8(32'hbdb9565b), 
		.K12_C4_W0(32'hbdaf2358), .K12_C4_W1(32'h3d6b7c5a), .K12_C4_W2(32'h3d481307), .K12_C4_W3(32'hbe139ab6), .K12_C4_W4(32'hbe20a0e1), .K12_C4_W5(32'hbd041468), .K12_C4_W6(32'h3c4961f3), .K12_C4_W7(32'h3d0964f5), .K12_C4_W8(32'hbd7266fd), 
		.K12_C5_W0(32'hbcb91f63), .K12_C5_W1(32'hbc9e252f), .K12_C5_W2(32'hbe052955), .K12_C5_W3(32'h3db03e9e), .K12_C5_W4(32'h3b230945), .K12_C5_W5(32'h3d7b7a73), .K12_C5_W6(32'hbd91d414), .K12_C5_W7(32'hbdd7724f), .K12_C5_W8(32'hbb20defe), 
		.K12_C6_W0(32'h3be09de5), .K12_C6_W1(32'h3d25fc34), .K12_C6_W2(32'hbd46e625), .K12_C6_W3(32'h3e08e596), .K12_C6_W4(32'h3dd75b99), .K12_C6_W5(32'h3da0a658), .K12_C6_W6(32'h3c9ee05a), .K12_C6_W7(32'h3dd26745), .K12_C6_W8(32'hbd2023c7), 
		.K12_C7_W0(32'h3c9e73ab), .K12_C7_W1(32'hbd325600), .K12_C7_W2(32'h3de0d952), .K12_C7_W3(32'hbdaf7714), .K12_C7_W4(32'hbe0121d8), .K12_C7_W5(32'hbd4943a0), .K12_C7_W6(32'hbd44fe99), .K12_C7_W7(32'h3df78884), .K12_C7_W8(32'hbd0684c1), 
		.K12_C8_W0(32'h3c167d4d), .K12_C8_W1(32'h3be06741), .K12_C8_W2(32'hbda268d8), .K12_C8_W3(32'hbdc19685), .K12_C8_W4(32'h3e0f70d3), .K12_C8_W5(32'h3c574696), .K12_C8_W6(32'hbdaa3fdc), .K12_C8_W7(32'h3dafcce0), .K12_C8_W8(32'hbbe79f93), 
		.K12_C9_W0(32'hb929b794), .K12_C9_W1(32'hbdb95183), .K12_C9_W2(32'h3cd30499), .K12_C9_W3(32'h3dad4139), .K12_C9_W4(32'h3cec4906), .K12_C9_W5(32'hbdbe6ebe), .K12_C9_W6(32'h3d833c50), .K12_C9_W7(32'h3d6eb6d5), .K12_C9_W8(32'hbd072f88), 
		.K12_C10_W0(32'hbde4dc12), .K12_C10_W1(32'hbb03858d), .K12_C10_W2(32'hbe110cbf), .K12_C10_W3(32'h3d29e824), .K12_C10_W4(32'h3ca8a73e), .K12_C10_W5(32'h3c8c0d95), .K12_C10_W6(32'hbdea7061), .K12_C10_W7(32'hbd989069), .K12_C10_W8(32'h3dd29fb7), 
		.K12_C11_W0(32'h3ae89367), .K12_C11_W1(32'h3ccd93f4), .K12_C11_W2(32'h3d2b6b35), .K12_C11_W3(32'hbdf2f349), .K12_C11_W4(32'hbd81b240), .K12_C11_W5(32'hbe014aa6), .K12_C11_W6(32'hbb827c74), .K12_C11_W7(32'hbd6849f6), .K12_C11_W8(32'h3c22ad10), 
		.K12_C12_W0(32'h3da05dec), .K12_C12_W1(32'hbd635fd3), .K12_C12_W2(32'hbdf66f7f), .K12_C12_W3(32'h3e1185dd), .K12_C12_W4(32'h3d2b11a0), .K12_C12_W5(32'hbd71a48b), .K12_C12_W6(32'h3d850156), .K12_C12_W7(32'h3cff9fa6), .K12_C12_W8(32'hbcdd000c), 
		.K12_C13_W0(32'hbdefedd3), .K12_C13_W1(32'hbdcf5907), .K12_C13_W2(32'hbc90e147), .K12_C13_W3(32'hbde3d5fc), .K12_C13_W4(32'hbd7c5f6f), .K12_C13_W5(32'hbcdb9ae0), .K12_C13_W6(32'h3ca7020f), .K12_C13_W7(32'hbc9c063f), .K12_C13_W8(32'hbbcfab7c), 
		.K12_C14_W0(32'hbdad8bd3), .K12_C14_W1(32'h3d7c706b), .K12_C14_W2(32'h3d0793a3), .K12_C14_W3(32'hbd89a646), .K12_C14_W4(32'hbd944462), .K12_C14_W5(32'hbe10d3ee), .K12_C14_W6(32'hbc91eb70), .K12_C14_W7(32'hbdfa8b5c), .K12_C14_W8(32'hbdb03955), 
		.K12_C15_W0(32'h3d2f10c5), .K12_C15_W1(32'hbc9cdeaa), .K12_C15_W2(32'h3c6f47fe), .K12_C15_W3(32'hbd991625), .K12_C15_W4(32'hbd19f21b), .K12_C15_W5(32'hbcd789b1), .K12_C15_W6(32'h3deceae7), .K12_C15_W7(32'h3d79447c), .K12_C15_W8(32'hbdebe38e), 
		.K12_BIAS (32'hbd06c3fb),

		.K13_C0_W0(32'hbdcd89d0), .K13_C0_W1(32'h3c19c698), .K13_C0_W2(32'h3c209b09), .K13_C0_W3(32'hbcaee71f), .K13_C0_W4(32'h3d878b49), .K13_C0_W5(32'hbe301773), .K13_C0_W6(32'h3d78f3ad), .K13_C0_W7(32'hbe1c5f97), .K13_C0_W8(32'h3dd91378), 
		.K13_C1_W0(32'h3df42b66), .K13_C1_W1(32'h3db582ed), .K13_C1_W2(32'h3dab79f9), .K13_C1_W3(32'hbd3605b0), .K13_C1_W4(32'h3dafdf9a), .K13_C1_W5(32'hbe0d3b1a), .K13_C1_W6(32'h3de96857), .K13_C1_W7(32'hbe1e9309), .K13_C1_W8(32'hbd8bb712), 
		.K13_C2_W0(32'h3e0937ab), .K13_C2_W1(32'h3d0cd4e8), .K13_C2_W2(32'hbe1a5205), .K13_C2_W3(32'hbda88a07), .K13_C2_W4(32'h3c876d60), .K13_C2_W5(32'hbd2417e7), .K13_C2_W6(32'hbd716464), .K13_C2_W7(32'h3cc8f507), .K13_C2_W8(32'h3da404f9), 
		.K13_C3_W0(32'hbdb16eb7), .K13_C3_W1(32'h3daae282), .K13_C3_W2(32'hbe048164), .K13_C3_W3(32'h3e018dab), .K13_C3_W4(32'h3e0ef81e), .K13_C3_W5(32'h3e328300), .K13_C3_W6(32'h3de39a32), .K13_C3_W7(32'hbe11ec4d), .K13_C3_W8(32'h3d561ed1), 
		.K13_C4_W0(32'hbd7bb5e4), .K13_C4_W1(32'hbdb2b619), .K13_C4_W2(32'hbcb5954f), .K13_C4_W3(32'h3c85f83c), .K13_C4_W4(32'h3d148506), .K13_C4_W5(32'h3e02d29a), .K13_C4_W6(32'hbe05d87d), .K13_C4_W7(32'hbe21a246), .K13_C4_W8(32'h3b8aaa1c), 
		.K13_C5_W0(32'h3dd3aa4d), .K13_C5_W1(32'h3dba7341), .K13_C5_W2(32'h3e12c639), .K13_C5_W3(32'h3e58f340), .K13_C5_W4(32'h3dd5b106), .K13_C5_W5(32'hbd9c6f3b), .K13_C5_W6(32'hbd3d3d01), .K13_C5_W7(32'h3da89e57), .K13_C5_W8(32'h3ca3718f), 
		.K13_C6_W0(32'h3e011840), .K13_C6_W1(32'hbcbc31be), .K13_C6_W2(32'h3e118cc7), .K13_C6_W3(32'hbdb599b5), .K13_C6_W4(32'h3d663b97), .K13_C6_W5(32'h3cb51ef8), .K13_C6_W6(32'h3da07f97), .K13_C6_W7(32'h3d222ea6), .K13_C6_W8(32'h3e10c7fa), 
		.K13_C7_W0(32'h3e069efb), .K13_C7_W1(32'hbcd741d9), .K13_C7_W2(32'h3e0f5a57), .K13_C7_W3(32'hbcca4615), .K13_C7_W4(32'hbcd41f17), .K13_C7_W5(32'h3d9df998), .K13_C7_W6(32'hbbdd8a4d), .K13_C7_W7(32'hbd1bded5), .K13_C7_W8(32'h3d07f351), 
		.K13_C8_W0(32'hbe371eeb), .K13_C8_W1(32'h3de06ce9), .K13_C8_W2(32'h3d2eee41), .K13_C8_W3(32'hbe18f58f), .K13_C8_W4(32'h3d25c330), .K13_C8_W5(32'hbdb13342), .K13_C8_W6(32'hbde4ce66), .K13_C8_W7(32'hbdff9573), .K13_C8_W8(32'hbcad8f79), 
		.K13_C9_W0(32'h3d6018ec), .K13_C9_W1(32'h3ccff646), .K13_C9_W2(32'h3d9d3408), .K13_C9_W3(32'h3d0806d7), .K13_C9_W4(32'hbd964213), .K13_C9_W5(32'h3d9d5f75), .K13_C9_W6(32'h3e025ee3), .K13_C9_W7(32'h3dd4ae1e), .K13_C9_W8(32'hbc988aca), 
		.K13_C10_W0(32'h3e047a90), .K13_C10_W1(32'hbd7f43fb), .K13_C10_W2(32'h3d2674bf), .K13_C10_W3(32'h3de8ab5a), .K13_C10_W4(32'hbd8d1bad), .K13_C10_W5(32'hbc057f99), .K13_C10_W6(32'h3c34c737), .K13_C10_W7(32'hbd8affc0), .K13_C10_W8(32'hbc2bd272), 
		.K13_C11_W0(32'hbe10b6d8), .K13_C11_W1(32'hbd3b7a72), .K13_C11_W2(32'hbb92d02b), .K13_C11_W3(32'hbdad60af), .K13_C11_W4(32'h3dad91bf), .K13_C11_W5(32'hbc9ca2c3), .K13_C11_W6(32'h3b56a309), .K13_C11_W7(32'h3dd50626), .K13_C11_W8(32'hbe0c26a5), 
		.K13_C12_W0(32'h3b73ea57), .K13_C12_W1(32'hbca4c5a1), .K13_C12_W2(32'hbd276002), .K13_C12_W3(32'h3dc89feb), .K13_C12_W4(32'h3c1267bf), .K13_C12_W5(32'hbc9a83d7), .K13_C12_W6(32'h3d9b1fae), .K13_C12_W7(32'hbddfc22d), .K13_C12_W8(32'h3db0a1f7), 
		.K13_C13_W0(32'hbd55beb6), .K13_C13_W1(32'hbdcecfbd), .K13_C13_W2(32'h3d73cee0), .K13_C13_W3(32'hbc92b907), .K13_C13_W4(32'hbdd5fa5d), .K13_C13_W5(32'hbdffe64d), .K13_C13_W6(32'h3d2ac9e7), .K13_C13_W7(32'h3c89ed4e), .K13_C13_W8(32'h3d0e76ac), 
		.K13_C14_W0(32'h3de7416c), .K13_C14_W1(32'h3e0955ed), .K13_C14_W2(32'hbe05500f), .K13_C14_W3(32'h3d98bec2), .K13_C14_W4(32'hbd5f12e8), .K13_C14_W5(32'hbd6212f9), .K13_C14_W6(32'h3c4868d2), .K13_C14_W7(32'hbe049246), .K13_C14_W8(32'h3dfcc3b5), 
		.K13_C15_W0(32'hbdf6a16f), .K13_C15_W1(32'hbc50c831), .K13_C15_W2(32'h3da1bcf8), .K13_C15_W3(32'h3debc958), .K13_C15_W4(32'h3dbac864), .K13_C15_W5(32'hbde30d46), .K13_C15_W6(32'hbc23c0cf), .K13_C15_W7(32'hbe2a1378), .K13_C15_W8(32'h3df4b2ed), 
		.K13_BIAS (32'h3d5311c3),

		.K14_C0_W0(32'hbd4476a5), .K14_C0_W1(32'hbdbc3407), .K14_C0_W2(32'hbdb4e10a), .K14_C0_W3(32'h3e44ea3f), .K14_C0_W4(32'hbd66a974), .K14_C0_W5(32'h3e062bc5), .K14_C0_W6(32'h3e2d55c9), .K14_C0_W7(32'h3cc3a2f8), .K14_C0_W8(32'h3e3c4639), 
		.K14_C1_W0(32'hbe1c8233), .K14_C1_W1(32'h3d73e831), .K14_C1_W2(32'h3d743af2), .K14_C1_W3(32'hbd8bc6ea), .K14_C1_W4(32'h3d23a1ef), .K14_C1_W5(32'hbdd99457), .K14_C1_W6(32'h3d3efc61), .K14_C1_W7(32'hbd9bbc6b), .K14_C1_W8(32'hbd4267fc), 
		.K14_C2_W0(32'h3c3ab8dc), .K14_C2_W1(32'hbd0db947), .K14_C2_W2(32'h3d1b7567), .K14_C2_W3(32'hbe0dec88), .K14_C2_W4(32'h3ddb03b7), .K14_C2_W5(32'h3dd1f48f), .K14_C2_W6(32'hbd438b65), .K14_C2_W7(32'hbc52ca63), .K14_C2_W8(32'h3d3392d8), 
		.K14_C3_W0(32'hbd872e7c), .K14_C3_W1(32'hbda5756d), .K14_C3_W2(32'h3d4c5231), .K14_C3_W3(32'h3de3ac11), .K14_C3_W4(32'hbdefff64), .K14_C3_W5(32'h3ccb3fba), .K14_C3_W6(32'hbdf366d0), .K14_C3_W7(32'h3d59534a), .K14_C3_W8(32'hbddc29d4), 
		.K14_C4_W0(32'hbddf719b), .K14_C4_W1(32'hbd0a9967), .K14_C4_W2(32'h3d86b252), .K14_C4_W3(32'h3dfb853b), .K14_C4_W4(32'h3dd463d2), .K14_C4_W5(32'h3de1cc2b), .K14_C4_W6(32'hbb25b54a), .K14_C4_W7(32'hbbb18ab6), .K14_C4_W8(32'h3d153762), 
		.K14_C5_W0(32'h3c545113), .K14_C5_W1(32'h3d5dffd5), .K14_C5_W2(32'hba94b2f3), .K14_C5_W3(32'h3d7f72e8), .K14_C5_W4(32'h3d3da5ca), .K14_C5_W5(32'h3d8120b1), .K14_C5_W6(32'h3cc66be9), .K14_C5_W7(32'h3e002ce4), .K14_C5_W8(32'hbc231f31), 
		.K14_C6_W0(32'h3df38a40), .K14_C6_W1(32'h3c0ce6ec), .K14_C6_W2(32'hbdcf3e66), .K14_C6_W3(32'hbd8d0e82), .K14_C6_W4(32'h3c94f738), .K14_C6_W5(32'hbda668fd), .K14_C6_W6(32'hbd31586c), .K14_C6_W7(32'hbd86a40c), .K14_C6_W8(32'h3d58fc37), 
		.K14_C7_W0(32'h3bd53b0c), .K14_C7_W1(32'h3d0fc88d), .K14_C7_W2(32'hbafebf23), .K14_C7_W3(32'hbdc2bd5c), .K14_C7_W4(32'hbe16c116), .K14_C7_W5(32'hbdf3820c), .K14_C7_W6(32'hbd6ae2ac), .K14_C7_W7(32'h3dfdd02c), .K14_C7_W8(32'hbdf00d43), 
		.K14_C8_W0(32'h3d95341c), .K14_C8_W1(32'hbd89c900), .K14_C8_W2(32'h3c192b42), .K14_C8_W3(32'h3d57d5b2), .K14_C8_W4(32'h3d9208bc), .K14_C8_W5(32'hbd7fd522), .K14_C8_W6(32'h3db183fd), .K14_C8_W7(32'h3d903ea3), .K14_C8_W8(32'hbd00252d), 
		.K14_C9_W0(32'hbdb458fb), .K14_C9_W1(32'hbdcb0afe), .K14_C9_W2(32'h3c9d4414), .K14_C9_W3(32'h3da9f615), .K14_C9_W4(32'h3d5f6501), .K14_C9_W5(32'h3e01cbf1), .K14_C9_W6(32'h3d1b6c3b), .K14_C9_W7(32'hbd72d75d), .K14_C9_W8(32'hbe06c3ee), 
		.K14_C10_W0(32'hbd222a3a), .K14_C10_W1(32'hbe10a14e), .K14_C10_W2(32'h3d6e2b54), .K14_C10_W3(32'hbe34fd12), .K14_C10_W4(32'hbd8603b9), .K14_C10_W5(32'h3df66ef8), .K14_C10_W6(32'hbcf84e51), .K14_C10_W7(32'h3de45de8), .K14_C10_W8(32'h3dbf0d7d), 
		.K14_C11_W0(32'h3d0faaf2), .K14_C11_W1(32'h3e35a3af), .K14_C11_W2(32'hbd86fd78), .K14_C11_W3(32'hbcb1c432), .K14_C11_W4(32'hbe2a1382), .K14_C11_W5(32'hbe1cad7c), .K14_C11_W6(32'hbc94b3e8), .K14_C11_W7(32'h3d720a6e), .K14_C11_W8(32'hbdf15253), 
		.K14_C12_W0(32'hbdaf9951), .K14_C12_W1(32'h3d0c1c4f), .K14_C12_W2(32'hbdc9cfd4), .K14_C12_W3(32'hbd6d76e8), .K14_C12_W4(32'hbd533e4e), .K14_C12_W5(32'hbcf609a1), .K14_C12_W6(32'h3dd2b366), .K14_C12_W7(32'h3c9cb436), .K14_C12_W8(32'hbc96cc57), 
		.K14_C13_W0(32'h3e207dc5), .K14_C13_W1(32'h3d9d8b3a), .K14_C13_W2(32'h3ddf2711), .K14_C13_W3(32'hbd788f44), .K14_C13_W4(32'h3e2fcc7e), .K14_C13_W5(32'hbcd8cb42), .K14_C13_W6(32'hbd505389), .K14_C13_W7(32'hbcc46d99), .K14_C13_W8(32'hbd957a00), 
		.K14_C14_W0(32'hbd844706), .K14_C14_W1(32'hbde25460), .K14_C14_W2(32'hbd5c09d6), .K14_C14_W3(32'h3cf8a147), .K14_C14_W4(32'h3d8b2e17), .K14_C14_W5(32'hbd4d8b30), .K14_C14_W6(32'h3d92faa1), .K14_C14_W7(32'hbcb50820), .K14_C14_W8(32'h3ce02b21), 
		.K14_C15_W0(32'h3d6cb75e), .K14_C15_W1(32'hbd2e9eb6), .K14_C15_W2(32'hbe112920), .K14_C15_W3(32'h3d9cba8b), .K14_C15_W4(32'hbda8018b), .K14_C15_W5(32'hbdf4c193), .K14_C15_W6(32'hbc7c6e04), .K14_C15_W7(32'h3da311f7), .K14_C15_W8(32'h3de61999), 
		.K14_BIAS (32'hbcbfcc1a),

		.K15_C0_W0(32'h3cb6f2a5), .K15_C0_W1(32'h3da86ca2), .K15_C0_W2(32'h3d408298), .K15_C0_W3(32'h3cc70d23), .K15_C0_W4(32'h3d410b08), .K15_C0_W5(32'h3d28e676), .K15_C0_W6(32'hbd151632), .K15_C0_W7(32'h3dba7104), .K15_C0_W8(32'hbd9487ea), 
		.K15_C1_W0(32'h3ccb85d6), .K15_C1_W1(32'h3d9e9d1e), .K15_C1_W2(32'h3b90239b), .K15_C1_W3(32'h3d9e36e8), .K15_C1_W4(32'h3d8ba2b0), .K15_C1_W5(32'hbd860b4c), .K15_C1_W6(32'hbdfbb61e), .K15_C1_W7(32'hbd93c8f0), .K15_C1_W8(32'hbe0d3a12), 
		.K15_C2_W0(32'hbd8b3652), .K15_C2_W1(32'hbe093bad), .K15_C2_W2(32'hbe01bb33), .K15_C2_W3(32'h3d83e87e), .K15_C2_W4(32'h3dc6a7a0), .K15_C2_W5(32'hbd179be1), .K15_C2_W6(32'h3d92fa76), .K15_C2_W7(32'hbe178233), .K15_C2_W8(32'hbe130b89), 
		.K15_C3_W0(32'h3db2f4ae), .K15_C3_W1(32'h3cc54523), .K15_C3_W2(32'hbda8fb4f), .K15_C3_W3(32'h3e08b889), .K15_C3_W4(32'hbcd3c74d), .K15_C3_W5(32'hbe02879d), .K15_C3_W6(32'h3e18f24e), .K15_C3_W7(32'hbdc18665), .K15_C3_W8(32'hbdcabec5), 
		.K15_C4_W0(32'h3d0c9d56), .K15_C4_W1(32'h3b954f68), .K15_C4_W2(32'h3ce93364), .K15_C4_W3(32'h3c9954f1), .K15_C4_W4(32'h3ce8a720), .K15_C4_W5(32'h3d28166a), .K15_C4_W6(32'hbe02d0dc), .K15_C4_W7(32'h3d8a06c6), .K15_C4_W8(32'h3d23ac30), 
		.K15_C5_W0(32'hbdb51fcb), .K15_C5_W1(32'h3d2f7422), .K15_C5_W2(32'hbe0731c1), .K15_C5_W3(32'h3d38888d), .K15_C5_W4(32'h3db1ceff), .K15_C5_W5(32'h3de8cbdc), .K15_C5_W6(32'hbdab6d63), .K15_C5_W7(32'hbd7501b6), .K15_C5_W8(32'h3d886dd4), 
		.K15_C6_W0(32'h3d120d9e), .K15_C6_W1(32'hbc110f52), .K15_C6_W2(32'h3cf6e72e), .K15_C6_W3(32'h3dec7a5c), .K15_C6_W4(32'h3d552968), .K15_C6_W5(32'h3d9c1508), .K15_C6_W6(32'hbc68865e), .K15_C6_W7(32'h3dd5ae3c), .K15_C6_W8(32'h3b1de0b3), 
		.K15_C7_W0(32'h3a9b0d84), .K15_C7_W1(32'h3d390e2a), .K15_C7_W2(32'h3cbc9604), .K15_C7_W3(32'hbd539e95), .K15_C7_W4(32'hbc0255ad), .K15_C7_W5(32'h3d223b7f), .K15_C7_W6(32'h3e07578d), .K15_C7_W7(32'hbe1c5b44), .K15_C7_W8(32'h3c661fb3), 
		.K15_C8_W0(32'h3e1a6b3a), .K15_C8_W1(32'hbe114996), .K15_C8_W2(32'hbdd6292e), .K15_C8_W3(32'h3c87acc2), .K15_C8_W4(32'hbdfeddff), .K15_C8_W5(32'h3d2880a5), .K15_C8_W6(32'h3d1d8f8b), .K15_C8_W7(32'h3dbe9b3e), .K15_C8_W8(32'hbd138bad), 
		.K15_C9_W0(32'h3dc4a3ca), .K15_C9_W1(32'hbb782a62), .K15_C9_W2(32'hbda0701b), .K15_C9_W3(32'hbe0da076), .K15_C9_W4(32'h3c865d74), .K15_C9_W5(32'h3ce590d6), .K15_C9_W6(32'h3d390184), .K15_C9_W7(32'h3da6c088), .K15_C9_W8(32'h3e334aca), 
		.K15_C10_W0(32'hbb2c65f2), .K15_C10_W1(32'hbdbf6d97), .K15_C10_W2(32'h3d1b8669), .K15_C10_W3(32'hbe0289fb), .K15_C10_W4(32'h3daf628e), .K15_C10_W5(32'h3de70499), .K15_C10_W6(32'hbd7b47b6), .K15_C10_W7(32'h3dbca9cd), .K15_C10_W8(32'hbe0ad9b2), 
		.K15_C11_W0(32'h3dc29539), .K15_C11_W1(32'h3d407411), .K15_C11_W2(32'h3dd0cbf6), .K15_C11_W3(32'hbd199639), .K15_C11_W4(32'hbd25e239), .K15_C11_W5(32'hbcbbbd71), .K15_C11_W6(32'hbdb4265a), .K15_C11_W7(32'hbdb2cca6), .K15_C11_W8(32'h3d034f37), 
		.K15_C12_W0(32'hbdd4e9dd), .K15_C12_W1(32'h3db78dc2), .K15_C12_W2(32'h3e156ebe), .K15_C12_W3(32'hbdcabd84), .K15_C12_W4(32'hbd66e84c), .K15_C12_W5(32'h3e1438f0), .K15_C12_W6(32'h3deea340), .K15_C12_W7(32'h3e065a63), .K15_C12_W8(32'h3e0ad178), 
		.K15_C13_W0(32'h3e0c3d14), .K15_C13_W1(32'h3c26db72), .K15_C13_W2(32'hbdd460c6), .K15_C13_W3(32'h3d571f6b), .K15_C13_W4(32'h3d3723d4), .K15_C13_W5(32'h3d9dd514), .K15_C13_W6(32'h3de99cdc), .K15_C13_W7(32'h3d86805a), .K15_C13_W8(32'h3c132236), 
		.K15_C14_W0(32'hbe18e0b0), .K15_C14_W1(32'h3d90fda5), .K15_C14_W2(32'h3de955f9), .K15_C14_W3(32'h3cc7384d), .K15_C14_W4(32'h3cbc76b0), .K15_C14_W5(32'h3cb407d4), .K15_C14_W6(32'h3d9f0210), .K15_C14_W7(32'hbd92a02c), .K15_C14_W8(32'hbcd132fe), 
		.K15_C15_W0(32'h3df0126c), .K15_C15_W1(32'hbd852ec6), .K15_C15_W2(32'hbdbcde3f), .K15_C15_W3(32'hbbd3afc3), .K15_C15_W4(32'hbdb55703), .K15_C15_W5(32'hbd3ec546), .K15_C15_W6(32'h3d1d6241), .K15_C15_W7(32'h3ccc4ffe), .K15_C15_W8(32'h3e0d7b9e), 
		.K15_BIAS (32'hbd3f6096)
		)
		block4_conv2(
		.clk(clk),
		.resetn(resetn),
		.data_valid_in(conv_valid_out_4_1),
		.data_in_0(conv_out_4_1[0]),
		.data_in_1(conv_out_4_1[1]),
		.data_in_2(conv_out_4_1[2]),
		.data_in_3(conv_out_4_1[3]),
		.data_in_4(conv_out_4_1[4]),
		.data_in_5(conv_out_4_1[5]),
		.data_in_6(conv_out_4_1[6]),
		.data_in_7(conv_out_4_1[7]),
		.data_in_8(conv_out_4_1[8]),
		.data_in_9(conv_out_4_1[9]),
		.data_in_10(conv_out_4_1[10]),
		.data_in_11(conv_out_4_1[11]),
		.data_in_12(conv_out_4_1[12]),
		.data_in_13(conv_out_4_1[13]),
		.data_in_14(conv_out_4_1[14]),
		.data_in_15(conv_out_4_1[15]),
		.data_out_conv_0(conv_out_4_2[0]),
		.data_out_conv_1(conv_out_4_2[1]),
		.data_out_conv_2(conv_out_4_2[2]),
		.data_out_conv_3(conv_out_4_2[3]),
		.data_out_conv_4(conv_out_4_2[4]),
		.data_out_conv_5(conv_out_4_2[5]),
		.data_out_conv_6(conv_out_4_2[6]),
		.data_out_conv_7(conv_out_4_2[7]),
		.data_out_conv_8(conv_out_4_2[8]),
		.data_out_conv_9(conv_out_4_2[9]),
		.data_out_conv_10(conv_out_4_2[10]),
		.data_out_conv_11(conv_out_4_2[11]),
		.data_out_conv_12(conv_out_4_2[12]),
		.data_out_conv_13(conv_out_4_2[13]),
		.data_out_conv_14(conv_out_4_2[14]),
		.data_out_conv_15(conv_out_4_2[15]),
		.valid_out_pixel(conv_valid_out_4_2),
		.done(done_conv_4_2)
		);




	conv3d_16_kernel_16_channel_size_3 #(
		.DATA_WIDTH(32),.IMG_WIDTH(WIDTH/8),.IMG_HEIGHT(HEIGHT/8),
		.K0_C0_W0(32'hbdd94a6e), .K0_C0_W1(32'hbd4d4a9b), .K0_C0_W2(32'h3d930002), .K0_C0_W3(32'h3d958da6), .K0_C0_W4(32'hbced3357), .K0_C0_W5(32'h3de849d7), .K0_C0_W6(32'hbc919109), .K0_C0_W7(32'hbd358e00), .K0_C0_W8(32'h3e2a90c0), 
		.K0_C1_W0(32'h3c04e4eb), .K0_C1_W1(32'h3d03fb71), .K0_C1_W2(32'h3b2150a8), .K0_C1_W3(32'h3dd784be), .K0_C1_W4(32'h3e143d0e), .K0_C1_W5(32'h3df3e84c), .K0_C1_W6(32'h3d5240a1), .K0_C1_W7(32'h3cb7ca58), .K0_C1_W8(32'hbdfdcacb), 
		.K0_C2_W0(32'hbda526f2), .K0_C2_W1(32'h3d0114bc), .K0_C2_W2(32'hbb22a55b), .K0_C2_W3(32'hbdb51a02), .K0_C2_W4(32'h3daf4757), .K0_C2_W5(32'h3d03962c), .K0_C2_W6(32'hbe01290b), .K0_C2_W7(32'hbae29a18), .K0_C2_W8(32'hbd95edbf), 
		.K0_C3_W0(32'h3d42f886), .K0_C3_W1(32'hbc8280de), .K0_C3_W2(32'h3d8ecc3d), .K0_C3_W3(32'hbbe2786e), .K0_C3_W4(32'h3d92ed91), .K0_C3_W5(32'hbd4ba88b), .K0_C3_W6(32'hbdd89e26), .K0_C3_W7(32'hbd9fc999), .K0_C3_W8(32'h3d256cfc), 
		.K0_C4_W0(32'hbe19bfab), .K0_C4_W1(32'hbdccb794), .K0_C4_W2(32'h3d3e1aa0), .K0_C4_W3(32'h3d6a27b5), .K0_C4_W4(32'hbdcd3550), .K0_C4_W5(32'hbe161eb7), .K0_C4_W6(32'hbda7863b), .K0_C4_W7(32'h3df52a5a), .K0_C4_W8(32'hbe01ab30), 
		.K0_C5_W0(32'h3d962341), .K0_C5_W1(32'hbd0d1d29), .K0_C5_W2(32'hbe1f1ed4), .K0_C5_W3(32'h3dc7620b), .K0_C5_W4(32'h3dc80785), .K0_C5_W5(32'h3db5cd57), .K0_C5_W6(32'h3b63833a), .K0_C5_W7(32'hbdd52638), .K0_C5_W8(32'h3b9ef94c), 
		.K0_C6_W0(32'hbdfe2f5e), .K0_C6_W1(32'hbbe1852c), .K0_C6_W2(32'hbc787490), .K0_C6_W3(32'h3c470016), .K0_C6_W4(32'hbcde98f0), .K0_C6_W5(32'h3de77a84), .K0_C6_W6(32'h3c6137ae), .K0_C6_W7(32'hbde03815), .K0_C6_W8(32'h3d10025f), 
		.K0_C7_W0(32'hbdaf0247), .K0_C7_W1(32'h3d8238a6), .K0_C7_W2(32'hbd96332c), .K0_C7_W3(32'hbd93bbe7), .K0_C7_W4(32'hbc498505), .K0_C7_W5(32'hbd116102), .K0_C7_W6(32'hbd464ab8), .K0_C7_W7(32'hbc20fd8d), .K0_C7_W8(32'hbd179e67), 
		.K0_C8_W0(32'hbca24056), .K0_C8_W1(32'hbd7dd687), .K0_C8_W2(32'h3e146d68), .K0_C8_W3(32'hbd9698ad), .K0_C8_W4(32'hbcbe30a9), .K0_C8_W5(32'h3d31568b), .K0_C8_W6(32'h3cf8054f), .K0_C8_W7(32'h3cdbed45), .K0_C8_W8(32'h3cf91695), 
		.K0_C9_W0(32'hbe0b96bd), .K0_C9_W1(32'h3d4496cb), .K0_C9_W2(32'hbdddce16), .K0_C9_W3(32'h3e2a73a6), .K0_C9_W4(32'hbb85e0ec), .K0_C9_W5(32'h3df22a04), .K0_C9_W6(32'h3e1521df), .K0_C9_W7(32'hbd51ac5d), .K0_C9_W8(32'h3ddbc710), 
		.K0_C10_W0(32'h3de9442b), .K0_C10_W1(32'hbd517117), .K0_C10_W2(32'h3d7bfb69), .K0_C10_W3(32'h3d16f8ff), .K0_C10_W4(32'hbe0a6b62), .K0_C10_W5(32'hbe13bf8f), .K0_C10_W6(32'hbdca0a51), .K0_C10_W7(32'h3ddc6061), .K0_C10_W8(32'h3cbab08e), 
		.K0_C11_W0(32'h3c2e4499), .K0_C11_W1(32'h3d3a439e), .K0_C11_W2(32'hbd3e2017), .K0_C11_W3(32'h3cf9ca0e), .K0_C11_W4(32'h3cc361f8), .K0_C11_W5(32'hba3f97e9), .K0_C11_W6(32'h3c70a499), .K0_C11_W7(32'hbdd98897), .K0_C11_W8(32'hbde8a2cf), 
		.K0_C12_W0(32'hbdabd44f), .K0_C12_W1(32'hbe1832be), .K0_C12_W2(32'hbd757ffe), .K0_C12_W3(32'hbdb530a8), .K0_C12_W4(32'h3c0ccd92), .K0_C12_W5(32'hbddd947d), .K0_C12_W6(32'h3c27ff3c), .K0_C12_W7(32'h3ccd3f04), .K0_C12_W8(32'hbc844491), 
		.K0_C13_W0(32'h3d1cb6cb), .K0_C13_W1(32'hbdc70f19), .K0_C13_W2(32'hbcb6976a), .K0_C13_W3(32'h3e128591), .K0_C13_W4(32'hbd422a22), .K0_C13_W5(32'hbdb85d37), .K0_C13_W6(32'h3e2c0338), .K0_C13_W7(32'h3d8bcde3), .K0_C13_W8(32'hbd9937b4), 
		.K0_C14_W0(32'hbd874e0f), .K0_C14_W1(32'hbe13fdf3), .K0_C14_W2(32'hbd5253c2), .K0_C14_W3(32'hbdf82150), .K0_C14_W4(32'hbd5b45a4), .K0_C14_W5(32'hbe1b7278), .K0_C14_W6(32'h3c08bd13), .K0_C14_W7(32'hbe00594c), .K0_C14_W8(32'hbe05c54c), 
		.K0_C15_W0(32'hbd7282e6), .K0_C15_W1(32'h3d24c317), .K0_C15_W2(32'hbd0d4429), .K0_C15_W3(32'h3dfbf347), .K0_C15_W4(32'h3cbe1835), .K0_C15_W5(32'hbde782dd), .K0_C15_W6(32'h3dcd4e5c), .K0_C15_W7(32'hbe064cf8), .K0_C15_W8(32'h3df43b8d), 
		.K0_BIAS (32'h3d1f9130),

		.K1_C0_W0(32'hbc3f913a), .K1_C0_W1(32'hbcca3705), .K1_C0_W2(32'hbcc712ad), .K1_C0_W3(32'hbd3892b9), .K1_C0_W4(32'h3b16dc3a), .K1_C0_W5(32'h3d39a07d), .K1_C0_W6(32'hbda38bd8), .K1_C0_W7(32'hbdd7b778), .K1_C0_W8(32'h3dbf4e2f), 
		.K1_C1_W0(32'h3e0abffa), .K1_C1_W1(32'h3b72ebc2), .K1_C1_W2(32'h3dfea044), .K1_C1_W3(32'h3e18ff72), .K1_C1_W4(32'hbd8ed635), .K1_C1_W5(32'h3db6c59d), .K1_C1_W6(32'h3e07538f), .K1_C1_W7(32'hbcbfd6de), .K1_C1_W8(32'hbd98258d), 
		.K1_C2_W0(32'h3deface8), .K1_C2_W1(32'hbb95500e), .K1_C2_W2(32'h3d6f00f9), .K1_C2_W3(32'h3dfa25d5), .K1_C2_W4(32'h3d8206db), .K1_C2_W5(32'hbd29c32f), .K1_C2_W6(32'h3e0e13ec), .K1_C2_W7(32'hbd759811), .K1_C2_W8(32'h3bcd871d), 
		.K1_C3_W0(32'hbda47039), .K1_C3_W1(32'hbcaa1e87), .K1_C3_W2(32'h3d2c4ab9), .K1_C3_W3(32'hbddb1857), .K1_C3_W4(32'hbd427db1), .K1_C3_W5(32'h3d9c34bc), .K1_C3_W6(32'hbe28384c), .K1_C3_W7(32'h3dbd06c3), .K1_C3_W8(32'hbd88d465), 
		.K1_C4_W0(32'h3d7dcd03), .K1_C4_W1(32'hbda16106), .K1_C4_W2(32'h3c11b698), .K1_C4_W3(32'h3cb9a376), .K1_C4_W4(32'hbd8aeafd), .K1_C4_W5(32'hbd84e1ba), .K1_C4_W6(32'h3e1779ee), .K1_C4_W7(32'hbd9d6947), .K1_C4_W8(32'h3e2a70f9), 
		.K1_C5_W0(32'h3e137a1d), .K1_C5_W1(32'hbdb6aae1), .K1_C5_W2(32'h3cbd752d), .K1_C5_W3(32'hbca286a0), .K1_C5_W4(32'h3d46fcf3), .K1_C5_W5(32'h3e3a93a2), .K1_C5_W6(32'hbd7bdd8d), .K1_C5_W7(32'h3d43c0e2), .K1_C5_W8(32'h3deb3084), 
		.K1_C6_W0(32'hbd97aeed), .K1_C6_W1(32'h3d38ad1f), .K1_C6_W2(32'h3da57d02), .K1_C6_W3(32'hbe17d6df), .K1_C6_W4(32'hbd9c50ab), .K1_C6_W5(32'h3d9fad5b), .K1_C6_W6(32'h3c3c983f), .K1_C6_W7(32'hbdbdba67), .K1_C6_W8(32'h3d0eabe4), 
		.K1_C7_W0(32'h3d92cc94), .K1_C7_W1(32'h3dcac556), .K1_C7_W2(32'hbdb34058), .K1_C7_W3(32'h3df01627), .K1_C7_W4(32'h3e22fb75), .K1_C7_W5(32'h3dbb4d13), .K1_C7_W6(32'h3dabd6bf), .K1_C7_W7(32'h3d84cfe6), .K1_C7_W8(32'h3ced07d0), 
		.K1_C8_W0(32'h3dd7da32), .K1_C8_W1(32'hbd59648b), .K1_C8_W2(32'h3d987477), .K1_C8_W3(32'hbd23e822), .K1_C8_W4(32'hbd2d52c7), .K1_C8_W5(32'hbe335a2e), .K1_C8_W6(32'hbdf7bf7a), .K1_C8_W7(32'hbe20d055), .K1_C8_W8(32'hbdc267d7), 
		.K1_C9_W0(32'hbbbdcd2d), .K1_C9_W1(32'hbce3af9c), .K1_C9_W2(32'hbd7e05ad), .K1_C9_W3(32'hbd1e53d0), .K1_C9_W4(32'h3d07cb8f), .K1_C9_W5(32'h3dffb331), .K1_C9_W6(32'h3df84410), .K1_C9_W7(32'h3dc07aa8), .K1_C9_W8(32'h3df12279), 
		.K1_C10_W0(32'h3df354ee), .K1_C10_W1(32'h3b8e1f26), .K1_C10_W2(32'h3c5c9f53), .K1_C10_W3(32'h3e123eed), .K1_C10_W4(32'h3db431b1), .K1_C10_W5(32'h3db83640), .K1_C10_W6(32'hbd2b4d0e), .K1_C10_W7(32'hbdda4363), .K1_C10_W8(32'h3d1849c1), 
		.K1_C11_W0(32'h3d36b824), .K1_C11_W1(32'h3d74e314), .K1_C11_W2(32'h3de2496c), .K1_C11_W3(32'hbccb11ff), .K1_C11_W4(32'h3d047372), .K1_C11_W5(32'hbd34bafd), .K1_C11_W6(32'h3cca62e4), .K1_C11_W7(32'h3dd0e7ac), .K1_C11_W8(32'hbd9f7fa4), 
		.K1_C12_W0(32'h3de2b42a), .K1_C12_W1(32'hbcd721bd), .K1_C12_W2(32'hbd80ac5f), .K1_C12_W3(32'hbd486835), .K1_C12_W4(32'hbca2338e), .K1_C12_W5(32'h3c469e40), .K1_C12_W6(32'h3d80c62b), .K1_C12_W7(32'h3d9ec17c), .K1_C12_W8(32'h3e12356b), 
		.K1_C13_W0(32'h3b8d8d4e), .K1_C13_W1(32'h3e1c0981), .K1_C13_W2(32'hbde285b1), .K1_C13_W3(32'h3d199aaa), .K1_C13_W4(32'h3e082d09), .K1_C13_W5(32'hbdc19adc), .K1_C13_W6(32'hbbb0203a), .K1_C13_W7(32'hbd662189), .K1_C13_W8(32'h3e222440), 
		.K1_C14_W0(32'h3da8ecf5), .K1_C14_W1(32'hbda360ab), .K1_C14_W2(32'h3d6be8a0), .K1_C14_W3(32'hbd297335), .K1_C14_W4(32'hbe0f54ef), .K1_C14_W5(32'h3d3786f7), .K1_C14_W6(32'h3e1837df), .K1_C14_W7(32'h3d8ca7de), .K1_C14_W8(32'hbd68054c), 
		.K1_C15_W0(32'h3dd174aa), .K1_C15_W1(32'h3d9e66c2), .K1_C15_W2(32'h3cdcce44), .K1_C15_W3(32'hbde5ea63), .K1_C15_W4(32'h3cebd381), .K1_C15_W5(32'hbdb75166), .K1_C15_W6(32'h3d0aa3e4), .K1_C15_W7(32'hbd96be96), .K1_C15_W8(32'hbd7355b9), 
		.K1_BIAS (32'h3c0a67a0),

		.K2_C0_W0(32'hbde2fb3e), .K2_C0_W1(32'h3dbc88d3), .K2_C0_W2(32'hbb922b77), .K2_C0_W3(32'h3e08be83), .K2_C0_W4(32'hbd941b29), .K2_C0_W5(32'h3d9e2083), .K2_C0_W6(32'h3cfa5894), .K2_C0_W7(32'h3c99c004), .K2_C0_W8(32'hbe01fc9e), 
		.K2_C1_W0(32'hbd925013), .K2_C1_W1(32'h3d2c4e31), .K2_C1_W2(32'h3c28d260), .K2_C1_W3(32'h3e1274ca), .K2_C1_W4(32'hbd86afdb), .K2_C1_W5(32'hbddcb834), .K2_C1_W6(32'h3d430935), .K2_C1_W7(32'hbc1a170f), .K2_C1_W8(32'hbbc372f1), 
		.K2_C2_W0(32'h3dc8df01), .K2_C2_W1(32'hbdb839ae), .K2_C2_W2(32'hbd9b4400), .K2_C2_W3(32'h3dea9bed), .K2_C2_W4(32'hbd13bb3a), .K2_C2_W5(32'hbd865802), .K2_C2_W6(32'h3d44ab2f), .K2_C2_W7(32'hbb9cb1f9), .K2_C2_W8(32'hbd53f2b1), 
		.K2_C3_W0(32'h3dc61274), .K2_C3_W1(32'h3c27e5c6), .K2_C3_W2(32'hbd9e7983), .K2_C3_W3(32'hbda07718), .K2_C3_W4(32'hbd7d4709), .K2_C3_W5(32'h3dc09d32), .K2_C3_W6(32'hbb4eb929), .K2_C3_W7(32'hbd2114bb), .K2_C3_W8(32'hbd99b3b7), 
		.K2_C4_W0(32'hbda9e036), .K2_C4_W1(32'h3d22196a), .K2_C4_W2(32'hbd56cf1c), .K2_C4_W3(32'hbc832cf3), .K2_C4_W4(32'h3d6764ab), .K2_C4_W5(32'h3e05af06), .K2_C4_W6(32'h3db81730), .K2_C4_W7(32'hbcdcf5ff), .K2_C4_W8(32'h3cfa7231), 
		.K2_C5_W0(32'h3ddffc82), .K2_C5_W1(32'hbdcc1756), .K2_C5_W2(32'hbdcf564b), .K2_C5_W3(32'h3d15efb2), .K2_C5_W4(32'hbda2890f), .K2_C5_W5(32'h3d854b61), .K2_C5_W6(32'hbb86a3b2), .K2_C5_W7(32'hbddf7771), .K2_C5_W8(32'hbd397cfd), 
		.K2_C6_W0(32'hbdb16fb5), .K2_C6_W1(32'h3c77be9b), .K2_C6_W2(32'h3dbe88f7), .K2_C6_W3(32'hbcee14ea), .K2_C6_W4(32'hbdcf3989), .K2_C6_W5(32'h3dfee5eb), .K2_C6_W6(32'hbd71b3d3), .K2_C6_W7(32'hbdb120c8), .K2_C6_W8(32'h3e0e393f), 
		.K2_C7_W0(32'h3c3ccc52), .K2_C7_W1(32'hbde5e489), .K2_C7_W2(32'hbdff11ee), .K2_C7_W3(32'hbd7909ce), .K2_C7_W4(32'hbded2c17), .K2_C7_W5(32'hbda559c3), .K2_C7_W6(32'hbe06a236), .K2_C7_W7(32'h3dec0356), .K2_C7_W8(32'h3d36fcf7), 
		.K2_C8_W0(32'h3d6e70ee), .K2_C8_W1(32'hbce4e2aa), .K2_C8_W2(32'hbd393732), .K2_C8_W3(32'h3da14cdd), .K2_C8_W4(32'h3d11558d), .K2_C8_W5(32'hbd1de2e6), .K2_C8_W6(32'h3e0fe63a), .K2_C8_W7(32'h3d5be307), .K2_C8_W8(32'hbdafff25), 
		.K2_C9_W0(32'hbd83e30b), .K2_C9_W1(32'h3ce18d51), .K2_C9_W2(32'hbd66d619), .K2_C9_W3(32'hbe1e9477), .K2_C9_W4(32'h3de17a5e), .K2_C9_W5(32'hbddb19c1), .K2_C9_W6(32'hbe212afc), .K2_C9_W7(32'hbcf97a08), .K2_C9_W8(32'h3db65834), 
		.K2_C10_W0(32'h3d42f26a), .K2_C10_W1(32'h3db03d56), .K2_C10_W2(32'hbd5d1b4a), .K2_C10_W3(32'h3dadb8e9), .K2_C10_W4(32'hbaa1f81b), .K2_C10_W5(32'h3e108de8), .K2_C10_W6(32'h3d71cb37), .K2_C10_W7(32'hbd5195fc), .K2_C10_W8(32'hbdf65716), 
		.K2_C11_W0(32'hbdd2c613), .K2_C11_W1(32'h3dddfadf), .K2_C11_W2(32'h3dd741fb), .K2_C11_W3(32'hbd3bc815), .K2_C11_W4(32'h3d2f4272), .K2_C11_W5(32'h3e04cd44), .K2_C11_W6(32'hbd8eab33), .K2_C11_W7(32'h3d8e325a), .K2_C11_W8(32'h3cc866f4), 
		.K2_C12_W0(32'h3cbcfe9f), .K2_C12_W1(32'hbd8b62d6), .K2_C12_W2(32'hbdcb7009), .K2_C12_W3(32'h3e009f34), .K2_C12_W4(32'hbd89cd7a), .K2_C12_W5(32'hbd8761ca), .K2_C12_W6(32'hbd25926b), .K2_C12_W7(32'h3dbec5b7), .K2_C12_W8(32'hbdc0145a), 
		.K2_C13_W0(32'h3e0c05fc), .K2_C13_W1(32'hbdb71401), .K2_C13_W2(32'h3dbfbbe8), .K2_C13_W3(32'h3db6b206), .K2_C13_W4(32'hbd336965), .K2_C13_W5(32'hbd4b4d89), .K2_C13_W6(32'hbe2603d0), .K2_C13_W7(32'hbe23a19a), .K2_C13_W8(32'hbae3400b), 
		.K2_C14_W0(32'hbd81c29e), .K2_C14_W1(32'h3c88ea94), .K2_C14_W2(32'h3de23cd9), .K2_C14_W3(32'hbdceec2a), .K2_C14_W4(32'hbdd087ca), .K2_C14_W5(32'h3d07f61a), .K2_C14_W6(32'h3de289ae), .K2_C14_W7(32'h3d105b84), .K2_C14_W8(32'h3e1ad24f), 
		.K2_C15_W0(32'hbe1ab88c), .K2_C15_W1(32'h3db9eac3), .K2_C15_W2(32'h3ccb8228), .K2_C15_W3(32'hbd90b9fe), .K2_C15_W4(32'hbda9a52e), .K2_C15_W5(32'h3ce56994), .K2_C15_W6(32'hbdac3d6a), .K2_C15_W7(32'hbd7a3d32), .K2_C15_W8(32'h3df534b6), 
		.K2_BIAS (32'h3bb6f9be),

		.K3_C0_W0(32'hbdb1a845), .K3_C0_W1(32'hbc882034), .K3_C0_W2(32'h3dd7caee), .K3_C0_W3(32'hbca230af), .K3_C0_W4(32'h3e19c5e1), .K3_C0_W5(32'h3e09c2f8), .K3_C0_W6(32'h3e30e805), .K3_C0_W7(32'h3e1062c6), .K3_C0_W8(32'h3d77def7), 
		.K3_C1_W0(32'h3cae7df8), .K3_C1_W1(32'h3bd9e45f), .K3_C1_W2(32'h3cc77926), .K3_C1_W3(32'h3d590c6d), .K3_C1_W4(32'hbd132969), .K3_C1_W5(32'hba87cc56), .K3_C1_W6(32'hbdf3b77c), .K3_C1_W7(32'h3d652564), .K3_C1_W8(32'h3decc70c), 
		.K3_C2_W0(32'hbe14811b), .K3_C2_W1(32'h3dd12c88), .K3_C2_W2(32'hbdd56108), .K3_C2_W3(32'hbdf06532), .K3_C2_W4(32'hbd44816b), .K3_C2_W5(32'h3db71dac), .K3_C2_W6(32'hbdf8f1f7), .K3_C2_W7(32'hbc8c11a6), .K3_C2_W8(32'hbda7bbc2), 
		.K3_C3_W0(32'h3dc7236c), .K3_C3_W1(32'hbca678c1), .K3_C3_W2(32'h3e03fb8a), .K3_C3_W3(32'hbdf3a795), .K3_C3_W4(32'h3b4c3505), .K3_C3_W5(32'hbd0bc072), .K3_C3_W6(32'h3c510a28), .K3_C3_W7(32'h3d3016c1), .K3_C3_W8(32'h3d016188), 
		.K3_C4_W0(32'hbd5f9afe), .K3_C4_W1(32'h3d88625b), .K3_C4_W2(32'h3dbc4702), .K3_C4_W3(32'h3dcdd31f), .K3_C4_W4(32'h3d809ce2), .K3_C4_W5(32'hbd33616d), .K3_C4_W6(32'h3cfc9aec), .K3_C4_W7(32'h3e148018), .K3_C4_W8(32'h3df032c6), 
		.K3_C5_W0(32'hbd96e114), .K3_C5_W1(32'h3d54b92e), .K3_C5_W2(32'hbd890eb3), .K3_C5_W3(32'h3dd696d0), .K3_C5_W4(32'hbdbe98d4), .K3_C5_W5(32'hbe1031bf), .K3_C5_W6(32'hbd2b2d35), .K3_C5_W7(32'hbd894a89), .K3_C5_W8(32'hbcbdaa55), 
		.K3_C6_W0(32'h3e0a9f28), .K3_C6_W1(32'h3e0a1a05), .K3_C6_W2(32'hbd301d17), .K3_C6_W3(32'hbe3a3ba7), .K3_C6_W4(32'hbd326af8), .K3_C6_W5(32'h3c3f5dcc), .K3_C6_W6(32'hbde744dc), .K3_C6_W7(32'h3d5dd969), .K3_C6_W8(32'hbe06261c), 
		.K3_C7_W0(32'hbd397409), .K3_C7_W1(32'hbce17b64), .K3_C7_W2(32'h3cc593c7), .K3_C7_W3(32'hbc8ec8c1), .K3_C7_W4(32'h3dccd4e1), .K3_C7_W5(32'h3d880669), .K3_C7_W6(32'hbd3aaad4), .K3_C7_W7(32'h3c3bfd24), .K3_C7_W8(32'h3d328ddd), 
		.K3_C8_W0(32'hbe110f3e), .K3_C8_W1(32'hbbacd4c1), .K3_C8_W2(32'hbcd67162), .K3_C8_W3(32'hbd2bae04), .K3_C8_W4(32'hbb8f3617), .K3_C8_W5(32'h3de2f4fc), .K3_C8_W6(32'hbdba19ef), .K3_C8_W7(32'hbd1e37d7), .K3_C8_W8(32'hbdd2d2e0), 
		.K3_C9_W0(32'h3c8b505d), .K3_C9_W1(32'h3dfb678a), .K3_C9_W2(32'h3c5b9a2c), .K3_C9_W3(32'hbde92ac4), .K3_C9_W4(32'hbe07dde8), .K3_C9_W5(32'hbca54ae6), .K3_C9_W6(32'hbd3de232), .K3_C9_W7(32'hbdb4276f), .K3_C9_W8(32'h3dec841b), 
		.K3_C10_W0(32'hbde443fd), .K3_C10_W1(32'hbdfea480), .K3_C10_W2(32'h3dd9d3be), .K3_C10_W3(32'h3d326b45), .K3_C10_W4(32'h3d31f52b), .K3_C10_W5(32'h3db11f09), .K3_C10_W6(32'h3c56e2e5), .K3_C10_W7(32'hbd4ca9f6), .K3_C10_W8(32'hbd07c4e4), 
		.K3_C11_W0(32'hbe0e5a1f), .K3_C11_W1(32'h3d6a9c5b), .K3_C11_W2(32'hbdf88461), .K3_C11_W3(32'h3df2ecc6), .K3_C11_W4(32'hbcce8a29), .K3_C11_W5(32'hbbd5e344), .K3_C11_W6(32'h3d509c1f), .K3_C11_W7(32'h3ad0445c), .K3_C11_W8(32'h3c6f6db4), 
		.K3_C12_W0(32'h3d792692), .K3_C12_W1(32'hbbd66923), .K3_C12_W2(32'h3dc7c733), .K3_C12_W3(32'h3c49db85), .K3_C12_W4(32'hbe11cc45), .K3_C12_W5(32'h3cd87f51), .K3_C12_W6(32'h3d42a07c), .K3_C12_W7(32'h3d3c87a0), .K3_C12_W8(32'hbda4a69e), 
		.K3_C13_W0(32'hbbc334e7), .K3_C13_W1(32'hbdf16c1d), .K3_C13_W2(32'h3dec4ca6), .K3_C13_W3(32'h3e411b97), .K3_C13_W4(32'hbd2e65c6), .K3_C13_W5(32'h3b8bd7f5), .K3_C13_W6(32'h3ddb63f3), .K3_C13_W7(32'h3db2f475), .K3_C13_W8(32'h3e11d7d5), 
		.K3_C14_W0(32'h3df25f52), .K3_C14_W1(32'h3de27d0e), .K3_C14_W2(32'h3ca42a45), .K3_C14_W3(32'hbdb7211f), .K3_C14_W4(32'hbdfaf661), .K3_C14_W5(32'h3e0756ca), .K3_C14_W6(32'h3e1b1c25), .K3_C14_W7(32'hbc0ff0e3), .K3_C14_W8(32'hbdc82a4e), 
		.K3_C15_W0(32'hbe4dcd34), .K3_C15_W1(32'hbdbcdda6), .K3_C15_W2(32'hbccabda9), .K3_C15_W3(32'hbcac0874), .K3_C15_W4(32'hbe11face), .K3_C15_W5(32'h3c126d48), .K3_C15_W6(32'hbd499e27), .K3_C15_W7(32'h3d4211af), .K3_C15_W8(32'hbe0ee97d), 
		.K3_BIAS (32'h3cf1e7bb),

		.K4_C0_W0(32'h3ce7e593), .K4_C0_W1(32'hbd6c5e85), .K4_C0_W2(32'hbd9dc2cb), .K4_C0_W3(32'h3ddfa7e9), .K4_C0_W4(32'h3de04746), .K4_C0_W5(32'hbd33a9f0), .K4_C0_W6(32'h3d0436b7), .K4_C0_W7(32'hbdc3e17a), .K4_C0_W8(32'h3d2d3f8b), 
		.K4_C1_W0(32'hbdc1fd6d), .K4_C1_W1(32'hbda82a38), .K4_C1_W2(32'h3afa5dde), .K4_C1_W3(32'h3c3516b0), .K4_C1_W4(32'hbd0d93fa), .K4_C1_W5(32'hbe0faab4), .K4_C1_W6(32'h3dae99b9), .K4_C1_W7(32'hbc28f0fb), .K4_C1_W8(32'hbda62a65), 
		.K4_C2_W0(32'hbd14b6d3), .K4_C2_W1(32'hbe06a6f3), .K4_C2_W2(32'hbc9e9679), .K4_C2_W3(32'hbe29548a), .K4_C2_W4(32'h3d9b32d6), .K4_C2_W5(32'h3cbec723), .K4_C2_W6(32'h3dc8a60b), .K4_C2_W7(32'h3d3f55b2), .K4_C2_W8(32'hbd0876b3), 
		.K4_C3_W0(32'hbcb6e5b8), .K4_C3_W1(32'h3d4e1d11), .K4_C3_W2(32'hbd8906be), .K4_C3_W3(32'hbe29a530), .K4_C3_W4(32'hbde3c274), .K4_C3_W5(32'hbd562a58), .K4_C3_W6(32'hbd15ee4a), .K4_C3_W7(32'h3ce60be9), .K4_C3_W8(32'h3d1021e3), 
		.K4_C4_W0(32'hbdacce25), .K4_C4_W1(32'hbdeb2080), .K4_C4_W2(32'h3bdfc4a2), .K4_C4_W3(32'h3e2bd93d), .K4_C4_W4(32'h3ca5252f), .K4_C4_W5(32'hbdc7526c), .K4_C4_W6(32'hbd6c605f), .K4_C4_W7(32'h3daae1a2), .K4_C4_W8(32'hbbfbb6e4), 
		.K4_C5_W0(32'h3d82a20a), .K4_C5_W1(32'h3e0579e4), .K4_C5_W2(32'hbdc59e00), .K4_C5_W3(32'hbe13bbbe), .K4_C5_W4(32'hbc475c1d), .K4_C5_W5(32'h3dd6b23f), .K4_C5_W6(32'hbb2f5cd2), .K4_C5_W7(32'h3d4daa95), .K4_C5_W8(32'h3cd3460c), 
		.K4_C6_W0(32'h3ded104f), .K4_C6_W1(32'h3b90771a), .K4_C6_W2(32'hbdc9dde8), .K4_C6_W3(32'hbdb2f167), .K4_C6_W4(32'h3d445e8d), .K4_C6_W5(32'hbdee3994), .K4_C6_W6(32'hbc7d80af), .K4_C6_W7(32'hbdaff768), .K4_C6_W8(32'h3d21570e), 
		.K4_C7_W0(32'h3df17767), .K4_C7_W1(32'hbd07add9), .K4_C7_W2(32'hbe16ca40), .K4_C7_W3(32'h3d581921), .K4_C7_W4(32'hbe218891), .K4_C7_W5(32'hbe0451d0), .K4_C7_W6(32'h3e0011af), .K4_C7_W7(32'h3d99ce4d), .K4_C7_W8(32'hbd076f15), 
		.K4_C8_W0(32'h3d5ff3bc), .K4_C8_W1(32'hba86f81b), .K4_C8_W2(32'h3ca6a695), .K4_C8_W3(32'h3d9c320a), .K4_C8_W4(32'h3df03b25), .K4_C8_W5(32'h3e02086e), .K4_C8_W6(32'h3c992e72), .K4_C8_W7(32'h3d9091d5), .K4_C8_W8(32'h3da2ced6), 
		.K4_C9_W0(32'h3c8d001f), .K4_C9_W1(32'h3e25fae1), .K4_C9_W2(32'hbcd78bda), .K4_C9_W3(32'h3d6c5723), .K4_C9_W4(32'h3dc01c98), .K4_C9_W5(32'hbd9c4923), .K4_C9_W6(32'h3dc7fda5), .K4_C9_W7(32'hbd9bf777), .K4_C9_W8(32'hbe0079b3), 
		.K4_C10_W0(32'h3d88d552), .K4_C10_W1(32'h3d5a05ba), .K4_C10_W2(32'hbd4f368f), .K4_C10_W3(32'hbe14bc55), .K4_C10_W4(32'hbe1abe01), .K4_C10_W5(32'h3dae144f), .K4_C10_W6(32'h3e2a7cf5), .K4_C10_W7(32'hbc7f80bb), .K4_C10_W8(32'h3e01a981), 
		.K4_C11_W0(32'h3cc9ccb3), .K4_C11_W1(32'hbd9391af), .K4_C11_W2(32'h3ac00471), .K4_C11_W3(32'hbe0ec218), .K4_C11_W4(32'h3dbc75a7), .K4_C11_W5(32'hbe014438), .K4_C11_W6(32'hbd715387), .K4_C11_W7(32'h3e15436f), .K4_C11_W8(32'h3e129f4f), 
		.K4_C12_W0(32'hbdcb17c0), .K4_C12_W1(32'h3d3fa84f), .K4_C12_W2(32'hbd5392c5), .K4_C12_W3(32'hbd32bbfc), .K4_C12_W4(32'hbd502271), .K4_C12_W5(32'h3db6b1c3), .K4_C12_W6(32'hbd93f893), .K4_C12_W7(32'h3d664c55), .K4_C12_W8(32'hbcbc34da), 
		.K4_C13_W0(32'hbd63ac45), .K4_C13_W1(32'hbdfe9351), .K4_C13_W2(32'h3cb4985e), .K4_C13_W3(32'h3dd3b801), .K4_C13_W4(32'hbddd65dc), .K4_C13_W5(32'hbdde5d0a), .K4_C13_W6(32'hbd6e701e), .K4_C13_W7(32'h3cf628dd), .K4_C13_W8(32'hbde333e3), 
		.K4_C14_W0(32'h3d88a794), .K4_C14_W1(32'h3d5cc404), .K4_C14_W2(32'hbd376a3a), .K4_C14_W3(32'hbdf656c1), .K4_C14_W4(32'hbd3ca266), .K4_C14_W5(32'hbc972b86), .K4_C14_W6(32'hbdd95e6c), .K4_C14_W7(32'hbd32edf9), .K4_C14_W8(32'hbdb12e3c), 
		.K4_C15_W0(32'hbd07cbd3), .K4_C15_W1(32'h3dfb7542), .K4_C15_W2(32'h3dba6f65), .K4_C15_W3(32'h3cca82e5), .K4_C15_W4(32'h3dc77f97), .K4_C15_W5(32'h3e07cc66), .K4_C15_W6(32'hbd8db882), .K4_C15_W7(32'hbd1f8f85), .K4_C15_W8(32'h3dc7a365), 
		.K4_BIAS (32'h3d0bb565),

		.K5_C0_W0(32'hbcd4d670), .K5_C0_W1(32'hbca733f9), .K5_C0_W2(32'h3dd21987), .K5_C0_W3(32'h3ca295dc), .K5_C0_W4(32'h3e2152ad), .K5_C0_W5(32'h3d990668), .K5_C0_W6(32'h3c5c7783), .K5_C0_W7(32'h3d923fc5), .K5_C0_W8(32'hbb8ab223), 
		.K5_C1_W0(32'h3d038300), .K5_C1_W1(32'hbe013724), .K5_C1_W2(32'hbdf2619a), .K5_C1_W3(32'hbda92110), .K5_C1_W4(32'hbd19078c), .K5_C1_W5(32'hbdbf0ef1), .K5_C1_W6(32'hbe0cdb9a), .K5_C1_W7(32'hbd63fb29), .K5_C1_W8(32'h3d3ce419), 
		.K5_C2_W0(32'hbdb25f9c), .K5_C2_W1(32'h3dc55cd6), .K5_C2_W2(32'hbd1f4d6b), .K5_C2_W3(32'hbe07af62), .K5_C2_W4(32'h3d536414), .K5_C2_W5(32'hbd8bbd79), .K5_C2_W6(32'h3e05a12d), .K5_C2_W7(32'hbe02313f), .K5_C2_W8(32'h3cf147cf), 
		.K5_C3_W0(32'hbcdb9be4), .K5_C3_W1(32'h3dd7796c), .K5_C3_W2(32'hbe185f43), .K5_C3_W3(32'hbdb11456), .K5_C3_W4(32'h3dba7da9), .K5_C3_W5(32'h3d2b7873), .K5_C3_W6(32'hbd4562b1), .K5_C3_W7(32'h3d4ecbaf), .K5_C3_W8(32'hbe113863), 
		.K5_C4_W0(32'h3d40f2f4), .K5_C4_W1(32'hbd4bb08f), .K5_C4_W2(32'hbd842a9f), .K5_C4_W3(32'hbc09a606), .K5_C4_W4(32'h3cdcc5a8), .K5_C4_W5(32'h3d0300f7), .K5_C4_W6(32'h3d59ed98), .K5_C4_W7(32'hbba69239), .K5_C4_W8(32'h3e096602), 
		.K5_C5_W0(32'hbe1b48a1), .K5_C5_W1(32'hbb65b7f0), .K5_C5_W2(32'h3da06c09), .K5_C5_W3(32'hbe22165a), .K5_C5_W4(32'hbb1470f0), .K5_C5_W5(32'h3d375d8d), .K5_C5_W6(32'h3e14a1fe), .K5_C5_W7(32'h3be04926), .K5_C5_W8(32'hbb3590a5), 
		.K5_C6_W0(32'h3cc9324c), .K5_C6_W1(32'hbdae145c), .K5_C6_W2(32'hbd6905f8), .K5_C6_W3(32'h3d91f2f4), .K5_C6_W4(32'hbd5f0e8b), .K5_C6_W5(32'h3d5b483f), .K5_C6_W6(32'hbd2b5074), .K5_C6_W7(32'h3a30c7ca), .K5_C6_W8(32'hbb97778c), 
		.K5_C7_W0(32'hbcf35c6c), .K5_C7_W1(32'hbc51680f), .K5_C7_W2(32'h3d4ca4e6), .K5_C7_W3(32'h3dd4a7a9), .K5_C7_W4(32'hbddeb16a), .K5_C7_W5(32'hbab2086a), .K5_C7_W6(32'h3dcee96a), .K5_C7_W7(32'h3da14e05), .K5_C7_W8(32'hbd4f120e), 
		.K5_C8_W0(32'h3dbab65b), .K5_C8_W1(32'hbce53330), .K5_C8_W2(32'h3db0e823), .K5_C8_W3(32'h3d4eb43d), .K5_C8_W4(32'h3c0b0e3f), .K5_C8_W5(32'h3d386bf5), .K5_C8_W6(32'h3d9ff4f4), .K5_C8_W7(32'hbcfc547c), .K5_C8_W8(32'hbd0c388a), 
		.K5_C9_W0(32'hbdb8315b), .K5_C9_W1(32'hbd91ddac), .K5_C9_W2(32'hbdd2d7c2), .K5_C9_W3(32'h3d214e7a), .K5_C9_W4(32'hbdb89409), .K5_C9_W5(32'hbe1f2793), .K5_C9_W6(32'hbd57c6c1), .K5_C9_W7(32'hbc0cb252), .K5_C9_W8(32'h3e206a3f), 
		.K5_C10_W0(32'hbdb4de0a), .K5_C10_W1(32'hbda2fcad), .K5_C10_W2(32'h3e20a44d), .K5_C10_W3(32'hbda5bd1e), .K5_C10_W4(32'h3e0753fe), .K5_C10_W5(32'h3e08970a), .K5_C10_W6(32'hbc8bc505), .K5_C10_W7(32'hbbf4b3c6), .K5_C10_W8(32'hbd854a1a), 
		.K5_C11_W0(32'hbdcf614a), .K5_C11_W1(32'hbd2e4002), .K5_C11_W2(32'hbc248fbf), .K5_C11_W3(32'h3e05245a), .K5_C11_W4(32'h3e125c8e), .K5_C11_W5(32'hbdd5dd1e), .K5_C11_W6(32'h3dfbd86c), .K5_C11_W7(32'hbb908acc), .K5_C11_W8(32'hbde18159), 
		.K5_C12_W0(32'h3e2d4bf8), .K5_C12_W1(32'h3e0a1238), .K5_C12_W2(32'hbbbb750a), .K5_C12_W3(32'h3dee5982), .K5_C12_W4(32'h3d7d426c), .K5_C12_W5(32'hbe057aaf), .K5_C12_W6(32'h3b3f4cfb), .K5_C12_W7(32'h3d917512), .K5_C12_W8(32'hbda2c448), 
		.K5_C13_W0(32'h3d190e04), .K5_C13_W1(32'hbc7cd4cd), .K5_C13_W2(32'hbde14032), .K5_C13_W3(32'hbcdb9ae8), .K5_C13_W4(32'hbe40adc8), .K5_C13_W5(32'h3cf7b2e5), .K5_C13_W6(32'hbd1de366), .K5_C13_W7(32'h3da5baeb), .K5_C13_W8(32'h3e122d8d), 
		.K5_C14_W0(32'h3c83b7d2), .K5_C14_W1(32'h3ce5a47b), .K5_C14_W2(32'h3d9ba9f4), .K5_C14_W3(32'hbded9a1d), .K5_C14_W4(32'h3e05bec3), .K5_C14_W5(32'h3d0e08b5), .K5_C14_W6(32'h3d1bface), .K5_C14_W7(32'h3c62a677), .K5_C14_W8(32'hbe075c08), 
		.K5_C15_W0(32'h3d644d47), .K5_C15_W1(32'h3ca817ec), .K5_C15_W2(32'h3b2caec6), .K5_C15_W3(32'hbe0d9f82), .K5_C15_W4(32'h3d7fe009), .K5_C15_W5(32'hbd8afdec), .K5_C15_W6(32'hbe251771), .K5_C15_W7(32'h3d60983e), .K5_C15_W8(32'hbd106445), 
		.K5_BIAS (32'h3ce4caf4),

		.K6_C0_W0(32'h3d19d22e), .K6_C0_W1(32'hbc62af15), .K6_C0_W2(32'h3d65f44e), .K6_C0_W3(32'h3d08a573), .K6_C0_W4(32'h3bab2254), .K6_C0_W5(32'h3dbaa57d), .K6_C0_W6(32'h3de42379), .K6_C0_W7(32'h3da5117b), .K6_C0_W8(32'h3e02f78a), 
		.K6_C1_W0(32'hbdf8c588), .K6_C1_W1(32'h3db9c1f7), .K6_C1_W2(32'h3c852583), .K6_C1_W3(32'h3db35cfc), .K6_C1_W4(32'hbd5ddbbb), .K6_C1_W5(32'hbde5f5ee), .K6_C1_W6(32'h3daf172e), .K6_C1_W7(32'hbe017375), .K6_C1_W8(32'h3d053d5c), 
		.K6_C2_W0(32'h3dbc23cc), .K6_C2_W1(32'hbdbc71f0), .K6_C2_W2(32'h3cac81c0), .K6_C2_W3(32'hbe036580), .K6_C2_W4(32'hbe2a203b), .K6_C2_W5(32'hbdb0ef7e), .K6_C2_W6(32'h3ddce25e), .K6_C2_W7(32'h3da1bd22), .K6_C2_W8(32'h3d66fa93), 
		.K6_C3_W0(32'h3d5d801b), .K6_C3_W1(32'h3dde0e84), .K6_C3_W2(32'hbddd5f5f), .K6_C3_W3(32'hbe0684c8), .K6_C3_W4(32'h3dfac2a4), .K6_C3_W5(32'h3a5c5d14), .K6_C3_W6(32'hbdafdc17), .K6_C3_W7(32'hbe12d9f2), .K6_C3_W8(32'hbd37b007), 
		.K6_C4_W0(32'h3e2d4669), .K6_C4_W1(32'hbd1088a9), .K6_C4_W2(32'h3e281d4c), .K6_C4_W3(32'h3d53aff7), .K6_C4_W4(32'h3e2bc373), .K6_C4_W5(32'h3dd09754), .K6_C4_W6(32'hbdb101cb), .K6_C4_W7(32'h3df05cc5), .K6_C4_W8(32'h3d707b14), 
		.K6_C5_W0(32'hbd013ca7), .K6_C5_W1(32'h3c111d8d), .K6_C5_W2(32'hbda296ee), .K6_C5_W3(32'hbd183a1c), .K6_C5_W4(32'hbe0e744c), .K6_C5_W5(32'hbde7108a), .K6_C5_W6(32'hbdd9551d), .K6_C5_W7(32'h3d61838d), .K6_C5_W8(32'h3e0adeaf), 
		.K6_C6_W0(32'h3e11b449), .K6_C6_W1(32'h3d8a4fd3), .K6_C6_W2(32'hbd102ea1), .K6_C6_W3(32'h3c9df94b), .K6_C6_W4(32'hba84dcc6), .K6_C6_W5(32'h3d6ae203), .K6_C6_W6(32'h3d1c01eb), .K6_C6_W7(32'h3db9973f), .K6_C6_W8(32'hbdc86636), 
		.K6_C7_W0(32'h3d00ee1e), .K6_C7_W1(32'hbd80ea73), .K6_C7_W2(32'hbdcd1f97), .K6_C7_W3(32'hbd39b797), .K6_C7_W4(32'hbd3518f3), .K6_C7_W5(32'h3d158d2a), .K6_C7_W6(32'hbda2ac9b), .K6_C7_W7(32'hbd0ebed5), .K6_C7_W8(32'hbd8c2e17), 
		.K6_C8_W0(32'hbe533ff5), .K6_C8_W1(32'hbe48dc6c), .K6_C8_W2(32'hbe018252), .K6_C8_W3(32'h3b56bdc3), .K6_C8_W4(32'hbcbd286a), .K6_C8_W5(32'hbd9dba1a), .K6_C8_W6(32'h3df35d3e), .K6_C8_W7(32'hbdc45b65), .K6_C8_W8(32'hbd955604), 
		.K6_C9_W0(32'h3d9f9662), .K6_C9_W1(32'h3bfd830f), .K6_C9_W2(32'h3db00597), .K6_C9_W3(32'h3df6f986), .K6_C9_W4(32'h3e21ffec), .K6_C9_W5(32'h3e1acf64), .K6_C9_W6(32'hbd88169c), .K6_C9_W7(32'h3dd2752e), .K6_C9_W8(32'h3d9802b2), 
		.K6_C10_W0(32'h3de37d1a), .K6_C10_W1(32'h3dcc768f), .K6_C10_W2(32'hbe2d6a5f), .K6_C10_W3(32'hbdcfa32d), .K6_C10_W4(32'h3da8b119), .K6_C10_W5(32'hbc66a141), .K6_C10_W6(32'hbd599842), .K6_C10_W7(32'h3db9d191), .K6_C10_W8(32'h3da3f220), 
		.K6_C11_W0(32'hbd445087), .K6_C11_W1(32'h3c9d6dc5), .K6_C11_W2(32'h3d1e64cc), .K6_C11_W3(32'h3d266ed1), .K6_C11_W4(32'h3df54ec0), .K6_C11_W5(32'hbdba840f), .K6_C11_W6(32'hbde64b82), .K6_C11_W7(32'hbd3ffca0), .K6_C11_W8(32'h3db6b1bd), 
		.K6_C12_W0(32'h3cfa879a), .K6_C12_W1(32'h3d4f385b), .K6_C12_W2(32'hbd380510), .K6_C12_W3(32'hbd107153), .K6_C12_W4(32'h3dea6dca), .K6_C12_W5(32'hbe1339cf), .K6_C12_W6(32'h3d3d760a), .K6_C12_W7(32'h3dfad915), .K6_C12_W8(32'h3d52bc3d), 
		.K6_C13_W0(32'h3e314121), .K6_C13_W1(32'h3dc8b6cb), .K6_C13_W2(32'h3d3de626), .K6_C13_W3(32'h3d5d35b8), .K6_C13_W4(32'h3e155cba), .K6_C13_W5(32'h3d23e9b8), .K6_C13_W6(32'h3d82cf3c), .K6_C13_W7(32'hbe026130), .K6_C13_W8(32'hbd054400), 
		.K6_C14_W0(32'hbe1d51c1), .K6_C14_W1(32'h3cf188d1), .K6_C14_W2(32'hbcaf9909), .K6_C14_W3(32'h3d8da024), .K6_C14_W4(32'h3b788349), .K6_C14_W5(32'h3d928202), .K6_C14_W6(32'hbe00e46c), .K6_C14_W7(32'h3daca73e), .K6_C14_W8(32'h3d566e44), 
		.K6_C15_W0(32'h3c894c72), .K6_C15_W1(32'hbd9c01ac), .K6_C15_W2(32'hbdc03683), .K6_C15_W3(32'hbd732141), .K6_C15_W4(32'h3d410419), .K6_C15_W5(32'hbd82af68), .K6_C15_W6(32'hbd84301a), .K6_C15_W7(32'h3d5a172f), .K6_C15_W8(32'h3d736243), 
		.K6_BIAS (32'h3d86eb4b),

		.K7_C0_W0(32'h3cacbf35), .K7_C0_W1(32'hbe07d5c7), .K7_C0_W2(32'h3d659ec9), .K7_C0_W3(32'hbc8a181b), .K7_C0_W4(32'hbe0b7a11), .K7_C0_W5(32'hbdc814bc), .K7_C0_W6(32'hbe07cc9b), .K7_C0_W7(32'h3d55f059), .K7_C0_W8(32'h3bc5b2a2), 
		.K7_C1_W0(32'h3da241cc), .K7_C1_W1(32'hbd948f3c), .K7_C1_W2(32'h3e0913da), .K7_C1_W3(32'h3cb19644), .K7_C1_W4(32'h3da7d76a), .K7_C1_W5(32'h3b3cf176), .K7_C1_W6(32'h3bd60367), .K7_C1_W7(32'h3df2bdef), .K7_C1_W8(32'hbe193169), 
		.K7_C2_W0(32'hbdcb30b3), .K7_C2_W1(32'h3db90b36), .K7_C2_W2(32'hbe07de65), .K7_C2_W3(32'h3d4794a8), .K7_C2_W4(32'h3d1dbf3b), .K7_C2_W5(32'h3e0601c1), .K7_C2_W6(32'hbd7a93bc), .K7_C2_W7(32'hbdbeeecf), .K7_C2_W8(32'hbdfd2bdb), 
		.K7_C3_W0(32'hbe32de8a), .K7_C3_W1(32'h3e142b79), .K7_C3_W2(32'h3e07810a), .K7_C3_W3(32'hbe1b6e85), .K7_C3_W4(32'h3aa835a9), .K7_C3_W5(32'hbe28e55f), .K7_C3_W6(32'hbd50fc4d), .K7_C3_W7(32'hbced2066), .K7_C3_W8(32'h3e3414a6), 
		.K7_C4_W0(32'h3c22a998), .K7_C4_W1(32'hbccc100c), .K7_C4_W2(32'h3d6c7f6e), .K7_C4_W3(32'h3e00781a), .K7_C4_W4(32'h3e337c61), .K7_C4_W5(32'h3dd357cb), .K7_C4_W6(32'h39fb52ba), .K7_C4_W7(32'h3dc0311e), .K7_C4_W8(32'h3dd2ecaf), 
		.K7_C5_W0(32'h3b759ce5), .K7_C5_W1(32'hbcf3dbab), .K7_C5_W2(32'h3dd8b230), .K7_C5_W3(32'h3d95fd76), .K7_C5_W4(32'h3e4085a3), .K7_C5_W5(32'h3c6ff11e), .K7_C5_W6(32'hbbfc8a1e), .K7_C5_W7(32'h3dd9ad58), .K7_C5_W8(32'hbd290fa7), 
		.K7_C6_W0(32'hbdd97c39), .K7_C6_W1(32'h3c97306c), .K7_C6_W2(32'h3d47afb4), .K7_C6_W3(32'h3ce41dd6), .K7_C6_W4(32'hbd47ba07), .K7_C6_W5(32'h3d181e64), .K7_C6_W6(32'hbe01ed63), .K7_C6_W7(32'h3da5b519), .K7_C6_W8(32'h3c2be34a), 
		.K7_C7_W0(32'h3debd273), .K7_C7_W1(32'h3a941682), .K7_C7_W2(32'h3d49229d), .K7_C7_W3(32'hbc91ca82), .K7_C7_W4(32'hbba43e9d), .K7_C7_W5(32'h3dc94bfb), .K7_C7_W6(32'h3d218555), .K7_C7_W7(32'h3dc6d793), .K7_C7_W8(32'h3d759341), 
		.K7_C8_W0(32'h3de46450), .K7_C8_W1(32'hbe20bc90), .K7_C8_W2(32'hbc8d8776), .K7_C8_W3(32'hbe0c3224), .K7_C8_W4(32'hbdb43e89), .K7_C8_W5(32'h3d1e53ce), .K7_C8_W6(32'hbd822f6c), .K7_C8_W7(32'hbdac248e), .K7_C8_W8(32'h3b498904), 
		.K7_C9_W0(32'h3e14f43b), .K7_C9_W1(32'h3d877c42), .K7_C9_W2(32'hbd429e8e), .K7_C9_W3(32'h3e28a4b8), .K7_C9_W4(32'h3e3840f7), .K7_C9_W5(32'h3dbc10ea), .K7_C9_W6(32'hbc93080f), .K7_C9_W7(32'hba7a4075), .K7_C9_W8(32'hbe08a9bc), 
		.K7_C10_W0(32'hbd08b886), .K7_C10_W1(32'h3e1a9356), .K7_C10_W2(32'hbdc60909), .K7_C10_W3(32'h3dd552f1), .K7_C10_W4(32'h3d935f0c), .K7_C10_W5(32'h3dcc3f7d), .K7_C10_W6(32'h3d8b1631), .K7_C10_W7(32'hbe011461), .K7_C10_W8(32'hbd6a81bb), 
		.K7_C11_W0(32'hbd1a538e), .K7_C11_W1(32'hbe06ed1b), .K7_C11_W2(32'hbdd5da8d), .K7_C11_W3(32'hbde6038e), .K7_C11_W4(32'hbe22b9b8), .K7_C11_W5(32'hbe0d14d6), .K7_C11_W6(32'h3e0ba0db), .K7_C11_W7(32'hbd9185eb), .K7_C11_W8(32'h3deaf539), 
		.K7_C12_W0(32'hbbc7de53), .K7_C12_W1(32'hbd6f0c46), .K7_C12_W2(32'h3c030665), .K7_C12_W3(32'h3d0a4376), .K7_C12_W4(32'hbdb65e44), .K7_C12_W5(32'h3cfb7aef), .K7_C12_W6(32'h3dc8cbb7), .K7_C12_W7(32'h3bef0922), .K7_C12_W8(32'h3cb456ab), 
		.K7_C13_W0(32'h3e0c327a), .K7_C13_W1(32'h3def3292), .K7_C13_W2(32'h3dcec7eb), .K7_C13_W3(32'h3ca7d221), .K7_C13_W4(32'h3e2b01fd), .K7_C13_W5(32'hbc119888), .K7_C13_W6(32'hbd7670f6), .K7_C13_W7(32'hbd926017), .K7_C13_W8(32'hbdf5f4fe), 
		.K7_C14_W0(32'h3dae1054), .K7_C14_W1(32'hbd860d3c), .K7_C14_W2(32'hbcc428e1), .K7_C14_W3(32'hbdf30632), .K7_C14_W4(32'h3ccb1d50), .K7_C14_W5(32'hbb44025f), .K7_C14_W6(32'h3b99c4dc), .K7_C14_W7(32'h3d854d82), .K7_C14_W8(32'h3e2d78c2), 
		.K7_C15_W0(32'h3dd7f3ce), .K7_C15_W1(32'h3dc121a4), .K7_C15_W2(32'hbd61433b), .K7_C15_W3(32'h3d2c649f), .K7_C15_W4(32'h3b1b8dbb), .K7_C15_W5(32'h3dfb505c), .K7_C15_W6(32'hbe054e69), .K7_C15_W7(32'h3e041ef7), .K7_C15_W8(32'h3e1088b7), 
		.K7_BIAS (32'hbb17a59c),

		.K8_C0_W0(32'hbd064f3d), .K8_C0_W1(32'h3cdb21cd), .K8_C0_W2(32'h3d2a1bb4), .K8_C0_W3(32'h3d44990b), .K8_C0_W4(32'hbcd2f40e), .K8_C0_W5(32'h3d926772), .K8_C0_W6(32'h3d823c16), .K8_C0_W7(32'h3da020d8), .K8_C0_W8(32'h3a5e7b8e), 
		.K8_C1_W0(32'h3b1b802d), .K8_C1_W1(32'h3d6dd130), .K8_C1_W2(32'hbce62fad), .K8_C1_W3(32'h3dc8ddb1), .K8_C1_W4(32'hbdd74e0f), .K8_C1_W5(32'h3d8b38e5), .K8_C1_W6(32'h3d0c25c7), .K8_C1_W7(32'hbdd82af3), .K8_C1_W8(32'hbd4fbe2b), 
		.K8_C2_W0(32'hbdce4922), .K8_C2_W1(32'h3e1ce2aa), .K8_C2_W2(32'h3d3016b4), .K8_C2_W3(32'h3c428071), .K8_C2_W4(32'h3d09991e), .K8_C2_W5(32'h3dd6548f), .K8_C2_W6(32'hbdb92d4c), .K8_C2_W7(32'hbd914340), .K8_C2_W8(32'hbdce3a5d), 
		.K8_C3_W0(32'h3d26e010), .K8_C3_W1(32'hbdc2c3ff), .K8_C3_W2(32'h3d8b7dff), .K8_C3_W3(32'hbda16fc4), .K8_C3_W4(32'h3df19a3b), .K8_C3_W5(32'h3e099053), .K8_C3_W6(32'hbde4ee51), .K8_C3_W7(32'h3d84ea8f), .K8_C3_W8(32'h3e22e889), 
		.K8_C4_W0(32'h3c52f8cf), .K8_C4_W1(32'h3ceeca44), .K8_C4_W2(32'h3d807a0b), .K8_C4_W3(32'hbdaa84a6), .K8_C4_W4(32'hbc72ea55), .K8_C4_W5(32'h3dca5835), .K8_C4_W6(32'h3d4b297e), .K8_C4_W7(32'hbe021285), .K8_C4_W8(32'hbdfd3c72), 
		.K8_C5_W0(32'hbc329b74), .K8_C5_W1(32'h3e081c3f), .K8_C5_W2(32'h3e18d47c), .K8_C5_W3(32'hbe010c40), .K8_C5_W4(32'hbe1c5421), .K8_C5_W5(32'hbb5b255c), .K8_C5_W6(32'h3d9db93f), .K8_C5_W7(32'h3ba09ea9), .K8_C5_W8(32'hbd4511b5), 
		.K8_C6_W0(32'h3e0ecfc2), .K8_C6_W1(32'hbda95b54), .K8_C6_W2(32'h3e26daf3), .K8_C6_W3(32'hbd2cc68c), .K8_C6_W4(32'hbd3d9c70), .K8_C6_W5(32'hbd8840b7), .K8_C6_W6(32'h3e11e728), .K8_C6_W7(32'hbdf523b9), .K8_C6_W8(32'h3af9529a), 
		.K8_C7_W0(32'hbd81e19c), .K8_C7_W1(32'hbdf91e61), .K8_C7_W2(32'h3d6963ec), .K8_C7_W3(32'hbc413906), .K8_C7_W4(32'hbd2e0f9d), .K8_C7_W5(32'hbe078662), .K8_C7_W6(32'hbdf6ac6a), .K8_C7_W7(32'hbe1d0e31), .K8_C7_W8(32'hbd85e578), 
		.K8_C8_W0(32'hbca5c4db), .K8_C8_W1(32'h3d0559f4), .K8_C8_W2(32'h3d232983), .K8_C8_W3(32'hbcee5970), .K8_C8_W4(32'hbd8b7a0c), .K8_C8_W5(32'hbdbc80e2), .K8_C8_W6(32'h3de45e99), .K8_C8_W7(32'hbd13093b), .K8_C8_W8(32'h3dd180c9), 
		.K8_C9_W0(32'h3d79c0e2), .K8_C9_W1(32'h3e0e573f), .K8_C9_W2(32'hbcdab1f6), .K8_C9_W3(32'hbe073146), .K8_C9_W4(32'h3dcbd2d5), .K8_C9_W5(32'hbe005102), .K8_C9_W6(32'hbd0f1cad), .K8_C9_W7(32'hbdfa3618), .K8_C9_W8(32'h3d820ab1), 
		.K8_C10_W0(32'h3df2022e), .K8_C10_W1(32'h3d762aaa), .K8_C10_W2(32'h3d9b62e5), .K8_C10_W3(32'hbde9d0d1), .K8_C10_W4(32'hba1a1285), .K8_C10_W5(32'hbda32438), .K8_C10_W6(32'h3da522f0), .K8_C10_W7(32'h3db7bba0), .K8_C10_W8(32'hbe25774c), 
		.K8_C11_W0(32'hbd969ce0), .K8_C11_W1(32'h3b967cf3), .K8_C11_W2(32'hbbdc9226), .K8_C11_W3(32'h3d2e02ac), .K8_C11_W4(32'h3e1c8315), .K8_C11_W5(32'hbab1f9fa), .K8_C11_W6(32'h3c87f834), .K8_C11_W7(32'hbdcacdef), .K8_C11_W8(32'h3dc7999a), 
		.K8_C12_W0(32'h3d6cdbd9), .K8_C12_W1(32'h3de8533e), .K8_C12_W2(32'h3d3c5ed2), .K8_C12_W3(32'h3da9e90d), .K8_C12_W4(32'hbe05aa0a), .K8_C12_W5(32'hbc67c692), .K8_C12_W6(32'hbcfae6e5), .K8_C12_W7(32'h3de38e7d), .K8_C12_W8(32'h3c66f2cd), 
		.K8_C13_W0(32'h3d94954e), .K8_C13_W1(32'h3d156685), .K8_C13_W2(32'h3d8633cb), .K8_C13_W3(32'h3e0057b8), .K8_C13_W4(32'hbdf99321), .K8_C13_W5(32'hbdc9ec1e), .K8_C13_W6(32'hbc8f4564), .K8_C13_W7(32'hbdf05d92), .K8_C13_W8(32'hbdc8a7f9), 
		.K8_C14_W0(32'hbdc63211), .K8_C14_W1(32'hbdf207ac), .K8_C14_W2(32'h3cd8ac21), .K8_C14_W3(32'hbdf3bace), .K8_C14_W4(32'h3e07cafc), .K8_C14_W5(32'hbe036d78), .K8_C14_W6(32'hbd2835be), .K8_C14_W7(32'h3e06131e), .K8_C14_W8(32'h3ded1a99), 
		.K8_C15_W0(32'h3c9d4d65), .K8_C15_W1(32'h3dfbe7c2), .K8_C15_W2(32'hbda82190), .K8_C15_W3(32'h3da23205), .K8_C15_W4(32'h3d943a03), .K8_C15_W5(32'hbd6fbcda), .K8_C15_W6(32'h3cf87df2), .K8_C15_W7(32'hbd501cb5), .K8_C15_W8(32'h3da6407a), 
		.K8_BIAS (32'hbcb94f4f),

		.K9_C0_W0(32'hbcd907c8), .K9_C0_W1(32'hbdf8a2aa), .K9_C0_W2(32'hbcddb282), .K9_C0_W3(32'hbce3c558), .K9_C0_W4(32'h3d8d1aad), .K9_C0_W5(32'hbdbae14c), .K9_C0_W6(32'h3db9354f), .K9_C0_W7(32'h3e2529c0), .K9_C0_W8(32'h3d709a40), 
		.K9_C1_W0(32'hbd686f45), .K9_C1_W1(32'hbd1b40a0), .K9_C1_W2(32'hbe08e643), .K9_C1_W3(32'h3d873fa3), .K9_C1_W4(32'h3df0c1eb), .K9_C1_W5(32'h3dda436b), .K9_C1_W6(32'hbe1ddb6f), .K9_C1_W7(32'hbb3333e4), .K9_C1_W8(32'h3dc09763), 
		.K9_C2_W0(32'hbd5c9688), .K9_C2_W1(32'h3dc69073), .K9_C2_W2(32'h3e0c6857), .K9_C2_W3(32'h3dbf73e3), .K9_C2_W4(32'h3e113c20), .K9_C2_W5(32'h3c0eb12b), .K9_C2_W6(32'h3dc4c594), .K9_C2_W7(32'hbde62f22), .K9_C2_W8(32'hbbdc48dd), 
		.K9_C3_W0(32'hbc7747f5), .K9_C3_W1(32'h3dd218f4), .K9_C3_W2(32'hbdc1a5f3), .K9_C3_W3(32'h3dacd3c0), .K9_C3_W4(32'hbdab2607), .K9_C3_W5(32'hbdcc8f6b), .K9_C3_W6(32'h3e00af4d), .K9_C3_W7(32'h3d92209b), .K9_C3_W8(32'h3e06ab6d), 
		.K9_C4_W0(32'hbdca7be6), .K9_C4_W1(32'hbe188933), .K9_C4_W2(32'h3e0466e9), .K9_C4_W3(32'hbdfe4bab), .K9_C4_W4(32'hbd6b45cd), .K9_C4_W5(32'h3dacc141), .K9_C4_W6(32'hbdb5ad67), .K9_C4_W7(32'hbdb0b471), .K9_C4_W8(32'hbd4068d0), 
		.K9_C5_W0(32'h3d9db7ac), .K9_C5_W1(32'hb9ec5cc6), .K9_C5_W2(32'h3da6f445), .K9_C5_W3(32'hbc85c48d), .K9_C5_W4(32'hbdefb135), .K9_C5_W5(32'hbdddeaf5), .K9_C5_W6(32'h3df34efb), .K9_C5_W7(32'h3de0bf79), .K9_C5_W8(32'hba43aeb4), 
		.K9_C6_W0(32'h3d0c1557), .K9_C6_W1(32'h3df8b480), .K9_C6_W2(32'hbdbd38b2), .K9_C6_W3(32'h3cb4a73c), .K9_C6_W4(32'hbe2d65c6), .K9_C6_W5(32'hbd5b04b4), .K9_C6_W6(32'hbe209a0d), .K9_C6_W7(32'hbdc20d87), .K9_C6_W8(32'hbe2a8bd0), 
		.K9_C7_W0(32'hbb332dbc), .K9_C7_W1(32'hbd8116ad), .K9_C7_W2(32'h3da03711), .K9_C7_W3(32'hbd8f86f7), .K9_C7_W4(32'h3d58a2a5), .K9_C7_W5(32'hbd423edf), .K9_C7_W6(32'h3d903a12), .K9_C7_W7(32'h3d9bc81d), .K9_C7_W8(32'h3d53b7bf), 
		.K9_C8_W0(32'h3dc9be9a), .K9_C8_W1(32'h3d61fd2f), .K9_C8_W2(32'h3dc1f516), .K9_C8_W3(32'hbd56e218), .K9_C8_W4(32'h3d78787e), .K9_C8_W5(32'hbdba00d8), .K9_C8_W6(32'hbdb55f75), .K9_C8_W7(32'h3c8b269a), .K9_C8_W8(32'hbbf47016), 
		.K9_C9_W0(32'hbe12b34c), .K9_C9_W1(32'hbc420c8b), .K9_C9_W2(32'hbda02aab), .K9_C9_W3(32'hbb277fc0), .K9_C9_W4(32'hbe287cd5), .K9_C9_W5(32'h3d8d69cd), .K9_C9_W6(32'hbc3944a7), .K9_C9_W7(32'h3d812d9e), .K9_C9_W8(32'h3ddcb88a), 
		.K9_C10_W0(32'hbe086e6a), .K9_C10_W1(32'h3dec41d4), .K9_C10_W2(32'h3dfc5acd), .K9_C10_W3(32'h3dda4f55), .K9_C10_W4(32'hbd936652), .K9_C10_W5(32'hbe0736ff), .K9_C10_W6(32'hbdc84030), .K9_C10_W7(32'h3d8fbf90), .K9_C10_W8(32'hbd001371), 
		.K9_C11_W0(32'h3d08fa4f), .K9_C11_W1(32'h3da4125d), .K9_C11_W2(32'h3dde0069), .K9_C11_W3(32'hbd16be43), .K9_C11_W4(32'hbe0bf545), .K9_C11_W5(32'h3c1593f8), .K9_C11_W6(32'hbbacc368), .K9_C11_W7(32'hbceba350), .K9_C11_W8(32'hbdd129f1), 
		.K9_C12_W0(32'hbde206ae), .K9_C12_W1(32'h3dec7737), .K9_C12_W2(32'h3de10541), .K9_C12_W3(32'hbe05f22d), .K9_C12_W4(32'hbe00cb38), .K9_C12_W5(32'hbdc20873), .K9_C12_W6(32'hbd39c967), .K9_C12_W7(32'hbd72a62d), .K9_C12_W8(32'hbdd1650c), 
		.K9_C13_W0(32'hbd8a593b), .K9_C13_W1(32'h3dad11b6), .K9_C13_W2(32'h3e002e6a), .K9_C13_W3(32'hbe1541cb), .K9_C13_W4(32'h3dcc6be8), .K9_C13_W5(32'h3d74a810), .K9_C13_W6(32'hbb9cefe7), .K9_C13_W7(32'hbdcf7e92), .K9_C13_W8(32'h3d800ec4), 
		.K9_C14_W0(32'hbd74b2a6), .K9_C14_W1(32'h3df649e9), .K9_C14_W2(32'hbd8830eb), .K9_C14_W3(32'h3e0527b1), .K9_C14_W4(32'h3df07548), .K9_C14_W5(32'h3dc35c3d), .K9_C14_W6(32'h3d9ddd99), .K9_C14_W7(32'hbdd57748), .K9_C14_W8(32'hbdddee3b), 
		.K9_C15_W0(32'hbbb7983b), .K9_C15_W1(32'hbd985c90), .K9_C15_W2(32'h3df34fcc), .K9_C15_W3(32'hbcae33d9), .K9_C15_W4(32'h3c6f20d4), .K9_C15_W5(32'hbe2bf0d9), .K9_C15_W6(32'h3e0344ba), .K9_C15_W7(32'h3b139543), .K9_C15_W8(32'hbdf2c7ff), 
		.K9_BIAS (32'h3bdd4f4c),

		.K10_C0_W0(32'hbdc4231a), .K10_C0_W1(32'hbd8d2683), .K10_C0_W2(32'h3dc62da0), .K10_C0_W3(32'h3ccb1c21), .K10_C0_W4(32'hbdbac533), .K10_C0_W5(32'h3d5ea260), .K10_C0_W6(32'h3c949b03), .K10_C0_W7(32'h3e462f1d), .K10_C0_W8(32'h3cef3da3), 
		.K10_C1_W0(32'hbd0353cf), .K10_C1_W1(32'h3e157cbe), .K10_C1_W2(32'hbde49307), .K10_C1_W3(32'h3dcfae5e), .K10_C1_W4(32'h3e0f7924), .K10_C1_W5(32'hbde4c578), .K10_C1_W6(32'h3d6bfb75), .K10_C1_W7(32'h3e2d9799), .K10_C1_W8(32'h3dab75eb), 
		.K10_C2_W0(32'h3e015fd0), .K10_C2_W1(32'h3d635908), .K10_C2_W2(32'h3ca143d0), .K10_C2_W3(32'hbd576ac3), .K10_C2_W4(32'h3d0cf62d), .K10_C2_W5(32'hbe0039d3), .K10_C2_W6(32'h3d999e58), .K10_C2_W7(32'hbde5bf62), .K10_C2_W8(32'hbd99f84e), 
		.K10_C3_W0(32'hbd096378), .K10_C3_W1(32'hbdb44f37), .K10_C3_W2(32'h3c9d5cbe), .K10_C3_W3(32'h3e1f5bb0), .K10_C3_W4(32'h3d1df558), .K10_C3_W5(32'h3c80e799), .K10_C3_W6(32'hbde22fb8), .K10_C3_W7(32'hbe0cb5a4), .K10_C3_W8(32'h3d5ed38b), 
		.K10_C4_W0(32'hbde94a46), .K10_C4_W1(32'h3e10a365), .K10_C4_W2(32'hbcec303f), .K10_C4_W3(32'h3c294a7c), .K10_C4_W4(32'hbd5b833f), .K10_C4_W5(32'h3df4006a), .K10_C4_W6(32'h3e0ab67d), .K10_C4_W7(32'hbd45411b), .K10_C4_W8(32'h3d869065), 
		.K10_C5_W0(32'h3ca4bdb4), .K10_C5_W1(32'hbe0bfbe2), .K10_C5_W2(32'h3c04f30f), .K10_C5_W3(32'h3cb95efe), .K10_C5_W4(32'hbdcb27ea), .K10_C5_W5(32'hb93560c8), .K10_C5_W6(32'h3dd37f9b), .K10_C5_W7(32'hbe00767a), .K10_C5_W8(32'hbe053271), 
		.K10_C6_W0(32'hbdffa95a), .K10_C6_W1(32'h3dd61640), .K10_C6_W2(32'h3cdd91bd), .K10_C6_W3(32'hbe3a6f67), .K10_C6_W4(32'h3d1cbc71), .K10_C6_W5(32'h3dcd6c24), .K10_C6_W6(32'hbdacdc07), .K10_C6_W7(32'hbdd5cd54), .K10_C6_W8(32'h3cb2e11f), 
		.K10_C7_W0(32'h3df62165), .K10_C7_W1(32'h3d93fdfd), .K10_C7_W2(32'h3d3525d8), .K10_C7_W3(32'hbd68fb7c), .K10_C7_W4(32'h3d00924e), .K10_C7_W5(32'hbdcc718b), .K10_C7_W6(32'hbd5483fc), .K10_C7_W7(32'hbddd8deb), .K10_C7_W8(32'hbddd0430), 
		.K10_C8_W0(32'h3d145d00), .K10_C8_W1(32'h3d139485), .K10_C8_W2(32'h3de963ff), .K10_C8_W3(32'h3c0ed339), .K10_C8_W4(32'h3df57c94), .K10_C8_W5(32'h3d858af9), .K10_C8_W6(32'h3df3a57a), .K10_C8_W7(32'hbda0513f), .K10_C8_W8(32'hbcf7ff10), 
		.K10_C9_W0(32'hbd942ed3), .K10_C9_W1(32'hbdc28e43), .K10_C9_W2(32'h3dc5c75e), .K10_C9_W3(32'h3d25937d), .K10_C9_W4(32'hbd1cdf9a), .K10_C9_W5(32'h3e0ba65c), .K10_C9_W6(32'h3d50d878), .K10_C9_W7(32'hbdbb400a), .K10_C9_W8(32'h3de585a0), 
		.K10_C10_W0(32'h3d823b7d), .K10_C10_W1(32'h3df71638), .K10_C10_W2(32'hbd10f669), .K10_C10_W3(32'hbd66681f), .K10_C10_W4(32'hbdef8c48), .K10_C10_W5(32'hbdf1b6e2), .K10_C10_W6(32'hbb5c4e74), .K10_C10_W7(32'hbc8b4419), .K10_C10_W8(32'h3d8a6575), 
		.K10_C11_W0(32'h3db39b40), .K10_C11_W1(32'hbdbb7f31), .K10_C11_W2(32'hbb5b8042), .K10_C11_W3(32'hbdf1cb0e), .K10_C11_W4(32'h3948aec0), .K10_C11_W5(32'hbde31517), .K10_C11_W6(32'h3d18afdc), .K10_C11_W7(32'hbe1bae38), .K10_C11_W8(32'h3cb9f30b), 
		.K10_C12_W0(32'hbdd52e3a), .K10_C12_W1(32'h3d421e86), .K10_C12_W2(32'h3dc0ec3c), .K10_C12_W3(32'hbcf8e46d), .K10_C12_W4(32'hbccedca4), .K10_C12_W5(32'hbd76e685), .K10_C12_W6(32'h3e30cba7), .K10_C12_W7(32'h3dcc4351), .K10_C12_W8(32'h3e093ab2), 
		.K10_C13_W0(32'hbdc1fa35), .K10_C13_W1(32'h3d2e9348), .K10_C13_W2(32'h3e05303b), .K10_C13_W3(32'h3d88e61e), .K10_C13_W4(32'hbc2bec6a), .K10_C13_W5(32'h3decaaf7), .K10_C13_W6(32'h3df85337), .K10_C13_W7(32'hbcbc1ce2), .K10_C13_W8(32'h3e2873c6), 
		.K10_C14_W0(32'h3ca3eb8d), .K10_C14_W1(32'hbb1690b4), .K10_C14_W2(32'hbcd3f5e5), .K10_C14_W3(32'h3d151a31), .K10_C14_W4(32'hbd92031f), .K10_C14_W5(32'h3d37c885), .K10_C14_W6(32'h3ddbd864), .K10_C14_W7(32'hbdd1c93f), .K10_C14_W8(32'h3c1370bb), 
		.K10_C15_W0(32'h3d1a525f), .K10_C15_W1(32'hbde05ed3), .K10_C15_W2(32'hbd21b73b), .K10_C15_W3(32'hbceab915), .K10_C15_W4(32'hbdedef92), .K10_C15_W5(32'hbcf12129), .K10_C15_W6(32'h3d3fc6fd), .K10_C15_W7(32'hbd28dc76), .K10_C15_W8(32'hbe221980), 
		.K10_BIAS (32'h3d56fde2),

		.K11_C0_W0(32'hbdd79ee6), .K11_C0_W1(32'hbd73fee2), .K11_C0_W2(32'h3c80430b), .K11_C0_W3(32'h3cdff971), .K11_C0_W4(32'hbd9aaf4b), .K11_C0_W5(32'hbd0b35dc), .K11_C0_W6(32'hbddd88c1), .K11_C0_W7(32'h3df6f2a8), .K11_C0_W8(32'h3d92cf97), 
		.K11_C1_W0(32'h3e248ad8), .K11_C1_W1(32'hbddb0fde), .K11_C1_W2(32'h3cdfbb8c), .K11_C1_W3(32'h3cd86146), .K11_C1_W4(32'h3e043630), .K11_C1_W5(32'hbcecc97c), .K11_C1_W6(32'hbd4d91a6), .K11_C1_W7(32'hbd655def), .K11_C1_W8(32'hbe02ecbc), 
		.K11_C2_W0(32'hbdc02eab), .K11_C2_W1(32'h3e041ebe), .K11_C2_W2(32'h3d4917c5), .K11_C2_W3(32'h3e05a51f), .K11_C2_W4(32'h3cb66c05), .K11_C2_W5(32'h3d5b04db), .K11_C2_W6(32'hbdead507), .K11_C2_W7(32'h3db23f62), .K11_C2_W8(32'hbd90549d), 
		.K11_C3_W0(32'h3da058e4), .K11_C3_W1(32'h3e1ea787), .K11_C3_W2(32'h3d912e82), .K11_C3_W3(32'hbcb55572), .K11_C3_W4(32'hbe31e2d4), .K11_C3_W5(32'hbe128197), .K11_C3_W6(32'hbd2b8ed1), .K11_C3_W7(32'h3b0d0de6), .K11_C3_W8(32'hbcbc805d), 
		.K11_C4_W0(32'hbd3d31a8), .K11_C4_W1(32'h3c30e172), .K11_C4_W2(32'hbda70195), .K11_C4_W3(32'h3d366abd), .K11_C4_W4(32'h3dd89850), .K11_C4_W5(32'h3df255cd), .K11_C4_W6(32'hbca51794), .K11_C4_W7(32'h3e0786ae), .K11_C4_W8(32'h3afe3ddb), 
		.K11_C5_W0(32'hbdf3cde4), .K11_C5_W1(32'h3de5a6fc), .K11_C5_W2(32'h3c9900aa), .K11_C5_W3(32'h3d9776b8), .K11_C5_W4(32'h3e2e480b), .K11_C5_W5(32'h3e0b2219), .K11_C5_W6(32'h3e3164a3), .K11_C5_W7(32'h3db2d1ec), .K11_C5_W8(32'h3d90d7c6), 
		.K11_C6_W0(32'hbd86813f), .K11_C6_W1(32'hbd77022b), .K11_C6_W2(32'hbc8af92f), .K11_C6_W3(32'h3d741139), .K11_C6_W4(32'hbdbf719b), .K11_C6_W5(32'hbd7a8700), .K11_C6_W6(32'h3d1b5e47), .K11_C6_W7(32'hbd53fed1), .K11_C6_W8(32'hbdd637be), 
		.K11_C7_W0(32'h3db64db7), .K11_C7_W1(32'h3c5e153b), .K11_C7_W2(32'h3e014bcd), .K11_C7_W3(32'hbb5072d7), .K11_C7_W4(32'h3e1bfd80), .K11_C7_W5(32'hbd7ab3a9), .K11_C7_W6(32'hbd124941), .K11_C7_W7(32'hbcd1b9ad), .K11_C7_W8(32'h3e0c2b7b), 
		.K11_C8_W0(32'h3d2ab8f2), .K11_C8_W1(32'hbe20e20c), .K11_C8_W2(32'hbcfb7196), .K11_C8_W3(32'h3d5eb172), .K11_C8_W4(32'hbd165493), .K11_C8_W5(32'hbe45cec0), .K11_C8_W6(32'h3d92a768), .K11_C8_W7(32'hbd74c509), .K11_C8_W8(32'hbe1dda36), 
		.K11_C9_W0(32'h3c7a0bc7), .K11_C9_W1(32'h3d852e82), .K11_C9_W2(32'h3dd73707), .K11_C9_W3(32'h3e2e895a), .K11_C9_W4(32'h3e314c07), .K11_C9_W5(32'h3d90f9fa), .K11_C9_W6(32'h3dbcfe90), .K11_C9_W7(32'h3e021441), .K11_C9_W8(32'hbda0f6d1), 
		.K11_C10_W0(32'h3c6f27a1), .K11_C10_W1(32'hbd1c3ebf), .K11_C10_W2(32'h3dd424ff), .K11_C10_W3(32'h3dba32f7), .K11_C10_W4(32'hbda65ce5), .K11_C10_W5(32'h3e27b9cd), .K11_C10_W6(32'hbe1df3f3), .K11_C10_W7(32'h3e09afd8), .K11_C10_W8(32'h3d02eaf9), 
		.K11_C11_W0(32'hbe1d06f3), .K11_C11_W1(32'h3d399690), .K11_C11_W2(32'h3d0d5408), .K11_C11_W3(32'hbe0e4c68), .K11_C11_W4(32'h3d084219), .K11_C11_W5(32'hbd3b9d67), .K11_C11_W6(32'hbd0f4a68), .K11_C11_W7(32'hbc82ab63), .K11_C11_W8(32'h3dada66c), 
		.K11_C12_W0(32'h3dab916f), .K11_C12_W1(32'h3d4754a3), .K11_C12_W2(32'h3d19c190), .K11_C12_W3(32'h3e1d5dae), .K11_C12_W4(32'hbc711eff), .K11_C12_W5(32'h3e0ed7e8), .K11_C12_W6(32'h3e16bf29), .K11_C12_W7(32'hbdc99859), .K11_C12_W8(32'h3de7ba1d), 
		.K11_C13_W0(32'hbdf4454d), .K11_C13_W1(32'h3d9affd3), .K11_C13_W2(32'h3e09ce87), .K11_C13_W3(32'hbc9d09cf), .K11_C13_W4(32'hbd5b62eb), .K11_C13_W5(32'hbd22ad9f), .K11_C13_W6(32'hbd45b118), .K11_C13_W7(32'h3dcd7cd9), .K11_C13_W8(32'hbd7a28c8), 
		.K11_C14_W0(32'h3dbbe5eb), .K11_C14_W1(32'h3c8f17ff), .K11_C14_W2(32'hbd951054), .K11_C14_W3(32'h3c341025), .K11_C14_W4(32'hbda44e3b), .K11_C14_W5(32'h3d97d640), .K11_C14_W6(32'h3de259d9), .K11_C14_W7(32'hbda212a4), .K11_C14_W8(32'hbd57841d), 
		.K11_C15_W0(32'hbc9df2a1), .K11_C15_W1(32'hbdc6861a), .K11_C15_W2(32'hbe15a8a1), .K11_C15_W3(32'hbd9b790f), .K11_C15_W4(32'hbc325b3a), .K11_C15_W5(32'hbbddfb92), .K11_C15_W6(32'h3ddd4d7b), .K11_C15_W7(32'h3dec38c3), .K11_C15_W8(32'h3de37d00), 
		.K11_BIAS (32'hbc77a5c7),

		.K12_C0_W0(32'hbceb671d), .K12_C0_W1(32'hbd17e04b), .K12_C0_W2(32'hbdab3965), .K12_C0_W3(32'h3d3c09ca), .K12_C0_W4(32'h3c462efb), .K12_C0_W5(32'hbd4f7e32), .K12_C0_W6(32'h3de5c30c), .K12_C0_W7(32'h3d9d68a9), .K12_C0_W8(32'hbd7b3b9a), 
		.K12_C1_W0(32'hbdbf9ff3), .K12_C1_W1(32'hbd1fced6), .K12_C1_W2(32'h3da9db84), .K12_C1_W3(32'hbdca713d), .K12_C1_W4(32'h3dde71b1), .K12_C1_W5(32'hbbf72e1a), .K12_C1_W6(32'h3dd4f1c3), .K12_C1_W7(32'hbd90cf66), .K12_C1_W8(32'h3d9812c8), 
		.K12_C2_W0(32'hbc17eb5e), .K12_C2_W1(32'hbd84940f), .K12_C2_W2(32'hbd067f47), .K12_C2_W3(32'hbd7e78df), .K12_C2_W4(32'hbc9ff4ba), .K12_C2_W5(32'hbc4d3211), .K12_C2_W6(32'h3d776d04), .K12_C2_W7(32'hbe2cebd3), .K12_C2_W8(32'h3cf3206e), 
		.K12_C3_W0(32'hbc6f1035), .K12_C3_W1(32'h3cde338b), .K12_C3_W2(32'h3dd10c4b), .K12_C3_W3(32'hbd83c1ba), .K12_C3_W4(32'hbe207065), .K12_C3_W5(32'hbdaa05c7), .K12_C3_W6(32'h3d70b9dd), .K12_C3_W7(32'h3cae9d3d), .K12_C3_W8(32'hbdee5139), 
		.K12_C4_W0(32'hbe008256), .K12_C4_W1(32'hbc8eff7e), .K12_C4_W2(32'hbdb20df7), .K12_C4_W3(32'hbcc95080), .K12_C4_W4(32'hbdbe7713), .K12_C4_W5(32'h3df438eb), .K12_C4_W6(32'h3dd6538d), .K12_C4_W7(32'hbc8ed497), .K12_C4_W8(32'hbd5478ac), 
		.K12_C5_W0(32'hbd8d6c5f), .K12_C5_W1(32'h3dfcfc32), .K12_C5_W2(32'hbd6213a6), .K12_C5_W3(32'h3da54fb1), .K12_C5_W4(32'h3e0d23ee), .K12_C5_W5(32'h3e1b797b), .K12_C5_W6(32'h3e2bf9f9), .K12_C5_W7(32'hbdf2a124), .K12_C5_W8(32'h3d88bbc5), 
		.K12_C6_W0(32'hbe04fbb8), .K12_C6_W1(32'h3d617d52), .K12_C6_W2(32'hbd805094), .K12_C6_W3(32'h3dbae349), .K12_C6_W4(32'h3dbb549a), .K12_C6_W5(32'hbd3d3f39), .K12_C6_W6(32'h3e227298), .K12_C6_W7(32'h3dcd9cbe), .K12_C6_W8(32'h3d8bad63), 
		.K12_C7_W0(32'hbc8be555), .K12_C7_W1(32'h3ddbcfa7), .K12_C7_W2(32'h3d0d9fd7), .K12_C7_W3(32'h3db17fea), .K12_C7_W4(32'h3d4be78d), .K12_C7_W5(32'h3a99fd1f), .K12_C7_W6(32'hbbf1d53a), .K12_C7_W7(32'hbd93d5d6), .K12_C7_W8(32'hbc85ef12), 
		.K12_C8_W0(32'hbd7c0cc9), .K12_C8_W1(32'hbd427d83), .K12_C8_W2(32'h3d26acb9), .K12_C8_W3(32'h3ce8a4ca), .K12_C8_W4(32'h3c7be38f), .K12_C8_W5(32'h3c95776b), .K12_C8_W6(32'hbc5dcd53), .K12_C8_W7(32'h3d1b1c1d), .K12_C8_W8(32'hbc98376e), 
		.K12_C9_W0(32'h3dd4126c), .K12_C9_W1(32'h3de9a499), .K12_C9_W2(32'h3e030dee), .K12_C9_W3(32'hbd985489), .K12_C9_W4(32'h3e40da31), .K12_C9_W5(32'hbd47de90), .K12_C9_W6(32'h3d95a4a8), .K12_C9_W7(32'hbd562bbe), .K12_C9_W8(32'h3da79e01), 
		.K12_C10_W0(32'h3c5b3e0e), .K12_C10_W1(32'h3dad5af1), .K12_C10_W2(32'h3e1a2890), .K12_C10_W3(32'h3d8388e7), .K12_C10_W4(32'h3dffdb5c), .K12_C10_W5(32'hbd9d55e3), .K12_C10_W6(32'h3d74ee70), .K12_C10_W7(32'hbe05bbcb), .K12_C10_W8(32'hbcf0dfbd), 
		.K12_C11_W0(32'hbdc6fb42), .K12_C11_W1(32'h3c8d9d6a), .K12_C11_W2(32'h3e13a317), .K12_C11_W3(32'hbc0db81e), .K12_C11_W4(32'h3d283b43), .K12_C11_W5(32'hbd97c1e8), .K12_C11_W6(32'hbd4a3aa4), .K12_C11_W7(32'h3c0ef71f), .K12_C11_W8(32'h3dff8202), 
		.K12_C12_W0(32'h3dc78cd8), .K12_C12_W1(32'h3dd4afc7), .K12_C12_W2(32'h3d2edad7), .K12_C12_W3(32'hbddf18ad), .K12_C12_W4(32'h3d65d6fd), .K12_C12_W5(32'h3d190b8a), .K12_C12_W6(32'hbde0510e), .K12_C12_W7(32'hbe06b6d8), .K12_C12_W8(32'h3deeb1fe), 
		.K12_C13_W0(32'hbdd675d7), .K12_C13_W1(32'hbe10a2f7), .K12_C13_W2(32'h3d9a6af4), .K12_C13_W3(32'hbdc082a8), .K12_C13_W4(32'h3d20500b), .K12_C13_W5(32'hbd6af25d), .K12_C13_W6(32'h3d82a9e2), .K12_C13_W7(32'hbe0355e0), .K12_C13_W8(32'h3ddf93a8), 
		.K12_C14_W0(32'hbd892b72), .K12_C14_W1(32'h3e02ec85), .K12_C14_W2(32'h3dbc25c5), .K12_C14_W3(32'h3dbad981), .K12_C14_W4(32'hbe0c332f), .K12_C14_W5(32'hbdfff891), .K12_C14_W6(32'hbda1155a), .K12_C14_W7(32'h3e013d10), .K12_C14_W8(32'hbda158e7), 
		.K12_C15_W0(32'hbd0b1609), .K12_C15_W1(32'hbdf37951), .K12_C15_W2(32'hbe172fa3), .K12_C15_W3(32'h3d80830f), .K12_C15_W4(32'h3e15c4dc), .K12_C15_W5(32'hbb98d4c5), .K12_C15_W6(32'h3dbe1e59), .K12_C15_W7(32'hbdbb9c21), .K12_C15_W8(32'h3dfc5432), 
		.K12_BIAS (32'hbc8106b6),

		.K13_C0_W0(32'hbe01aaec), .K13_C0_W1(32'h3db4dbf6), .K13_C0_W2(32'hbca1931f), .K13_C0_W3(32'h3d1c9413), .K13_C0_W4(32'hbde8087e), .K13_C0_W5(32'hbd8bfcaf), .K13_C0_W6(32'h3e006631), .K13_C0_W7(32'hbe009a6a), .K13_C0_W8(32'hbc2538e2), 
		.K13_C1_W0(32'hbdb97fab), .K13_C1_W1(32'h3cc1cda4), .K13_C1_W2(32'h3c244d1f), .K13_C1_W3(32'h3d839ffe), .K13_C1_W4(32'hbd9d8ba4), .K13_C1_W5(32'hbbb9d666), .K13_C1_W6(32'h3c5a615e), .K13_C1_W7(32'h3c983408), .K13_C1_W8(32'hbe04980e), 
		.K13_C2_W0(32'h3dacf76d), .K13_C2_W1(32'hbe04bb09), .K13_C2_W2(32'hbd01986d), .K13_C2_W3(32'hbdefd094), .K13_C2_W4(32'hbbc59c6f), .K13_C2_W5(32'h3dd4e0ee), .K13_C2_W6(32'h3df55aed), .K13_C2_W7(32'h3d48d74e), .K13_C2_W8(32'hbe00fe71), 
		.K13_C3_W0(32'hbcb05513), .K13_C3_W1(32'h3d019709), .K13_C3_W2(32'h3c22bbd0), .K13_C3_W3(32'h3ccfca09), .K13_C3_W4(32'hbcda8630), .K13_C3_W5(32'hbde84cfc), .K13_C3_W6(32'hbdfbd6e3), .K13_C3_W7(32'h3d9ac6f4), .K13_C3_W8(32'hbda31bb1), 
		.K13_C4_W0(32'h3d480de7), .K13_C4_W1(32'hbcdae26e), .K13_C4_W2(32'hbcf9c658), .K13_C4_W3(32'h3d928cc9), .K13_C4_W4(32'h3df55988), .K13_C4_W5(32'h3d6f1d04), .K13_C4_W6(32'h3db4d8fd), .K13_C4_W7(32'h3c13af34), .K13_C4_W8(32'hbb49cb67), 
		.K13_C5_W0(32'h3e3b1a03), .K13_C5_W1(32'hbab50904), .K13_C5_W2(32'h3df66bf3), .K13_C5_W3(32'hbdff6273), .K13_C5_W4(32'h3d133daf), .K13_C5_W5(32'h3d8aba51), .K13_C5_W6(32'hbc7e3dd9), .K13_C5_W7(32'h3dc020b2), .K13_C5_W8(32'hbd78cf13), 
		.K13_C6_W0(32'hbce9ebd6), .K13_C6_W1(32'h3db83730), .K13_C6_W2(32'hbdbf8058), .K13_C6_W3(32'h3e10d1a5), .K13_C6_W4(32'hbe0d354b), .K13_C6_W5(32'h3c8090ea), .K13_C6_W6(32'hbcb2355e), .K13_C6_W7(32'h3c11d9a5), .K13_C6_W8(32'hbe17c7a1), 
		.K13_C7_W0(32'h3da516bd), .K13_C7_W1(32'hbc15098e), .K13_C7_W2(32'hbe0acde6), .K13_C7_W3(32'hbbe1347a), .K13_C7_W4(32'h3dc67ec1), .K13_C7_W5(32'h3d059603), .K13_C7_W6(32'hbddc25e6), .K13_C7_W7(32'h3b437d90), .K13_C7_W8(32'h3da284a4), 
		.K13_C8_W0(32'h3dc911a8), .K13_C8_W1(32'hbe21f9ea), .K13_C8_W2(32'h3d56b6f3), .K13_C8_W3(32'h3c72af11), .K13_C8_W4(32'hbde19b27), .K13_C8_W5(32'hbcc3b95e), .K13_C8_W6(32'hbcb399f1), .K13_C8_W7(32'h3dd39d6c), .K13_C8_W8(32'hbdb53799), 
		.K13_C9_W0(32'h3cd8e57b), .K13_C9_W1(32'h3e3872a4), .K13_C9_W2(32'h3ded5aae), .K13_C9_W3(32'h3db50300), .K13_C9_W4(32'hbdf6dbfe), .K13_C9_W5(32'h3de50d1f), .K13_C9_W6(32'h3db5f4eb), .K13_C9_W7(32'h3ca9e8b6), .K13_C9_W8(32'hbd6b2adc), 
		.K13_C10_W0(32'h3caa2978), .K13_C10_W1(32'h3bf25353), .K13_C10_W2(32'h3df85293), .K13_C10_W3(32'h3d00bfbf), .K13_C10_W4(32'h3d861e4c), .K13_C10_W5(32'h3de5cfab), .K13_C10_W6(32'hbd9e828a), .K13_C10_W7(32'hbdea50c2), .K13_C10_W8(32'h3da4ff79), 
		.K13_C11_W0(32'h3d6db93f), .K13_C11_W1(32'h3dd0360f), .K13_C11_W2(32'hbc1ecedf), .K13_C11_W3(32'h3dcd50e5), .K13_C11_W4(32'hbe00db58), .K13_C11_W5(32'hbd086ee3), .K13_C11_W6(32'hbd8fa079), .K13_C11_W7(32'h3d8e1f43), .K13_C11_W8(32'hbd7287bb), 
		.K13_C12_W0(32'hbdb20654), .K13_C12_W1(32'h3d6c53d7), .K13_C12_W2(32'h3dc4df3c), .K13_C12_W3(32'h3e2361b7), .K13_C12_W4(32'h3dd22d62), .K13_C12_W5(32'hbdc6782d), .K13_C12_W6(32'h3d6c5f11), .K13_C12_W7(32'hbd75fd72), .K13_C12_W8(32'hbd8ae985), 
		.K13_C13_W0(32'hbdecb627), .K13_C13_W1(32'hbd88245b), .K13_C13_W2(32'h3debd99f), .K13_C13_W3(32'hbdda2eb2), .K13_C13_W4(32'hbdf2d93a), .K13_C13_W5(32'h3dd056ed), .K13_C13_W6(32'h3d365823), .K13_C13_W7(32'h3de4d5f3), .K13_C13_W8(32'h3dc14af5), 
		.K13_C14_W0(32'h3dacffeb), .K13_C14_W1(32'hbe03704b), .K13_C14_W2(32'h3d69c7f9), .K13_C14_W3(32'h3aa809b8), .K13_C14_W4(32'hbda0842e), .K13_C14_W5(32'h3db39afa), .K13_C14_W6(32'h3d9f3c4f), .K13_C14_W7(32'hbcc66ca4), .K13_C14_W8(32'h39569f5f), 
		.K13_C15_W0(32'h3de5f5ba), .K13_C15_W1(32'h3c90a6fe), .K13_C15_W2(32'hbdfced58), .K13_C15_W3(32'h3df7e9b2), .K13_C15_W4(32'h3d11bb75), .K13_C15_W5(32'h3d7b96de), .K13_C15_W6(32'hbb575a56), .K13_C15_W7(32'hbd220491), .K13_C15_W8(32'hbc44fcb2), 
		.K13_BIAS (32'hbbc561ac),

		.K14_C0_W0(32'h3e015c2d), .K14_C0_W1(32'hbab7df3b), .K14_C0_W2(32'h3d494539), .K14_C0_W3(32'h3dae0a61), .K14_C0_W4(32'h3de8e85a), .K14_C0_W5(32'h3d9be73e), .K14_C0_W6(32'h3df5156b), .K14_C0_W7(32'hbc67a204), .K14_C0_W8(32'h3d4edc13), 
		.K14_C1_W0(32'hbdf864b1), .K14_C1_W1(32'h3d1a6880), .K14_C1_W2(32'hbdf55c16), .K14_C1_W3(32'hbdf49616), .K14_C1_W4(32'hbe1173fd), .K14_C1_W5(32'h3dfacf24), .K14_C1_W6(32'hbe0c4d22), .K14_C1_W7(32'h3cf7b88e), .K14_C1_W8(32'h3bdaf1f9), 
		.K14_C2_W0(32'hbdf431d3), .K14_C2_W1(32'hbde4b14d), .K14_C2_W2(32'h3e082dd5), .K14_C2_W3(32'hbd4c6721), .K14_C2_W4(32'h3d7df34f), .K14_C2_W5(32'hbdf47991), .K14_C2_W6(32'h3d8d256e), .K14_C2_W7(32'h3d77f5a9), .K14_C2_W8(32'h3da33e25), 
		.K14_C3_W0(32'h3e1792fd), .K14_C3_W1(32'h3e09564b), .K14_C3_W2(32'h3d4a5ac9), .K14_C3_W3(32'h3ce4f3a6), .K14_C3_W4(32'hbd897cfc), .K14_C3_W5(32'hbe020767), .K14_C3_W6(32'h3d49e3eb), .K14_C3_W7(32'h3d4ff6d3), .K14_C3_W8(32'hbd18da19), 
		.K14_C4_W0(32'h3d7eaf6a), .K14_C4_W1(32'hbdeb6a4d), .K14_C4_W2(32'h3def3617), .K14_C4_W3(32'hbdb71748), .K14_C4_W4(32'hbdd5e467), .K14_C4_W5(32'hbdc8c21d), .K14_C4_W6(32'hbe1a8427), .K14_C4_W7(32'hbdfcb9f7), .K14_C4_W8(32'hbe097c88), 
		.K14_C5_W0(32'hbde8d460), .K14_C5_W1(32'hbd429987), .K14_C5_W2(32'hbd6d05a6), .K14_C5_W3(32'hbae5292d), .K14_C5_W4(32'hbde49b40), .K14_C5_W5(32'h3ce520f4), .K14_C5_W6(32'hbe082d1b), .K14_C5_W7(32'h3dbc7e5d), .K14_C5_W8(32'h3dab9361), 
		.K14_C6_W0(32'hbd2ab6f0), .K14_C6_W1(32'h3d928ce2), .K14_C6_W2(32'h3d9655c2), .K14_C6_W3(32'h3d173e0a), .K14_C6_W4(32'hbd8e3708), .K14_C6_W5(32'h3db18c60), .K14_C6_W6(32'hbc05f58a), .K14_C6_W7(32'hbdc390ab), .K14_C6_W8(32'hbdb05a76), 
		.K14_C7_W0(32'hbdec3a33), .K14_C7_W1(32'h3d925b6e), .K14_C7_W2(32'h3c5c32f1), .K14_C7_W3(32'hbd998d75), .K14_C7_W4(32'h3e071be2), .K14_C7_W5(32'hbd269853), .K14_C7_W6(32'hbdfb68f3), .K14_C7_W7(32'hbc427542), .K14_C7_W8(32'h3cc588a8), 
		.K14_C8_W0(32'hbd990860), .K14_C8_W1(32'hbdc76524), .K14_C8_W2(32'hbd223247), .K14_C8_W3(32'h3db57da7), .K14_C8_W4(32'h3da4fb07), .K14_C8_W5(32'h3e0feadd), .K14_C8_W6(32'h3e10644a), .K14_C8_W7(32'h3d2ca52d), .K14_C8_W8(32'hbe091196), 
		.K14_C9_W0(32'h3e076292), .K14_C9_W1(32'h3d10a3f4), .K14_C9_W2(32'h3d3e22ce), .K14_C9_W3(32'h3e07b3e1), .K14_C9_W4(32'hbc8589d3), .K14_C9_W5(32'hbdd9062f), .K14_C9_W6(32'h3cfa7086), .K14_C9_W7(32'h3d9d05c3), .K14_C9_W8(32'hbdd2f8e2), 
		.K14_C10_W0(32'h3c994966), .K14_C10_W1(32'hbdcf07c2), .K14_C10_W2(32'h3d6e9cb8), .K14_C10_W3(32'hbddb75fc), .K14_C10_W4(32'h3e05fec6), .K14_C10_W5(32'h3c05becc), .K14_C10_W6(32'hbde1128a), .K14_C10_W7(32'h3d57cadc), .K14_C10_W8(32'hbe0800dc), 
		.K14_C11_W0(32'h3dd8e42f), .K14_C11_W1(32'hbdb71625), .K14_C11_W2(32'hbd92b5b9), .K14_C11_W3(32'hbdc21d56), .K14_C11_W4(32'hbdaa05d0), .K14_C11_W5(32'hbd388dde), .K14_C11_W6(32'h3e262014), .K14_C11_W7(32'h3dc05524), .K14_C11_W8(32'hbde57cb5), 
		.K14_C12_W0(32'h3db92a58), .K14_C12_W1(32'hbdbda618), .K14_C12_W2(32'hbd17e909), .K14_C12_W3(32'h3d047afb), .K14_C12_W4(32'h3db15524), .K14_C12_W5(32'h3e00d644), .K14_C12_W6(32'hbdcf09b5), .K14_C12_W7(32'h3d8c2b29), .K14_C12_W8(32'hbc78e5f6), 
		.K14_C13_W0(32'h3b0dc631), .K14_C13_W1(32'hbd9f9a6d), .K14_C13_W2(32'hbd6c7f0c), .K14_C13_W3(32'h3df17358), .K14_C13_W4(32'hbd4cba02), .K14_C13_W5(32'h3e00fa46), .K14_C13_W6(32'hbe15ca22), .K14_C13_W7(32'hbd7921e9), .K14_C13_W8(32'h3c9596d5), 
		.K14_C14_W0(32'hbd9789b6), .K14_C14_W1(32'hbbe74655), .K14_C14_W2(32'h3d9c6a9e), .K14_C14_W3(32'hbdc2597d), .K14_C14_W4(32'hbd77a926), .K14_C14_W5(32'h3d642846), .K14_C14_W6(32'h3dbe9520), .K14_C14_W7(32'h3d126987), .K14_C14_W8(32'h3d6d34da), 
		.K14_C15_W0(32'hbd656154), .K14_C15_W1(32'hbd443775), .K14_C15_W2(32'hbdfd9ad5), .K14_C15_W3(32'h3d52919c), .K14_C15_W4(32'h3d4f956d), .K14_C15_W5(32'hbca34dc4), .K14_C15_W6(32'hbdd2d077), .K14_C15_W7(32'h3dfc9f0f), .K14_C15_W8(32'hbdc42bf7), 
		.K14_BIAS (32'hba8b09b8),

		.K15_C0_W0(32'h3d592cb4), .K15_C0_W1(32'h3db45944), .K15_C0_W2(32'h3c94ae72), .K15_C0_W3(32'hbe0f1aa8), .K15_C0_W4(32'hbc120a59), .K15_C0_W5(32'h3de49053), .K15_C0_W6(32'hbdf4e055), .K15_C0_W7(32'hbc9d1fff), .K15_C0_W8(32'h3b007f27), 
		.K15_C1_W0(32'hbdc1fb66), .K15_C1_W1(32'h3db91141), .K15_C1_W2(32'h3dfcd166), .K15_C1_W3(32'hbb2205cf), .K15_C1_W4(32'hbe1eb115), .K15_C1_W5(32'hb95fed70), .K15_C1_W6(32'hbca9e780), .K15_C1_W7(32'hba75e614), .K15_C1_W8(32'h3e0ecf46), 
		.K15_C2_W0(32'hbdf69809), .K15_C2_W1(32'hbd28d3fe), .K15_C2_W2(32'hbe1842b5), .K15_C2_W3(32'hbd99fadf), .K15_C2_W4(32'hbd0ff8e5), .K15_C2_W5(32'h3e003eff), .K15_C2_W6(32'hbc4bbb0a), .K15_C2_W7(32'h3d9eeaf2), .K15_C2_W8(32'hbc02dfe6), 
		.K15_C3_W0(32'h3d077783), .K15_C3_W1(32'h3cbd2aa4), .K15_C3_W2(32'hbe1c3217), .K15_C3_W3(32'hbd8076d8), .K15_C3_W4(32'hbd70417f), .K15_C3_W5(32'h3d230160), .K15_C3_W6(32'hbdc1bc84), .K15_C3_W7(32'h3bd43585), .K15_C3_W8(32'hbdb090fc), 
		.K15_C4_W0(32'hbd2a445e), .K15_C4_W1(32'h3d9d6a7c), .K15_C4_W2(32'hbd9cec9e), .K15_C4_W3(32'h3cd50a83), .K15_C4_W4(32'h3d40762b), .K15_C4_W5(32'h3d62fa1f), .K15_C4_W6(32'h3da432fd), .K15_C4_W7(32'h3da9fd26), .K15_C4_W8(32'h3d5b108e), 
		.K15_C5_W0(32'h3db5473e), .K15_C5_W1(32'h3e191e41), .K15_C5_W2(32'hbdea2953), .K15_C5_W3(32'h3e100ce2), .K15_C5_W4(32'h3df6eab1), .K15_C5_W5(32'hbd8692d7), .K15_C5_W6(32'h3df153d4), .K15_C5_W7(32'h3dbd3b54), .K15_C5_W8(32'hbdc3903d), 
		.K15_C6_W0(32'hbe442341), .K15_C6_W1(32'hbdebd043), .K15_C6_W2(32'hbc931733), .K15_C6_W3(32'h3d0f97ec), .K15_C6_W4(32'hbd5eb56f), .K15_C6_W5(32'h3d87f4b1), .K15_C6_W6(32'hbd4c3bef), .K15_C6_W7(32'hbdb00b68), .K15_C6_W8(32'hbc828f87), 
		.K15_C7_W0(32'hbdccd572), .K15_C7_W1(32'h3d36ecf8), .K15_C7_W2(32'hbdad168e), .K15_C7_W3(32'hbdd6743d), .K15_C7_W4(32'h3e013c34), .K15_C7_W5(32'hbdd7faad), .K15_C7_W6(32'hbdce3701), .K15_C7_W7(32'h3b81186e), .K15_C7_W8(32'h3d2423a8), 
		.K15_C8_W0(32'h3d9d69cd), .K15_C8_W1(32'h3df33603), .K15_C8_W2(32'hbd6d8bed), .K15_C8_W3(32'h3e28816a), .K15_C8_W4(32'hbdfed1ae), .K15_C8_W5(32'h3e07de63), .K15_C8_W6(32'h3d6bf2c2), .K15_C8_W7(32'h3df13380), .K15_C8_W8(32'h3e09e091), 
		.K15_C9_W0(32'h3c60d546), .K15_C9_W1(32'hbe023e61), .K15_C9_W2(32'h3d11fafc), .K15_C9_W3(32'h3d9cf61c), .K15_C9_W4(32'h3d44fcbf), .K15_C9_W5(32'h3da77da8), .K15_C9_W6(32'h3d362d6e), .K15_C9_W7(32'h3de89e85), .K15_C9_W8(32'h3d9c7655), 
		.K15_C10_W0(32'hbde457b3), .K15_C10_W1(32'hbd9ecadb), .K15_C10_W2(32'h3d326ed0), .K15_C10_W3(32'h3d82ed66), .K15_C10_W4(32'hbdf9dcf4), .K15_C10_W5(32'h3d59fe3e), .K15_C10_W6(32'hbdc91ef8), .K15_C10_W7(32'hbb2d86cc), .K15_C10_W8(32'h3c978ac3), 
		.K15_C11_W0(32'hbdace967), .K15_C11_W1(32'hbdb8bd9b), .K15_C11_W2(32'h3d4067a8), .K15_C11_W3(32'hbdf5f43d), .K15_C11_W4(32'hbbae1912), .K15_C11_W5(32'h3d7032e5), .K15_C11_W6(32'h3e10d406), .K15_C11_W7(32'h3dbffacb), .K15_C11_W8(32'hbd941686), 
		.K15_C12_W0(32'h3d9206e8), .K15_C12_W1(32'hbd383df8), .K15_C12_W2(32'hbd32b00b), .K15_C12_W3(32'h3cfd01fe), .K15_C12_W4(32'hbdf87ae2), .K15_C12_W5(32'hbd670e56), .K15_C12_W6(32'h3daa780f), .K15_C12_W7(32'hbe017f94), .K15_C12_W8(32'h3d8aae76), 
		.K15_C13_W0(32'h3c8d03da), .K15_C13_W1(32'h3df647f4), .K15_C13_W2(32'h3deeedc0), .K15_C13_W3(32'hbdccdb58), .K15_C13_W4(32'h3ccf6b1a), .K15_C13_W5(32'h3df50af7), .K15_C13_W6(32'h3cfcb42e), .K15_C13_W7(32'hbd53911e), .K15_C13_W8(32'hbd4f3734), 
		.K15_C14_W0(32'h3e366cb8), .K15_C14_W1(32'h3e01a973), .K15_C14_W2(32'h3d053db6), .K15_C14_W3(32'h3e1389fe), .K15_C14_W4(32'hbd337b1d), .K15_C14_W5(32'hbdec5d87), .K15_C14_W6(32'hbdd6eccf), .K15_C14_W7(32'h3dd60c89), .K15_C14_W8(32'hbdfcbbe5), 
		.K15_C15_W0(32'h3e170e8f), .K15_C15_W1(32'hbdaaabb7), .K15_C15_W2(32'h3dd8b3db), .K15_C15_W3(32'hbdb1a0ae), .K15_C15_W4(32'h3ce9260b), .K15_C15_W5(32'hbdc46f69), .K15_C15_W6(32'hbdde7397), .K15_C15_W7(32'h3d9c14e1), .K15_C15_W8(32'hbdb93c15), 
		.K15_BIAS (32'h3d34f629)
		)
		block4_conv3(
		.clk(clk),
		.resetn(resetn),
		.data_valid_in(conv_valid_out_4_2),
		.data_in_0(conv_out_4_2[0]),
		.data_in_1(conv_out_4_2[1]),
		.data_in_2(conv_out_4_2[2]),
		.data_in_3(conv_out_4_2[3]),
		.data_in_4(conv_out_4_2[4]),
		.data_in_5(conv_out_4_2[5]),
		.data_in_6(conv_out_4_2[6]),
		.data_in_7(conv_out_4_2[7]),
		.data_in_8(conv_out_4_2[8]),
		.data_in_9(conv_out_4_2[9]),
		.data_in_10(conv_out_4_2[10]),
		.data_in_11(conv_out_4_2[11]),
		.data_in_12(conv_out_4_2[12]),
		.data_in_13(conv_out_4_2[13]),
		.data_in_14(conv_out_4_2[14]),
		.data_in_15(conv_out_4_2[15]),
		.data_out_conv_0(conv_out_4_3[0]),
		.data_out_conv_1(conv_out_4_3[1]),
		.data_out_conv_2(conv_out_4_3[2]),
		.data_out_conv_3(conv_out_4_3[3]),
		.data_out_conv_4(conv_out_4_3[4]),
		.data_out_conv_5(conv_out_4_3[5]),
		.data_out_conv_6(conv_out_4_3[6]),
		.data_out_conv_7(conv_out_4_3[7]),
		.data_out_conv_8(conv_out_4_3[8]),
		.data_out_conv_9(conv_out_4_3[9]),
		.data_out_conv_10(conv_out_4_3[10]),
		.data_out_conv_11(conv_out_4_3[11]),
		.data_out_conv_12(conv_out_4_3[12]),
		.data_out_conv_13(conv_out_4_3[13]),
		.data_out_conv_14(conv_out_4_3[14]),
		.data_out_conv_15(conv_out_4_3[15]),
		.valid_out_pixel(conv_valid_out_4_3),
		.done(done_conv_4_3)
		);




    generate
    for (i = 0; i < CHANNEL_OUT*2; i=i+1) 
    begin : relu_4_3 // needs CHANNEL_OUT*2 relu		// Edit here - name

        activate #(
            .DATA_WIDTH(32)
        )
        relu (
            .in(conv_out_4_3[i]),			// Edit here
            .out(relu_out_4_3[i])
        );
    end
    endgenerate

    generate
    for (i = 0; i < CHANNEL_OUT*2; i=i+1) 
    begin : max_pool_4 // needs CHANNEL_OUT*2 max_pooling		// Edit here - name

        max_pooling #(
            .DATA_WIDTH(32),
            .WIDTH(WIDTH/8),
            .HEIGHT(HEIGHT/8)
        )
        max_pool(
            .clk(clk),
			.ack(done_conv_4_3),					// Edit here
            .resetn(resetn),
            .valid_in(conv_valid_out_4_3),			// Edit here
            .data_in(relu_out_4_3[i]),
            .data_out(data_out_pool_4_3[i]),
            .valid_out(valid_out_pool_4_3[i]),
            .done(done_pool_4_3[i])
        );
    end
    endgenerate




    // ------------ BLOCK 5 ------------
	conv3d_16_kernel_16_channel_size_3 #(
		.DATA_WIDTH(32),.IMG_WIDTH(WIDTH/16),.IMG_HEIGHT(HEIGHT/16),	// Edit here
		.K0_C0_W0(32'h3de2b41e), .K0_C0_W1(32'h3d6c3cb3), .K0_C0_W2(32'h3e0bbdf5), .K0_C0_W3(32'hbde378ca), .K0_C0_W4(32'hbdf12877), .K0_C0_W5(32'h3dd9f5c1), .K0_C0_W6(32'h3dbeee67), .K0_C0_W7(32'hbde74dba), .K0_C0_W8(32'h3e0ffaa9), 
		.K0_C1_W0(32'h3dad775a), .K0_C1_W1(32'hbe067455), .K0_C1_W2(32'h3d882864), .K0_C1_W3(32'h3e19d2d6), .K0_C1_W4(32'h3dee30d6), .K0_C1_W5(32'h3d4b6548), .K0_C1_W6(32'hbdc7545d), .K0_C1_W7(32'h3ddaf733), .K0_C1_W8(32'hbdaf348c), 
		.K0_C2_W0(32'hbe0cf991), .K0_C2_W1(32'h3d6bfd91), .K0_C2_W2(32'h3d6723d1), .K0_C2_W3(32'h3d864215), .K0_C2_W4(32'h3cbdfb81), .K0_C2_W5(32'h3d318ade), .K0_C2_W6(32'h3dceadb0), .K0_C2_W7(32'h3dc240d2), .K0_C2_W8(32'hbdaa8eac), 
		.K0_C3_W0(32'h3c8ecb52), .K0_C3_W1(32'h3ddb2aa2), .K0_C3_W2(32'hbd0754d4), .K0_C3_W3(32'hbc15ad2c), .K0_C3_W4(32'hba70efce), .K0_C3_W5(32'hbd1fc71d), .K0_C3_W6(32'hbdd641c4), .K0_C3_W7(32'hbd19d58e), .K0_C3_W8(32'hbc8c5303), 
		.K0_C4_W0(32'hbc7c4dab), .K0_C4_W1(32'h3d4beb7e), .K0_C4_W2(32'h3dce99e0), .K0_C4_W3(32'hbca92060), .K0_C4_W4(32'hbd3c6d61), .K0_C4_W5(32'hbe0c389e), .K0_C4_W6(32'h3dcedee0), .K0_C4_W7(32'hbc5ae0a9), .K0_C4_W8(32'h3d9ef6a9), 
		.K0_C5_W0(32'h3e1e446d), .K0_C5_W1(32'hbe11a741), .K0_C5_W2(32'hbe0ba081), .K0_C5_W3(32'h3d3519a6), .K0_C5_W4(32'h3db9e300), .K0_C5_W5(32'h3e04c94e), .K0_C5_W6(32'hbd5080cb), .K0_C5_W7(32'hbe19bb42), .K0_C5_W8(32'h3d25cb7f), 
		.K0_C6_W0(32'h3dea2872), .K0_C6_W1(32'hbdb85f98), .K0_C6_W2(32'h3dfac6a3), .K0_C6_W3(32'hbc8d9d66), .K0_C6_W4(32'h3da2babc), .K0_C6_W5(32'h3e163544), .K0_C6_W6(32'h3c406735), .K0_C6_W7(32'h3dd1138c), .K0_C6_W8(32'h3e475944), 
		.K0_C7_W0(32'h3da7f394), .K0_C7_W1(32'h3c2c7176), .K0_C7_W2(32'h3c873a9e), .K0_C7_W3(32'hbd392820), .K0_C7_W4(32'h3e3a9e0e), .K0_C7_W5(32'hbd84a43f), .K0_C7_W6(32'h3d0b20b6), .K0_C7_W7(32'hbca7746e), .K0_C7_W8(32'hbda16f7e), 
		.K0_C8_W0(32'h3c89a0a5), .K0_C8_W1(32'hbdf58345), .K0_C8_W2(32'hbe0cfed7), .K0_C8_W3(32'hbdf554da), .K0_C8_W4(32'h3de291b2), .K0_C8_W5(32'h3e0bf4a9), .K0_C8_W6(32'hbcbd3efa), .K0_C8_W7(32'h3c85bde7), .K0_C8_W8(32'h3e10a02f), 
		.K0_C9_W0(32'h3ceecf21), .K0_C9_W1(32'hbdf0a21f), .K0_C9_W2(32'hbdcc5f99), .K0_C9_W3(32'hbb465bbb), .K0_C9_W4(32'h3dfd47a1), .K0_C9_W5(32'hbd4320d9), .K0_C9_W6(32'hbce38240), .K0_C9_W7(32'hbe21fef7), .K0_C9_W8(32'hbe0e14cb), 
		.K0_C10_W0(32'hbb8fc1ab), .K0_C10_W1(32'hbcff5ef7), .K0_C10_W2(32'hbcb9c9d7), .K0_C10_W3(32'hbd1c2cfd), .K0_C10_W4(32'h3d9439d3), .K0_C10_W5(32'hbde5e965), .K0_C10_W6(32'h3cfdf296), .K0_C10_W7(32'hbdc7a1e8), .K0_C10_W8(32'h3da004ad), 
		.K0_C11_W0(32'h3d0b6bcf), .K0_C11_W1(32'hbd3eaac4), .K0_C11_W2(32'h3d2e4851), .K0_C11_W3(32'h3d155fa3), .K0_C11_W4(32'h3deef882), .K0_C11_W5(32'h3dfe081b), .K0_C11_W6(32'h3d44ecdb), .K0_C11_W7(32'h3d2855fc), .K0_C11_W8(32'hbd870f83), 
		.K0_C12_W0(32'hbdf09006), .K0_C12_W1(32'hbdcc1680), .K0_C12_W2(32'hbe37ceb5), .K0_C12_W3(32'h3df58f10), .K0_C12_W4(32'hbd9cd4c7), .K0_C12_W5(32'hbcec15a9), .K0_C12_W6(32'h3d0fea6c), .K0_C12_W7(32'h3e0552ab), .K0_C12_W8(32'h3d8e6893), 
		.K0_C13_W0(32'h3e01eb49), .K0_C13_W1(32'h3d3e6864), .K0_C13_W2(32'h39b625c9), .K0_C13_W3(32'h3d1b4ec9), .K0_C13_W4(32'h3d07f0e7), .K0_C13_W5(32'hbd004146), .K0_C13_W6(32'h3d8e1e0f), .K0_C13_W7(32'h3cacbb96), .K0_C13_W8(32'hbdc4190d), 
		.K0_C14_W0(32'h3c96e1f8), .K0_C14_W1(32'hbd99cf94), .K0_C14_W2(32'hbe02f4d5), .K0_C14_W3(32'h3d044c69), .K0_C14_W4(32'hbe0cb141), .K0_C14_W5(32'hbe16fd73), .K0_C14_W6(32'hbe2704a0), .K0_C14_W7(32'hbdddd673), .K0_C14_W8(32'hbc62d361), 
		.K0_C15_W0(32'hbd45d122), .K0_C15_W1(32'h3d079991), .K0_C15_W2(32'h3dc4ee2e), .K0_C15_W3(32'hbd82c84c), .K0_C15_W4(32'hbba4d345), .K0_C15_W5(32'hbc7c4f18), .K0_C15_W6(32'hbda63e2e), .K0_C15_W7(32'h3d8aba82), .K0_C15_W8(32'hbd5a9cb2), 
		.K0_BIAS (32'hbc74d63e),

		.K1_C0_W0(32'h3dbc6b5b), .K1_C0_W1(32'hbce51b65), .K1_C0_W2(32'h3df1d6af), .K1_C0_W3(32'h3be555bc), .K1_C0_W4(32'h3dd15e95), .K1_C0_W5(32'h3bb24618), .K1_C0_W6(32'hbc3931a3), .K1_C0_W7(32'hbd2d400c), .K1_C0_W8(32'hbd4c9c18), 
		.K1_C1_W0(32'hbd7063dd), .K1_C1_W1(32'hbda79f1f), .K1_C1_W2(32'hbce11ab5), .K1_C1_W3(32'h3c9864a1), .K1_C1_W4(32'hbd8163f8), .K1_C1_W5(32'h3d882b8f), .K1_C1_W6(32'h3d184a78), .K1_C1_W7(32'h3d70e522), .K1_C1_W8(32'h3df27a83), 
		.K1_C2_W0(32'h3dfcbe41), .K1_C2_W1(32'h3e079028), .K1_C2_W2(32'hbe01742b), .K1_C2_W3(32'hbca1864a), .K1_C2_W4(32'hbd51f063), .K1_C2_W5(32'hbcb128c0), .K1_C2_W6(32'h3cfc3e60), .K1_C2_W7(32'hbd3caa91), .K1_C2_W8(32'h3c3d2b26), 
		.K1_C3_W0(32'h3e249ca0), .K1_C3_W1(32'hbd64a351), .K1_C3_W2(32'hbe01f2b1), .K1_C3_W3(32'hbc4df3a1), .K1_C3_W4(32'h3dbe2d36), .K1_C3_W5(32'h3c975f51), .K1_C3_W6(32'hbdc46b15), .K1_C3_W7(32'h3d0392e4), .K1_C3_W8(32'h3cf341ed), 
		.K1_C4_W0(32'hbd64de7f), .K1_C4_W1(32'h3db82675), .K1_C4_W2(32'hbdd8156e), .K1_C4_W3(32'h3bae9464), .K1_C4_W4(32'h3d76d12d), .K1_C4_W5(32'hbd9e042f), .K1_C4_W6(32'hbce53524), .K1_C4_W7(32'hbdeef841), .K1_C4_W8(32'h3e1b9cef), 
		.K1_C5_W0(32'hbb7934ac), .K1_C5_W1(32'hbdecac9b), .K1_C5_W2(32'h3cde8204), .K1_C5_W3(32'h3ccbc680), .K1_C5_W4(32'h3d4e6c47), .K1_C5_W5(32'h3d80b2e2), .K1_C5_W6(32'hbd734588), .K1_C5_W7(32'h3cb00e6f), .K1_C5_W8(32'hbd0b3dcb), 
		.K1_C6_W0(32'hbd04c8d4), .K1_C6_W1(32'h3d15252a), .K1_C6_W2(32'h3d6cacfe), .K1_C6_W3(32'h3d863a3d), .K1_C6_W4(32'h3d391c17), .K1_C6_W5(32'hbca18a65), .K1_C6_W6(32'h3da360ce), .K1_C6_W7(32'hbe2d9607), .K1_C6_W8(32'hbd3a7612), 
		.K1_C7_W0(32'hbdc1f862), .K1_C7_W1(32'hbdf1c0ea), .K1_C7_W2(32'hbc97ba29), .K1_C7_W3(32'hbde4978f), .K1_C7_W4(32'hbdc818aa), .K1_C7_W5(32'hbd9d9533), .K1_C7_W6(32'hbb48117e), .K1_C7_W7(32'hbdd1f1fa), .K1_C7_W8(32'h3d78c274), 
		.K1_C8_W0(32'hbdac82bd), .K1_C8_W1(32'h3d8481d5), .K1_C8_W2(32'hbd804d40), .K1_C8_W3(32'hbc5f8bda), .K1_C8_W4(32'hbc8c574a), .K1_C8_W5(32'hbd9c6284), .K1_C8_W6(32'h3dd5e248), .K1_C8_W7(32'hbcdca690), .K1_C8_W8(32'h3de53dde), 
		.K1_C9_W0(32'h3e168bd1), .K1_C9_W1(32'h3c46704d), .K1_C9_W2(32'hbe14d437), .K1_C9_W3(32'hbd3d3fc5), .K1_C9_W4(32'hbd40587f), .K1_C9_W5(32'hbd36c68b), .K1_C9_W6(32'hbdc9f393), .K1_C9_W7(32'hbd7e832c), .K1_C9_W8(32'hbd8801e5), 
		.K1_C10_W0(32'hbe0aadf2), .K1_C10_W1(32'hbd44652b), .K1_C10_W2(32'hbd5552df), .K1_C10_W3(32'h3cb91951), .K1_C10_W4(32'hbd98a1e3), .K1_C10_W5(32'h3bea5ae6), .K1_C10_W6(32'hbd1c9d45), .K1_C10_W7(32'hbda5d799), .K1_C10_W8(32'hbd0c5bbd), 
		.K1_C11_W0(32'h3ca5e6b6), .K1_C11_W1(32'h3d2afb1d), .K1_C11_W2(32'hbce90503), .K1_C11_W3(32'h3dbafe91), .K1_C11_W4(32'h3c8ec645), .K1_C11_W5(32'hbce3b83a), .K1_C11_W6(32'h3ddb56e7), .K1_C11_W7(32'hbc55f065), .K1_C11_W8(32'h3ddd70b2), 
		.K1_C12_W0(32'h3d85b1da), .K1_C12_W1(32'h3def09b7), .K1_C12_W2(32'hbe0cd89f), .K1_C12_W3(32'hbcc8ac00), .K1_C12_W4(32'h3ded790d), .K1_C12_W5(32'h3de0d326), .K1_C12_W6(32'hbbb0e539), .K1_C12_W7(32'h3e1e1f9e), .K1_C12_W8(32'hbd83665a), 
		.K1_C13_W0(32'hbcdd7338), .K1_C13_W1(32'h3d0436e1), .K1_C13_W2(32'hbd9e7aea), .K1_C13_W3(32'h3dbe5b34), .K1_C13_W4(32'h3ddaccfe), .K1_C13_W5(32'hbdbbd838), .K1_C13_W6(32'hbd8d3150), .K1_C13_W7(32'h3d2eb127), .K1_C13_W8(32'h3cf00a5e), 
		.K1_C14_W0(32'h3d9d1746), .K1_C14_W1(32'h3c4e6506), .K1_C14_W2(32'hbc29e231), .K1_C14_W3(32'hbe028c37), .K1_C14_W4(32'hbdf5582e), .K1_C14_W5(32'hbccae300), .K1_C14_W6(32'h3cff2f94), .K1_C14_W7(32'h3b2b2169), .K1_C14_W8(32'hbe065f2e), 
		.K1_C15_W0(32'h3e01a9ba), .K1_C15_W1(32'hbd2ed7c1), .K1_C15_W2(32'h3dadb804), .K1_C15_W3(32'h3d1cfe54), .K1_C15_W4(32'h3d675585), .K1_C15_W5(32'hbdb336da), .K1_C15_W6(32'h3c4170a2), .K1_C15_W7(32'hbc0bff44), .K1_C15_W8(32'h3db0eb67), 
		.K1_BIAS (32'h3caf4b73),

		.K2_C0_W0(32'h3cd21c8e), .K2_C0_W1(32'hbd3a0582), .K2_C0_W2(32'hbd1897b6), .K2_C0_W3(32'h3d94268d), .K2_C0_W4(32'hbd4c3042), .K2_C0_W5(32'hbdcb1e2a), .K2_C0_W6(32'hbdbe3fe2), .K2_C0_W7(32'hbce39b7d), .K2_C0_W8(32'hbd4fedbd), 
		.K2_C1_W0(32'h3e0024ac), .K2_C1_W1(32'h3dd7dbf3), .K2_C1_W2(32'h3df07126), .K2_C1_W3(32'h3d16d0a1), .K2_C1_W4(32'h3dec919e), .K2_C1_W5(32'h3df25776), .K2_C1_W6(32'h3d648ec6), .K2_C1_W7(32'h3e13bc81), .K2_C1_W8(32'h3c11669d), 
		.K2_C2_W0(32'hbdc42e69), .K2_C2_W1(32'hbdba56dd), .K2_C2_W2(32'hbe0aea68), .K2_C2_W3(32'h3d8cab12), .K2_C2_W4(32'h3d8c8dab), .K2_C2_W5(32'hbd6bafb7), .K2_C2_W6(32'hbca43893), .K2_C2_W7(32'h3e19d176), .K2_C2_W8(32'h3db3a82f), 
		.K2_C3_W0(32'hbd438b9e), .K2_C3_W1(32'h3ddcd678), .K2_C3_W2(32'hbdf9b7fa), .K2_C3_W3(32'h3daf2bbf), .K2_C3_W4(32'h3adaa1f0), .K2_C3_W5(32'h3d2fd636), .K2_C3_W6(32'h3e1dc8e9), .K2_C3_W7(32'h3cbaca37), .K2_C3_W8(32'h3ddb94dc), 
		.K2_C4_W0(32'hbc9e2f2b), .K2_C4_W1(32'hbe15bca7), .K2_C4_W2(32'hbde30910), .K2_C4_W3(32'h3e22cc1f), .K2_C4_W4(32'hbd22307d), .K2_C4_W5(32'h3deb8bd2), .K2_C4_W6(32'h3d733313), .K2_C4_W7(32'h3c94fb25), .K2_C4_W8(32'hbdc564a1), 
		.K2_C5_W0(32'h3db19c95), .K2_C5_W1(32'h3cb33310), .K2_C5_W2(32'h3ca9f04d), .K2_C5_W3(32'hbdabbf8b), .K2_C5_W4(32'h3d301f0d), .K2_C5_W5(32'hbdb02021), .K2_C5_W6(32'hbbd7be24), .K2_C5_W7(32'hbd971942), .K2_C5_W8(32'hbce02397), 
		.K2_C6_W0(32'h3da35b6f), .K2_C6_W1(32'hbd1c60f1), .K2_C6_W2(32'hbc949d40), .K2_C6_W3(32'h3e02214c), .K2_C6_W4(32'hbce371e1), .K2_C6_W5(32'h3da6c6d0), .K2_C6_W6(32'hbde784cb), .K2_C6_W7(32'h3dd09195), .K2_C6_W8(32'h3cccb77c), 
		.K2_C7_W0(32'h3e472a97), .K2_C7_W1(32'hbc528896), .K2_C7_W2(32'h3dee3bb7), .K2_C7_W3(32'h3dc11c2a), .K2_C7_W4(32'h3d7b6183), .K2_C7_W5(32'h3e373b3f), .K2_C7_W6(32'h3b36b86e), .K2_C7_W7(32'h3da49c49), .K2_C7_W8(32'hbdcdacab), 
		.K2_C8_W0(32'h3e0aa0b2), .K2_C8_W1(32'hbcca8b88), .K2_C8_W2(32'h3db16ee1), .K2_C8_W3(32'hbd32157a), .K2_C8_W4(32'hbcd633bc), .K2_C8_W5(32'hbd9c6daf), .K2_C8_W6(32'hbbb2217f), .K2_C8_W7(32'hbdeecdb1), .K2_C8_W8(32'h3dcfcc30), 
		.K2_C9_W0(32'hbced1bef), .K2_C9_W1(32'h3dff872a), .K2_C9_W2(32'hbd0af89c), .K2_C9_W3(32'hbe0741bd), .K2_C9_W4(32'hbda2544a), .K2_C9_W5(32'hbe0e0520), .K2_C9_W6(32'hbbb35b4a), .K2_C9_W7(32'h3e02c074), .K2_C9_W8(32'hbd811d6d), 
		.K2_C10_W0(32'h3d3a3976), .K2_C10_W1(32'hbd9c8db6), .K2_C10_W2(32'h3d78bfd2), .K2_C10_W3(32'hbd2083f3), .K2_C10_W4(32'h3dc408a5), .K2_C10_W5(32'hbd241ece), .K2_C10_W6(32'hbc714fa6), .K2_C10_W7(32'hbda00438), .K2_C10_W8(32'hbe2d38fe), 
		.K2_C11_W0(32'h3e07cbe8), .K2_C11_W1(32'h3c2286fd), .K2_C11_W2(32'h3e2a4b3d), .K2_C11_W3(32'h3d414ff3), .K2_C11_W4(32'h3d9856d0), .K2_C11_W5(32'h3cffdf6f), .K2_C11_W6(32'h3def2f1c), .K2_C11_W7(32'hbe09302b), .K2_C11_W8(32'h3db948c6), 
		.K2_C12_W0(32'hbcb0f961), .K2_C12_W1(32'hbd941196), .K2_C12_W2(32'h3d0e2d28), .K2_C12_W3(32'hbe027950), .K2_C12_W4(32'h3d244f32), .K2_C12_W5(32'h3dcd0ee0), .K2_C12_W6(32'hbcc37359), .K2_C12_W7(32'h3e1d3115), .K2_C12_W8(32'h3cba3e43), 
		.K2_C13_W0(32'hbd9a756d), .K2_C13_W1(32'h3df73ed3), .K2_C13_W2(32'h3d0d60c5), .K2_C13_W3(32'hbdf6a864), .K2_C13_W4(32'h3c911c70), .K2_C13_W5(32'h3e1befd5), .K2_C13_W6(32'h3c955b57), .K2_C13_W7(32'hbc84fcdb), .K2_C13_W8(32'h3d9bbd86), 
		.K2_C14_W0(32'h3dc5a604), .K2_C14_W1(32'hbc424820), .K2_C14_W2(32'h3cf64b53), .K2_C14_W3(32'h3d8aa91f), .K2_C14_W4(32'hbd857f72), .K2_C14_W5(32'h3e0de147), .K2_C14_W6(32'hbd7e3afc), .K2_C14_W7(32'hb9842b70), .K2_C14_W8(32'h3d095f1e), 
		.K2_C15_W0(32'h3ce1ffd2), .K2_C15_W1(32'h3e26da12), .K2_C15_W2(32'h3d9df1c0), .K2_C15_W3(32'hbd08a776), .K2_C15_W4(32'hbde6605c), .K2_C15_W5(32'h3dba0335), .K2_C15_W6(32'h3e18af58), .K2_C15_W7(32'hbd80535d), .K2_C15_W8(32'hbd9ec627), 
		.K2_BIAS (32'hbbbfd0ce),

		.K3_C0_W0(32'hbdb63c10), .K3_C0_W1(32'hbd995030), .K3_C0_W2(32'h3df4feaa), .K3_C0_W3(32'h3db351da), .K3_C0_W4(32'hbe05f060), .K3_C0_W5(32'h3bc66c0c), .K3_C0_W6(32'h3dad0b66), .K3_C0_W7(32'hbd9447cc), .K3_C0_W8(32'h3c745143), 
		.K3_C1_W0(32'h3e0611a0), .K3_C1_W1(32'hbdde9d83), .K3_C1_W2(32'h3db636fb), .K3_C1_W3(32'hbe1b6cef), .K3_C1_W4(32'h3d9be141), .K3_C1_W5(32'h3dcc5e41), .K3_C1_W6(32'hbddddc8e), .K3_C1_W7(32'h3da8f072), .K3_C1_W8(32'h3d0eaf3e), 
		.K3_C2_W0(32'h3b22a731), .K3_C2_W1(32'hbce36907), .K3_C2_W2(32'hbc18b4f9), .K3_C2_W3(32'h3d130f51), .K3_C2_W4(32'h3d10f4b9), .K3_C2_W5(32'hbdc5c435), .K3_C2_W6(32'h3d1b2c9a), .K3_C2_W7(32'hbd987209), .K3_C2_W8(32'hbd95a1e9), 
		.K3_C3_W0(32'hbcc35743), .K3_C3_W1(32'h3d5b6a50), .K3_C3_W2(32'h3b927737), .K3_C3_W3(32'hbc0f10f6), .K3_C3_W4(32'h3bc55ba6), .K3_C3_W5(32'hbd8f4baa), .K3_C3_W6(32'hbdb0d5a0), .K3_C3_W7(32'h3c454a8c), .K3_C3_W8(32'h3dcfd9c3), 
		.K3_C4_W0(32'h3d22b1a8), .K3_C4_W1(32'h3d113ee0), .K3_C4_W2(32'h3dfbefe5), .K3_C4_W3(32'h3d92a282), .K3_C4_W4(32'hbcdb0b89), .K3_C4_W5(32'hbe1d12f3), .K3_C4_W6(32'hbe17cf63), .K3_C4_W7(32'hbd9bf312), .K3_C4_W8(32'hbe0246f3), 
		.K3_C5_W0(32'hbe296fca), .K3_C5_W1(32'hbcb8e5af), .K3_C5_W2(32'h3c4f46d6), .K3_C5_W3(32'hbd792489), .K3_C5_W4(32'h3d53ab48), .K3_C5_W5(32'hbd6e3b08), .K3_C5_W6(32'h3abb0453), .K3_C5_W7(32'hbd50fb5c), .K3_C5_W8(32'h3c13c080), 
		.K3_C6_W0(32'hbb6fc6de), .K3_C6_W1(32'h3cd469f2), .K3_C6_W2(32'h3d080abb), .K3_C6_W3(32'hbda84d23), .K3_C6_W4(32'hbd799b97), .K3_C6_W5(32'hbcb59675), .K3_C6_W6(32'h3de8bc26), .K3_C6_W7(32'hbd92f88b), .K3_C6_W8(32'hbc7c8703), 
		.K3_C7_W0(32'h3e1382b0), .K3_C7_W1(32'hbd4c64cf), .K3_C7_W2(32'h3d730478), .K3_C7_W3(32'hbd97cea4), .K3_C7_W4(32'hbc9a7adc), .K3_C7_W5(32'hbdc3ebc3), .K3_C7_W6(32'h3e00723f), .K3_C7_W7(32'hbdbe0ef7), .K3_C7_W8(32'hbdc147a5), 
		.K3_C8_W0(32'hbe02a91d), .K3_C8_W1(32'hbd11c463), .K3_C8_W2(32'h3d4b6d8d), .K3_C8_W3(32'hbdf770ad), .K3_C8_W4(32'hbd647e5a), .K3_C8_W5(32'h3ce21218), .K3_C8_W6(32'hbd28be56), .K3_C8_W7(32'hbe1414c1), .K3_C8_W8(32'h3d988b8b), 
		.K3_C9_W0(32'h3cfde936), .K3_C9_W1(32'hbdcd64a4), .K3_C9_W2(32'h3e0bbccc), .K3_C9_W3(32'hbd1a73aa), .K3_C9_W4(32'h3d587257), .K3_C9_W5(32'h3e19883f), .K3_C9_W6(32'hbc253c44), .K3_C9_W7(32'h3e0157c5), .K3_C9_W8(32'hbcc8fc16), 
		.K3_C10_W0(32'h3d7b635f), .K3_C10_W1(32'hbda15178), .K3_C10_W2(32'hbd4e1709), .K3_C10_W3(32'h3e17b109), .K3_C10_W4(32'hbd3b7cd8), .K3_C10_W5(32'h3e087080), .K3_C10_W6(32'hbb68218a), .K3_C10_W7(32'h3e20d88e), .K3_C10_W8(32'hbd78430d), 
		.K3_C11_W0(32'h3d4a9481), .K3_C11_W1(32'hbb5e35c3), .K3_C11_W2(32'hbddd9ae7), .K3_C11_W3(32'hbdd18fb5), .K3_C11_W4(32'hbc45253f), .K3_C11_W5(32'h3de941ce), .K3_C11_W6(32'h3d68f0b8), .K3_C11_W7(32'hbe00e892), .K3_C11_W8(32'h3de8f396), 
		.K3_C12_W0(32'hbde1ae1c), .K3_C12_W1(32'hbd371093), .K3_C12_W2(32'hbdd79d46), .K3_C12_W3(32'hbcb2cab7), .K3_C12_W4(32'hbc639a69), .K3_C12_W5(32'hbe0dfb57), .K3_C12_W6(32'h3dfb4805), .K3_C12_W7(32'hbdaf963a), .K3_C12_W8(32'h3cdc404d), 
		.K3_C13_W0(32'hbcdabe83), .K3_C13_W1(32'h3df4a197), .K3_C13_W2(32'h3dbfb16a), .K3_C13_W3(32'hbdc0ed72), .K3_C13_W4(32'h3cc97877), .K3_C13_W5(32'h3e01afa7), .K3_C13_W6(32'hbdb1e165), .K3_C13_W7(32'h3d640a36), .K3_C13_W8(32'hbd1c55de), 
		.K3_C14_W0(32'hbd519d59), .K3_C14_W1(32'hbe09027e), .K3_C14_W2(32'h3d79b6be), .K3_C14_W3(32'h3de5ce45), .K3_C14_W4(32'h3e16de25), .K3_C14_W5(32'h3e1304dd), .K3_C14_W6(32'hbd922bbc), .K3_C14_W7(32'h3df34f89), .K3_C14_W8(32'hbd2e66e5), 
		.K3_C15_W0(32'hbdc4127c), .K3_C15_W1(32'h3cca9415), .K3_C15_W2(32'h3e3a27f7), .K3_C15_W3(32'h3e2c3c4b), .K3_C15_W4(32'h3d2e224a), .K3_C15_W5(32'h3e279375), .K3_C15_W6(32'hbc1d7e14), .K3_C15_W7(32'h3d3fd11b), .K3_C15_W8(32'h3db39417), 
		.K3_BIAS (32'hbb4218d1),

		.K4_C0_W0(32'h3d30b1d5), .K4_C0_W1(32'hbdf79efd), .K4_C0_W2(32'h3cbc2e2d), .K4_C0_W3(32'h3cf537d2), .K4_C0_W4(32'h3dddb66b), .K4_C0_W5(32'h3d8fcb12), .K4_C0_W6(32'h3d8517a5), .K4_C0_W7(32'hbd155b74), .K4_C0_W8(32'hbe0d0f89), 
		.K4_C1_W0(32'h3d9a0614), .K4_C1_W1(32'hbc98e3ed), .K4_C1_W2(32'hbd9defa5), .K4_C1_W3(32'h3dd636da), .K4_C1_W4(32'hbd98ce37), .K4_C1_W5(32'h3c1cab95), .K4_C1_W6(32'h3b519f56), .K4_C1_W7(32'hbd8ebfe6), .K4_C1_W8(32'hbda7f52e), 
		.K4_C2_W0(32'hbd5d0a8d), .K4_C2_W1(32'hbe1e5673), .K4_C2_W2(32'h3c3fa301), .K4_C2_W3(32'h3e0bf4cf), .K4_C2_W4(32'h3d615953), .K4_C2_W5(32'hbe0f1c91), .K4_C2_W6(32'hbdc1ec2a), .K4_C2_W7(32'hbd7057c0), .K4_C2_W8(32'h3dd5dd70), 
		.K4_C3_W0(32'hbe0d1ac5), .K4_C3_W1(32'h3dcea876), .K4_C3_W2(32'h3dd8f7ef), .K4_C3_W3(32'hbdeea80e), .K4_C3_W4(32'hbdc0917f), .K4_C3_W5(32'hbe136a93), .K4_C3_W6(32'h3dfd38f5), .K4_C3_W7(32'h3d892be3), .K4_C3_W8(32'h3de8ebec), 
		.K4_C4_W0(32'h3cfd8a04), .K4_C4_W1(32'hbe1a049a), .K4_C4_W2(32'hbdca6758), .K4_C4_W3(32'hbda5f363), .K4_C4_W4(32'h3d6db392), .K4_C4_W5(32'hbdcf9b14), .K4_C4_W6(32'h3d3fa1ac), .K4_C4_W7(32'hbda19593), .K4_C4_W8(32'hbbecfb25), 
		.K4_C5_W0(32'h3d348384), .K4_C5_W1(32'hbc751cfc), .K4_C5_W2(32'hbd0fb8c2), .K4_C5_W3(32'hbe00839b), .K4_C5_W4(32'h3d7005f6), .K4_C5_W5(32'h3c582d36), .K4_C5_W6(32'h3df15727), .K4_C5_W7(32'hbd8ffffa), .K4_C5_W8(32'hbe18ef61), 
		.K4_C6_W0(32'h3d4ec8fe), .K4_C6_W1(32'hbdde78b7), .K4_C6_W2(32'h3bc3c747), .K4_C6_W3(32'h3d592234), .K4_C6_W4(32'hbd7dc911), .K4_C6_W5(32'hbdaf6fea), .K4_C6_W6(32'hbd4ee164), .K4_C6_W7(32'h3dc9df06), .K4_C6_W8(32'hbddf2e99), 
		.K4_C7_W0(32'h3d0ca0a2), .K4_C7_W1(32'h3dd2d1e5), .K4_C7_W2(32'hbe150164), .K4_C7_W3(32'hbc44c4f7), .K4_C7_W4(32'h3b8a6fe1), .K4_C7_W5(32'hbd60d8d1), .K4_C7_W6(32'hbdfac4ef), .K4_C7_W7(32'h3df0785e), .K4_C7_W8(32'hbd8e7586), 
		.K4_C8_W0(32'hbd265206), .K4_C8_W1(32'hbb238033), .K4_C8_W2(32'hbde0ff7f), .K4_C8_W3(32'hbe06c8c8), .K4_C8_W4(32'h3d5c9421), .K4_C8_W5(32'h3b13d4de), .K4_C8_W6(32'h3d630bd7), .K4_C8_W7(32'h3c03d920), .K4_C8_W8(32'h3dd49e50), 
		.K4_C9_W0(32'h3d456f84), .K4_C9_W1(32'hbe1599f4), .K4_C9_W2(32'hbdc03b07), .K4_C9_W3(32'hbd0108d9), .K4_C9_W4(32'hbe03a3b8), .K4_C9_W5(32'h3ca86c4d), .K4_C9_W6(32'h3c9c220f), .K4_C9_W7(32'hbca2b3f2), .K4_C9_W8(32'hbe211cc5), 
		.K4_C10_W0(32'h3da0a6c2), .K4_C10_W1(32'hbdbba0c7), .K4_C10_W2(32'h3d1d8a2d), .K4_C10_W3(32'hbd7c87f2), .K4_C10_W4(32'hbe13b1d6), .K4_C10_W5(32'hbd8d0a16), .K4_C10_W6(32'hbdab18b7), .K4_C10_W7(32'hbdefeae9), .K4_C10_W8(32'h3d97d478), 
		.K4_C11_W0(32'h3d821006), .K4_C11_W1(32'hbde3d9ea), .K4_C11_W2(32'hbcb22888), .K4_C11_W3(32'h3dd5c097), .K4_C11_W4(32'h3d16281a), .K4_C11_W5(32'hbe2fe79a), .K4_C11_W6(32'h3dbda30d), .K4_C11_W7(32'hbdbea558), .K4_C11_W8(32'hbe265282), 
		.K4_C12_W0(32'hbdd316ab), .K4_C12_W1(32'hbd995b2c), .K4_C12_W2(32'h3df94cde), .K4_C12_W3(32'h3e0985ad), .K4_C12_W4(32'hbdd28560), .K4_C12_W5(32'h3ba1dc64), .K4_C12_W6(32'hbcbb3381), .K4_C12_W7(32'hbdf825ba), .K4_C12_W8(32'hbd430901), 
		.K4_C13_W0(32'h3ddbd4e8), .K4_C13_W1(32'hbe0542c8), .K4_C13_W2(32'hbc65d98d), .K4_C13_W3(32'h3dc0a761), .K4_C13_W4(32'h3deee53a), .K4_C13_W5(32'h3d82ac86), .K4_C13_W6(32'h3caa5a1f), .K4_C13_W7(32'hbc19910e), .K4_C13_W8(32'hbd73ee73), 
		.K4_C14_W0(32'hbe14d9fa), .K4_C14_W1(32'hbc980be7), .K4_C14_W2(32'h3dc4551c), .K4_C14_W3(32'hbcd2fec9), .K4_C14_W4(32'h3d15222d), .K4_C14_W5(32'h3d20f7cd), .K4_C14_W6(32'hbddd2273), .K4_C14_W7(32'h3e0a822d), .K4_C14_W8(32'hbda79cef), 
		.K4_C15_W0(32'h3d8e2104), .K4_C15_W1(32'h3d7823f5), .K4_C15_W2(32'hbdb87990), .K4_C15_W3(32'h3c62006b), .K4_C15_W4(32'hbd28478e), .K4_C15_W5(32'hbe27f133), .K4_C15_W6(32'hbd111959), .K4_C15_W7(32'hbda6247c), .K4_C15_W8(32'hbe053b64), 
		.K4_BIAS (32'hbc0a482a),

		.K5_C0_W0(32'h3dbb9f9e), .K5_C0_W1(32'h3dd1c0e5), .K5_C0_W2(32'hbde14e83), .K5_C0_W3(32'h3d97a658), .K5_C0_W4(32'h3cc04dc0), .K5_C0_W5(32'h3dde7b92), .K5_C0_W6(32'h3d9ce815), .K5_C0_W7(32'h3dc77729), .K5_C0_W8(32'h3e02b0c4), 
		.K5_C1_W0(32'h3c9d9646), .K5_C1_W1(32'h3dbe177e), .K5_C1_W2(32'h3da57925), .K5_C1_W3(32'hbd08d971), .K5_C1_W4(32'h3ddddd5e), .K5_C1_W5(32'hbe0e960b), .K5_C1_W6(32'h3dc0ec2e), .K5_C1_W7(32'h3d7ab795), .K5_C1_W8(32'h3df52a6b), 
		.K5_C2_W0(32'hbe039249), .K5_C2_W1(32'h3dfebe11), .K5_C2_W2(32'h3c960391), .K5_C2_W3(32'h3de8e044), .K5_C2_W4(32'hbd54e86b), .K5_C2_W5(32'h3da80e4c), .K5_C2_W6(32'h3db68610), .K5_C2_W7(32'hbdeccf30), .K5_C2_W8(32'h3e09b512), 
		.K5_C3_W0(32'hbe08072b), .K5_C3_W1(32'h3dfea0af), .K5_C3_W2(32'h3cc27c0d), .K5_C3_W3(32'h3d539c00), .K5_C3_W4(32'hbd951f3d), .K5_C3_W5(32'hbdca3ce5), .K5_C3_W6(32'h3de29f07), .K5_C3_W7(32'hbdc1c377), .K5_C3_W8(32'hbdf2216c), 
		.K5_C4_W0(32'h3e1cb4b9), .K5_C4_W1(32'hbce1951e), .K5_C4_W2(32'hbcd4c2dc), .K5_C4_W3(32'h3dca52fb), .K5_C4_W4(32'hbc6eb69e), .K5_C4_W5(32'h3e014883), .K5_C4_W6(32'h3d1b123b), .K5_C4_W7(32'h3d279790), .K5_C4_W8(32'hbc760298), 
		.K5_C5_W0(32'h3cca98a4), .K5_C5_W1(32'h3db81ed6), .K5_C5_W2(32'h3db17a9a), .K5_C5_W3(32'h3de79f29), .K5_C5_W4(32'h3e22d2cb), .K5_C5_W5(32'hbd64c4c2), .K5_C5_W6(32'h3d8bcf2d), .K5_C5_W7(32'h3c19c03a), .K5_C5_W8(32'hbe33b2c5), 
		.K5_C6_W0(32'h3d2f9ef6), .K5_C6_W1(32'h3d105f57), .K5_C6_W2(32'h3ccd7034), .K5_C6_W3(32'h3d830a97), .K5_C6_W4(32'hbc8b5a6c), .K5_C6_W5(32'hbc3f4310), .K5_C6_W6(32'hbd0a0d10), .K5_C6_W7(32'h3db26222), .K5_C6_W8(32'h3d840ca4), 
		.K5_C7_W0(32'hbe1465c1), .K5_C7_W1(32'hbd7a57ff), .K5_C7_W2(32'hbdd04caa), .K5_C7_W3(32'hbdeec71e), .K5_C7_W4(32'h3e0374c9), .K5_C7_W5(32'hbdf4d813), .K5_C7_W6(32'h3c9742ff), .K5_C7_W7(32'h3d81227f), .K5_C7_W8(32'h3c2f9d56), 
		.K5_C8_W0(32'h3d653d00), .K5_C8_W1(32'h3dd38f72), .K5_C8_W2(32'h3dab0e99), .K5_C8_W3(32'hbe09de0f), .K5_C8_W4(32'hbcc2831b), .K5_C8_W5(32'hbd21d908), .K5_C8_W6(32'hbe122c18), .K5_C8_W7(32'hbc3850eb), .K5_C8_W8(32'h3d938b84), 
		.K5_C9_W0(32'hbbc6e8e9), .K5_C9_W1(32'h3cb26d99), .K5_C9_W2(32'hbcc8c719), .K5_C9_W3(32'hbdf996cd), .K5_C9_W4(32'hbd4dff80), .K5_C9_W5(32'hbc805d93), .K5_C9_W6(32'hbde0ea64), .K5_C9_W7(32'h3d7bf42f), .K5_C9_W8(32'hbe082a14), 
		.K5_C10_W0(32'hbd5b3fef), .K5_C10_W1(32'h3e0f26f8), .K5_C10_W2(32'hbd84dfc7), .K5_C10_W3(32'h3cf47019), .K5_C10_W4(32'h3e0b1e1f), .K5_C10_W5(32'hbc2b6c4a), .K5_C10_W6(32'h3cfbcc9d), .K5_C10_W7(32'h3de95441), .K5_C10_W8(32'hbc0e6033), 
		.K5_C11_W0(32'hbdf5d035), .K5_C11_W1(32'hbe2c916e), .K5_C11_W2(32'hbe15dda4), .K5_C11_W3(32'hbdf57ae8), .K5_C11_W4(32'h3cbe8a54), .K5_C11_W5(32'h3b49d12b), .K5_C11_W6(32'hbcfd3e75), .K5_C11_W7(32'h3deb43fc), .K5_C11_W8(32'hbe197f39), 
		.K5_C12_W0(32'hbe57478a), .K5_C12_W1(32'h3d8f5d9d), .K5_C12_W2(32'hbe227129), .K5_C12_W3(32'hbd4f5596), .K5_C12_W4(32'h3dad74c0), .K5_C12_W5(32'h3dc5ee61), .K5_C12_W6(32'hbe0815e6), .K5_C12_W7(32'hbd2d7da5), .K5_C12_W8(32'hbe0da5ad), 
		.K5_C13_W0(32'h3cb77ec9), .K5_C13_W1(32'hbcff7a78), .K5_C13_W2(32'h3d0d94a8), .K5_C13_W3(32'hbdc07823), .K5_C13_W4(32'hbdded8e1), .K5_C13_W5(32'hbe107ac1), .K5_C13_W6(32'h3dfc02b7), .K5_C13_W7(32'hbdfb5a75), .K5_C13_W8(32'h3c11590b), 
		.K5_C14_W0(32'h3df58120), .K5_C14_W1(32'h3c899778), .K5_C14_W2(32'h3c518df9), .K5_C14_W3(32'hbd0cf9e8), .K5_C14_W4(32'h3dc5e25c), .K5_C14_W5(32'h3d58c79e), .K5_C14_W6(32'h3cce233d), .K5_C14_W7(32'h3d3f8718), .K5_C14_W8(32'hbe214f5b), 
		.K5_C15_W0(32'h3e2a0418), .K5_C15_W1(32'hbd8aebbd), .K5_C15_W2(32'h3daa9d74), .K5_C15_W3(32'hbcb240d8), .K5_C15_W4(32'h3da33879), .K5_C15_W5(32'hbe488ccf), .K5_C15_W6(32'h3dcab03f), .K5_C15_W7(32'h3d6aac1e), .K5_C15_W8(32'hbcd28bc7), 
		.K5_BIAS (32'h3cbe9e2f),

		.K6_C0_W0(32'hbda8e24d), .K6_C0_W1(32'hbb8d44cc), .K6_C0_W2(32'hbcb2a981), .K6_C0_W3(32'h3d902038), .K6_C0_W4(32'hbd633c93), .K6_C0_W5(32'hbdde3273), .K6_C0_W6(32'hbcbe706e), .K6_C0_W7(32'hbc2cf696), .K6_C0_W8(32'hbd65e195), 
		.K6_C1_W0(32'hbdd70120), .K6_C1_W1(32'hbe007d29), .K6_C1_W2(32'h3d676e61), .K6_C1_W3(32'hbd74df81), .K6_C1_W4(32'hbdbec00b), .K6_C1_W5(32'hbdbf92d9), .K6_C1_W6(32'hbdbc07ae), .K6_C1_W7(32'hbd9f23d5), .K6_C1_W8(32'hbd65ec13), 
		.K6_C2_W0(32'hbdaaef5f), .K6_C2_W1(32'h3d958be5), .K6_C2_W2(32'h3df99a79), .K6_C2_W3(32'h3e1b0a3f), .K6_C2_W4(32'h3da4b6a4), .K6_C2_W5(32'hbd79516a), .K6_C2_W6(32'hbb980d95), .K6_C2_W7(32'hbd641e30), .K6_C2_W8(32'h3dda117f), 
		.K6_C3_W0(32'hbafb0566), .K6_C3_W1(32'hbd7a8e6b), .K6_C3_W2(32'h3ce86af0), .K6_C3_W3(32'h3d1311ac), .K6_C3_W4(32'hbd70bfd8), .K6_C3_W5(32'hbda0da3c), .K6_C3_W6(32'h3ab5aff6), .K6_C3_W7(32'hbc59ec48), .K6_C3_W8(32'hbdbdba5d), 
		.K6_C4_W0(32'hbd573e1c), .K6_C4_W1(32'h3d79a2f7), .K6_C4_W2(32'h3ccd4734), .K6_C4_W3(32'hbcd1504d), .K6_C4_W4(32'hbdac8555), .K6_C4_W5(32'hbd2316e3), .K6_C4_W6(32'hbe063477), .K6_C4_W7(32'h3ce729f6), .K6_C4_W8(32'h3d2b0f91), 
		.K6_C5_W0(32'hbdf26110), .K6_C5_W1(32'h3d220f9e), .K6_C5_W2(32'hbc9da4ff), .K6_C5_W3(32'h3daa373f), .K6_C5_W4(32'h3cf3a98d), .K6_C5_W5(32'hbbd6fbc4), .K6_C5_W6(32'h3d05c064), .K6_C5_W7(32'h3d5ff313), .K6_C5_W8(32'hbcbf991a), 
		.K6_C6_W0(32'h3c6d07f2), .K6_C6_W1(32'h3d8eae39), .K6_C6_W2(32'h3dc36ee1), .K6_C6_W3(32'hbdef6414), .K6_C6_W4(32'hbdad969c), .K6_C6_W5(32'h3d3c71ba), .K6_C6_W6(32'h3ce95da3), .K6_C6_W7(32'h3d52bfa0), .K6_C6_W8(32'h3d9b3612), 
		.K6_C7_W0(32'hbdca3340), .K6_C7_W1(32'hbcfe62c7), .K6_C7_W2(32'h3cc26518), .K6_C7_W3(32'h3d8c4ef6), .K6_C7_W4(32'hbe2bd32c), .K6_C7_W5(32'h3d7b5911), .K6_C7_W6(32'h3ccb15b6), .K6_C7_W7(32'h3cc00cb0), .K6_C7_W8(32'hbd9be79a), 
		.K6_C8_W0(32'h3a03eb77), .K6_C8_W1(32'h3daa1b76), .K6_C8_W2(32'h3ced9b1e), .K6_C8_W3(32'h3e29bc0b), .K6_C8_W4(32'h3ccab59a), .K6_C8_W5(32'hbcef1f33), .K6_C8_W6(32'h3b085db0), .K6_C8_W7(32'hbdd33d40), .K6_C8_W8(32'hbe1960ef), 
		.K6_C9_W0(32'hbd097f2e), .K6_C9_W1(32'h3d852565), .K6_C9_W2(32'hbd96f0e6), .K6_C9_W3(32'h3d417395), .K6_C9_W4(32'hbdd8053d), .K6_C9_W5(32'h3e43deb7), .K6_C9_W6(32'hbdaa68e0), .K6_C9_W7(32'h3decb89a), .K6_C9_W8(32'h3dc111e5), 
		.K6_C10_W0(32'h3dc1d855), .K6_C10_W1(32'h3e170102), .K6_C10_W2(32'h3e267c23), .K6_C10_W3(32'h3db467a5), .K6_C10_W4(32'hbe0e9700), .K6_C10_W5(32'h3daaaa94), .K6_C10_W6(32'h3cdaf094), .K6_C10_W7(32'h3dd30fd5), .K6_C10_W8(32'hbde2dc0d), 
		.K6_C11_W0(32'hbc479fc4), .K6_C11_W1(32'hbd3fd55c), .K6_C11_W2(32'hbe0fdeb3), .K6_C11_W3(32'hbd1cba24), .K6_C11_W4(32'h3c4eef67), .K6_C11_W5(32'hbde20429), .K6_C11_W6(32'h3def1e9a), .K6_C11_W7(32'h3d9253c4), .K6_C11_W8(32'hbdeff2c2), 
		.K6_C12_W0(32'hbd066336), .K6_C12_W1(32'hbe25a2a0), .K6_C12_W2(32'hbd5ead35), .K6_C12_W3(32'hbc0a43a2), .K6_C12_W4(32'hbe0e3320), .K6_C12_W5(32'h3e213e68), .K6_C12_W6(32'hbdad3ea3), .K6_C12_W7(32'h3ba11838), .K6_C12_W8(32'hbd3a19a8), 
		.K6_C13_W0(32'h3d6a6529), .K6_C13_W1(32'hbd64b41b), .K6_C13_W2(32'h3d391da6), .K6_C13_W3(32'h3cb8d4e0), .K6_C13_W4(32'hbe0c2ad0), .K6_C13_W5(32'hbdbbccf4), .K6_C13_W6(32'hbc297b0e), .K6_C13_W7(32'h3e22e812), .K6_C13_W8(32'hbd6dd59d), 
		.K6_C14_W0(32'hbc4cfe5b), .K6_C14_W1(32'h3ca2c2cf), .K6_C14_W2(32'h3e0b9400), .K6_C14_W3(32'hbd96cd5c), .K6_C14_W4(32'h3e080356), .K6_C14_W5(32'h3dca83f9), .K6_C14_W6(32'h3c270a1b), .K6_C14_W7(32'hbd647c07), .K6_C14_W8(32'hbe0d0c02), 
		.K6_C15_W0(32'h3de884cd), .K6_C15_W1(32'h3ca2baf7), .K6_C15_W2(32'hbd8ef5ec), .K6_C15_W3(32'hbd62f350), .K6_C15_W4(32'h3d906f78), .K6_C15_W5(32'hbd063748), .K6_C15_W6(32'hbd669ba8), .K6_C15_W7(32'h3df95968), .K6_C15_W8(32'h3da9dff5), 
		.K6_BIAS (32'h3c8ef77e),

		.K7_C0_W0(32'h3d09da57), .K7_C0_W1(32'h3d90a73e), .K7_C0_W2(32'hbd872fe1), .K7_C0_W3(32'h3dab7967), .K7_C0_W4(32'h3babb747), .K7_C0_W5(32'h3c9f4a4e), .K7_C0_W6(32'h3db3e03a), .K7_C0_W7(32'h3df8b48f), .K7_C0_W8(32'hbdada1d1), 
		.K7_C1_W0(32'hbdc9d21b), .K7_C1_W1(32'h3dca8354), .K7_C1_W2(32'h3cdc0bc8), .K7_C1_W3(32'h3da4938f), .K7_C1_W4(32'hbc762d21), .K7_C1_W5(32'h3da80e6e), .K7_C1_W6(32'h3e0ba1ee), .K7_C1_W7(32'hbdb0fca4), .K7_C1_W8(32'hbd3b4400), 
		.K7_C2_W0(32'h3dc66fcc), .K7_C2_W1(32'h3d0df294), .K7_C2_W2(32'hbd7589da), .K7_C2_W3(32'h3e10b107), .K7_C2_W4(32'hbbe2bdb1), .K7_C2_W5(32'hbb4a4eb4), .K7_C2_W6(32'hbdc58e58), .K7_C2_W7(32'h3c8d53c6), .K7_C2_W8(32'hbd614080), 
		.K7_C3_W0(32'h3e50f12b), .K7_C3_W1(32'hbb8a8754), .K7_C3_W2(32'h3bc6f362), .K7_C3_W3(32'hbdb003a5), .K7_C3_W4(32'hbd9e164b), .K7_C3_W5(32'h3ded9eb5), .K7_C3_W6(32'h3d9384ae), .K7_C3_W7(32'h3de1dd29), .K7_C3_W8(32'hbcc20867), 
		.K7_C4_W0(32'h3da2a257), .K7_C4_W1(32'h3de6df9e), .K7_C4_W2(32'h3d1f8c09), .K7_C4_W3(32'h3d7b212b), .K7_C4_W4(32'h3d5d79e1), .K7_C4_W5(32'hba50c84f), .K7_C4_W6(32'hbdd53626), .K7_C4_W7(32'h3d021a84), .K7_C4_W8(32'hbd8a6c39), 
		.K7_C5_W0(32'hbdc5c685), .K7_C5_W1(32'hbdc6feb8), .K7_C5_W2(32'h3c49275e), .K7_C5_W3(32'h3de698d6), .K7_C5_W4(32'h3d504769), .K7_C5_W5(32'h3d926c13), .K7_C5_W6(32'hbd18d4b3), .K7_C5_W7(32'hbd3e3118), .K7_C5_W8(32'h3dc5835e), 
		.K7_C6_W0(32'hbd8219c0), .K7_C6_W1(32'hbdc3460c), .K7_C6_W2(32'h3cf979e5), .K7_C6_W3(32'hbd98232e), .K7_C6_W4(32'hbb999b31), .K7_C6_W5(32'hbbdab076), .K7_C6_W6(32'h3e2d3b97), .K7_C6_W7(32'h3ab0a12b), .K7_C6_W8(32'h3e313d92), 
		.K7_C7_W0(32'hbbb35879), .K7_C7_W1(32'h3d478cfb), .K7_C7_W2(32'hbe1b9470), .K7_C7_W3(32'h3b11ffbc), .K7_C7_W4(32'hbcb260dc), .K7_C7_W5(32'h3d82debd), .K7_C7_W6(32'hbc1a9c3d), .K7_C7_W7(32'hbd6c1b5e), .K7_C7_W8(32'h3d3d7096), 
		.K7_C8_W0(32'hbda5e8d9), .K7_C8_W1(32'h3df3f8fc), .K7_C8_W2(32'h3d78fae4), .K7_C8_W3(32'hbd5e6389), .K7_C8_W4(32'hbd3796db), .K7_C8_W5(32'hbe14844f), .K7_C8_W6(32'hbdc3b714), .K7_C8_W7(32'h3ddae8d1), .K7_C8_W8(32'hbdcec1fd), 
		.K7_C9_W0(32'hbe1455dc), .K7_C9_W1(32'h3d87d9d6), .K7_C9_W2(32'h3c905ccb), .K7_C9_W3(32'h3de4ea03), .K7_C9_W4(32'hbdce8a9b), .K7_C9_W5(32'hbca858f7), .K7_C9_W6(32'hbd91beec), .K7_C9_W7(32'hbdebd50e), .K7_C9_W8(32'h3d9814ad), 
		.K7_C10_W0(32'hbcdc700e), .K7_C10_W1(32'h3dfc56a2), .K7_C10_W2(32'h3d94b72e), .K7_C10_W3(32'hbde4ff4f), .K7_C10_W4(32'hbc6cf852), .K7_C10_W5(32'h3e09a0eb), .K7_C10_W6(32'h3d09c494), .K7_C10_W7(32'h3df5e886), .K7_C10_W8(32'h3da65e45), 
		.K7_C11_W0(32'h3d27d7a3), .K7_C11_W1(32'hbdb9758c), .K7_C11_W2(32'hbc7f0f3a), .K7_C11_W3(32'hba64c7ee), .K7_C11_W4(32'hbdf5202c), .K7_C11_W5(32'hbc9a9c19), .K7_C11_W6(32'h3d3755b2), .K7_C11_W7(32'hbdf96961), .K7_C11_W8(32'h3dcce449), 
		.K7_C12_W0(32'hbd804519), .K7_C12_W1(32'hbe15ede9), .K7_C12_W2(32'hbd25bf36), .K7_C12_W3(32'h3c2e4973), .K7_C12_W4(32'h3dd31e82), .K7_C12_W5(32'h3d4e1f0b), .K7_C12_W6(32'hbca0ff8e), .K7_C12_W7(32'hbdd5149f), .K7_C12_W8(32'hbcf5bd8f), 
		.K7_C13_W0(32'hbde224b5), .K7_C13_W1(32'h3dbe2649), .K7_C13_W2(32'hbdf7f9d3), .K7_C13_W3(32'h3d949155), .K7_C13_W4(32'hbdd7b8d5), .K7_C13_W5(32'hbd3dde97), .K7_C13_W6(32'hbc08e665), .K7_C13_W7(32'h3b65abdf), .K7_C13_W8(32'hbe05b277), 
		.K7_C14_W0(32'h3e0efa6f), .K7_C14_W1(32'h3e1c4698), .K7_C14_W2(32'hbd7aeba6), .K7_C14_W3(32'hbdae73e5), .K7_C14_W4(32'hbd6b5027), .K7_C14_W5(32'hbc6a6ae9), .K7_C14_W6(32'h3cc5ae9d), .K7_C14_W7(32'h3d9dbb62), .K7_C14_W8(32'h3cd67f97), 
		.K7_C15_W0(32'h3d034e58), .K7_C15_W1(32'h3dddda19), .K7_C15_W2(32'h3dbe243d), .K7_C15_W3(32'h3dc33e75), .K7_C15_W4(32'hbd2babd5), .K7_C15_W5(32'hbd58cee6), .K7_C15_W6(32'hbdcff5c9), .K7_C15_W7(32'h3bb111af), .K7_C15_W8(32'h3e19b635), 
		.K7_BIAS (32'h3d410ea5),

		.K8_C0_W0(32'hbb80ffcc), .K8_C0_W1(32'h3e0ae418), .K8_C0_W2(32'hbcddcb8b), .K8_C0_W3(32'hbdfa350c), .K8_C0_W4(32'h3d2399fe), .K8_C0_W5(32'h3e35fd41), .K8_C0_W6(32'h3c43c5f6), .K8_C0_W7(32'h3dbbb87b), .K8_C0_W8(32'hbdd1198e), 
		.K8_C1_W0(32'h3d460201), .K8_C1_W1(32'h3d999c38), .K8_C1_W2(32'h3d465bd0), .K8_C1_W3(32'hbc019d23), .K8_C1_W4(32'hbdaa622c), .K8_C1_W5(32'hbdbab082), .K8_C1_W6(32'h3d85388a), .K8_C1_W7(32'h3dcdd6d3), .K8_C1_W8(32'h3d66a3a5), 
		.K8_C2_W0(32'hbe24afa3), .K8_C2_W1(32'hbdb430a9), .K8_C2_W2(32'h3e098a3b), .K8_C2_W3(32'hbdb17763), .K8_C2_W4(32'h3a932020), .K8_C2_W5(32'hbd302aa7), .K8_C2_W6(32'h3d053c0f), .K8_C2_W7(32'h3db7278f), .K8_C2_W8(32'hbd72d622), 
		.K8_C3_W0(32'h3c6faf30), .K8_C3_W1(32'h3da29ff8), .K8_C3_W2(32'h3db289fe), .K8_C3_W3(32'hbd90282e), .K8_C3_W4(32'h3d739d13), .K8_C3_W5(32'hbdeb46fc), .K8_C3_W6(32'hbdfae652), .K8_C3_W7(32'hbcc29650), .K8_C3_W8(32'hbe03089d), 
		.K8_C4_W0(32'hbd9637c9), .K8_C4_W1(32'hbd320c96), .K8_C4_W2(32'hbd3ee78c), .K8_C4_W3(32'h3cf0b799), .K8_C4_W4(32'h3ce5bdb1), .K8_C4_W5(32'hbd747dfc), .K8_C4_W6(32'hbd04f746), .K8_C4_W7(32'hbe1564fe), .K8_C4_W8(32'hbe11c338), 
		.K8_C5_W0(32'hbcf3886d), .K8_C5_W1(32'hbca9eda6), .K8_C5_W2(32'h3dad1330), .K8_C5_W3(32'h3d1c5299), .K8_C5_W4(32'hbd9893b4), .K8_C5_W5(32'hbdce3bde), .K8_C5_W6(32'hbd54f9cf), .K8_C5_W7(32'hbda9ab62), .K8_C5_W8(32'h3dbd8b5b), 
		.K8_C6_W0(32'hbe1a2cc9), .K8_C6_W1(32'h3c148219), .K8_C6_W2(32'h3d6bbbd3), .K8_C6_W3(32'hbe45be6c), .K8_C6_W4(32'hbdc47097), .K8_C6_W5(32'hbd9ccf08), .K8_C6_W6(32'h3dae9735), .K8_C6_W7(32'hbcb1dba3), .K8_C6_W8(32'hbc0d3cea), 
		.K8_C7_W0(32'hbb923a1c), .K8_C7_W1(32'hbd2b65c5), .K8_C7_W2(32'hbdea7153), .K8_C7_W3(32'hbde9df36), .K8_C7_W4(32'h3d8acdb5), .K8_C7_W5(32'hbc21a11c), .K8_C7_W6(32'hbd25e170), .K8_C7_W7(32'h3c2e54d8), .K8_C7_W8(32'h3d9f80ea), 
		.K8_C8_W0(32'h3d1b3448), .K8_C8_W1(32'h3db8e581), .K8_C8_W2(32'h3cbc9124), .K8_C8_W3(32'hbcb820b8), .K8_C8_W4(32'h3cb67977), .K8_C8_W5(32'h3db45edb), .K8_C8_W6(32'hbb971de4), .K8_C8_W7(32'hbe0f2981), .K8_C8_W8(32'h3cc47e64), 
		.K8_C9_W0(32'h3c1e15a2), .K8_C9_W1(32'h3d9079fb), .K8_C9_W2(32'h3e192eff), .K8_C9_W3(32'hbceb4339), .K8_C9_W4(32'hbe0386ad), .K8_C9_W5(32'hbccb7f2c), .K8_C9_W6(32'h3e0c9c73), .K8_C9_W7(32'h3e044228), .K8_C9_W8(32'hbd1ea3da), 
		.K8_C10_W0(32'h3dd57029), .K8_C10_W1(32'hbdcc245b), .K8_C10_W2(32'hbcf8cf9b), .K8_C10_W3(32'hbe28dea7), .K8_C10_W4(32'h3e05f976), .K8_C10_W5(32'h3dcb22db), .K8_C10_W6(32'h3d8e6cbb), .K8_C10_W7(32'hbd114e8f), .K8_C10_W8(32'h3d904c37), 
		.K8_C11_W0(32'hbd341342), .K8_C11_W1(32'hbde8622a), .K8_C11_W2(32'hbdb317be), .K8_C11_W3(32'h3d18b0b2), .K8_C11_W4(32'h3ddbb742), .K8_C11_W5(32'hba2634aa), .K8_C11_W6(32'h3dc7843d), .K8_C11_W7(32'h3ad0ad05), .K8_C11_W8(32'h3e05b4ec), 
		.K8_C12_W0(32'hbe21492c), .K8_C12_W1(32'hbd9760d0), .K8_C12_W2(32'h3e1a6d4f), .K8_C12_W3(32'hbd1f498a), .K8_C12_W4(32'h3dc1c981), .K8_C12_W5(32'hbdcb0124), .K8_C12_W6(32'h3d90d487), .K8_C12_W7(32'hbd62e43f), .K8_C12_W8(32'hbd3d519e), 
		.K8_C13_W0(32'hbe2445c1), .K8_C13_W1(32'hbd93de28), .K8_C13_W2(32'hbdec56b5), .K8_C13_W3(32'hbdb8fb5c), .K8_C13_W4(32'hbde0f277), .K8_C13_W5(32'h3dc94db3), .K8_C13_W6(32'hbd769b7f), .K8_C13_W7(32'hbda63153), .K8_C13_W8(32'h3cd3475b), 
		.K8_C14_W0(32'h3d3aa2db), .K8_C14_W1(32'h3cb549b3), .K8_C14_W2(32'hbc4277eb), .K8_C14_W3(32'hbe24c3f3), .K8_C14_W4(32'hbd8b5b32), .K8_C14_W5(32'hbcf5c367), .K8_C14_W6(32'h3d9322d4), .K8_C14_W7(32'h3d63077c), .K8_C14_W8(32'hbdab0b5e), 
		.K8_C15_W0(32'hbd42305a), .K8_C15_W1(32'h3d46da0f), .K8_C15_W2(32'h3e0fdd44), .K8_C15_W3(32'hbd997dc8), .K8_C15_W4(32'h3d39f873), .K8_C15_W5(32'h3cca6ede), .K8_C15_W6(32'hbcb6e89b), .K8_C15_W7(32'h3d918fa6), .K8_C15_W8(32'hbdad4bcd), 
		.K8_BIAS (32'h3d4fe3ad),

		.K9_C0_W0(32'h3de51afa), .K9_C0_W1(32'h3e1c3718), .K9_C0_W2(32'hbdea19ec), .K9_C0_W3(32'hbda838eb), .K9_C0_W4(32'hbd1c30f1), .K9_C0_W5(32'hbe0b641b), .K9_C0_W6(32'hbd9f8dde), .K9_C0_W7(32'hbddda1d1), .K9_C0_W8(32'hbd7a3413), 
		.K9_C1_W0(32'h3ba6e06d), .K9_C1_W1(32'hbdbfd9d9), .K9_C1_W2(32'h3e285dbe), .K9_C1_W3(32'h3c7fca36), .K9_C1_W4(32'hbd1f8a1c), .K9_C1_W5(32'hbd922059), .K9_C1_W6(32'h3dc55f73), .K9_C1_W7(32'hbc9a2445), .K9_C1_W8(32'hbdb84600), 
		.K9_C2_W0(32'h3e153568), .K9_C2_W1(32'hbd9b5ae9), .K9_C2_W2(32'hbdb3261a), .K9_C2_W3(32'hbbbfe7e4), .K9_C2_W4(32'hbce70531), .K9_C2_W5(32'h3e1c0630), .K9_C2_W6(32'hbd9ca4de), .K9_C2_W7(32'h3d935616), .K9_C2_W8(32'hba790ed0), 
		.K9_C3_W0(32'h3d479458), .K9_C3_W1(32'hbce75eaf), .K9_C3_W2(32'hbe18951c), .K9_C3_W3(32'hbcbd9208), .K9_C3_W4(32'h3c5a4dc4), .K9_C3_W5(32'hbe067368), .K9_C3_W6(32'hbe0309fa), .K9_C3_W7(32'hbdb1c1b7), .K9_C3_W8(32'hbdeca4a1), 
		.K9_C4_W0(32'h3c515e0f), .K9_C4_W1(32'hbd473c18), .K9_C4_W2(32'hbcd42b01), .K9_C4_W3(32'hbe09db27), .K9_C4_W4(32'h3df579e4), .K9_C4_W5(32'h3dc6fed6), .K9_C4_W6(32'hbe0bc348), .K9_C4_W7(32'h3c34cdbc), .K9_C4_W8(32'hbcea8551), 
		.K9_C5_W0(32'hbe01e6ec), .K9_C5_W1(32'h3e1c4294), .K9_C5_W2(32'hbd1f538e), .K9_C5_W3(32'hbe07bf83), .K9_C5_W4(32'h3e0a4d25), .K9_C5_W5(32'hbd8cb87c), .K9_C5_W6(32'hbdd0a148), .K9_C5_W7(32'h3d960b0b), .K9_C5_W8(32'h3d8962e4), 
		.K9_C6_W0(32'h3df925e5), .K9_C6_W1(32'h3d7597d7), .K9_C6_W2(32'hbd80e778), .K9_C6_W3(32'h3c777d41), .K9_C6_W4(32'hbcfb8dd5), .K9_C6_W5(32'hba2f07f6), .K9_C6_W6(32'h3e3ef673), .K9_C6_W7(32'hbda3685d), .K9_C6_W8(32'h3d4d4d80), 
		.K9_C7_W0(32'hbd8f9b72), .K9_C7_W1(32'h3db97de2), .K9_C7_W2(32'hbd8d4036), .K9_C7_W3(32'h3e0d002c), .K9_C7_W4(32'h3ddde329), .K9_C7_W5(32'h3c6d373d), .K9_C7_W6(32'hbbe264e8), .K9_C7_W7(32'h3d6d3481), .K9_C7_W8(32'hbdeb5fab), 
		.K9_C8_W0(32'h3de499fd), .K9_C8_W1(32'hbafcbfe2), .K9_C8_W2(32'h3d4dc1ef), .K9_C8_W3(32'hbb051d54), .K9_C8_W4(32'h3c5d78b3), .K9_C8_W5(32'hbcb1083c), .K9_C8_W6(32'h3d8ea6db), .K9_C8_W7(32'h3c9bcefb), .K9_C8_W8(32'hbd441c5a), 
		.K9_C9_W0(32'hbd84eda5), .K9_C9_W1(32'hbdbd00e3), .K9_C9_W2(32'hbd3990ce), .K9_C9_W3(32'h3db0b1d1), .K9_C9_W4(32'h3e11dd01), .K9_C9_W5(32'h3c86c569), .K9_C9_W6(32'h3b932f6e), .K9_C9_W7(32'h3d1df169), .K9_C9_W8(32'h3d0c6d26), 
		.K9_C10_W0(32'h3e3d0899), .K9_C10_W1(32'hbd842fbc), .K9_C10_W2(32'hbd1b7bee), .K9_C10_W3(32'hbc85415d), .K9_C10_W4(32'hbdfbb925), .K9_C10_W5(32'h3c917841), .K9_C10_W6(32'h3dbebff7), .K9_C10_W7(32'hbd9dc63f), .K9_C10_W8(32'hbd5f7589), 
		.K9_C11_W0(32'hbd143f42), .K9_C11_W1(32'hbe0393f2), .K9_C11_W2(32'hbde55c95), .K9_C11_W3(32'hbde996bd), .K9_C11_W4(32'h3dfc2bd9), .K9_C11_W5(32'hbe0fbdf1), .K9_C11_W6(32'hbe2a3eb1), .K9_C11_W7(32'hbe077834), .K9_C11_W8(32'hbdd905e0), 
		.K9_C12_W0(32'hbde6932b), .K9_C12_W1(32'hbcb9eb63), .K9_C12_W2(32'h3d92490e), .K9_C12_W3(32'hbdfc5f1f), .K9_C12_W4(32'hbc6de354), .K9_C12_W5(32'h3d21e31f), .K9_C12_W6(32'h3dd9e06e), .K9_C12_W7(32'h3cfe6de8), .K9_C12_W8(32'hbca98194), 
		.K9_C13_W0(32'hbdf92248), .K9_C13_W1(32'hbe310c74), .K9_C13_W2(32'h3e2f8bef), .K9_C13_W3(32'h3d03d3f9), .K9_C13_W4(32'h3d4a49ca), .K9_C13_W5(32'hba849dec), .K9_C13_W6(32'h3dd92618), .K9_C13_W7(32'hbd39d060), .K9_C13_W8(32'h3a5a1ff8), 
		.K9_C14_W0(32'h3d12be69), .K9_C14_W1(32'h3de82493), .K9_C14_W2(32'hbdddd04d), .K9_C14_W3(32'h3daac169), .K9_C14_W4(32'h3d90ce59), .K9_C14_W5(32'hbdc3d3ec), .K9_C14_W6(32'h3d744530), .K9_C14_W7(32'hbdb7d1d1), .K9_C14_W8(32'hbe04e3a7), 
		.K9_C15_W0(32'h3d8c6f81), .K9_C15_W1(32'h3d04f9e4), .K9_C15_W2(32'hbdc44b7c), .K9_C15_W3(32'h3d32ef19), .K9_C15_W4(32'h3d893fd3), .K9_C15_W5(32'h3da10e49), .K9_C15_W6(32'hbdb98671), .K9_C15_W7(32'h3c373f67), .K9_C15_W8(32'hbdc8cda4), 
		.K9_BIAS (32'h3d376573),

		.K10_C0_W0(32'h3dedd337), .K10_C0_W1(32'h3d5cae04), .K10_C0_W2(32'hbd969948), .K10_C0_W3(32'hbd8d19db), .K10_C0_W4(32'hbdd6b3b4), .K10_C0_W5(32'h3df9a428), .K10_C0_W6(32'h3cdc7b73), .K10_C0_W7(32'hbd4df471), .K10_C0_W8(32'h3c9fd02b), 
		.K10_C1_W0(32'hbc2658ff), .K10_C1_W1(32'h3c82d787), .K10_C1_W2(32'hbda91e8c), .K10_C1_W3(32'h3cefcaaa), .K10_C1_W4(32'h3d5edbcd), .K10_C1_W5(32'h3de3596c), .K10_C1_W6(32'h3b420afa), .K10_C1_W7(32'h3dfa2c02), .K10_C1_W8(32'h3df2b850), 
		.K10_C2_W0(32'hbde316b2), .K10_C2_W1(32'hbdcf70b4), .K10_C2_W2(32'hbdbc6e47), .K10_C2_W3(32'h3d478961), .K10_C2_W4(32'hbb4a7ac1), .K10_C2_W5(32'hbd284731), .K10_C2_W6(32'h3e26fc43), .K10_C2_W7(32'hbdf964a7), .K10_C2_W8(32'h3cd3fb15), 
		.K10_C3_W0(32'hbd9b9f0c), .K10_C3_W1(32'h3d5d775d), .K10_C3_W2(32'h3de2f73c), .K10_C3_W3(32'hbe016424), .K10_C3_W4(32'hbe3d459b), .K10_C3_W5(32'hbd26c599), .K10_C3_W6(32'hbe1dcdc8), .K10_C3_W7(32'hbd7f7957), .K10_C3_W8(32'hbd7a0c06), 
		.K10_C4_W0(32'hbd4d4cc8), .K10_C4_W1(32'hbe03026f), .K10_C4_W2(32'hbca9c1ca), .K10_C4_W3(32'hbcffc952), .K10_C4_W4(32'h3e09e9e8), .K10_C4_W5(32'hbcce29e0), .K10_C4_W6(32'h3e2ff4a2), .K10_C4_W7(32'hbdc0c13b), .K10_C4_W8(32'h3db14c62), 
		.K10_C5_W0(32'h3d6bbf8f), .K10_C5_W1(32'hbdb6956e), .K10_C5_W2(32'h3df22d3a), .K10_C5_W3(32'hbd9e97ce), .K10_C5_W4(32'hbd8fcf67), .K10_C5_W5(32'h3d60bf62), .K10_C5_W6(32'h3e052c63), .K10_C5_W7(32'h3de24231), .K10_C5_W8(32'hbcbbae2b), 
		.K10_C6_W0(32'h3e05df13), .K10_C6_W1(32'hbe12dc43), .K10_C6_W2(32'hbdf4aa89), .K10_C6_W3(32'h3ca2d407), .K10_C6_W4(32'hbd517b41), .K10_C6_W5(32'hbdf992bd), .K10_C6_W6(32'h3ccfa0ed), .K10_C6_W7(32'hbdcd0f29), .K10_C6_W8(32'hbb682562), 
		.K10_C7_W0(32'h3de998c1), .K10_C7_W1(32'hbd2fce94), .K10_C7_W2(32'hbd618c93), .K10_C7_W3(32'hbca2742a), .K10_C7_W4(32'hbbff31da), .K10_C7_W5(32'h3df5a5f0), .K10_C7_W6(32'hbd72dd8a), .K10_C7_W7(32'hbe2231ae), .K10_C7_W8(32'hbdd7dff5), 
		.K10_C8_W0(32'hbda3f25d), .K10_C8_W1(32'hbdce0719), .K10_C8_W2(32'hbdeaca5c), .K10_C8_W3(32'hbd645625), .K10_C8_W4(32'h3d98016f), .K10_C8_W5(32'hbc58ea39), .K10_C8_W6(32'hbc8b1b85), .K10_C8_W7(32'hbc2fe481), .K10_C8_W8(32'hbe0061a6), 
		.K10_C9_W0(32'h3d50be3e), .K10_C9_W1(32'hbc7eec27), .K10_C9_W2(32'hbd99e3a3), .K10_C9_W3(32'h3b4bb9b2), .K10_C9_W4(32'h3db061c5), .K10_C9_W5(32'h3a680768), .K10_C9_W6(32'h3d469c56), .K10_C9_W7(32'hbdf62d54), .K10_C9_W8(32'h3d6967cb), 
		.K10_C10_W0(32'h3df4e1d5), .K10_C10_W1(32'h3c58aed5), .K10_C10_W2(32'hbdba2b6b), .K10_C10_W3(32'h3d3f95d4), .K10_C10_W4(32'hbd6a186c), .K10_C10_W5(32'hbdccd73d), .K10_C10_W6(32'hbc326a91), .K10_C10_W7(32'h3d806151), .K10_C10_W8(32'hbe13583c), 
		.K10_C11_W0(32'hbdf1e5b8), .K10_C11_W1(32'hbe046f3e), .K10_C11_W2(32'h3ce7bb9f), .K10_C11_W3(32'hbd9b99d2), .K10_C11_W4(32'h3d5a4b99), .K10_C11_W5(32'hbb3adb61), .K10_C11_W6(32'hbd7147cb), .K10_C11_W7(32'hbdacb2b5), .K10_C11_W8(32'hbdf7c6ac), 
		.K10_C12_W0(32'hbcdd2039), .K10_C12_W1(32'h3deabfa8), .K10_C12_W2(32'hbd3e305f), .K10_C12_W3(32'h3c20dcf0), .K10_C12_W4(32'h3d97a721), .K10_C12_W5(32'hbdc8e968), .K10_C12_W6(32'hbcf1b2bb), .K10_C12_W7(32'h3da1b669), .K10_C12_W8(32'h3dd839d3), 
		.K10_C13_W0(32'hbd2efa2f), .K10_C13_W1(32'hbd3ac765), .K10_C13_W2(32'hbd5d8378), .K10_C13_W3(32'hbc8808a9), .K10_C13_W4(32'hbe19f9e6), .K10_C13_W5(32'hbd01839e), .K10_C13_W6(32'hbe254d39), .K10_C13_W7(32'h3d527f81), .K10_C13_W8(32'h3d1899a1), 
		.K10_C14_W0(32'hbe1d0f6e), .K10_C14_W1(32'h3dd2cf3f), .K10_C14_W2(32'h3c34abe7), .K10_C14_W3(32'hbd011191), .K10_C14_W4(32'hbdb268de), .K10_C14_W5(32'hbd894923), .K10_C14_W6(32'h3da183b9), .K10_C14_W7(32'hbd3ec7ed), .K10_C14_W8(32'hbdc5afaf), 
		.K10_C15_W0(32'h3da32945), .K10_C15_W1(32'hbdba8778), .K10_C15_W2(32'hbd87c1c9), .K10_C15_W3(32'hbbb3e058), .K10_C15_W4(32'hbc8e1338), .K10_C15_W5(32'h3d825076), .K10_C15_W6(32'h3d6d341f), .K10_C15_W7(32'hbe229fe1), .K10_C15_W8(32'hbd0d1888), 
		.K10_BIAS (32'h3c299adc),

		.K11_C0_W0(32'h3d1a3bba), .K11_C0_W1(32'h3d30535a), .K11_C0_W2(32'h3cbdd7f4), .K11_C0_W3(32'h3daa8f7e), .K11_C0_W4(32'hbe076b57), .K11_C0_W5(32'h3d8c7a11), .K11_C0_W6(32'hbd9ff30b), .K11_C0_W7(32'h3ca0b39e), .K11_C0_W8(32'h3c4873ac), 
		.K11_C1_W0(32'h3e34058f), .K11_C1_W1(32'h3e0909b8), .K11_C1_W2(32'hbc1629cb), .K11_C1_W3(32'hbdad6c77), .K11_C1_W4(32'h3dcd5461), .K11_C1_W5(32'hbdddee98), .K11_C1_W6(32'hbc9ee844), .K11_C1_W7(32'hbcc2fcab), .K11_C1_W8(32'h3dfb6a99), 
		.K11_C2_W0(32'h3e073029), .K11_C2_W1(32'h3da63dc0), .K11_C2_W2(32'h3d37faf3), .K11_C2_W3(32'h3d7a8337), .K11_C2_W4(32'hbe0a22ae), .K11_C2_W5(32'hbd1f1933), .K11_C2_W6(32'h3d7de84e), .K11_C2_W7(32'hbd3ed286), .K11_C2_W8(32'hbde01a9c), 
		.K11_C3_W0(32'h3daed175), .K11_C3_W1(32'h3cfdfddd), .K11_C3_W2(32'h3da6ae77), .K11_C3_W3(32'h3e238b55), .K11_C3_W4(32'h3dfc62b6), .K11_C3_W5(32'hbc18c6a5), .K11_C3_W6(32'h3dc1120c), .K11_C3_W7(32'hbce3ffe3), .K11_C3_W8(32'h3d52dff0), 
		.K11_C4_W0(32'hbd879c8c), .K11_C4_W1(32'h3d7db9cb), .K11_C4_W2(32'h3dc0b64a), .K11_C4_W3(32'h3e0b6280), .K11_C4_W4(32'hbdbc7aca), .K11_C4_W5(32'hbd107c1b), .K11_C4_W6(32'h3c755f83), .K11_C4_W7(32'h3dcd297e), .K11_C4_W8(32'hbc4ea8a7), 
		.K11_C5_W0(32'hbcfc1402), .K11_C5_W1(32'h3d9e30db), .K11_C5_W2(32'h3dea8531), .K11_C5_W3(32'h3da1baf8), .K11_C5_W4(32'h3da73505), .K11_C5_W5(32'hbd5efc6f), .K11_C5_W6(32'hbe1e2d02), .K11_C5_W7(32'h3de6dcb5), .K11_C5_W8(32'hbdff52f5), 
		.K11_C6_W0(32'hbc717d93), .K11_C6_W1(32'h3ccd4714), .K11_C6_W2(32'h3c24e728), .K11_C6_W3(32'h3d70394d), .K11_C6_W4(32'hbe1223eb), .K11_C6_W5(32'hbdddc2e9), .K11_C6_W6(32'hbe12f6f2), .K11_C6_W7(32'hbcd8dd93), .K11_C6_W8(32'h3ced5271), 
		.K11_C7_W0(32'h3d7e9bdf), .K11_C7_W1(32'h3e29c3a0), .K11_C7_W2(32'h3dbc9e16), .K11_C7_W3(32'hbd5df280), .K11_C7_W4(32'hbca9edb2), .K11_C7_W5(32'h3d610334), .K11_C7_W6(32'h3d8a2c36), .K11_C7_W7(32'hbd8a6452), .K11_C7_W8(32'h3df07f36), 
		.K11_C8_W0(32'h3d5e166d), .K11_C8_W1(32'h3cf004db), .K11_C8_W2(32'hbbeebe0c), .K11_C8_W3(32'hbd413001), .K11_C8_W4(32'h3de38f39), .K11_C8_W5(32'h3d8aea54), .K11_C8_W6(32'h3dac05a9), .K11_C8_W7(32'h3da378d5), .K11_C8_W8(32'hbe301175), 
		.K11_C9_W0(32'h3d02e971), .K11_C9_W1(32'hbbee271d), .K11_C9_W2(32'h3e17b5e4), .K11_C9_W3(32'h3e187aaa), .K11_C9_W4(32'h3cc82d22), .K11_C9_W5(32'h3da3b5c3), .K11_C9_W6(32'hbe05c945), .K11_C9_W7(32'h3de2c1af), .K11_C9_W8(32'hbcb496eb), 
		.K11_C10_W0(32'hbd2cb298), .K11_C10_W1(32'hbd5c2791), .K11_C10_W2(32'hbd8a62b4), .K11_C10_W3(32'h3deea0fb), .K11_C10_W4(32'h3dbe0710), .K11_C10_W5(32'h3dec4416), .K11_C10_W6(32'hbe2782a5), .K11_C10_W7(32'hbdef1c4a), .K11_C10_W8(32'hbca357ea), 
		.K11_C11_W0(32'h3e29aadc), .K11_C11_W1(32'hbd1440ff), .K11_C11_W2(32'h3e3b5809), .K11_C11_W3(32'h3db06654), .K11_C11_W4(32'h3c415c0d), .K11_C11_W5(32'hbe067fb8), .K11_C11_W6(32'hbe09fff0), .K11_C11_W7(32'h3e1f5038), .K11_C11_W8(32'h3d48e24e), 
		.K11_C12_W0(32'hbd7cf983), .K11_C12_W1(32'hbd0b009d), .K11_C12_W2(32'hbd9ffab7), .K11_C12_W3(32'hbd83047f), .K11_C12_W4(32'hbd6b7c38), .K11_C12_W5(32'hbcc035ea), .K11_C12_W6(32'h3b7b0c7d), .K11_C12_W7(32'h3dc6ea2b), .K11_C12_W8(32'hbdf63694), 
		.K11_C13_W0(32'hbcffb8fa), .K11_C13_W1(32'h3ddfd22a), .K11_C13_W2(32'h3d1a0889), .K11_C13_W3(32'h3d255e91), .K11_C13_W4(32'hbc5a5492), .K11_C13_W5(32'h3ded8712), .K11_C13_W6(32'h3e0374fd), .K11_C13_W7(32'hbc81cf82), .K11_C13_W8(32'h3c8b7ad6), 
		.K11_C14_W0(32'h3d65a7e4), .K11_C14_W1(32'hbbbfd498), .K11_C14_W2(32'h3d812bab), .K11_C14_W3(32'h3db03873), .K11_C14_W4(32'hbdcaeb15), .K11_C14_W5(32'h3b7f8ee8), .K11_C14_W6(32'h3dbbda71), .K11_C14_W7(32'h3d98710d), .K11_C14_W8(32'h3c0f02ed), 
		.K11_C15_W0(32'h3dafcef1), .K11_C15_W1(32'hbc845229), .K11_C15_W2(32'hbd7fc2ec), .K11_C15_W3(32'hbd876a1c), .K11_C15_W4(32'hbd4f7324), .K11_C15_W5(32'h3d80322a), .K11_C15_W6(32'h3def5ce6), .K11_C15_W7(32'h3e0c1ec0), .K11_C15_W8(32'hbde0c1e2), 
		.K11_BIAS (32'hbce47018),

		.K12_C0_W0(32'h3e07eff5), .K12_C0_W1(32'hbafbd346), .K12_C0_W2(32'h3da56969), .K12_C0_W3(32'h3de724b2), .K12_C0_W4(32'h3da174d3), .K12_C0_W5(32'h3e0d6abc), .K12_C0_W6(32'hbdc1b8a8), .K12_C0_W7(32'h3e02d38e), .K12_C0_W8(32'h3e0cf921), 
		.K12_C1_W0(32'hbbd951eb), .K12_C1_W1(32'hbbafe76f), .K12_C1_W2(32'hbdc0e2a5), .K12_C1_W3(32'h3df5d01e), .K12_C1_W4(32'h3e37fa11), .K12_C1_W5(32'hbcb05d04), .K12_C1_W6(32'hbcc8fe9f), .K12_C1_W7(32'h3e1ae10f), .K12_C1_W8(32'hbd007930), 
		.K12_C2_W0(32'h3d758179), .K12_C2_W1(32'hbcfadfae), .K12_C2_W2(32'h3c8ba5ee), .K12_C2_W3(32'hbd4285e2), .K12_C2_W4(32'h3c22221f), .K12_C2_W5(32'hbd688c49), .K12_C2_W6(32'h3def8abc), .K12_C2_W7(32'hbd4b626d), .K12_C2_W8(32'hbde1f6a9), 
		.K12_C3_W0(32'hbe0e5630), .K12_C3_W1(32'hbd5135b6), .K12_C3_W2(32'h3de5e21b), .K12_C3_W3(32'h3df222fa), .K12_C3_W4(32'hbd65bc6e), .K12_C3_W5(32'h3e3bfc4d), .K12_C3_W6(32'hbbe82196), .K12_C3_W7(32'hbdae7385), .K12_C3_W8(32'hbdd51bb3), 
		.K12_C4_W0(32'hbda9d79d), .K12_C4_W1(32'h3ce0f772), .K12_C4_W2(32'h3e2287b6), .K12_C4_W3(32'h3c9a8b38), .K12_C4_W4(32'h3c77893e), .K12_C4_W5(32'h3e19144f), .K12_C4_W6(32'h3dedcaf4), .K12_C4_W7(32'hbb610c32), .K12_C4_W8(32'h3daec2c5), 
		.K12_C5_W0(32'hbb3d446e), .K12_C5_W1(32'hbe1bb7c4), .K12_C5_W2(32'h3d48c9c2), .K12_C5_W3(32'h3cf1d9e4), .K12_C5_W4(32'h3dc6fe85), .K12_C5_W5(32'h3e1710ab), .K12_C5_W6(32'h3d226c7a), .K12_C5_W7(32'h3d19b315), .K12_C5_W8(32'hbde4a3c7), 
		.K12_C6_W0(32'h3d32886a), .K12_C6_W1(32'hbdf44de2), .K12_C6_W2(32'h3cb72445), .K12_C6_W3(32'h3d3b6b2d), .K12_C6_W4(32'hbd6ce51f), .K12_C6_W5(32'h3d10ad85), .K12_C6_W6(32'h3e000f85), .K12_C6_W7(32'h3c7aca96), .K12_C6_W8(32'h3e196148), 
		.K12_C7_W0(32'hbd88307b), .K12_C7_W1(32'hbe01c03c), .K12_C7_W2(32'hbe0fdec0), .K12_C7_W3(32'h3e1b98a0), .K12_C7_W4(32'h3d7cdd4c), .K12_C7_W5(32'hbdb53377), .K12_C7_W6(32'h3d3b8526), .K12_C7_W7(32'h3dba228b), .K12_C7_W8(32'hbdb71d97), 
		.K12_C8_W0(32'h3e0d4aae), .K12_C8_W1(32'h3d8279c4), .K12_C8_W2(32'h3dd8f411), .K12_C8_W3(32'h3d845719), .K12_C8_W4(32'hbd219b33), .K12_C8_W5(32'hbc5d36e1), .K12_C8_W6(32'h3d42ee45), .K12_C8_W7(32'hbe1e8276), .K12_C8_W8(32'hb99acda2), 
		.K12_C9_W0(32'hbdae9c8c), .K12_C9_W1(32'hbdd80cf4), .K12_C9_W2(32'hbc6b19d6), .K12_C9_W3(32'h3d420dbe), .K12_C9_W4(32'h3e003fe1), .K12_C9_W5(32'h3e2d9e98), .K12_C9_W6(32'h3cbce7e0), .K12_C9_W7(32'h3d9163c3), .K12_C9_W8(32'hbd659cfa), 
		.K12_C10_W0(32'hbd858339), .K12_C10_W1(32'hbd30ef1a), .K12_C10_W2(32'h3d342fd7), .K12_C10_W3(32'hbdef6438), .K12_C10_W4(32'h3d0b3077), .K12_C10_W5(32'h3d3b0c8c), .K12_C10_W6(32'hbe084172), .K12_C10_W7(32'hbdf52b70), .K12_C10_W8(32'h3d227898), 
		.K12_C11_W0(32'hbd3ce973), .K12_C11_W1(32'h3e22bf86), .K12_C11_W2(32'h3dc47635), .K12_C11_W3(32'hbcf70a5d), .K12_C11_W4(32'h3dfd4b1d), .K12_C11_W5(32'h3cfb2dbf), .K12_C11_W6(32'h3e084205), .K12_C11_W7(32'h3d8ad4a3), .K12_C11_W8(32'hbe215cbf), 
		.K12_C12_W0(32'h3d6d11de), .K12_C12_W1(32'h3db33e90), .K12_C12_W2(32'hbbc33e53), .K12_C12_W3(32'h3bf45ca8), .K12_C12_W4(32'h3cb6ac30), .K12_C12_W5(32'hbe0743d7), .K12_C12_W6(32'hbd8a2999), .K12_C12_W7(32'h3d8b4147), .K12_C12_W8(32'h3d3946b1), 
		.K12_C13_W0(32'hbcaa0e23), .K12_C13_W1(32'hbcd1b8b6), .K12_C13_W2(32'hbe2ae4fc), .K12_C13_W3(32'h3d97b7f9), .K12_C13_W4(32'hbdb42c05), .K12_C13_W5(32'hbdf7794a), .K12_C13_W6(32'hbd9d96d6), .K12_C13_W7(32'h3d93c4f0), .K12_C13_W8(32'hbd05c540), 
		.K12_C14_W0(32'hbd944cde), .K12_C14_W1(32'h3e11d209), .K12_C14_W2(32'h3d510ffa), .K12_C14_W3(32'hbc43ff4e), .K12_C14_W4(32'hbc35e646), .K12_C14_W5(32'hbd58ac98), .K12_C14_W6(32'h3e0430b2), .K12_C14_W7(32'hbcc23403), .K12_C14_W8(32'hbdbb325c), 
		.K12_C15_W0(32'h3d810dd1), .K12_C15_W1(32'hbd8ac132), .K12_C15_W2(32'hbe04695f), .K12_C15_W3(32'h3d2f8879), .K12_C15_W4(32'h3deebd61), .K12_C15_W5(32'hbe247677), .K12_C15_W6(32'hbdedddb3), .K12_C15_W7(32'hbd1ba08f), .K12_C15_W8(32'hbe1a1797), 
		.K12_BIAS (32'hbbb55caa),

		.K13_C0_W0(32'h3e0ab894), .K13_C0_W1(32'hbd45b552), .K13_C0_W2(32'hbb8559c3), .K13_C0_W3(32'h3de8f4a6), .K13_C0_W4(32'hbe083a1d), .K13_C0_W5(32'h3ca1ed24), .K13_C0_W6(32'h3dad3712), .K13_C0_W7(32'h3cb7c592), .K13_C0_W8(32'h3dd4f7ce), 
		.K13_C1_W0(32'hbda9cbca), .K13_C1_W1(32'hbd5d31f8), .K13_C1_W2(32'hbdd4d520), .K13_C1_W3(32'h3d82c7ec), .K13_C1_W4(32'h3d4a1972), .K13_C1_W5(32'h3dff0dd9), .K13_C1_W6(32'h3e246153), .K13_C1_W7(32'hbc9a8061), .K13_C1_W8(32'h3e04ebfe), 
		.K13_C2_W0(32'hbdce06ac), .K13_C2_W1(32'h3b95d963), .K13_C2_W2(32'hbd465fc7), .K13_C2_W3(32'hbcb72e11), .K13_C2_W4(32'h3d3ba347), .K13_C2_W5(32'h3bb8f0d9), .K13_C2_W6(32'h3de2cb86), .K13_C2_W7(32'hbd47322f), .K13_C2_W8(32'hb940c282), 
		.K13_C3_W0(32'hbdbdd03f), .K13_C3_W1(32'h3dfc2217), .K13_C3_W2(32'h3dc2d4d4), .K13_C3_W3(32'h3de977ae), .K13_C3_W4(32'hbd9b5712), .K13_C3_W5(32'h3e06654d), .K13_C3_W6(32'hbd56e571), .K13_C3_W7(32'hbb03b2bc), .K13_C3_W8(32'h3ddb1b84), 
		.K13_C4_W0(32'h3dbe0352), .K13_C4_W1(32'h3e113d74), .K13_C4_W2(32'h3e0a251d), .K13_C4_W3(32'hbde6ea9a), .K13_C4_W4(32'h3dc11add), .K13_C4_W5(32'h3d572ba8), .K13_C4_W6(32'h3cccb48e), .K13_C4_W7(32'h3d04b3d6), .K13_C4_W8(32'h3dccadc3), 
		.K13_C5_W0(32'h3bbb72db), .K13_C5_W1(32'h3d3bc12c), .K13_C5_W2(32'hbb11bbdc), .K13_C5_W3(32'hbe0c8fee), .K13_C5_W4(32'h3d8bdc31), .K13_C5_W5(32'hbc9de684), .K13_C5_W6(32'hbda61fc5), .K13_C5_W7(32'h3d6230d5), .K13_C5_W8(32'h3a12b3ea), 
		.K13_C6_W0(32'hbe0e5f9b), .K13_C6_W1(32'h3de9a6ba), .K13_C6_W2(32'hbcbdf290), .K13_C6_W3(32'hbdfbf4bf), .K13_C6_W4(32'h3d107e50), .K13_C6_W5(32'h3c1c4597), .K13_C6_W6(32'hbd8a3705), .K13_C6_W7(32'hbd27313f), .K13_C6_W8(32'h3e292468), 
		.K13_C7_W0(32'hbd36e9b3), .K13_C7_W1(32'h3e017b0f), .K13_C7_W2(32'h3e42fefb), .K13_C7_W3(32'hbdc1378f), .K13_C7_W4(32'h3dcb90c2), .K13_C7_W5(32'h3da92c22), .K13_C7_W6(32'hbdecc58c), .K13_C7_W7(32'hbdbfe431), .K13_C7_W8(32'hbdae54e9), 
		.K13_C8_W0(32'h3d6918df), .K13_C8_W1(32'hbd4f3275), .K13_C8_W2(32'h3df6e68d), .K13_C8_W3(32'hbdd7fed8), .K13_C8_W4(32'h3dcb25e6), .K13_C8_W5(32'h3dad2e10), .K13_C8_W6(32'hbdae169b), .K13_C8_W7(32'hbdcd2736), .K13_C8_W8(32'hbc49c41a), 
		.K13_C9_W0(32'hbd49be71), .K13_C9_W1(32'hbe0ab648), .K13_C9_W2(32'hbbc5529b), .K13_C9_W3(32'h3e0a3e7c), .K13_C9_W4(32'hbd3a43cd), .K13_C9_W5(32'hbd4afd15), .K13_C9_W6(32'hbe112ea6), .K13_C9_W7(32'h3dd901fb), .K13_C9_W8(32'hbdf87756), 
		.K13_C10_W0(32'hbcb7d8c1), .K13_C10_W1(32'hbd88079f), .K13_C10_W2(32'hbd27756a), .K13_C10_W3(32'h3e2153ad), .K13_C10_W4(32'hbd84ba93), .K13_C10_W5(32'hbdef565f), .K13_C10_W6(32'h3de43624), .K13_C10_W7(32'h3d9f61cd), .K13_C10_W8(32'h3e2aad25), 
		.K13_C11_W0(32'h3da757d7), .K13_C11_W1(32'h3d9eb44b), .K13_C11_W2(32'hbd720f27), .K13_C11_W3(32'hbd89d074), .K13_C11_W4(32'hbd9081d5), .K13_C11_W5(32'h3d734f96), .K13_C11_W6(32'hbd91ec6a), .K13_C11_W7(32'hbc78ffe7), .K13_C11_W8(32'hbcd3a0ee), 
		.K13_C12_W0(32'h3d4aa667), .K13_C12_W1(32'h3d1039a5), .K13_C12_W2(32'hbd2bd340), .K13_C12_W3(32'h3bc358ee), .K13_C12_W4(32'hbd008832), .K13_C12_W5(32'hbdc15498), .K13_C12_W6(32'h3dbe997a), .K13_C12_W7(32'h3bf2ee60), .K13_C12_W8(32'hbd346e7a), 
		.K13_C13_W0(32'hbe25f51c), .K13_C13_W1(32'hbe0632b2), .K13_C13_W2(32'hbc5f7066), .K13_C13_W3(32'hbd9cb49b), .K13_C13_W4(32'hbd30d361), .K13_C13_W5(32'h3dc53034), .K13_C13_W6(32'h3cd60e13), .K13_C13_W7(32'hbc86bb8c), .K13_C13_W8(32'h3dba5ef8), 
		.K13_C14_W0(32'hbde620a0), .K13_C14_W1(32'hbcc31da3), .K13_C14_W2(32'h3d8a6855), .K13_C14_W3(32'h3de6d86b), .K13_C14_W4(32'h3dfc5a53), .K13_C14_W5(32'h3df35b28), .K13_C14_W6(32'h3c84d911), .K13_C14_W7(32'h3d28ae94), .K13_C14_W8(32'hbd57e3d4), 
		.K13_C15_W0(32'hbd6d3f77), .K13_C15_W1(32'h3cac4dce), .K13_C15_W2(32'h3973450b), .K13_C15_W3(32'hbd40729e), .K13_C15_W4(32'hbd743e99), .K13_C15_W5(32'h3d26e4e6), .K13_C15_W6(32'h3e1676d7), .K13_C15_W7(32'h3d610ca1), .K13_C15_W8(32'h3e07d6a8), 
		.K13_BIAS (32'h3d03d650),

		.K14_C0_W0(32'hbd380493), .K14_C0_W1(32'hbdff766a), .K14_C0_W2(32'hbde5866d), .K14_C0_W3(32'h3db0c94b), .K14_C0_W4(32'hbdbfd4d6), .K14_C0_W5(32'h3dc4da9a), .K14_C0_W6(32'h3dca5dc7), .K14_C0_W7(32'h3d8412e7), .K14_C0_W8(32'h3d0b56ac), 
		.K14_C1_W0(32'h3e0e0a4b), .K14_C1_W1(32'h3d9099dc), .K14_C1_W2(32'h3ddaca81), .K14_C1_W3(32'h3d79f820), .K14_C1_W4(32'hbcc2c6c6), .K14_C1_W5(32'hbd1d0404), .K14_C1_W6(32'hbe1b1daa), .K14_C1_W7(32'h3da336bf), .K14_C1_W8(32'hbd853a9c), 
		.K14_C2_W0(32'hbde8130b), .K14_C2_W1(32'hbe12145f), .K14_C2_W2(32'hbc727abb), .K14_C2_W3(32'hbb6cbd9f), .K14_C2_W4(32'h3d84f5e1), .K14_C2_W5(32'hbdfed89a), .K14_C2_W6(32'h3e00aa8f), .K14_C2_W7(32'h3d586c99), .K14_C2_W8(32'hbdcc4ead), 
		.K14_C3_W0(32'h3bb5212b), .K14_C3_W1(32'hbe21f855), .K14_C3_W2(32'hbe0f5e30), .K14_C3_W3(32'h3d805fbc), .K14_C3_W4(32'hbdb6126c), .K14_C3_W5(32'h3db40451), .K14_C3_W6(32'h3cee7223), .K14_C3_W7(32'h3e13e9f9), .K14_C3_W8(32'h3ce82ad9), 
		.K14_C4_W0(32'hbc4eaeb8), .K14_C4_W1(32'h3d313a58), .K14_C4_W2(32'h3d8e9747), .K14_C4_W3(32'h3d2f1b0d), .K14_C4_W4(32'hbe100029), .K14_C4_W5(32'hbcf9818c), .K14_C4_W6(32'h3dcea6a4), .K14_C4_W7(32'h3dc42bfd), .K14_C4_W8(32'h3dd33679), 
		.K14_C5_W0(32'h3d329ddd), .K14_C5_W1(32'hbc351017), .K14_C5_W2(32'hbdb447e5), .K14_C5_W3(32'hbde28ebb), .K14_C5_W4(32'h3dfcbd2a), .K14_C5_W5(32'hbd8aa13c), .K14_C5_W6(32'hbdcc15ce), .K14_C5_W7(32'hbcd8e2b7), .K14_C5_W8(32'hbdd489d6), 
		.K14_C6_W0(32'h3db36c4f), .K14_C6_W1(32'h3da91dc7), .K14_C6_W2(32'h3d85b278), .K14_C6_W3(32'h3d347063), .K14_C6_W4(32'hbdf01ac0), .K14_C6_W5(32'h3d896a67), .K14_C6_W6(32'h3c8f3484), .K14_C6_W7(32'hbde80c9d), .K14_C6_W8(32'h3d94559c), 
		.K14_C7_W0(32'hbca0a19b), .K14_C7_W1(32'hbbed6939), .K14_C7_W2(32'h3d313fd7), .K14_C7_W3(32'hbe14a655), .K14_C7_W4(32'hbb856519), .K14_C7_W5(32'hbdcb62e4), .K14_C7_W6(32'hbcfa1645), .K14_C7_W7(32'hbd2b3c3b), .K14_C7_W8(32'hbe0b1fe4), 
		.K14_C8_W0(32'hbcf2f0de), .K14_C8_W1(32'hbcf1e90c), .K14_C8_W2(32'h3d5deec9), .K14_C8_W3(32'h3d8a8157), .K14_C8_W4(32'hbdfb8555), .K14_C8_W5(32'hbd0e2073), .K14_C8_W6(32'hbde3ce7b), .K14_C8_W7(32'hbdca0b6f), .K14_C8_W8(32'h3dccdc0c), 
		.K14_C9_W0(32'hbe04021e), .K14_C9_W1(32'h392b1608), .K14_C9_W2(32'h3c836e83), .K14_C9_W3(32'h3ce714fd), .K14_C9_W4(32'hbccccc8e), .K14_C9_W5(32'hbdc9a8a1), .K14_C9_W6(32'hbdd68d22), .K14_C9_W7(32'h3cc742a2), .K14_C9_W8(32'h3dc32536), 
		.K14_C10_W0(32'hbda6bf85), .K14_C10_W1(32'h3cf587fb), .K14_C10_W2(32'hbda024a4), .K14_C10_W3(32'h3db1cfc7), .K14_C10_W4(32'h3dffb5a0), .K14_C10_W5(32'hbde38bb9), .K14_C10_W6(32'hb9f55949), .K14_C10_W7(32'h3d7bfe63), .K14_C10_W8(32'hbbee40fd), 
		.K14_C11_W0(32'h3c08c26a), .K14_C11_W1(32'h3e173025), .K14_C11_W2(32'hbd5bc033), .K14_C11_W3(32'h3dd83e41), .K14_C11_W4(32'h3dc1a950), .K14_C11_W5(32'hbe070d02), .K14_C11_W6(32'h3cad3941), .K14_C11_W7(32'h3943e528), .K14_C11_W8(32'hbd0c8911), 
		.K14_C12_W0(32'hbdfc2b20), .K14_C12_W1(32'h3d7b98b4), .K14_C12_W2(32'hbdda7ae7), .K14_C12_W3(32'hbe205443), .K14_C12_W4(32'hbd1697a4), .K14_C12_W5(32'h3e13eb64), .K14_C12_W6(32'h3d9189bd), .K14_C12_W7(32'hbd18bf90), .K14_C12_W8(32'hbd9a7938), 
		.K14_C13_W0(32'h3bf05e0f), .K14_C13_W1(32'h3d9f05db), .K14_C13_W2(32'h3e15e99f), .K14_C13_W3(32'hbe09892d), .K14_C13_W4(32'h3ae19646), .K14_C13_W5(32'hbdd776d6), .K14_C13_W6(32'hbd16d470), .K14_C13_W7(32'hbe0e8f87), .K14_C13_W8(32'hbc2aeb74), 
		.K14_C14_W0(32'h3d970c49), .K14_C14_W1(32'hbcb13269), .K14_C14_W2(32'h3cf2c386), .K14_C14_W3(32'hbd5fee6f), .K14_C14_W4(32'h3d56ec87), .K14_C14_W5(32'hbd3c4aa3), .K14_C14_W6(32'hbdf13ec0), .K14_C14_W7(32'hbdecc1cf), .K14_C14_W8(32'hbcd3f0ca), 
		.K14_C15_W0(32'hbdd3816e), .K14_C15_W1(32'h3d210755), .K14_C15_W2(32'hbda77c27), .K14_C15_W3(32'h3d8a99ec), .K14_C15_W4(32'h3df26a55), .K14_C15_W5(32'hbde26513), .K14_C15_W6(32'hbd779bbf), .K14_C15_W7(32'hbcdd7f80), .K14_C15_W8(32'hbdc7205b), 
		.K14_BIAS (32'hbd04e4ad),

		.K15_C0_W0(32'h3df2c6be), .K15_C0_W1(32'h3caf174b), .K15_C0_W2(32'h3d8ad2df), .K15_C0_W3(32'h3d638121), .K15_C0_W4(32'hbde09203), .K15_C0_W5(32'h3dbab3ad), .K15_C0_W6(32'hbd0b20e5), .K15_C0_W7(32'h3e0198aa), .K15_C0_W8(32'hbd776237), 
		.K15_C1_W0(32'h3c69e2d3), .K15_C1_W1(32'h3d91c10f), .K15_C1_W2(32'h3bbf77dd), .K15_C1_W3(32'h3d25a1ad), .K15_C1_W4(32'hbcb42657), .K15_C1_W5(32'hbddf9e33), .K15_C1_W6(32'h3c28a6fa), .K15_C1_W7(32'h3cd9cbdf), .K15_C1_W8(32'hbd85f2cf), 
		.K15_C2_W0(32'hbd825587), .K15_C2_W1(32'hbdc6a345), .K15_C2_W2(32'hbdafe27a), .K15_C2_W3(32'h3dc2227d), .K15_C2_W4(32'h3de00ada), .K15_C2_W5(32'hbdbcd6bb), .K15_C2_W6(32'h3d1dfd17), .K15_C2_W7(32'h3d2ae58f), .K15_C2_W8(32'h3d29fee9), 
		.K15_C3_W0(32'h3d387dc0), .K15_C3_W1(32'hbde2e3d5), .K15_C3_W2(32'hbcec8b28), .K15_C3_W3(32'h3df03799), .K15_C3_W4(32'hbd8fee81), .K15_C3_W5(32'hbe1f781a), .K15_C3_W6(32'h3e31e38a), .K15_C3_W7(32'h3dfc00dc), .K15_C3_W8(32'hbcdcf1ca), 
		.K15_C4_W0(32'h3dfe27fc), .K15_C4_W1(32'hbdee8631), .K15_C4_W2(32'h3d949f3a), .K15_C4_W3(32'h3dba27c0), .K15_C4_W4(32'h3d47f7f6), .K15_C4_W5(32'h3e15748d), .K15_C4_W6(32'hbd94e67a), .K15_C4_W7(32'hbd410e23), .K15_C4_W8(32'h3e143a1d), 
		.K15_C5_W0(32'h3d50655a), .K15_C5_W1(32'h3ccabc9b), .K15_C5_W2(32'h3dc31b1e), .K15_C5_W3(32'hbdc3819c), .K15_C5_W4(32'hbe16fda0), .K15_C5_W5(32'h3da8bd13), .K15_C5_W6(32'hbe051684), .K15_C5_W7(32'hbb7c0f58), .K15_C5_W8(32'hbcf0fcb7), 
		.K15_C6_W0(32'hbdd0dbce), .K15_C6_W1(32'h3cb4ddd4), .K15_C6_W2(32'hbdd807fc), .K15_C6_W3(32'h3e2d018c), .K15_C6_W4(32'h3d946bec), .K15_C6_W5(32'h3db18af6), .K15_C6_W6(32'hbde62bac), .K15_C6_W7(32'h3dbc56c2), .K15_C6_W8(32'hbd1a1cd5), 
		.K15_C7_W0(32'hbd810e35), .K15_C7_W1(32'hbc899349), .K15_C7_W2(32'hbbad403a), .K15_C7_W3(32'h3cdc0d88), .K15_C7_W4(32'hbd6c9112), .K15_C7_W5(32'h3e305964), .K15_C7_W6(32'hbe1b1b45), .K15_C7_W7(32'h3c21fe58), .K15_C7_W8(32'hbdd6ee0c), 
		.K15_C8_W0(32'hbcf0f6c6), .K15_C8_W1(32'hbde124ec), .K15_C8_W2(32'h3d98c042), .K15_C8_W3(32'hbdf8130e), .K15_C8_W4(32'hbd033c0a), .K15_C8_W5(32'hbd4fdf55), .K15_C8_W6(32'hbc1f44d7), .K15_C8_W7(32'h3e29e4a4), .K15_C8_W8(32'h3e2363f7), 
		.K15_C9_W0(32'hbda2439a), .K15_C9_W1(32'hbd1132d1), .K15_C9_W2(32'hbdd92dd3), .K15_C9_W3(32'hbd714ec6), .K15_C9_W4(32'hbd8e7a32), .K15_C9_W5(32'hbd086076), .K15_C9_W6(32'h3da2dd36), .K15_C9_W7(32'h3dfb80be), .K15_C9_W8(32'h3d811e56), 
		.K15_C10_W0(32'h3d620fc5), .K15_C10_W1(32'hbda26dc8), .K15_C10_W2(32'h3c94fc17), .K15_C10_W3(32'h3e27a454), .K15_C10_W4(32'h3e2acd96), .K15_C10_W5(32'h3dae1225), .K15_C10_W6(32'h3c9707a8), .K15_C10_W7(32'h3da82f4e), .K15_C10_W8(32'hbe1766c0), 
		.K15_C11_W0(32'hbbe9add6), .K15_C11_W1(32'h3d9600f4), .K15_C11_W2(32'h3e0e9dd3), .K15_C11_W3(32'h3d5569e7), .K15_C11_W4(32'hbd8edc6d), .K15_C11_W5(32'hbd8047ce), .K15_C11_W6(32'h3de63e01), .K15_C11_W7(32'hbd97bd95), .K15_C11_W8(32'h3da63adc), 
		.K15_C12_W0(32'h3e4577bc), .K15_C12_W1(32'h3e4b5ddf), .K15_C12_W2(32'h3d152923), .K15_C12_W3(32'hbdadcce5), .K15_C12_W4(32'h3d639aba), .K15_C12_W5(32'h3d4c3571), .K15_C12_W6(32'hbdcdaad7), .K15_C12_W7(32'hbda904e4), .K15_C12_W8(32'hbd842681), 
		.K15_C13_W0(32'h3e3a1178), .K15_C13_W1(32'h3d98f40f), .K15_C13_W2(32'hbd0dd970), .K15_C13_W3(32'hbdf943f0), .K15_C13_W4(32'h3d96b4f7), .K15_C13_W5(32'hbcea8df4), .K15_C13_W6(32'h3dce0add), .K15_C13_W7(32'h3d8c18d9), .K15_C13_W8(32'h3cd0453d), 
		.K15_C14_W0(32'h3d53b17b), .K15_C14_W1(32'h3d99eea2), .K15_C14_W2(32'hbca9d165), .K15_C14_W3(32'hb9ad621b), .K15_C14_W4(32'hbe03e7ae), .K15_C14_W5(32'h3df02e80), .K15_C14_W6(32'h3d9bf0e5), .K15_C14_W7(32'hbc1d9f08), .K15_C14_W8(32'h3d14bf29), 
		.K15_C15_W0(32'h3e14814f), .K15_C15_W1(32'h3cc7cc05), .K15_C15_W2(32'hbd4594e6), .K15_C15_W3(32'hbdc913c6), .K15_C15_W4(32'hbdaca14d), .K15_C15_W5(32'hbda1de85), .K15_C15_W6(32'h3e0c141d), .K15_C15_W7(32'h3d9bea04), .K15_C15_W8(32'hbdaede04), 
		.K15_BIAS (32'hbbaf1269)
		)
		block5_conv1(
		.clk(clk),
		.resetn(resetn),
		.data_valid_in(valid_out_pool_4_3[0]),		// Edit here - [index]
		.data_in_0(data_out_pool_4_3[0]),
		.data_in_1(data_out_pool_4_3[1]),
		.data_in_2(data_out_pool_4_3[2]),
		.data_in_3(data_out_pool_4_3[3]),
		.data_in_4(data_out_pool_4_3[4]),
		.data_in_5(data_out_pool_4_3[5]),
		.data_in_6(data_out_pool_4_3[6]),
		.data_in_7(data_out_pool_4_3[7]),
		.data_in_8(data_out_pool_4_3[8]),
		.data_in_9(data_out_pool_4_3[9]),
		.data_in_10(data_out_pool_4_3[10]),
		.data_in_11(data_out_pool_4_3[11]),
		.data_in_12(data_out_pool_4_3[12]),
		.data_in_13(data_out_pool_4_3[13]),
		.data_in_14(data_out_pool_4_3[14]),
		.data_in_15(data_out_pool_4_3[15]),
		.data_out_conv_0(conv_out_5_1[0]),
		.data_out_conv_1(conv_out_5_1[1]),
		.data_out_conv_2(conv_out_5_1[2]),
		.data_out_conv_3(conv_out_5_1[3]),
		.data_out_conv_4(conv_out_5_1[4]),
		.data_out_conv_5(conv_out_5_1[5]),
		.data_out_conv_6(conv_out_5_1[6]),
		.data_out_conv_7(conv_out_5_1[7]),
		.data_out_conv_8(conv_out_5_1[8]),
		.data_out_conv_9(conv_out_5_1[9]),
		.data_out_conv_10(conv_out_5_1[10]),
		.data_out_conv_11(conv_out_5_1[11]),
		.data_out_conv_12(conv_out_5_1[12]),
		.data_out_conv_13(conv_out_5_1[13]),
		.data_out_conv_14(conv_out_5_1[14]),
		.data_out_conv_15(conv_out_5_1[15]),
		.valid_out_pixel(conv_valid_out_5_1),
		.done(done_conv_5_1)
		);



	generate
    for (i = 0; i < CHANNEL_OUT*2; i=i+1) 
    begin : relu_5_1 // needs CHANNEL_OUT*2 relu

        activate #(
            .DATA_WIDTH(32)
        )
        relu (
            .in(conv_out_5_1[i]),			// Edit here
            .out(relu_out_5_1[i])
        );
    end
    endgenerate




	conv3d_16_kernel_16_channel_size_3 #(
		.DATA_WIDTH(32),.IMG_WIDTH(WIDTH/16),.IMG_HEIGHT(HEIGHT/16),	// Edit here
		.K0_C0_W0(32'hbd85b42f), .K0_C0_W1(32'h3dceeb4e), .K0_C0_W2(32'h3e34fa16), .K0_C0_W3(32'hbdab5411), .K0_C0_W4(32'hbdba0e5a), .K0_C0_W5(32'h3dde5897), .K0_C0_W6(32'hbe0609f3), .K0_C0_W7(32'h3e406b4f), .K0_C0_W8(32'hbe04d642), 
		.K0_C1_W0(32'hbdc0abec), .K0_C1_W1(32'hbc839d8a), .K0_C1_W2(32'h3d81190e), .K0_C1_W3(32'hbe0839e4), .K0_C1_W4(32'h3e0a2141), .K0_C1_W5(32'hbd7563e9), .K0_C1_W6(32'h3db7a708), .K0_C1_W7(32'hbd8a98aa), .K0_C1_W8(32'hbe09d424), 
		.K0_C2_W0(32'h3e0a222e), .K0_C2_W1(32'hbdf650cf), .K0_C2_W2(32'h3c85140d), .K0_C2_W3(32'h3de3d30c), .K0_C2_W4(32'hbdee9ea5), .K0_C2_W5(32'hbcda4c8a), .K0_C2_W6(32'h3df33dce), .K0_C2_W7(32'h3c8f857e), .K0_C2_W8(32'hbd311223), 
		.K0_C3_W0(32'hbdbe8a92), .K0_C3_W1(32'h3e0733ab), .K0_C3_W2(32'hbdd7a09e), .K0_C3_W3(32'hbc496133), .K0_C3_W4(32'h3e1a598c), .K0_C3_W5(32'hbe12e5d9), .K0_C3_W6(32'h3d7c1acb), .K0_C3_W7(32'h3d0503df), .K0_C3_W8(32'hbd8def55), 
		.K0_C4_W0(32'h3d39e354), .K0_C4_W1(32'h3d43e705), .K0_C4_W2(32'h3d0e3f82), .K0_C4_W3(32'hbde7c823), .K0_C4_W4(32'hbdc901b4), .K0_C4_W5(32'h3cf6cb13), .K0_C4_W6(32'h3dc54f0d), .K0_C4_W7(32'hbd84d725), .K0_C4_W8(32'hbd9f1651), 
		.K0_C5_W0(32'hbd931b36), .K0_C5_W1(32'hbddfdd67), .K0_C5_W2(32'hbdf33669), .K0_C5_W3(32'h3c596ecd), .K0_C5_W4(32'h3e28fcf7), .K0_C5_W5(32'h3ddb1195), .K0_C5_W6(32'h3d0c6295), .K0_C5_W7(32'h3d0bcb86), .K0_C5_W8(32'hbde71975), 
		.K0_C6_W0(32'hbdb64392), .K0_C6_W1(32'h3da5f3fd), .K0_C6_W2(32'h3e341b09), .K0_C6_W3(32'hbd7bbed2), .K0_C6_W4(32'hbd17d24b), .K0_C6_W5(32'hbe21afec), .K0_C6_W6(32'h3c853604), .K0_C6_W7(32'h3d52f96b), .K0_C6_W8(32'h3c899d01), 
		.K0_C7_W0(32'h3da88e4f), .K0_C7_W1(32'h3cdfbad8), .K0_C7_W2(32'h3dbe9726), .K0_C7_W3(32'h3cc96451), .K0_C7_W4(32'hbd15d146), .K0_C7_W5(32'h3d22a2f5), .K0_C7_W6(32'h3bb7bab0), .K0_C7_W7(32'h3d069788), .K0_C7_W8(32'h3e186800), 
		.K0_C8_W0(32'h3d4f8d52), .K0_C8_W1(32'h3e10c7d2), .K0_C8_W2(32'h3dd9be00), .K0_C8_W3(32'hbddacbd9), .K0_C8_W4(32'h3dea219b), .K0_C8_W5(32'h3ced4767), .K0_C8_W6(32'h3d94f836), .K0_C8_W7(32'h3ddb286f), .K0_C8_W8(32'h3dbcc300), 
		.K0_C9_W0(32'h3d910421), .K0_C9_W1(32'hbd996570), .K0_C9_W2(32'h3d9aa8db), .K0_C9_W3(32'h3def3119), .K0_C9_W4(32'hbd1c5e0a), .K0_C9_W5(32'hbdbbabf6), .K0_C9_W6(32'hbc94407c), .K0_C9_W7(32'h3e028c9c), .K0_C9_W8(32'h3dbd3820), 
		.K0_C10_W0(32'h3d73f893), .K0_C10_W1(32'hbc30be87), .K0_C10_W2(32'h3df7a839), .K0_C10_W3(32'h3e07ce6e), .K0_C10_W4(32'h3aa23174), .K0_C10_W5(32'hbd678bdd), .K0_C10_W6(32'hbc073fef), .K0_C10_W7(32'h3dd377a7), .K0_C10_W8(32'hbdd71ffb), 
		.K0_C11_W0(32'hbcb41ce3), .K0_C11_W1(32'h3ca32c91), .K0_C11_W2(32'h3c404814), .K0_C11_W3(32'h3e08ea84), .K0_C11_W4(32'hbdaf7cda), .K0_C11_W5(32'h3ddc1578), .K0_C11_W6(32'hbdb56eb5), .K0_C11_W7(32'h3ddc9c63), .K0_C11_W8(32'h3d848383), 
		.K0_C12_W0(32'h3c48fd1d), .K0_C12_W1(32'h3e0a34e9), .K0_C12_W2(32'h3dee5965), .K0_C12_W3(32'h3cd8d1d2), .K0_C12_W4(32'h3d324819), .K0_C12_W5(32'hbd42d986), .K0_C12_W6(32'h3e189189), .K0_C12_W7(32'hbdc5d32f), .K0_C12_W8(32'hbdda9974), 
		.K0_C13_W0(32'hbd46ea40), .K0_C13_W1(32'hbba77c80), .K0_C13_W2(32'h3de74ac3), .K0_C13_W3(32'hbdbe48f1), .K0_C13_W4(32'hbe1c5877), .K0_C13_W5(32'hbd2b15e4), .K0_C13_W6(32'h3cc2ae63), .K0_C13_W7(32'h3da9550c), .K0_C13_W8(32'h3daad7ce), 
		.K0_C14_W0(32'h3d92e551), .K0_C14_W1(32'h3c5fd2d1), .K0_C14_W2(32'hbd312a1f), .K0_C14_W3(32'h3d9240f4), .K0_C14_W4(32'h3cee7b02), .K0_C14_W5(32'h3df4efce), .K0_C14_W6(32'hbcd6e005), .K0_C14_W7(32'hbe001862), .K0_C14_W8(32'h3db40c65), 
		.K0_C15_W0(32'hbd8b6fbc), .K0_C15_W1(32'hbdafe874), .K0_C15_W2(32'h3dd000e8), .K0_C15_W3(32'h3ca39064), .K0_C15_W4(32'h3e069394), .K0_C15_W5(32'hbd8a35bf), .K0_C15_W6(32'hbdec21f6), .K0_C15_W7(32'h3dec90e6), .K0_C15_W8(32'hbdf88062), 
		.K0_BIAS (32'h3c53aab6),

		.K1_C0_W0(32'hbdf912fb), .K1_C0_W1(32'h3ce160fd), .K1_C0_W2(32'hbcd76c58), .K1_C0_W3(32'hbda93327), .K1_C0_W4(32'hbde03f67), .K1_C0_W5(32'h3d971df0), .K1_C0_W6(32'h3cf97008), .K1_C0_W7(32'h3cc50fe6), .K1_C0_W8(32'hbce24322), 
		.K1_C1_W0(32'h3e09a9bf), .K1_C1_W1(32'hbdfd7c0a), .K1_C1_W2(32'hbc945ac7), .K1_C1_W3(32'hbdc28b81), .K1_C1_W4(32'hbd47524b), .K1_C1_W5(32'h3d6b08df), .K1_C1_W6(32'hbd991abf), .K1_C1_W7(32'h3caa0a8a), .K1_C1_W8(32'h3d527deb), 
		.K1_C2_W0(32'h3de74739), .K1_C2_W1(32'h3e0fd2e2), .K1_C2_W2(32'h3c606aac), .K1_C2_W3(32'h3dd29da5), .K1_C2_W4(32'hbdbb313c), .K1_C2_W5(32'h3dbeba5d), .K1_C2_W6(32'hbd18cb94), .K1_C2_W7(32'hbd93c313), .K1_C2_W8(32'h3e0c70ba), 
		.K1_C3_W0(32'hbd5341e8), .K1_C3_W1(32'h3df0bfbf), .K1_C3_W2(32'h3d6bf4f0), .K1_C3_W3(32'h3c395774), .K1_C3_W4(32'h3c9c1a16), .K1_C3_W5(32'h3e060c32), .K1_C3_W6(32'h3d77c838), .K1_C3_W7(32'hbe135e3b), .K1_C3_W8(32'h3e277ee3), 
		.K1_C4_W0(32'hbdc2a69d), .K1_C4_W1(32'h3d61368e), .K1_C4_W2(32'hbd4e2fe6), .K1_C4_W3(32'h3dc0de13), .K1_C4_W4(32'hbce6f53e), .K1_C4_W5(32'h3d97b6d2), .K1_C4_W6(32'hbd5843cf), .K1_C4_W7(32'hbd9107a9), .K1_C4_W8(32'h3dd0209f), 
		.K1_C5_W0(32'hbde22c71), .K1_C5_W1(32'hbdd4b600), .K1_C5_W2(32'hbd0a3092), .K1_C5_W3(32'hbc80ba07), .K1_C5_W4(32'h3ddbc3a5), .K1_C5_W5(32'h3dd9249c), .K1_C5_W6(32'hbdc35b87), .K1_C5_W7(32'h3d84e34a), .K1_C5_W8(32'h3890258a), 
		.K1_C6_W0(32'hbd0dc2d7), .K1_C6_W1(32'h3c005d75), .K1_C6_W2(32'h3c9d40a7), .K1_C6_W3(32'h3b6247d3), .K1_C6_W4(32'h3db51eeb), .K1_C6_W5(32'hbe0f9ebe), .K1_C6_W6(32'hbdcf159a), .K1_C6_W7(32'hbdad86ae), .K1_C6_W8(32'h3dbba6a4), 
		.K1_C7_W0(32'h3c469509), .K1_C7_W1(32'h3d866f05), .K1_C7_W2(32'hbd4f4c22), .K1_C7_W3(32'hbdefcda3), .K1_C7_W4(32'hbbb94777), .K1_C7_W5(32'hbe0b5a80), .K1_C7_W6(32'h3dc5b9b0), .K1_C7_W7(32'h3dc39fea), .K1_C7_W8(32'hbd0fc7d7), 
		.K1_C8_W0(32'hbd9d6d9d), .K1_C8_W1(32'hbdbda538), .K1_C8_W2(32'h3ddbcf6a), .K1_C8_W3(32'hbbb096b7), .K1_C8_W4(32'hbe12573b), .K1_C8_W5(32'hbc579a5f), .K1_C8_W6(32'hbe19329b), .K1_C8_W7(32'hbe0aab78), .K1_C8_W8(32'h3d82a0d3), 
		.K1_C9_W0(32'h3d00f46b), .K1_C9_W1(32'h3c0a53a7), .K1_C9_W2(32'hbe039987), .K1_C9_W3(32'h3ca29661), .K1_C9_W4(32'hbbd5469e), .K1_C9_W5(32'hbc6d1985), .K1_C9_W6(32'hbdba371d), .K1_C9_W7(32'h3da60363), .K1_C9_W8(32'hbd27aa5b), 
		.K1_C10_W0(32'hbdd8b6c1), .K1_C10_W1(32'hbe1a4311), .K1_C10_W2(32'hbd9470e7), .K1_C10_W3(32'h3e228c67), .K1_C10_W4(32'hbe0e1405), .K1_C10_W5(32'hbc470011), .K1_C10_W6(32'h3e0ebc6b), .K1_C10_W7(32'hbdb065f0), .K1_C10_W8(32'h3cb46d47), 
		.K1_C11_W0(32'h3bb04c75), .K1_C11_W1(32'hbbc12fc1), .K1_C11_W2(32'h3c57e177), .K1_C11_W3(32'h3d3fb7df), .K1_C11_W4(32'hbe04af7f), .K1_C11_W5(32'h3e03fecb), .K1_C11_W6(32'hbd628661), .K1_C11_W7(32'hbdd82742), .K1_C11_W8(32'h3dd5d10c), 
		.K1_C12_W0(32'hbda5c094), .K1_C12_W1(32'h3d3d43ca), .K1_C12_W2(32'h3dc425fe), .K1_C12_W3(32'h3d4087a5), .K1_C12_W4(32'hbd3d74f2), .K1_C12_W5(32'hbd256e1e), .K1_C12_W6(32'h3de300eb), .K1_C12_W7(32'h3de50073), .K1_C12_W8(32'hbdd1e9d4), 
		.K1_C13_W0(32'h3dec3dee), .K1_C13_W1(32'h3d825a65), .K1_C13_W2(32'hbcf4e3bb), .K1_C13_W3(32'h3b8e49af), .K1_C13_W4(32'hbe0aa962), .K1_C13_W5(32'hbd11e345), .K1_C13_W6(32'hbc481889), .K1_C13_W7(32'hbdca2780), .K1_C13_W8(32'hbdf46d7a), 
		.K1_C14_W0(32'h3d73ceab), .K1_C14_W1(32'h3d1b2ced), .K1_C14_W2(32'h3cda2525), .K1_C14_W3(32'hbda2e142), .K1_C14_W4(32'hbc7a4a9f), .K1_C14_W5(32'hbcdc0112), .K1_C14_W6(32'hbd6e90e8), .K1_C14_W7(32'h3d224daf), .K1_C14_W8(32'hbde2ef7f), 
		.K1_C15_W0(32'h3c985d32), .K1_C15_W1(32'h3dd01902), .K1_C15_W2(32'hbd384e4e), .K1_C15_W3(32'h3d126c7b), .K1_C15_W4(32'h3d97e26c), .K1_C15_W5(32'h3da8f7c4), .K1_C15_W6(32'hbe32cd19), .K1_C15_W7(32'hbde06a65), .K1_C15_W8(32'h3e0a9003), 
		.K1_BIAS (32'hbc61431b),

		.K2_C0_W0(32'h3deb1248), .K2_C0_W1(32'hbdb9cfd9), .K2_C0_W2(32'hbe2d6f5e), .K2_C0_W3(32'hbdb10769), .K2_C0_W4(32'hbdacad32), .K2_C0_W5(32'h3db89093), .K2_C0_W6(32'h3e356564), .K2_C0_W7(32'h3e2b0687), .K2_C0_W8(32'hbdbe3398), 
		.K2_C1_W0(32'h3dc02831), .K2_C1_W1(32'h3cc820aa), .K2_C1_W2(32'hbd926e5e), .K2_C1_W3(32'h3e0dd43a), .K2_C1_W4(32'hbdba32e3), .K2_C1_W5(32'h3d6e9d17), .K2_C1_W6(32'hbdb43894), .K2_C1_W7(32'hbe00f350), .K2_C1_W8(32'h3b883efc), 
		.K2_C2_W0(32'hbdeed3f9), .K2_C2_W1(32'h3d645309), .K2_C2_W2(32'hbd706dca), .K2_C2_W3(32'h3d7fc5bd), .K2_C2_W4(32'hbdb4ec05), .K2_C2_W5(32'h3e0eb5fe), .K2_C2_W6(32'h3d1dd70d), .K2_C2_W7(32'h3cbe21ec), .K2_C2_W8(32'h3dfb3222), 
		.K2_C3_W0(32'hbcdc071e), .K2_C3_W1(32'h3e18151d), .K2_C3_W2(32'h3e1d4f3a), .K2_C3_W3(32'h3d1e790b), .K2_C3_W4(32'hbe201b2f), .K2_C3_W5(32'hbc55c8e6), .K2_C3_W6(32'h3dd57a8d), .K2_C3_W7(32'hbd760825), .K2_C3_W8(32'hbbffe5b7), 
		.K2_C4_W0(32'hbd43156d), .K2_C4_W1(32'hbe08973c), .K2_C4_W2(32'hbdef080c), .K2_C4_W3(32'hbcd83cee), .K2_C4_W4(32'h3dd721db), .K2_C4_W5(32'h3dee3872), .K2_C4_W6(32'h3c1295b8), .K2_C4_W7(32'hbde5dc7c), .K2_C4_W8(32'hbd921c61), 
		.K2_C5_W0(32'h3d818c4a), .K2_C5_W1(32'h3e16dc9d), .K2_C5_W2(32'h3ce6a000), .K2_C5_W3(32'h3c8de191), .K2_C5_W4(32'h3dbd053b), .K2_C5_W5(32'h3ddcae8c), .K2_C5_W6(32'h3cbf3fb9), .K2_C5_W7(32'hbdb3d4a6), .K2_C5_W8(32'hbd9111f8), 
		.K2_C6_W0(32'h3c99d387), .K2_C6_W1(32'hbda5c288), .K2_C6_W2(32'h3e08c550), .K2_C6_W3(32'hbc2d8379), .K2_C6_W4(32'hbce15d33), .K2_C6_W5(32'h3cfe6c05), .K2_C6_W6(32'hbd85ca72), .K2_C6_W7(32'hbe0f6538), .K2_C6_W8(32'hbe04d72a), 
		.K2_C7_W0(32'h3e02854c), .K2_C7_W1(32'h3c0966b3), .K2_C7_W2(32'hbd862577), .K2_C7_W3(32'h3d3b82e0), .K2_C7_W4(32'h3dfc25a9), .K2_C7_W5(32'h3cbbbb7a), .K2_C7_W6(32'h3d2bb4a1), .K2_C7_W7(32'hbda719cc), .K2_C7_W8(32'h3cafa134), 
		.K2_C8_W0(32'hbd291794), .K2_C8_W1(32'hbdbe67e6), .K2_C8_W2(32'hbdf7152c), .K2_C8_W3(32'h3e1a0ce8), .K2_C8_W4(32'hbdaa96f0), .K2_C8_W5(32'h3cee0d94), .K2_C8_W6(32'h3e0a0d03), .K2_C8_W7(32'hbc46f04b), .K2_C8_W8(32'hbe2bb1e5), 
		.K2_C9_W0(32'h3dcbb0f8), .K2_C9_W1(32'hbe2b5367), .K2_C9_W2(32'hbd8131af), .K2_C9_W3(32'hbde414df), .K2_C9_W4(32'hbda74b61), .K2_C9_W5(32'h3d92ce9b), .K2_C9_W6(32'h3dfd6a7b), .K2_C9_W7(32'hb86bfb7c), .K2_C9_W8(32'h3c8ca975), 
		.K2_C10_W0(32'hbd9a7592), .K2_C10_W1(32'hbc1892ba), .K2_C10_W2(32'hbd886b52), .K2_C10_W3(32'h3d8f7d37), .K2_C10_W4(32'h3c96546c), .K2_C10_W5(32'h3ddc18ac), .K2_C10_W6(32'hbd24b36c), .K2_C10_W7(32'h3c4aa2ea), .K2_C10_W8(32'hbcd357ce), 
		.K2_C11_W0(32'hbd399b0a), .K2_C11_W1(32'hbd8553c5), .K2_C11_W2(32'hbd0bc702), .K2_C11_W3(32'h3e048493), .K2_C11_W4(32'h3d885173), .K2_C11_W5(32'hbdb2a3ad), .K2_C11_W6(32'hbdf19a62), .K2_C11_W7(32'h3dc1432e), .K2_C11_W8(32'hbe14c953), 
		.K2_C12_W0(32'h3ded17b1), .K2_C12_W1(32'h3dc13c28), .K2_C12_W2(32'h3c8b2f49), .K2_C12_W3(32'hbdebe489), .K2_C12_W4(32'h3df4ad41), .K2_C12_W5(32'hbd26fbd9), .K2_C12_W6(32'h3ddc68cf), .K2_C12_W7(32'hbe39b1aa), .K2_C12_W8(32'hbe16aa40), 
		.K2_C13_W0(32'h3da2fadf), .K2_C13_W1(32'hbddd8bf1), .K2_C13_W2(32'hbd422acf), .K2_C13_W3(32'hbd871bfd), .K2_C13_W4(32'h3cc936b3), .K2_C13_W5(32'hbdcaa0f3), .K2_C13_W6(32'h3d0c410a), .K2_C13_W7(32'hbdb7f280), .K2_C13_W8(32'hbe0dc92e), 
		.K2_C14_W0(32'hbd2e2f04), .K2_C14_W1(32'h3d841556), .K2_C14_W2(32'hbe0e8cb4), .K2_C14_W3(32'hbb162d52), .K2_C14_W4(32'hbd637fa8), .K2_C14_W5(32'hbe099b5a), .K2_C14_W6(32'hbd86bb9e), .K2_C14_W7(32'hbd854024), .K2_C14_W8(32'h3d795aeb), 
		.K2_C15_W0(32'hbe1ea82a), .K2_C15_W1(32'hbdcf0c54), .K2_C15_W2(32'h3dfba544), .K2_C15_W3(32'hbc9fc56e), .K2_C15_W4(32'hbd891aca), .K2_C15_W5(32'h3cc1ea16), .K2_C15_W6(32'hbda3d428), .K2_C15_W7(32'hbdc12d54), .K2_C15_W8(32'hbc1b1e80), 
		.K2_BIAS (32'h3d10f482),

		.K3_C0_W0(32'hbda9460b), .K3_C0_W1(32'h3df7f0ef), .K3_C0_W2(32'h3e359523), .K3_C0_W3(32'hbc8cecf6), .K3_C0_W4(32'hba2ec4b2), .K3_C0_W5(32'hbe0273e0), .K3_C0_W6(32'hbd850691), .K3_C0_W7(32'hbd5a9f39), .K3_C0_W8(32'hbdbd3e2f), 
		.K3_C1_W0(32'h3d355b3a), .K3_C1_W1(32'hbd0e5294), .K3_C1_W2(32'hbdda30ff), .K3_C1_W3(32'hbe097394), .K3_C1_W4(32'h3be13dc4), .K3_C1_W5(32'hbd898043), .K3_C1_W6(32'hbdb48e84), .K3_C1_W7(32'hbd47c31a), .K3_C1_W8(32'h3d949725), 
		.K3_C2_W0(32'h3e019daf), .K3_C2_W1(32'h3ba43446), .K3_C2_W2(32'hbdabff0e), .K3_C2_W3(32'h3ce7ffcd), .K3_C2_W4(32'hbc6cd258), .K3_C2_W5(32'h3d3976fe), .K3_C2_W6(32'hbd1d8164), .K3_C2_W7(32'hbd390e9f), .K3_C2_W8(32'hbc6301ea), 
		.K3_C3_W0(32'hbc81ae93), .K3_C3_W1(32'h3e3b8aaf), .K3_C3_W2(32'hbd20351c), .K3_C3_W3(32'h3e2619eb), .K3_C3_W4(32'h3d950a2e), .K3_C3_W5(32'hbdef5729), .K3_C3_W6(32'hbd940aa1), .K3_C3_W7(32'hbbe98ece), .K3_C3_W8(32'h3d3a86e3), 
		.K3_C4_W0(32'hbdfb98ab), .K3_C4_W1(32'h3dabc3a7), .K3_C4_W2(32'h3d492ec5), .K3_C4_W3(32'hbc1abdf1), .K3_C4_W4(32'hbdf78863), .K3_C4_W5(32'hbdb49eae), .K3_C4_W6(32'hbcdddd7d), .K3_C4_W7(32'hbdc8662c), .K3_C4_W8(32'hbe1e829e), 
		.K3_C5_W0(32'h3ddf45d4), .K3_C5_W1(32'hbd06b24e), .K3_C5_W2(32'h3beb8f36), .K3_C5_W3(32'hbdc777e0), .K3_C5_W4(32'h3db08de7), .K3_C5_W5(32'hbdc5f93d), .K3_C5_W6(32'h3d899d65), .K3_C5_W7(32'h3d46e73a), .K3_C5_W8(32'h3db77a9d), 
		.K3_C6_W0(32'h3c734d41), .K3_C6_W1(32'h3d44f7b2), .K3_C6_W2(32'h3d1ce830), .K3_C6_W3(32'h3c21a9a1), .K3_C6_W4(32'hbe13657a), .K3_C6_W5(32'hbdae5200), .K3_C6_W6(32'hbd8eb529), .K3_C6_W7(32'h3dea26e7), .K3_C6_W8(32'h3e07c725), 
		.K3_C7_W0(32'h3dc2b39a), .K3_C7_W1(32'h3d791612), .K3_C7_W2(32'hbda609da), .K3_C7_W3(32'h3d6cd315), .K3_C7_W4(32'h3cb0ffb7), .K3_C7_W5(32'h3e1267c4), .K3_C7_W6(32'hbce84ebe), .K3_C7_W7(32'h3d19d73a), .K3_C7_W8(32'h3dc20616), 
		.K3_C8_W0(32'h3d72d62c), .K3_C8_W1(32'h3deebfbf), .K3_C8_W2(32'h3d7fa143), .K3_C8_W3(32'hbe095327), .K3_C8_W4(32'h3d16e1bc), .K3_C8_W5(32'h3e0691d0), .K3_C8_W6(32'h3d40f5c8), .K3_C8_W7(32'hbe03e2f5), .K3_C8_W8(32'hbdab1d05), 
		.K3_C9_W0(32'hbdbafed4), .K3_C9_W1(32'hbdd5c494), .K3_C9_W2(32'h3dfdcaae), .K3_C9_W3(32'hbcdd0bd3), .K3_C9_W4(32'hbc8707bf), .K3_C9_W5(32'h3c2608cd), .K3_C9_W6(32'hbd3b93a7), .K3_C9_W7(32'h3dd35581), .K3_C9_W8(32'hbde4742e), 
		.K3_C10_W0(32'h3d31ea0c), .K3_C10_W1(32'h3e16f988), .K3_C10_W2(32'h3d4af062), .K3_C10_W3(32'hbd7a8a18), .K3_C10_W4(32'hbd116a65), .K3_C10_W5(32'h3c36b0a5), .K3_C10_W6(32'h3e0389d5), .K3_C10_W7(32'h3d2319e0), .K3_C10_W8(32'h3cff3e37), 
		.K3_C11_W0(32'hbcb90226), .K3_C11_W1(32'h3df991c4), .K3_C11_W2(32'h3c334539), .K3_C11_W3(32'h3d2e93e3), .K3_C11_W4(32'hbd23bf26), .K3_C11_W5(32'hba8c2c7e), .K3_C11_W6(32'hbdb0f677), .K3_C11_W7(32'h3dad6067), .K3_C11_W8(32'h3db37f49), 
		.K3_C12_W0(32'hbdab9a41), .K3_C12_W1(32'h3decfe9d), .K3_C12_W2(32'hbc511d86), .K3_C12_W3(32'hbdbea258), .K3_C12_W4(32'hbe0ee99b), .K3_C12_W5(32'h3b88f5d3), .K3_C12_W6(32'h3db15cab), .K3_C12_W7(32'h3df1f6ca), .K3_C12_W8(32'h3dbb525a), 
		.K3_C13_W0(32'hbc05a2ab), .K3_C13_W1(32'h3dcd6814), .K3_C13_W2(32'h3d0c0a0b), .K3_C13_W3(32'hbb96f788), .K3_C13_W4(32'h3e0bf88f), .K3_C13_W5(32'hbdb60287), .K3_C13_W6(32'h3c55c71b), .K3_C13_W7(32'hbd2775f3), .K3_C13_W8(32'hbdf2ff43), 
		.K3_C14_W0(32'h3def3588), .K3_C14_W1(32'h3dd117e3), .K3_C14_W2(32'hbdcfcd88), .K3_C14_W3(32'h3d8db4f0), .K3_C14_W4(32'hbddef635), .K3_C14_W5(32'h3da8682d), .K3_C14_W6(32'h3d4bdcba), .K3_C14_W7(32'hbdc13073), .K3_C14_W8(32'hbc034eca), 
		.K3_C15_W0(32'h3ca89a3a), .K3_C15_W1(32'h3b78216c), .K3_C15_W2(32'h3c622f8f), .K3_C15_W3(32'hbd2168f7), .K3_C15_W4(32'h3e235490), .K3_C15_W5(32'h3d3bb314), .K3_C15_W6(32'h3db319d3), .K3_C15_W7(32'hbda786e7), .K3_C15_W8(32'hbddd2753), 
		.K3_BIAS (32'h3d36a3e1),

		.K4_C0_W0(32'hbd65044e), .K4_C0_W1(32'hbdd7591c), .K4_C0_W2(32'h3cdbe88e), .K4_C0_W3(32'hbd071248), .K4_C0_W4(32'h3dd6740a), .K4_C0_W5(32'h3c9cba33), .K4_C0_W6(32'h3dca8513), .K4_C0_W7(32'hbdcbfe5b), .K4_C0_W8(32'h3d8ee553), 
		.K4_C1_W0(32'h3a07fd2a), .K4_C1_W1(32'hbddafc0c), .K4_C1_W2(32'h3ba82aef), .K4_C1_W3(32'h3c966af2), .K4_C1_W4(32'h3d970c8d), .K4_C1_W5(32'hbd970067), .K4_C1_W6(32'h3d1c9dfc), .K4_C1_W7(32'h3dfcbcd3), .K4_C1_W8(32'hbdb8781d), 
		.K4_C2_W0(32'h3d93905b), .K4_C2_W1(32'hbad1b415), .K4_C2_W2(32'h3dd28640), .K4_C2_W3(32'h3d71a367), .K4_C2_W4(32'hbd24b0e0), .K4_C2_W5(32'h3d38cb03), .K4_C2_W6(32'hbe0d4748), .K4_C2_W7(32'hbd13af54), .K4_C2_W8(32'hbd2c1a76), 
		.K4_C3_W0(32'h3ca9e55b), .K4_C3_W1(32'h3c3a753f), .K4_C3_W2(32'hbc036355), .K4_C3_W3(32'h3b485dec), .K4_C3_W4(32'hbd9792d3), .K4_C3_W5(32'h3d99ec8f), .K4_C3_W6(32'h3d825eee), .K4_C3_W7(32'h3dde57a1), .K4_C3_W8(32'h3da75144), 
		.K4_C4_W0(32'h3d17a347), .K4_C4_W1(32'hbd5ab44f), .K4_C4_W2(32'hbd01adaa), .K4_C4_W3(32'hbc4b2653), .K4_C4_W4(32'hbd064c9a), .K4_C4_W5(32'hbdd1eddd), .K4_C4_W6(32'h3d1b80bc), .K4_C4_W7(32'h3d31c435), .K4_C4_W8(32'hbd6719fc), 
		.K4_C5_W0(32'h3d1c1f50), .K4_C5_W1(32'hbcdb1a22), .K4_C5_W2(32'hbe0cf201), .K4_C5_W3(32'hbd0dc3ff), .K4_C5_W4(32'hb974b778), .K4_C5_W5(32'hbe0da5f9), .K4_C5_W6(32'hbdd6d98d), .K4_C5_W7(32'hbde03144), .K4_C5_W8(32'h3d8d948a), 
		.K4_C6_W0(32'hbda6d14d), .K4_C6_W1(32'h3ddba854), .K4_C6_W2(32'h3c9c4442), .K4_C6_W3(32'hbba06972), .K4_C6_W4(32'h3d21e8f1), .K4_C6_W5(32'hbe140354), .K4_C6_W6(32'hbd7ded7c), .K4_C6_W7(32'h3d0da517), .K4_C6_W8(32'hbd6884b1), 
		.K4_C7_W0(32'hbd4471c7), .K4_C7_W1(32'hbd31bfd2), .K4_C7_W2(32'hba4fd8c3), .K4_C7_W3(32'h3ca5041e), .K4_C7_W4(32'h3d40ff9c), .K4_C7_W5(32'h3e0acfe0), .K4_C7_W6(32'h3e0807fd), .K4_C7_W7(32'hbbc5289d), .K4_C7_W8(32'hbd003657), 
		.K4_C8_W0(32'h3cd02a85), .K4_C8_W1(32'h3ca9a3d6), .K4_C8_W2(32'h3d5f8791), .K4_C8_W3(32'hbda7f989), .K4_C8_W4(32'hbd21aa50), .K4_C8_W5(32'hbc203ee0), .K4_C8_W6(32'hbd174237), .K4_C8_W7(32'hbdc06263), .K4_C8_W8(32'hbe02ad80), 
		.K4_C9_W0(32'h3c947545), .K4_C9_W1(32'h3dff7304), .K4_C9_W2(32'h3d94c0fe), .K4_C9_W3(32'hbda98262), .K4_C9_W4(32'h3d05fcde), .K4_C9_W5(32'hbd9e54e2), .K4_C9_W6(32'hbe0b3b62), .K4_C9_W7(32'hbcf1935f), .K4_C9_W8(32'h3d6412c4), 
		.K4_C10_W0(32'hbd57155a), .K4_C10_W1(32'hbd9595c5), .K4_C10_W2(32'h3c972076), .K4_C10_W3(32'hbd6ab222), .K4_C10_W4(32'h3d3c2390), .K4_C10_W5(32'hbdb2bc6f), .K4_C10_W6(32'h3e09f89a), .K4_C10_W7(32'hbcf5dea8), .K4_C10_W8(32'h3e0afc38), 
		.K4_C11_W0(32'hbd78f2d1), .K4_C11_W1(32'h3d902cfc), .K4_C11_W2(32'h3e09d24a), .K4_C11_W3(32'hbe227e92), .K4_C11_W4(32'hbd41dd42), .K4_C11_W5(32'hbdc5b2fc), .K4_C11_W6(32'h3bb5e5d4), .K4_C11_W7(32'hbda32679), .K4_C11_W8(32'h3dabb403), 
		.K4_C12_W0(32'hbb726730), .K4_C12_W1(32'hbdd9869f), .K4_C12_W2(32'hbdf36ce4), .K4_C12_W3(32'hbd9b1cb7), .K4_C12_W4(32'hbc3ab63e), .K4_C12_W5(32'h3df0288c), .K4_C12_W6(32'hbdb3c9e2), .K4_C12_W7(32'hbda1868c), .K4_C12_W8(32'hbce2a626), 
		.K4_C13_W0(32'h3ddc4b1f), .K4_C13_W1(32'hbd14ad84), .K4_C13_W2(32'h3de2bb07), .K4_C13_W3(32'hbd6d04d8), .K4_C13_W4(32'h3dae1ff7), .K4_C13_W5(32'hbc827509), .K4_C13_W6(32'h3d402668), .K4_C13_W7(32'hbe11bcde), .K4_C13_W8(32'hbe18df9f), 
		.K4_C14_W0(32'h3dd761f8), .K4_C14_W1(32'hbd896ab6), .K4_C14_W2(32'h3b881fe2), .K4_C14_W3(32'h3d3b893e), .K4_C14_W4(32'h3de43155), .K4_C14_W5(32'h3e08faf0), .K4_C14_W6(32'hbe03ef94), .K4_C14_W7(32'h3c97414c), .K4_C14_W8(32'h3b1a8421), 
		.K4_C15_W0(32'h3cf192df), .K4_C15_W1(32'hbd323a41), .K4_C15_W2(32'hbd305af6), .K4_C15_W3(32'h3de9cb8d), .K4_C15_W4(32'hbe11a2e6), .K4_C15_W5(32'hbd999379), .K4_C15_W6(32'hbdf8b695), .K4_C15_W7(32'hbd5c48cc), .K4_C15_W8(32'hbda00dd4), 
		.K4_BIAS (32'hbc751b87),

		.K5_C0_W0(32'hbcfa6d21), .K5_C0_W1(32'h3e02d392), .K5_C0_W2(32'h3d032722), .K5_C0_W3(32'h3dd554e5), .K5_C0_W4(32'hbd625db5), .K5_C0_W5(32'h3dd266d7), .K5_C0_W6(32'hbc8fa028), .K5_C0_W7(32'hbe0541a8), .K5_C0_W8(32'h3db5970a), 
		.K5_C1_W0(32'hbdc379a6), .K5_C1_W1(32'h3daebff8), .K5_C1_W2(32'hbdd49cd5), .K5_C1_W3(32'h3de32d2a), .K5_C1_W4(32'h3db05013), .K5_C1_W5(32'hbdca4f88), .K5_C1_W6(32'h3d632c4f), .K5_C1_W7(32'h3af9be35), .K5_C1_W8(32'hbe103963), 
		.K5_C2_W0(32'hbdb9e509), .K5_C2_W1(32'hbdb096f8), .K5_C2_W2(32'h3dd78f25), .K5_C2_W3(32'hbba5c25c), .K5_C2_W4(32'h3dcb148c), .K5_C2_W5(32'h3d2f15c3), .K5_C2_W6(32'h3dcd1adc), .K5_C2_W7(32'hbd30804e), .K5_C2_W8(32'h3d74c7b6), 
		.K5_C3_W0(32'h3b49bc55), .K5_C3_W1(32'h3c111e1d), .K5_C3_W2(32'h3dd2a2d1), .K5_C3_W3(32'h3e09674b), .K5_C3_W4(32'hbca7efe3), .K5_C3_W5(32'h3d91f11b), .K5_C3_W6(32'h3bdef58b), .K5_C3_W7(32'hbd15959b), .K5_C3_W8(32'h3e0a0ec1), 
		.K5_C4_W0(32'hbe0094dd), .K5_C4_W1(32'h3dc5cadb), .K5_C4_W2(32'hbdc649de), .K5_C4_W3(32'h3de1cb82), .K5_C4_W4(32'hbd7639a2), .K5_C4_W5(32'h3da8ee1d), .K5_C4_W6(32'hbdb05ce6), .K5_C4_W7(32'hbd682b24), .K5_C4_W8(32'h3dad6674), 
		.K5_C5_W0(32'hbe179b86), .K5_C5_W1(32'hbd9a8aa7), .K5_C5_W2(32'h3dd47a33), .K5_C5_W3(32'hbd236003), .K5_C5_W4(32'h3cf89f3c), .K5_C5_W5(32'hbc60f1f4), .K5_C5_W6(32'hbd90fc01), .K5_C5_W7(32'h3dd5377a), .K5_C5_W8(32'hbe0d03ae), 
		.K5_C6_W0(32'h3dc53e47), .K5_C6_W1(32'h3db59de0), .K5_C6_W2(32'hbc4c7de5), .K5_C6_W3(32'h3da495bd), .K5_C6_W4(32'h3b945b74), .K5_C6_W5(32'h3d98d722), .K5_C6_W6(32'hbdd258ee), .K5_C6_W7(32'hbdde2723), .K5_C6_W8(32'hbc46fb52), 
		.K5_C7_W0(32'hbdf2a8e2), .K5_C7_W1(32'h3de857f4), .K5_C7_W2(32'h3e0f9467), .K5_C7_W3(32'h3d57b816), .K5_C7_W4(32'h3c3265ea), .K5_C7_W5(32'hbd7b4c76), .K5_C7_W6(32'hbc604638), .K5_C7_W7(32'h3d80aefa), .K5_C7_W8(32'hbdf0261a), 
		.K5_C8_W0(32'hbdf213ef), .K5_C8_W1(32'h3d63e59a), .K5_C8_W2(32'h3d1aee8e), .K5_C8_W3(32'hbb45915d), .K5_C8_W4(32'hbddf392b), .K5_C8_W5(32'h3c9876b5), .K5_C8_W6(32'hbe1612d7), .K5_C8_W7(32'h3df32200), .K5_C8_W8(32'h3d418902), 
		.K5_C9_W0(32'hbbc8b00d), .K5_C9_W1(32'h3d168542), .K5_C9_W2(32'h3c6cdc5b), .K5_C9_W3(32'h3dd84ad5), .K5_C9_W4(32'hbdd4b38a), .K5_C9_W5(32'h3adea3d5), .K5_C9_W6(32'h3dc0cd0b), .K5_C9_W7(32'h3de2178c), .K5_C9_W8(32'h3c360c9d), 
		.K5_C10_W0(32'h3d7bf8e4), .K5_C10_W1(32'hbd60eaf7), .K5_C10_W2(32'h3ca8aedc), .K5_C10_W3(32'hbb999ccf), .K5_C10_W4(32'h3cd7c694), .K5_C10_W5(32'h3e05e98d), .K5_C10_W6(32'hbe0ec49c), .K5_C10_W7(32'h3cfe3998), .K5_C10_W8(32'h3dafdff0), 
		.K5_C11_W0(32'h3cb3bd76), .K5_C11_W1(32'h3d2c8794), .K5_C11_W2(32'h3e0bc7a7), .K5_C11_W3(32'hbd57f287), .K5_C11_W4(32'hbe0d9b18), .K5_C11_W5(32'h3da8e77b), .K5_C11_W6(32'hbdefce62), .K5_C11_W7(32'hbd958ba4), .K5_C11_W8(32'hbcc0dad9), 
		.K5_C12_W0(32'hbd5b17fd), .K5_C12_W1(32'hbd85940f), .K5_C12_W2(32'h3dec8904), .K5_C12_W3(32'hbdfb53aa), .K5_C12_W4(32'hbdf5923f), .K5_C12_W5(32'h3c8d1528), .K5_C12_W6(32'hbdcfef79), .K5_C12_W7(32'hbdb961a4), .K5_C12_W8(32'hbdd859ac), 
		.K5_C13_W0(32'hbde9d775), .K5_C13_W1(32'hbdfb8001), .K5_C13_W2(32'h3d9e8df0), .K5_C13_W3(32'h3e0f2b2b), .K5_C13_W4(32'h3ba9be28), .K5_C13_W5(32'hbe18f715), .K5_C13_W6(32'h3b333046), .K5_C13_W7(32'h3c44d1af), .K5_C13_W8(32'hbdc0c4c1), 
		.K5_C14_W0(32'h3d45ac52), .K5_C14_W1(32'hbc309509), .K5_C14_W2(32'h3d8adc2a), .K5_C14_W3(32'h3d271132), .K5_C14_W4(32'hbdac4eb2), .K5_C14_W5(32'h3c85bee3), .K5_C14_W6(32'hbd840bd0), .K5_C14_W7(32'hbdc03119), .K5_C14_W8(32'hbd890e78), 
		.K5_C15_W0(32'h3dfc8f01), .K5_C15_W1(32'hbddcd224), .K5_C15_W2(32'hbdd5eac8), .K5_C15_W3(32'hbdc7eb18), .K5_C15_W4(32'hbcada96b), .K5_C15_W5(32'h3cf081da), .K5_C15_W6(32'hbca0e3ff), .K5_C15_W7(32'h3db2dc96), .K5_C15_W8(32'hbde226ca), 
		.K5_BIAS (32'h3cc6f264),

		.K6_C0_W0(32'hbe13d712), .K6_C0_W1(32'h3df3696d), .K6_C0_W2(32'h3d7b57db), .K6_C0_W3(32'hbdf2c423), .K6_C0_W4(32'hbd924feb), .K6_C0_W5(32'hbe04fd0e), .K6_C0_W6(32'h3d9c2c7f), .K6_C0_W7(32'h3d4fdcc2), .K6_C0_W8(32'h3d9ec85c), 
		.K6_C1_W0(32'h3e014e43), .K6_C1_W1(32'hbd863c34), .K6_C1_W2(32'h3d6b24f9), .K6_C1_W3(32'h3da1fa72), .K6_C1_W4(32'hbcd3e600), .K6_C1_W5(32'hbdcad040), .K6_C1_W6(32'hbdd5ab70), .K6_C1_W7(32'h3d898486), .K6_C1_W8(32'hbdad0ef1), 
		.K6_C2_W0(32'h3dd889b0), .K6_C2_W1(32'h3dfcc181), .K6_C2_W2(32'h3df1af25), .K6_C2_W3(32'h3d0be4f4), .K6_C2_W4(32'h3e18afa6), .K6_C2_W5(32'hbdb882de), .K6_C2_W6(32'h3d501d39), .K6_C2_W7(32'hbd862d94), .K6_C2_W8(32'h3dc81923), 
		.K6_C3_W0(32'hbdaedf8e), .K6_C3_W1(32'hbde08190), .K6_C3_W2(32'h3dbcc931), .K6_C3_W3(32'hbd8c71df), .K6_C3_W4(32'h3d95e88f), .K6_C3_W5(32'hbdeccad7), .K6_C3_W6(32'hbdb6696a), .K6_C3_W7(32'h3d0fbdb7), .K6_C3_W8(32'h3e3cca68), 
		.K6_C4_W0(32'hbe00bfb8), .K6_C4_W1(32'hbd052c6d), .K6_C4_W2(32'hbdd74cc6), .K6_C4_W3(32'hbde1755e), .K6_C4_W4(32'h3df84a61), .K6_C4_W5(32'hbe350d8c), .K6_C4_W6(32'h3c6902d1), .K6_C4_W7(32'hbcb0aa65), .K6_C4_W8(32'h3cd254a5), 
		.K6_C5_W0(32'h3d63b8dd), .K6_C5_W1(32'h3d85fb93), .K6_C5_W2(32'hbd46dcce), .K6_C5_W3(32'hbc91422e), .K6_C5_W4(32'h3e0dae62), .K6_C5_W5(32'hbe0e01ce), .K6_C5_W6(32'hbe05d99f), .K6_C5_W7(32'h3d82e4bd), .K6_C5_W8(32'hbd811439), 
		.K6_C6_W0(32'hbdecd46b), .K6_C6_W1(32'h3cb59b38), .K6_C6_W2(32'hbd354a30), .K6_C6_W3(32'h3dde9f17), .K6_C6_W4(32'h3daddf95), .K6_C6_W5(32'h3dcd9489), .K6_C6_W6(32'hbdef4609), .K6_C6_W7(32'hbdf4d744), .K6_C6_W8(32'h3daa4e67), 
		.K6_C7_W0(32'hbdffff2a), .K6_C7_W1(32'h3d6f20c6), .K6_C7_W2(32'hbca99f27), .K6_C7_W3(32'h3d26a6c3), .K6_C7_W4(32'h3c8d7304), .K6_C7_W5(32'hbe06f61b), .K6_C7_W6(32'hbe053e8c), .K6_C7_W7(32'h3e047278), .K6_C7_W8(32'hbdd65b9b), 
		.K6_C8_W0(32'hbdbe268d), .K6_C8_W1(32'h3d8b399c), .K6_C8_W2(32'hbcc91885), .K6_C8_W3(32'hbd7f760a), .K6_C8_W4(32'hbd3625fb), .K6_C8_W5(32'h3c34b7ea), .K6_C8_W6(32'h3df00ebb), .K6_C8_W7(32'h3e1278e1), .K6_C8_W8(32'hbddb401b), 
		.K6_C9_W0(32'h3c8fc7fc), .K6_C9_W1(32'h3d1bf2f6), .K6_C9_W2(32'h3d571bba), .K6_C9_W3(32'hbe007737), .K6_C9_W4(32'h3d9866bd), .K6_C9_W5(32'h3c8ec0f2), .K6_C9_W6(32'hbd79a1fc), .K6_C9_W7(32'hbd98b28c), .K6_C9_W8(32'h3e28d822), 
		.K6_C10_W0(32'hbda1bf29), .K6_C10_W1(32'hbbf5ec96), .K6_C10_W2(32'h3d6aa0bb), .K6_C10_W3(32'h3dfe1c66), .K6_C10_W4(32'hbd6cf194), .K6_C10_W5(32'h3c35b03d), .K6_C10_W6(32'hbc065914), .K6_C10_W7(32'h3e092de8), .K6_C10_W8(32'hbd8cd579), 
		.K6_C11_W0(32'hbe057530), .K6_C11_W1(32'h3dc300be), .K6_C11_W2(32'hbe0d0820), .K6_C11_W3(32'hbe0fc564), .K6_C11_W4(32'h3d8cdd7a), .K6_C11_W5(32'hbd33edab), .K6_C11_W6(32'hbe11ba00), .K6_C11_W7(32'hbd64cc6c), .K6_C11_W8(32'h3d5a6d90), 
		.K6_C12_W0(32'hbd55151c), .K6_C12_W1(32'h3d80f371), .K6_C12_W2(32'hba583f20), .K6_C12_W3(32'h3df04e5e), .K6_C12_W4(32'h3d1b2c8f), .K6_C12_W5(32'hbe287e7d), .K6_C12_W6(32'h3dcaced6), .K6_C12_W7(32'h3d320e16), .K6_C12_W8(32'hbe00baa2), 
		.K6_C13_W0(32'hbce4fe9c), .K6_C13_W1(32'h3d956081), .K6_C13_W2(32'hbe15fcee), .K6_C13_W3(32'h3d9bf4d0), .K6_C13_W4(32'h3dd62e49), .K6_C13_W5(32'h3def385c), .K6_C13_W6(32'hbd07f651), .K6_C13_W7(32'h3e030aef), .K6_C13_W8(32'h3dfa7cfa), 
		.K6_C14_W0(32'h3de86bcc), .K6_C14_W1(32'h3d1ae392), .K6_C14_W2(32'h3e1d7f3a), .K6_C14_W3(32'h3def388b), .K6_C14_W4(32'hbc5ec404), .K6_C14_W5(32'h3d3bc98d), .K6_C14_W6(32'hbda77107), .K6_C14_W7(32'h3ca63dcd), .K6_C14_W8(32'h3cf76e78), 
		.K6_C15_W0(32'h3ddb4335), .K6_C15_W1(32'h3c166039), .K6_C15_W2(32'h3c963b2e), .K6_C15_W3(32'hbde5178c), .K6_C15_W4(32'h3d00517d), .K6_C15_W5(32'h3e099ff4), .K6_C15_W6(32'h3dd77672), .K6_C15_W7(32'h3d8d7b06), .K6_C15_W8(32'h3e0ed72e), 
		.K6_BIAS (32'h3d39562c),

		.K7_C0_W0(32'hbd443491), .K7_C0_W1(32'hbd6ecfa3), .K7_C0_W2(32'h3d59ba7c), .K7_C0_W3(32'hbe0838b2), .K7_C0_W4(32'h3cf17a1c), .K7_C0_W5(32'hbdcc3925), .K7_C0_W6(32'hbd9990c9), .K7_C0_W7(32'h3ad529a4), .K7_C0_W8(32'h3d8a0dae), 
		.K7_C1_W0(32'h3dfd8b0b), .K7_C1_W1(32'hbd224215), .K7_C1_W2(32'hbdf2d9ff), .K7_C1_W3(32'hbe121efb), .K7_C1_W4(32'h3c3598a5), .K7_C1_W5(32'h3d80ca53), .K7_C1_W6(32'h3d8fe16a), .K7_C1_W7(32'h3da90333), .K7_C1_W8(32'hbb29b880), 
		.K7_C2_W0(32'h3c09b606), .K7_C2_W1(32'hbd69854b), .K7_C2_W2(32'h3c936341), .K7_C2_W3(32'hbdcd5c2b), .K7_C2_W4(32'h3d1db105), .K7_C2_W5(32'h3daec550), .K7_C2_W6(32'hbc8352cf), .K7_C2_W7(32'hbde56f4d), .K7_C2_W8(32'hbe124bff), 
		.K7_C3_W0(32'hbd7d5eec), .K7_C3_W1(32'h3e382ab6), .K7_C3_W2(32'hbd84fb7d), .K7_C3_W3(32'hbc885d76), .K7_C3_W4(32'hbd6ed40f), .K7_C3_W5(32'hbe02bc50), .K7_C3_W6(32'h3deb6a71), .K7_C3_W7(32'h3cfa8ff2), .K7_C3_W8(32'h3d4c1d00), 
		.K7_C4_W0(32'h3e0039c6), .K7_C4_W1(32'hbdf95c6d), .K7_C4_W2(32'hbd28369d), .K7_C4_W3(32'h3deba2d4), .K7_C4_W4(32'hbac919f7), .K7_C4_W5(32'hbce968fb), .K7_C4_W6(32'hbe0c742f), .K7_C4_W7(32'h3d3f7cd8), .K7_C4_W8(32'hbc80419a), 
		.K7_C5_W0(32'hbe16db45), .K7_C5_W1(32'hbcb9f961), .K7_C5_W2(32'hbdaab34f), .K7_C5_W3(32'hbd94ff86), .K7_C5_W4(32'h3db8ca06), .K7_C5_W5(32'h3d890b9d), .K7_C5_W6(32'h3daacd17), .K7_C5_W7(32'h3d574117), .K7_C5_W8(32'h3dd1489e), 
		.K7_C6_W0(32'hbd9937ef), .K7_C6_W1(32'h3dccdf8e), .K7_C6_W2(32'h3de1bb81), .K7_C6_W3(32'hbe1263ff), .K7_C6_W4(32'h3dfa6343), .K7_C6_W5(32'h3cb4d39b), .K7_C6_W6(32'hbca5c372), .K7_C6_W7(32'hbe020728), .K7_C6_W8(32'h3d8cc4b9), 
		.K7_C7_W0(32'h3d73d863), .K7_C7_W1(32'hbdc47856), .K7_C7_W2(32'h3e059ca2), .K7_C7_W3(32'hbd212248), .K7_C7_W4(32'h3cd43864), .K7_C7_W5(32'hbdeaceef), .K7_C7_W6(32'hbd372e88), .K7_C7_W7(32'h3da6f91c), .K7_C7_W8(32'hbd21bbc6), 
		.K7_C8_W0(32'h3d872038), .K7_C8_W1(32'h3de9d39f), .K7_C8_W2(32'h3e212e88), .K7_C8_W3(32'h3db52cc4), .K7_C8_W4(32'hbd2a5d46), .K7_C8_W5(32'hbd919d45), .K7_C8_W6(32'h3d3314c2), .K7_C8_W7(32'hbdf9e3a7), .K7_C8_W8(32'h3d72602b), 
		.K7_C9_W0(32'h3d8b34f5), .K7_C9_W1(32'hbcca2627), .K7_C9_W2(32'hbd974b51), .K7_C9_W3(32'h3dea0e4b), .K7_C9_W4(32'h3dc7a843), .K7_C9_W5(32'hbb3b3496), .K7_C9_W6(32'hbc2dacf7), .K7_C9_W7(32'h3d4a3c0c), .K7_C9_W8(32'h3d7d8d3c), 
		.K7_C10_W0(32'h3c16b88a), .K7_C10_W1(32'hbd86a90e), .K7_C10_W2(32'hbe397006), .K7_C10_W3(32'hbe09a14b), .K7_C10_W4(32'h3cd5c45d), .K7_C10_W5(32'h3d87e595), .K7_C10_W6(32'hbe0747e8), .K7_C10_W7(32'h3d9b44ba), .K7_C10_W8(32'hbdb6f6ea), 
		.K7_C11_W0(32'hbe010f9c), .K7_C11_W1(32'hbcb01267), .K7_C11_W2(32'hbba28ff9), .K7_C11_W3(32'hbcfbf743), .K7_C11_W4(32'h3b168f7c), .K7_C11_W5(32'hbd41831f), .K7_C11_W6(32'hbd9a9440), .K7_C11_W7(32'hbe142778), .K7_C11_W8(32'hbdcb7ed3), 
		.K7_C12_W0(32'hbdfbaaa8), .K7_C12_W1(32'hbc65a7ac), .K7_C12_W2(32'h3e13a637), .K7_C12_W3(32'h3c3c27df), .K7_C12_W4(32'h3e032168), .K7_C12_W5(32'h3c94ddf7), .K7_C12_W6(32'hbe0999c1), .K7_C12_W7(32'hbd24a4b9), .K7_C12_W8(32'hbd8f71b1), 
		.K7_C13_W0(32'h3d0b47f3), .K7_C13_W1(32'hbd47a221), .K7_C13_W2(32'hbd540493), .K7_C13_W3(32'hbdc475b8), .K7_C13_W4(32'h393c9e7c), .K7_C13_W5(32'hbdd515e6), .K7_C13_W6(32'h3cd5c88e), .K7_C13_W7(32'h3de62efd), .K7_C13_W8(32'h3d049dc9), 
		.K7_C14_W0(32'hbc8b6627), .K7_C14_W1(32'hbcf9bcff), .K7_C14_W2(32'hbdeebfa9), .K7_C14_W3(32'h3d3e681d), .K7_C14_W4(32'h3d2a9e29), .K7_C14_W5(32'h3e192fdc), .K7_C14_W6(32'hbd9db8d6), .K7_C14_W7(32'hbd256419), .K7_C14_W8(32'hbd79df27), 
		.K7_C15_W0(32'hbca27da4), .K7_C15_W1(32'hbc31a431), .K7_C15_W2(32'hbdd78a2d), .K7_C15_W3(32'hbdeacb08), .K7_C15_W4(32'hbd4bd101), .K7_C15_W5(32'h3bc9271f), .K7_C15_W6(32'hbe15f7b6), .K7_C15_W7(32'h3e0305c1), .K7_C15_W8(32'h3c352bc2), 
		.K7_BIAS (32'hbc2c4159),

		.K8_C0_W0(32'h3cdb4b27), .K8_C0_W1(32'hbd89ccdc), .K8_C0_W2(32'hbdd250f4), .K8_C0_W3(32'h3c0189fe), .K8_C0_W4(32'hbaf75cb7), .K8_C0_W5(32'hbdfcf8b4), .K8_C0_W6(32'hbdac0d7a), .K8_C0_W7(32'h3dd4003d), .K8_C0_W8(32'hbd79b734), 
		.K8_C1_W0(32'h3e0e8c64), .K8_C1_W1(32'h3e1e418f), .K8_C1_W2(32'hbe052b61), .K8_C1_W3(32'hbdac0d76), .K8_C1_W4(32'hbdcba059), .K8_C1_W5(32'hbc170b58), .K8_C1_W6(32'hbdd52d1e), .K8_C1_W7(32'h3d119ef6), .K8_C1_W8(32'h3cc887a4), 
		.K8_C2_W0(32'hbd4fcb35), .K8_C2_W1(32'hbdd23f12), .K8_C2_W2(32'h3d99a7fb), .K8_C2_W3(32'hbd86060c), .K8_C2_W4(32'hbcd018f9), .K8_C2_W5(32'hbe1f5e73), .K8_C2_W6(32'h3dde6935), .K8_C2_W7(32'h3e1d8cc9), .K8_C2_W8(32'h3dc8aacd), 
		.K8_C3_W0(32'h3e01ce0e), .K8_C3_W1(32'h3aa23619), .K8_C3_W2(32'hbd79c76e), .K8_C3_W3(32'hbda8ad8d), .K8_C3_W4(32'hbe385bd5), .K8_C3_W5(32'hbd54111a), .K8_C3_W6(32'hbd121264), .K8_C3_W7(32'hbe0d6285), .K8_C3_W8(32'h3d946005), 
		.K8_C4_W0(32'h3d2353ef), .K8_C4_W1(32'h3d38311c), .K8_C4_W2(32'hbd8ca119), .K8_C4_W3(32'hbdc44a51), .K8_C4_W4(32'hbdb9bf93), .K8_C4_W5(32'h3d65073e), .K8_C4_W6(32'hbd28b402), .K8_C4_W7(32'hbc39e877), .K8_C4_W8(32'h3de88edf), 
		.K8_C5_W0(32'hbdbf2986), .K8_C5_W1(32'h3d084ad3), .K8_C5_W2(32'h3ccb20a1), .K8_C5_W3(32'hbda16882), .K8_C5_W4(32'h3d96618d), .K8_C5_W5(32'h3d9db623), .K8_C5_W6(32'hbc7095c6), .K8_C5_W7(32'hbca03759), .K8_C5_W8(32'h3d21ebde), 
		.K8_C6_W0(32'h3cac015f), .K8_C6_W1(32'hbb843fa1), .K8_C6_W2(32'hbe12d14b), .K8_C6_W3(32'h3e0a4158), .K8_C6_W4(32'h3d9ba351), .K8_C6_W5(32'hbdeffdb2), .K8_C6_W6(32'hbdc6776e), .K8_C6_W7(32'hbc6591cd), .K8_C6_W8(32'hbdc8b860), 
		.K8_C7_W0(32'h3dc6ca46), .K8_C7_W1(32'h3c0d1c16), .K8_C7_W2(32'hbc99b114), .K8_C7_W3(32'hbd50827c), .K8_C7_W4(32'h3da7b756), .K8_C7_W5(32'h3dd2539a), .K8_C7_W6(32'h3dc76ed9), .K8_C7_W7(32'hbd170fc9), .K8_C7_W8(32'h3cb4637f), 
		.K8_C8_W0(32'h3d6f6cb7), .K8_C8_W1(32'h3d4aac59), .K8_C8_W2(32'hbbd545c8), .K8_C8_W3(32'h3d858307), .K8_C8_W4(32'h3d10d171), .K8_C8_W5(32'hbdc551b2), .K8_C8_W6(32'h3e148e90), .K8_C8_W7(32'hbe140e48), .K8_C8_W8(32'hbacb3b11), 
		.K8_C9_W0(32'h3c81d5ee), .K8_C9_W1(32'h3c468992), .K8_C9_W2(32'hbd4a1d2e), .K8_C9_W3(32'hbccc77dd), .K8_C9_W4(32'h3d0ab547), .K8_C9_W5(32'h3d9b6782), .K8_C9_W6(32'h3dfce350), .K8_C9_W7(32'h3d5c7b6b), .K8_C9_W8(32'hbc6cd0e0), 
		.K8_C10_W0(32'hbd2d30e5), .K8_C10_W1(32'h3da0dcf9), .K8_C10_W2(32'h3d754da9), .K8_C10_W3(32'h3e031372), .K8_C10_W4(32'h3d57517c), .K8_C10_W5(32'hbd063020), .K8_C10_W6(32'hbdf7a731), .K8_C10_W7(32'h3d869acf), .K8_C10_W8(32'hbd82535d), 
		.K8_C11_W0(32'h3da2be46), .K8_C11_W1(32'h3dca0c59), .K8_C11_W2(32'h3e19f7ab), .K8_C11_W3(32'h3e00561b), .K8_C11_W4(32'h3ddbe9d9), .K8_C11_W5(32'h3cd58b31), .K8_C11_W6(32'h3cf7c421), .K8_C11_W7(32'h3cfa86b6), .K8_C11_W8(32'hbe10af14), 
		.K8_C12_W0(32'hbcc7c268), .K8_C12_W1(32'hbba2b13a), .K8_C12_W2(32'hbd8b52a1), .K8_C12_W3(32'hbd4aab1b), .K8_C12_W4(32'hbd636897), .K8_C12_W5(32'hbc817c68), .K8_C12_W6(32'hbcd5217a), .K8_C12_W7(32'hbdc5a2d0), .K8_C12_W8(32'hbb28af7f), 
		.K8_C13_W0(32'h3e076dc8), .K8_C13_W1(32'h3dc0e6fc), .K8_C13_W2(32'hbd915b4b), .K8_C13_W3(32'h3d36b4ad), .K8_C13_W4(32'h3c1a4c44), .K8_C13_W5(32'hbd937c5e), .K8_C13_W6(32'h3dd295b9), .K8_C13_W7(32'hbe14284f), .K8_C13_W8(32'h3d1d5aeb), 
		.K8_C14_W0(32'h3d8b5b2a), .K8_C14_W1(32'h3c8b3f51), .K8_C14_W2(32'hbdbc38d5), .K8_C14_W3(32'hbcf86428), .K8_C14_W4(32'hbd542ec5), .K8_C14_W5(32'hbdb18736), .K8_C14_W6(32'hbd848269), .K8_C14_W7(32'h3dbcb5fd), .K8_C14_W8(32'hbd64f978), 
		.K8_C15_W0(32'hbbaf7e02), .K8_C15_W1(32'h3cbb26e0), .K8_C15_W2(32'h3e0a0b3b), .K8_C15_W3(32'hbd52302a), .K8_C15_W4(32'h3ce56635), .K8_C15_W5(32'h3d4fda6c), .K8_C15_W6(32'hbde94335), .K8_C15_W7(32'h3e1cf91c), .K8_C15_W8(32'h3dae38ca), 
		.K8_BIAS (32'h3d376845),

		.K9_C0_W0(32'h3e4e1d3d), .K9_C0_W1(32'h3ca1a3c9), .K9_C0_W2(32'h3df6f52b), .K9_C0_W3(32'h3c9a69f7), .K9_C0_W4(32'hbdd5807e), .K9_C0_W5(32'hbc2a5fad), .K9_C0_W6(32'hbe1791a1), .K9_C0_W7(32'h3d41f8e2), .K9_C0_W8(32'hbe13bbb3), 
		.K9_C1_W0(32'hbda04000), .K9_C1_W1(32'h3b8c4669), .K9_C1_W2(32'h3e317180), .K9_C1_W3(32'h3d5b6388), .K9_C1_W4(32'hbc60b5a4), .K9_C1_W5(32'h3d44799e), .K9_C1_W6(32'h3a05c0ce), .K9_C1_W7(32'h3e069d1c), .K9_C1_W8(32'hbc61af7b), 
		.K9_C2_W0(32'hbe04e79c), .K9_C2_W1(32'h3d8ea033), .K9_C2_W2(32'h3d6ad4fd), .K9_C2_W3(32'h3d2ba152), .K9_C2_W4(32'hbd2b224b), .K9_C2_W5(32'h3e2bebbc), .K9_C2_W6(32'hbbc4f544), .K9_C2_W7(32'h3cf3ccdd), .K9_C2_W8(32'hbe0aeb7b), 
		.K9_C3_W0(32'hbd8af756), .K9_C3_W1(32'hbdfe4062), .K9_C3_W2(32'h3df1cf60), .K9_C3_W3(32'h3cd14f29), .K9_C3_W4(32'hbc99d926), .K9_C3_W5(32'h3da2049e), .K9_C3_W6(32'h37d316e8), .K9_C3_W7(32'h3c9ee637), .K9_C3_W8(32'h3d9f6270), 
		.K9_C4_W0(32'hbd595712), .K9_C4_W1(32'h3d4858e5), .K9_C4_W2(32'h3d2c56bd), .K9_C4_W3(32'hbdc36764), .K9_C4_W4(32'h3cdbb3e6), .K9_C4_W5(32'h3df37703), .K9_C4_W6(32'h3df2c371), .K9_C4_W7(32'hbe0347a4), .K9_C4_W8(32'h3d85ba44), 
		.K9_C5_W0(32'hbdf794e4), .K9_C5_W1(32'h3d6f7e4f), .K9_C5_W2(32'h3db27c25), .K9_C5_W3(32'h3dff30d9), .K9_C5_W4(32'hbd40ab1e), .K9_C5_W5(32'h3cbd27d2), .K9_C5_W6(32'hbd5abcfa), .K9_C5_W7(32'h3ac4fc8f), .K9_C5_W8(32'hbd6f8141), 
		.K9_C6_W0(32'hbc7e5c47), .K9_C6_W1(32'h3ba03fd6), .K9_C6_W2(32'hbdd081e8), .K9_C6_W3(32'hbb996152), .K9_C6_W4(32'hbe37f2eb), .K9_C6_W5(32'hbdb96e3e), .K9_C6_W6(32'hbc35989a), .K9_C6_W7(32'h3dd6b272), .K9_C6_W8(32'h3ae011ca), 
		.K9_C7_W0(32'h3daa775f), .K9_C7_W1(32'h3d7ebfb0), .K9_C7_W2(32'hbd8f7965), .K9_C7_W3(32'hbd954dbc), .K9_C7_W4(32'h3da99048), .K9_C7_W5(32'hbd8bc927), .K9_C7_W6(32'hbe12ff43), .K9_C7_W7(32'hbd8ae3ca), .K9_C7_W8(32'h3b253efe), 
		.K9_C8_W0(32'hbd04c3fe), .K9_C8_W1(32'hbddea546), .K9_C8_W2(32'hbde4efd8), .K9_C8_W3(32'h3c4cc89b), .K9_C8_W4(32'h3aa25fe8), .K9_C8_W5(32'h3de477b9), .K9_C8_W6(32'hbe0d4fb2), .K9_C8_W7(32'h3e170c42), .K9_C8_W8(32'h3c87055e), 
		.K9_C9_W0(32'hbd6e0365), .K9_C9_W1(32'h3da16acc), .K9_C9_W2(32'hbdbdcc0f), .K9_C9_W3(32'hbe20584b), .K9_C9_W4(32'h3da72376), .K9_C9_W5(32'hbdc37c18), .K9_C9_W6(32'hbe12d562), .K9_C9_W7(32'hbdb63e0b), .K9_C9_W8(32'h3d9c155b), 
		.K9_C10_W0(32'hbc4e9d7b), .K9_C10_W1(32'h3dc83d6f), .K9_C10_W2(32'hbd50fa18), .K9_C10_W3(32'hbe1cfe24), .K9_C10_W4(32'hbd5738d6), .K9_C10_W5(32'hbe1a96a9), .K9_C10_W6(32'h3dd56425), .K9_C10_W7(32'hbdc1b80f), .K9_C10_W8(32'hbe21eabf), 
		.K9_C11_W0(32'h3e12769d), .K9_C11_W1(32'hbdd58683), .K9_C11_W2(32'h3c479e83), .K9_C11_W3(32'h3c0acfd0), .K9_C11_W4(32'h3dd8d06d), .K9_C11_W5(32'h3d8273b4), .K9_C11_W6(32'hbad9d65d), .K9_C11_W7(32'h3df31e09), .K9_C11_W8(32'h3d8beb51), 
		.K9_C12_W0(32'hbd8b124a), .K9_C12_W1(32'hbd554a72), .K9_C12_W2(32'hbd8d4a87), .K9_C12_W3(32'h3dd87bb4), .K9_C12_W4(32'hbe08d7a7), .K9_C12_W5(32'h3dec0cb8), .K9_C12_W6(32'h3e12158e), .K9_C12_W7(32'hbd65c6ef), .K9_C12_W8(32'h3d95e737), 
		.K9_C13_W0(32'h3dc41144), .K9_C13_W1(32'h3e1d69a9), .K9_C13_W2(32'h3c9a82b6), .K9_C13_W3(32'hbc045c31), .K9_C13_W4(32'h3dd2937f), .K9_C13_W5(32'hbcaab24a), .K9_C13_W6(32'hbdda6c15), .K9_C13_W7(32'h3cba63ec), .K9_C13_W8(32'hbdd396b4), 
		.K9_C14_W0(32'hbdc2748b), .K9_C14_W1(32'hbda5ca4a), .K9_C14_W2(32'hbd1a4ae6), .K9_C14_W3(32'hbde56cac), .K9_C14_W4(32'hbe105e7e), .K9_C14_W5(32'hbd1df056), .K9_C14_W6(32'hbdc17b5c), .K9_C14_W7(32'h3d851037), .K9_C14_W8(32'h3debaec8), 
		.K9_C15_W0(32'hbd323e3e), .K9_C15_W1(32'h3a132004), .K9_C15_W2(32'h3b7fcc16), .K9_C15_W3(32'hbd5970f0), .K9_C15_W4(32'h3d0277e1), .K9_C15_W5(32'h3c2697a2), .K9_C15_W6(32'h3df715f0), .K9_C15_W7(32'hbd3172ba), .K9_C15_W8(32'h3d99a6ca), 
		.K9_BIAS (32'h3c19d729),

		.K10_C0_W0(32'hbc12dd06), .K10_C0_W1(32'hbd13de82), .K10_C0_W2(32'h3e054ac9), .K10_C0_W3(32'h3c41eaf6), .K10_C0_W4(32'h3dd3eac3), .K10_C0_W5(32'hbbc0933e), .K10_C0_W6(32'h3d6398b0), .K10_C0_W7(32'h3dd0caf3), .K10_C0_W8(32'hbd692b0a), 
		.K10_C1_W0(32'h3d63104f), .K10_C1_W1(32'h3cab2d90), .K10_C1_W2(32'h3cde1624), .K10_C1_W3(32'hbe017de0), .K10_C1_W4(32'hbdcb0f2d), .K10_C1_W5(32'h3d9c86b0), .K10_C1_W6(32'h3cc342c9), .K10_C1_W7(32'h3caa0b99), .K10_C1_W8(32'hbe060c5c), 
		.K10_C2_W0(32'hbddf83ec), .K10_C2_W1(32'hbddb8423), .K10_C2_W2(32'h3d9bf4ff), .K10_C2_W3(32'hbdfecdad), .K10_C2_W4(32'h3d7fa758), .K10_C2_W5(32'hbdc9a200), .K10_C2_W6(32'hbd3a8da2), .K10_C2_W7(32'hbda39d91), .K10_C2_W8(32'h3d133116), 
		.K10_C3_W0(32'h3d1f7884), .K10_C3_W1(32'h3d0a012d), .K10_C3_W2(32'h3cbacef1), .K10_C3_W3(32'hbc85d106), .K10_C3_W4(32'h3c6b177b), .K10_C3_W5(32'hbdb51dcb), .K10_C3_W6(32'h3de4f4b7), .K10_C3_W7(32'h3e3a07ce), .K10_C3_W8(32'h3cbd2ca0), 
		.K10_C4_W0(32'h3e18be1a), .K10_C4_W1(32'hbc9e3870), .K10_C4_W2(32'hbd1fb6a3), .K10_C4_W3(32'h3d11002b), .K10_C4_W4(32'h3dc7fbf4), .K10_C4_W5(32'hbd830db3), .K10_C4_W6(32'h3d8f078f), .K10_C4_W7(32'hbcd9fd8b), .K10_C4_W8(32'h3ddcd9ca), 
		.K10_C5_W0(32'hbd8a6d0b), .K10_C5_W1(32'hbdf48f00), .K10_C5_W2(32'hbddae098), .K10_C5_W3(32'hbdd60bd2), .K10_C5_W4(32'h3d8cfed7), .K10_C5_W5(32'h3da7f382), .K10_C5_W6(32'h3d6f11f2), .K10_C5_W7(32'h3dd7630f), .K10_C5_W8(32'hbdd8b345), 
		.K10_C6_W0(32'hbc50da26), .K10_C6_W1(32'h3dc3b972), .K10_C6_W2(32'h3e0c24e5), .K10_C6_W3(32'hbe1bab98), .K10_C6_W4(32'h3ce201ba), .K10_C6_W5(32'hbd2d7959), .K10_C6_W6(32'h3cdd994e), .K10_C6_W7(32'h3df12430), .K10_C6_W8(32'hbd658776), 
		.K10_C7_W0(32'hbdab8ddf), .K10_C7_W1(32'h3e071aa5), .K10_C7_W2(32'h3df0ca52), .K10_C7_W3(32'h3c1c41ad), .K10_C7_W4(32'h3d0b780b), .K10_C7_W5(32'hbd06cccd), .K10_C7_W6(32'hbdc2387d), .K10_C7_W7(32'hbdf65ea1), .K10_C7_W8(32'h3ddc70dd), 
		.K10_C8_W0(32'hbe197216), .K10_C8_W1(32'h3d978e5c), .K10_C8_W2(32'hbbaad361), .K10_C8_W3(32'h3d98ae37), .K10_C8_W4(32'h3d561ad5), .K10_C8_W5(32'hbd8fb5af), .K10_C8_W6(32'hbd12ae02), .K10_C8_W7(32'h3de27662), .K10_C8_W8(32'hbdabad8d), 
		.K10_C9_W0(32'h3dda1dc8), .K10_C9_W1(32'hbd1e0578), .K10_C9_W2(32'h3d6b41b6), .K10_C9_W3(32'h3d702788), .K10_C9_W4(32'hbd08eefc), .K10_C9_W5(32'h3d97d777), .K10_C9_W6(32'h3db5de11), .K10_C9_W7(32'hbb6c1ed9), .K10_C9_W8(32'hbcb1dc08), 
		.K10_C10_W0(32'h3ccd2a1b), .K10_C10_W1(32'h3cce5225), .K10_C10_W2(32'h3ceec78a), .K10_C10_W3(32'hbd8e63a8), .K10_C10_W4(32'hbd3bedaa), .K10_C10_W5(32'h3caaf805), .K10_C10_W6(32'h3e13db90), .K10_C10_W7(32'h3dcaaf26), .K10_C10_W8(32'h3d591e66), 
		.K10_C11_W0(32'hbd2a7a1f), .K10_C11_W1(32'hbcc6b659), .K10_C11_W2(32'h3dedbbd1), .K10_C11_W3(32'hbd8ce640), .K10_C11_W4(32'h3d48a141), .K10_C11_W5(32'h3c01aa4b), .K10_C11_W6(32'h3bd45995), .K10_C11_W7(32'h3dd0b094), .K10_C11_W8(32'h3d4ab10b), 
		.K10_C12_W0(32'h3dc5c3fc), .K10_C12_W1(32'h3d18691b), .K10_C12_W2(32'h3e298f00), .K10_C12_W3(32'hbc9f32a5), .K10_C12_W4(32'h3ddf9dd6), .K10_C12_W5(32'hbd867e41), .K10_C12_W6(32'h3dd0e0b0), .K10_C12_W7(32'h3d4a4cff), .K10_C12_W8(32'hbe17e2d3), 
		.K10_C13_W0(32'hbdb5c5cc), .K10_C13_W1(32'h3c06bac2), .K10_C13_W2(32'h3e0b037f), .K10_C13_W3(32'hbded2012), .K10_C13_W4(32'h3d065e9f), .K10_C13_W5(32'h3ce7088f), .K10_C13_W6(32'h3e12ec54), .K10_C13_W7(32'h3bfd79c3), .K10_C13_W8(32'hbd8e3921), 
		.K10_C14_W0(32'h3de59161), .K10_C14_W1(32'hbda1b259), .K10_C14_W2(32'hbdc2b82d), .K10_C14_W3(32'h3daf2f05), .K10_C14_W4(32'hbd25002d), .K10_C14_W5(32'hbdf8e5d2), .K10_C14_W6(32'hbdd96506), .K10_C14_W7(32'hbdaad063), .K10_C14_W8(32'hbd4c9b3d), 
		.K10_C15_W0(32'h3dd9e215), .K10_C15_W1(32'hbe1230e1), .K10_C15_W2(32'h3dc760a7), .K10_C15_W3(32'h3d705fca), .K10_C15_W4(32'hbd867d38), .K10_C15_W5(32'h3d38021b), .K10_C15_W6(32'hbdb37c87), .K10_C15_W7(32'h3d1b069f), .K10_C15_W8(32'h3e02c4eb), 
		.K10_BIAS (32'h3d0838b4),

		.K11_C0_W0(32'h3e20137a), .K11_C0_W1(32'hbd2097f6), .K11_C0_W2(32'h3e1119cf), .K11_C0_W3(32'h3dacceb3), .K11_C0_W4(32'h3dddabf3), .K11_C0_W5(32'hbdfead0c), .K11_C0_W6(32'hbb352dbd), .K11_C0_W7(32'hbe0625fb), .K11_C0_W8(32'hbdba3482), 
		.K11_C1_W0(32'h3dfe4e66), .K11_C1_W1(32'h3dcce4ef), .K11_C1_W2(32'hbd9f50a5), .K11_C1_W3(32'h3d9888a2), .K11_C1_W4(32'h3d5183eb), .K11_C1_W5(32'hbe118fee), .K11_C1_W6(32'h3d792ddb), .K11_C1_W7(32'h3dafa396), .K11_C1_W8(32'hbdecfeeb), 
		.K11_C2_W0(32'h3d9a4ef2), .K11_C2_W1(32'hbc1a6ea4), .K11_C2_W2(32'h3d3f44eb), .K11_C2_W3(32'h3d8704b0), .K11_C2_W4(32'h3e2ae35b), .K11_C2_W5(32'hbd51fb44), .K11_C2_W6(32'hbb93a6d9), .K11_C2_W7(32'hbdaaa828), .K11_C2_W8(32'h3cba1d92), 
		.K11_C3_W0(32'hbe5a6791), .K11_C3_W1(32'h3cdc2029), .K11_C3_W2(32'h3d40e183), .K11_C3_W3(32'h3dd8758d), .K11_C3_W4(32'h3d11ab9c), .K11_C3_W5(32'h3c58d2cc), .K11_C3_W6(32'h3d26ccaa), .K11_C3_W7(32'h3c060d3e), .K11_C3_W8(32'hbdd44108), 
		.K11_C4_W0(32'h3d6743f6), .K11_C4_W1(32'hbdf4617d), .K11_C4_W2(32'h3e0eafcf), .K11_C4_W3(32'hbe0fe7e0), .K11_C4_W4(32'hbc337c1f), .K11_C4_W5(32'h3dfb0e59), .K11_C4_W6(32'hbc0209d2), .K11_C4_W7(32'h3dca9bd6), .K11_C4_W8(32'hbe115fd3), 
		.K11_C5_W0(32'h3dc98c00), .K11_C5_W1(32'h3df7de04), .K11_C5_W2(32'hbd92a60e), .K11_C5_W3(32'h3d683b1e), .K11_C5_W4(32'hbe048d25), .K11_C5_W5(32'hbd41aa26), .K11_C5_W6(32'h3dd03c5b), .K11_C5_W7(32'hbd15c7b3), .K11_C5_W8(32'h3d4bee9f), 
		.K11_C6_W0(32'hbdcaca40), .K11_C6_W1(32'hbde46719), .K11_C6_W2(32'hbdf75315), .K11_C6_W3(32'hbd3bf90a), .K11_C6_W4(32'h3c806795), .K11_C6_W5(32'h3d52bc07), .K11_C6_W6(32'h3b585c2d), .K11_C6_W7(32'h3c3097f0), .K11_C6_W8(32'hbcd44fa9), 
		.K11_C7_W0(32'h3e0a2b90), .K11_C7_W1(32'hbd44cc4c), .K11_C7_W2(32'h3dbe0ff0), .K11_C7_W3(32'hbd3f824c), .K11_C7_W4(32'h3dd95f0b), .K11_C7_W5(32'hbe23dd11), .K11_C7_W6(32'h3d2e5630), .K11_C7_W7(32'h3d98588f), .K11_C7_W8(32'h3d93bb24), 
		.K11_C8_W0(32'hbc850b1c), .K11_C8_W1(32'hbc51d190), .K11_C8_W2(32'h3dc4f6f0), .K11_C8_W3(32'hbdd9ee33), .K11_C8_W4(32'hbd8d64f7), .K11_C8_W5(32'hbcdda41d), .K11_C8_W6(32'h3e072f97), .K11_C8_W7(32'h3be31cd3), .K11_C8_W8(32'hbd4b2a88), 
		.K11_C9_W0(32'hbe29a609), .K11_C9_W1(32'h3d977031), .K11_C9_W2(32'hbd1de501), .K11_C9_W3(32'h3dd5c59a), .K11_C9_W4(32'hbe31a898), .K11_C9_W5(32'h3de7b1ec), .K11_C9_W6(32'hbe044441), .K11_C9_W7(32'h3bda5dec), .K11_C9_W8(32'hbdce9f6f), 
		.K11_C10_W0(32'h3d71550d), .K11_C10_W1(32'hbde4f5d6), .K11_C10_W2(32'h3dd3080f), .K11_C10_W3(32'hbe19e3ae), .K11_C10_W4(32'h3df5cb01), .K11_C10_W5(32'h3cc5fa77), .K11_C10_W6(32'hbd19eda8), .K11_C10_W7(32'hbd9f2ad5), .K11_C10_W8(32'hbd25e9f1), 
		.K11_C11_W0(32'h3d351bae), .K11_C11_W1(32'hbb075670), .K11_C11_W2(32'hbdc41186), .K11_C11_W3(32'h3dcdc47f), .K11_C11_W4(32'h3dbbb668), .K11_C11_W5(32'h3dd3a817), .K11_C11_W6(32'hbe101a5d), .K11_C11_W7(32'h3d95a88c), .K11_C11_W8(32'h3db5ec4b), 
		.K11_C12_W0(32'h3e051c65), .K11_C12_W1(32'h3c6c5c2d), .K11_C12_W2(32'h3bdb5def), .K11_C12_W3(32'h3c038d2b), .K11_C12_W4(32'hbd42073d), .K11_C12_W5(32'h3df174ee), .K11_C12_W6(32'h3d8e6719), .K11_C12_W7(32'hbdf36779), .K11_C12_W8(32'hbd731641), 
		.K11_C13_W0(32'h3e0dc0c5), .K11_C13_W1(32'hbcbdc96e), .K11_C13_W2(32'hbd97b9b7), .K11_C13_W3(32'h3dfebbdc), .K11_C13_W4(32'h3dc54160), .K11_C13_W5(32'hbe168ca0), .K11_C13_W6(32'h3dd6ff66), .K11_C13_W7(32'hbdf3be5c), .K11_C13_W8(32'h3c3f045b), 
		.K11_C14_W0(32'h3d5ee391), .K11_C14_W1(32'hbdd304e6), .K11_C14_W2(32'h3e1dc23c), .K11_C14_W3(32'hbc801483), .K11_C14_W4(32'h3da0486d), .K11_C14_W5(32'hbd66e355), .K11_C14_W6(32'hbd9b4b02), .K11_C14_W7(32'hbe1b9bee), .K11_C14_W8(32'hbd3f91db), 
		.K11_C15_W0(32'h3c6bbc5c), .K11_C15_W1(32'h3dd47f9e), .K11_C15_W2(32'hbc299b93), .K11_C15_W3(32'h3dc83196), .K11_C15_W4(32'h3df81c32), .K11_C15_W5(32'h3dcffd22), .K11_C15_W6(32'h3de52b77), .K11_C15_W7(32'hbe23569d), .K11_C15_W8(32'hbd053831), 
		.K11_BIAS (32'hbd183ac3),

		.K12_C0_W0(32'hbd830048), .K12_C0_W1(32'h3d9e6448), .K12_C0_W2(32'hbd707394), .K12_C0_W3(32'h3dffed13), .K12_C0_W4(32'h3dbaf343), .K12_C0_W5(32'hbe181f80), .K12_C0_W6(32'hbcfe5aba), .K12_C0_W7(32'h3d29b9ff), .K12_C0_W8(32'h3d7bf817), 
		.K12_C1_W0(32'h3cb1b0e8), .K12_C1_W1(32'hbdd0dd78), .K12_C1_W2(32'h3d61a0e3), .K12_C1_W3(32'h3dbd8290), .K12_C1_W4(32'hbc7f98a7), .K12_C1_W5(32'hbdd0eb9c), .K12_C1_W6(32'hbcb36fd5), .K12_C1_W7(32'hbe357867), .K12_C1_W8(32'h3e0beccb), 
		.K12_C2_W0(32'hbd38bdfb), .K12_C2_W1(32'hbd89ed90), .K12_C2_W2(32'hbc356af3), .K12_C2_W3(32'h3e083159), .K12_C2_W4(32'hbddd671e), .K12_C2_W5(32'h3c722926), .K12_C2_W6(32'hbc8a0556), .K12_C2_W7(32'h3dded6f2), .K12_C2_W8(32'hbcb0dc55), 
		.K12_C3_W0(32'hbe43b512), .K12_C3_W1(32'h3c1fa9b0), .K12_C3_W2(32'h3a8b6dd9), .K12_C3_W3(32'hbd0ae321), .K12_C3_W4(32'h3cf173e2), .K12_C3_W5(32'h3c95941d), .K12_C3_W6(32'h3da847ff), .K12_C3_W7(32'h3cb4b757), .K12_C3_W8(32'h3e35feb1), 
		.K12_C4_W0(32'hbd4cfb4b), .K12_C4_W1(32'h3db11cd5), .K12_C4_W2(32'h3d8b1fe3), .K12_C4_W3(32'hbd5d2b55), .K12_C4_W4(32'h3e1edaf2), .K12_C4_W5(32'hbce0b60a), .K12_C4_W6(32'hbdd7a6b4), .K12_C4_W7(32'hbe002b69), .K12_C4_W8(32'hbc011b3d), 
		.K12_C5_W0(32'h3da54ef5), .K12_C5_W1(32'h3bd373e3), .K12_C5_W2(32'h3c0552fd), .K12_C5_W3(32'hbd717e80), .K12_C5_W4(32'hbdcb6d96), .K12_C5_W5(32'hbcb984b6), .K12_C5_W6(32'hbdb15a31), .K12_C5_W7(32'hbab5e6e4), .K12_C5_W8(32'h3dd2260b), 
		.K12_C6_W0(32'h3d848f41), .K12_C6_W1(32'h3d23749c), .K12_C6_W2(32'h3d227a9e), .K12_C6_W3(32'h3dbac544), .K12_C6_W4(32'hbd8da329), .K12_C6_W5(32'hbe0db266), .K12_C6_W6(32'h3d8c9535), .K12_C6_W7(32'h3df54eee), .K12_C6_W8(32'hbdddb1dc), 
		.K12_C7_W0(32'hbc755895), .K12_C7_W1(32'hbd4723c0), .K12_C7_W2(32'hbe089fe3), .K12_C7_W3(32'hbd996837), .K12_C7_W4(32'hbdb62c3b), .K12_C7_W5(32'h3d36f37e), .K12_C7_W6(32'hbb81b6b2), .K12_C7_W7(32'h3ca05bf3), .K12_C7_W8(32'hbdf0aa09), 
		.K12_C8_W0(32'hbd634295), .K12_C8_W1(32'hbd90d9dc), .K12_C8_W2(32'h3da2dac7), .K12_C8_W3(32'hbda16df4), .K12_C8_W4(32'h3d82dc61), .K12_C8_W5(32'hbe047fbb), .K12_C8_W6(32'h3c10bea5), .K12_C8_W7(32'h3df0ca32), .K12_C8_W8(32'h3d7bbfe6), 
		.K12_C9_W0(32'h3dfb88a8), .K12_C9_W1(32'h3c8d1218), .K12_C9_W2(32'h3dbef97d), .K12_C9_W3(32'hbcf3d7ca), .K12_C9_W4(32'hbd9fe488), .K12_C9_W5(32'hbd34673d), .K12_C9_W6(32'h3d8fbcee), .K12_C9_W7(32'h3e07ac40), .K12_C9_W8(32'hbe03e6bc), 
		.K12_C10_W0(32'h3d98ef2f), .K12_C10_W1(32'h3d354504), .K12_C10_W2(32'hbdeb113a), .K12_C10_W3(32'h3df36d0e), .K12_C10_W4(32'hbde1299e), .K12_C10_W5(32'hbe103183), .K12_C10_W6(32'h3d4f5c97), .K12_C10_W7(32'hbd693951), .K12_C10_W8(32'h3d00e7a9), 
		.K12_C11_W0(32'h3dbb0fcf), .K12_C11_W1(32'h3b65dda5), .K12_C11_W2(32'h3da45925), .K12_C11_W3(32'h3e03f516), .K12_C11_W4(32'h3d0747ef), .K12_C11_W5(32'h3dcbf3a3), .K12_C11_W6(32'hbc972ff0), .K12_C11_W7(32'h3d14af09), .K12_C11_W8(32'hbd04746f), 
		.K12_C12_W0(32'h3d05afb3), .K12_C12_W1(32'hbd3b887e), .K12_C12_W2(32'hbddeaecd), .K12_C12_W3(32'h3d888452), .K12_C12_W4(32'h3cf07c53), .K12_C12_W5(32'h3e0c6050), .K12_C12_W6(32'hbcb4be47), .K12_C12_W7(32'hbe017d96), .K12_C12_W8(32'h3dee12fe), 
		.K12_C13_W0(32'h3db399cd), .K12_C13_W1(32'h3c801211), .K12_C13_W2(32'hbd3b79f5), .K12_C13_W3(32'hbdb9735c), .K12_C13_W4(32'h3dede3f3), .K12_C13_W5(32'h3d43438c), .K12_C13_W6(32'hbe006dc9), .K12_C13_W7(32'h3def2a86), .K12_C13_W8(32'hbd2d7885), 
		.K12_C14_W0(32'h3d026033), .K12_C14_W1(32'h3ddd2be5), .K12_C14_W2(32'h3d704d8e), .K12_C14_W3(32'hbdb1c103), .K12_C14_W4(32'hbdd72f83), .K12_C14_W5(32'hbdfe56c0), .K12_C14_W6(32'h3c70beec), .K12_C14_W7(32'h3dc36fef), .K12_C14_W8(32'h3e22221a), 
		.K12_C15_W0(32'hbb005d50), .K12_C15_W1(32'h3d687831), .K12_C15_W2(32'h3db9a800), .K12_C15_W3(32'h3d94c8c6), .K12_C15_W4(32'h3caafdd9), .K12_C15_W5(32'hbc306bb7), .K12_C15_W6(32'hbcb1548d), .K12_C15_W7(32'h3d20f684), .K12_C15_W8(32'hbe0addfd), 
		.K12_BIAS (32'hbcd29bd3),

		.K13_C0_W0(32'hbe0aa911), .K13_C0_W1(32'hbce63761), .K13_C0_W2(32'h3d2fe906), .K13_C0_W3(32'hbcc7391d), .K13_C0_W4(32'h3d5a1597), .K13_C0_W5(32'h3dcecbfa), .K13_C0_W6(32'h3a3bfb8a), .K13_C0_W7(32'h3ddc2dae), .K13_C0_W8(32'hbdf13aea), 
		.K13_C1_W0(32'hbdecf2b4), .K13_C1_W1(32'h3a34702c), .K13_C1_W2(32'h3d1225f3), .K13_C1_W3(32'h3d1ee322), .K13_C1_W4(32'h3d3ed153), .K13_C1_W5(32'hbd7a917e), .K13_C1_W6(32'hbda2c7c1), .K13_C1_W7(32'hbc17273b), .K13_C1_W8(32'hbdaa2dc1), 
		.K13_C2_W0(32'h3dad7122), .K13_C2_W1(32'hbd9fbe3c), .K13_C2_W2(32'h3e26435c), .K13_C2_W3(32'hbe21e4b9), .K13_C2_W4(32'hbd959934), .K13_C2_W5(32'h3db35794), .K13_C2_W6(32'h3b129437), .K13_C2_W7(32'h3dde5099), .K13_C2_W8(32'hbe0b14ca), 
		.K13_C3_W0(32'h3bda893f), .K13_C3_W1(32'hbd8f5090), .K13_C3_W2(32'hba05fe9e), .K13_C3_W3(32'hbdc9b547), .K13_C3_W4(32'h3d33fbda), .K13_C3_W5(32'h3b06d71d), .K13_C3_W6(32'h3e06ac53), .K13_C3_W7(32'hba254c11), .K13_C3_W8(32'h3e3cd886), 
		.K13_C4_W0(32'hbdfac28d), .K13_C4_W1(32'h3d8d2464), .K13_C4_W2(32'h3e0f2409), .K13_C4_W3(32'hbc839154), .K13_C4_W4(32'h3dfd988e), .K13_C4_W5(32'hbdfaa72e), .K13_C4_W6(32'h3c0afce6), .K13_C4_W7(32'hbdde9e4b), .K13_C4_W8(32'h3cde6400), 
		.K13_C5_W0(32'hbdfd5298), .K13_C5_W1(32'hbdf34a3e), .K13_C5_W2(32'hbd7cf4bf), .K13_C5_W3(32'h3df3d77c), .K13_C5_W4(32'hbcec81eb), .K13_C5_W5(32'hbddfd7bc), .K13_C5_W6(32'hba2ceb5e), .K13_C5_W7(32'h3e20653c), .K13_C5_W8(32'h3e1f44fc), 
		.K13_C6_W0(32'hbe11ed01), .K13_C6_W1(32'hbdbc2c8b), .K13_C6_W2(32'h3d32806e), .K13_C6_W3(32'hbe0e3fbb), .K13_C6_W4(32'h3d944046), .K13_C6_W5(32'hbba3d68d), .K13_C6_W6(32'h3e13f275), .K13_C6_W7(32'hbddc5054), .K13_C6_W8(32'h3de49ab0), 
		.K13_C7_W0(32'hbdd02fa4), .K13_C7_W1(32'h3c57effd), .K13_C7_W2(32'h3d808cf9), .K13_C7_W3(32'hbcc26e58), .K13_C7_W4(32'hbd9f3616), .K13_C7_W5(32'h3dfb19f7), .K13_C7_W6(32'h3bd52782), .K13_C7_W7(32'h3d93c7b7), .K13_C7_W8(32'h3ddee08e), 
		.K13_C8_W0(32'hbcb68d40), .K13_C8_W1(32'h3bf94b71), .K13_C8_W2(32'h3e0b0bb2), .K13_C8_W3(32'h3e43299d), .K13_C8_W4(32'h3dff1f90), .K13_C8_W5(32'h3ca961d6), .K13_C8_W6(32'h3d793303), .K13_C8_W7(32'hbd2b0a72), .K13_C8_W8(32'h3dddde9f), 
		.K13_C9_W0(32'hbe1074d7), .K13_C9_W1(32'h3e13299f), .K13_C9_W2(32'h3d5ec8e0), .K13_C9_W3(32'hbdf71027), .K13_C9_W4(32'hbdeb1dd9), .K13_C9_W5(32'hbd045f2b), .K13_C9_W6(32'hbe0aa87c), .K13_C9_W7(32'hbda7a649), .K13_C9_W8(32'h3e0955ed), 
		.K13_C10_W0(32'h3d92d087), .K13_C10_W1(32'hbdf2f47e), .K13_C10_W2(32'h3c6ce277), .K13_C10_W3(32'hbacf2966), .K13_C10_W4(32'hbd8577ef), .K13_C10_W5(32'h3be44228), .K13_C10_W6(32'h3d97079c), .K13_C10_W7(32'hbc2c333f), .K13_C10_W8(32'hbd814d25), 
		.K13_C11_W0(32'h3df5e968), .K13_C11_W1(32'hbe0cd7e2), .K13_C11_W2(32'hbe087b72), .K13_C11_W3(32'hbd70d89e), .K13_C11_W4(32'h3ca06e4c), .K13_C11_W5(32'hbd33c449), .K13_C11_W6(32'hbd0709b0), .K13_C11_W7(32'hbe0967c8), .K13_C11_W8(32'h3da0705d), 
		.K13_C12_W0(32'hbd85916e), .K13_C12_W1(32'hbdafafb2), .K13_C12_W2(32'hbdd1f056), .K13_C12_W3(32'h3db6da7f), .K13_C12_W4(32'h3c202fa0), .K13_C12_W5(32'h3d33c0c0), .K13_C12_W6(32'h3caef8cc), .K13_C12_W7(32'h3de8653b), .K13_C12_W8(32'hbdb5d9ac), 
		.K13_C13_W0(32'h3d2be63e), .K13_C13_W1(32'hbd3bc7bb), .K13_C13_W2(32'hbc92d805), .K13_C13_W3(32'h3d796302), .K13_C13_W4(32'h3d8a4c32), .K13_C13_W5(32'h3c0792a3), .K13_C13_W6(32'hbd1fb1fb), .K13_C13_W7(32'h3e10e222), .K13_C13_W8(32'h3cc80d08), 
		.K13_C14_W0(32'hbd05c38e), .K13_C14_W1(32'h3dae013d), .K13_C14_W2(32'hbd33daf4), .K13_C14_W3(32'hbd100048), .K13_C14_W4(32'hbde223d6), .K13_C14_W5(32'hbd39369a), .K13_C14_W6(32'hbdc52dca), .K13_C14_W7(32'h3e04dae2), .K13_C14_W8(32'hbd048969), 
		.K13_C15_W0(32'h3d99b585), .K13_C15_W1(32'hbc54087b), .K13_C15_W2(32'hbdb992e8), .K13_C15_W3(32'hbd08be5a), .K13_C15_W4(32'h3db29b44), .K13_C15_W5(32'h3cbe13ae), .K13_C15_W6(32'hbd609016), .K13_C15_W7(32'h3d047769), .K13_C15_W8(32'hbd5ade29), 
		.K13_BIAS (32'h3c2b4aed),

		.K14_C0_W0(32'h3d541826), .K14_C0_W1(32'hbdf52b53), .K14_C0_W2(32'hbe03b26e), .K14_C0_W3(32'h3e0febcb), .K14_C0_W4(32'hbde3dd65), .K14_C0_W5(32'hbd237dd2), .K14_C0_W6(32'hbde56cfb), .K14_C0_W7(32'h3c7ccbcd), .K14_C0_W8(32'hbd5b4c75), 
		.K14_C1_W0(32'h3e0bbea2), .K14_C1_W1(32'hbda14fa1), .K14_C1_W2(32'h3dcc52b7), .K14_C1_W3(32'hbd8995bc), .K14_C1_W4(32'hbd535409), .K14_C1_W5(32'h3d8eb8b0), .K14_C1_W6(32'h3cc173c5), .K14_C1_W7(32'h3dcf73f4), .K14_C1_W8(32'hbdfb7ebc), 
		.K14_C2_W0(32'hbd05c4cd), .K14_C2_W1(32'h3d081b4d), .K14_C2_W2(32'h3dc35379), .K14_C2_W3(32'h3d931b64), .K14_C2_W4(32'hbc2a67d7), .K14_C2_W5(32'hbd0b453c), .K14_C2_W6(32'hbd9063c2), .K14_C2_W7(32'h3d1109c5), .K14_C2_W8(32'h3df654f8), 
		.K14_C3_W0(32'h3db7915d), .K14_C3_W1(32'h3e220db1), .K14_C3_W2(32'h3cc0f12a), .K14_C3_W3(32'hbdc030ec), .K14_C3_W4(32'h3e18bf10), .K14_C3_W5(32'hbda5579f), .K14_C3_W6(32'h3dbea40b), .K14_C3_W7(32'h3e029c25), .K14_C3_W8(32'hbdf3fabd), 
		.K14_C4_W0(32'hbd03b874), .K14_C4_W1(32'h3db8c357), .K14_C4_W2(32'h3d64a8fd), .K14_C4_W3(32'hbd948386), .K14_C4_W4(32'h3d465182), .K14_C4_W5(32'h3d29b0c6), .K14_C4_W6(32'hbd8992ac), .K14_C4_W7(32'hbc49575d), .K14_C4_W8(32'hbd937a6f), 
		.K14_C5_W0(32'hbd830d61), .K14_C5_W1(32'hbd7b8f3c), .K14_C5_W2(32'hbcfd77a5), .K14_C5_W3(32'h3d3f5930), .K14_C5_W4(32'hbce7a5fe), .K14_C5_W5(32'h3d6a30f1), .K14_C5_W6(32'h3c03de62), .K14_C5_W7(32'h3da714a7), .K14_C5_W8(32'hbd9e05c8), 
		.K14_C6_W0(32'hbc213de8), .K14_C6_W1(32'hbde8c083), .K14_C6_W2(32'hbc5d6e2c), .K14_C6_W3(32'h3ce21049), .K14_C6_W4(32'h3d1eae66), .K14_C6_W5(32'h3e1c108d), .K14_C6_W6(32'hbe1606fd), .K14_C6_W7(32'h3cdc7945), .K14_C6_W8(32'hbdb31bfd), 
		.K14_C7_W0(32'hbcc346a2), .K14_C7_W1(32'h3dcd27a4), .K14_C7_W2(32'hbe151cc4), .K14_C7_W3(32'h3dba9522), .K14_C7_W4(32'h3e1a1fab), .K14_C7_W5(32'h3e0e7925), .K14_C7_W6(32'h3c488c49), .K14_C7_W7(32'hbc797b79), .K14_C7_W8(32'h3b4d2fda), 
		.K14_C8_W0(32'hbb518549), .K14_C8_W1(32'h3e1b55bd), .K14_C8_W2(32'hbdce2e72), .K14_C8_W3(32'h3de7e6e9), .K14_C8_W4(32'h3dc0f351), .K14_C8_W5(32'h3e190959), .K14_C8_W6(32'hbd333af5), .K14_C8_W7(32'hbdfe500c), .K14_C8_W8(32'h3d1e7226), 
		.K14_C9_W0(32'h3dba4314), .K14_C9_W1(32'h3de2383b), .K14_C9_W2(32'h3d563825), .K14_C9_W3(32'hbc96fdcd), .K14_C9_W4(32'h3d374e76), .K14_C9_W5(32'h3d037986), .K14_C9_W6(32'hbe10b33e), .K14_C9_W7(32'hbdb4cfb6), .K14_C9_W8(32'hbd4f6b67), 
		.K14_C10_W0(32'h3dd639f3), .K14_C10_W1(32'hbdf188fa), .K14_C10_W2(32'h3d32ac6d), .K14_C10_W3(32'h3d8380b1), .K14_C10_W4(32'hbdd7375a), .K14_C10_W5(32'h3d97d34c), .K14_C10_W6(32'h3d3bd126), .K14_C10_W7(32'h3da468f2), .K14_C10_W8(32'hbd3c2039), 
		.K14_C11_W0(32'hbdae02b0), .K14_C11_W1(32'h3c94dfe2), .K14_C11_W2(32'h3d53f531), .K14_C11_W3(32'hbe0fe66b), .K14_C11_W4(32'h3e043f5a), .K14_C11_W5(32'h3e113742), .K14_C11_W6(32'hbd32a17f), .K14_C11_W7(32'h3d11202d), .K14_C11_W8(32'h3e00f9eb), 
		.K14_C12_W0(32'h3df54f63), .K14_C12_W1(32'h3d28e021), .K14_C12_W2(32'h3e11d4b7), .K14_C12_W3(32'hbd972353), .K14_C12_W4(32'h3d549be6), .K14_C12_W5(32'h3e30eb36), .K14_C12_W6(32'h3d061bb3), .K14_C12_W7(32'hbd93cd38), .K14_C12_W8(32'hbd731c6f), 
		.K14_C13_W0(32'hbdcfdb42), .K14_C13_W1(32'hbdcb8826), .K14_C13_W2(32'h3d7e6bae), .K14_C13_W3(32'hbd5f722c), .K14_C13_W4(32'h3da84ea2), .K14_C13_W5(32'hbdbaab23), .K14_C13_W6(32'h3d3bf156), .K14_C13_W7(32'hbc03a448), .K14_C13_W8(32'hbe251f39), 
		.K14_C14_W0(32'h3d3ee7e8), .K14_C14_W1(32'h3dbc106d), .K14_C14_W2(32'h3d27a5fe), .K14_C14_W3(32'h3d8fcc14), .K14_C14_W4(32'hbe35b480), .K14_C14_W5(32'h3dd6b62c), .K14_C14_W6(32'h3e1e9aa7), .K14_C14_W7(32'hbdce980b), .K14_C14_W8(32'hbb4d244e), 
		.K14_C15_W0(32'h3d10862b), .K14_C15_W1(32'h3daefb38), .K14_C15_W2(32'h3d0ab04d), .K14_C15_W3(32'h3d43f3b4), .K14_C15_W4(32'hbd196690), .K14_C15_W5(32'hbdb34bb2), .K14_C15_W6(32'h3d62e5d8), .K14_C15_W7(32'h3e03fd11), .K14_C15_W8(32'hbd17c811), 
		.K14_BIAS (32'hbc72a770),

		.K15_C0_W0(32'h3e2129e0), .K15_C0_W1(32'h3d559132), .K15_C0_W2(32'h3d4fd499), .K15_C0_W3(32'hbe152692), .K15_C0_W4(32'hba629c68), .K15_C0_W5(32'hbd953732), .K15_C0_W6(32'h3d5c5885), .K15_C0_W7(32'h3cb94d64), .K15_C0_W8(32'hbd15f27d), 
		.K15_C1_W0(32'hbe0e1fbc), .K15_C1_W1(32'h3dac50e2), .K15_C1_W2(32'h3d3ea335), .K15_C1_W3(32'h3e1139c3), .K15_C1_W4(32'hbdaeb779), .K15_C1_W5(32'h3e0e8aa1), .K15_C1_W6(32'h3cd20b37), .K15_C1_W7(32'hbdaa78cb), .K15_C1_W8(32'h3d661823), 
		.K15_C2_W0(32'hbd8c03ab), .K15_C2_W1(32'hbd1d553e), .K15_C2_W2(32'hbd3753ab), .K15_C2_W3(32'h3df23315), .K15_C2_W4(32'h3e217e06), .K15_C2_W5(32'h3d391f13), .K15_C2_W6(32'hbdc41ad4), .K15_C2_W7(32'h3bc0cee8), .K15_C2_W8(32'hbc946ade), 
		.K15_C3_W0(32'h3dae9717), .K15_C3_W1(32'h3e220d67), .K15_C3_W2(32'hbd086922), .K15_C3_W3(32'h3d012c09), .K15_C3_W4(32'h3d963926), .K15_C3_W5(32'h3e06397f), .K15_C3_W6(32'hbd9b9f3c), .K15_C3_W7(32'h3dd52491), .K15_C3_W8(32'hbd477c33), 
		.K15_C4_W0(32'hbe0f65dc), .K15_C4_W1(32'h3d243c70), .K15_C4_W2(32'h3dc675cc), .K15_C4_W3(32'hbda6e09a), .K15_C4_W4(32'hbde196ac), .K15_C4_W5(32'hbdfd2f8b), .K15_C4_W6(32'hbdb8104a), .K15_C4_W7(32'hbd50e506), .K15_C4_W8(32'h3d7241a7), 
		.K15_C5_W0(32'hbd277223), .K15_C5_W1(32'h3e1f6d66), .K15_C5_W2(32'h3d3d88a5), .K15_C5_W3(32'hbd08c313), .K15_C5_W4(32'hbddaf269), .K15_C5_W5(32'hbdf35b28), .K15_C5_W6(32'hbe04d1f2), .K15_C5_W7(32'hbda7c77f), .K15_C5_W8(32'hbd2a1cb0), 
		.K15_C6_W0(32'h3c7b15d7), .K15_C6_W1(32'h3e22a6fd), .K15_C6_W2(32'h3e02690b), .K15_C6_W3(32'hbd035cd4), .K15_C6_W4(32'hbaaf2265), .K15_C6_W5(32'hbe025285), .K15_C6_W6(32'h3da6505c), .K15_C6_W7(32'hbe19e7ca), .K15_C6_W8(32'hbddfef0d), 
		.K15_C7_W0(32'h3dc4e2f5), .K15_C7_W1(32'hbdd05b74), .K15_C7_W2(32'h3e0be5d7), .K15_C7_W3(32'h3e0a0f7f), .K15_C7_W4(32'hbcef8164), .K15_C7_W5(32'h3cf3ddb0), .K15_C7_W6(32'h3d51e9f0), .K15_C7_W7(32'hbde37995), .K15_C7_W8(32'hbdbebced), 
		.K15_C8_W0(32'h3cdf8629), .K15_C8_W1(32'h3848f30c), .K15_C8_W2(32'hbd9f1ed2), .K15_C8_W3(32'hbd9cc14b), .K15_C8_W4(32'hbd8ed51e), .K15_C8_W5(32'h3de73306), .K15_C8_W6(32'h3d503f9a), .K15_C8_W7(32'hbd0daa7b), .K15_C8_W8(32'h3dc20d44), 
		.K15_C9_W0(32'h3dad5bb0), .K15_C9_W1(32'hbd126dba), .K15_C9_W2(32'hbd59e6d2), .K15_C9_W3(32'hbe2712e9), .K15_C9_W4(32'hbe065bcf), .K15_C9_W5(32'hbd2f6f06), .K15_C9_W6(32'hbe366065), .K15_C9_W7(32'hbdb883a5), .K15_C9_W8(32'h3d3272a0), 
		.K15_C10_W0(32'hbd58fc58), .K15_C10_W1(32'hbcb87e2c), .K15_C10_W2(32'h3e0c0d54), .K15_C10_W3(32'h3dcaf77a), .K15_C10_W4(32'h3cce297c), .K15_C10_W5(32'hbc8c2ec6), .K15_C10_W6(32'hbdb4ccbe), .K15_C10_W7(32'hbc86fdc4), .K15_C10_W8(32'h3c811c11), 
		.K15_C11_W0(32'hbd6cb1b4), .K15_C11_W1(32'hbdc96f21), .K15_C11_W2(32'hbd6fe880), .K15_C11_W3(32'h3d9591bc), .K15_C11_W4(32'h3e119cb7), .K15_C11_W5(32'hbdf49842), .K15_C11_W6(32'hbd8bfb6c), .K15_C11_W7(32'hbd865dfd), .K15_C11_W8(32'h3db6820f), 
		.K15_C12_W0(32'hbd831148), .K15_C12_W1(32'hbd49377e), .K15_C12_W2(32'hbdcf5b9b), .K15_C12_W3(32'hbe0f3ccf), .K15_C12_W4(32'hbd756a30), .K15_C12_W5(32'h3d4ae11c), .K15_C12_W6(32'hbe091d7f), .K15_C12_W7(32'h3cb7667d), .K15_C12_W8(32'h3d1c9137), 
		.K15_C13_W0(32'h3dab08c5), .K15_C13_W1(32'hbd15aac4), .K15_C13_W2(32'h3dd365e8), .K15_C13_W3(32'h3d2cfa1f), .K15_C13_W4(32'hbc9ac8c9), .K15_C13_W5(32'h3e1051dd), .K15_C13_W6(32'hbd12c588), .K15_C13_W7(32'h3e0285f0), .K15_C13_W8(32'hbd6fc7ad), 
		.K15_C14_W0(32'hbdff04e7), .K15_C14_W1(32'h3e34b794), .K15_C14_W2(32'hbd753ef3), .K15_C14_W3(32'h3d619378), .K15_C14_W4(32'hbcfb1282), .K15_C14_W5(32'hbd9ae998), .K15_C14_W6(32'hbd975a4d), .K15_C14_W7(32'hbdddc71e), .K15_C14_W8(32'h3df16315), 
		.K15_C15_W0(32'hbc65b9f3), .K15_C15_W1(32'hbd447a4c), .K15_C15_W2(32'hbdc87d48), .K15_C15_W3(32'hbe29339e), .K15_C15_W4(32'h3d67ea7c), .K15_C15_W5(32'h3e11e141), .K15_C15_W6(32'h3ca0f834), .K15_C15_W7(32'h3d3e4970), .K15_C15_W8(32'h3e1d0372), 
		.K15_BIAS (32'h3cd4a86b)
		)
		block5_conv2(
		.clk(clk),
		.resetn(resetn),
		.data_valid_in(conv_valid_out_5_1),
		.data_in_0(relu_out_5_1[0]),
		.data_in_1(relu_out_5_1[1]),
		.data_in_2(relu_out_5_1[2]),
		.data_in_3(relu_out_5_1[3]),
		.data_in_4(relu_out_5_1[4]),
		.data_in_5(relu_out_5_1[5]),
		.data_in_6(relu_out_5_1[6]),
		.data_in_7(relu_out_5_1[7]),
		.data_in_8(relu_out_5_1[8]),
		.data_in_9(relu_out_5_1[9]),
		.data_in_10(relu_out_5_1[10]),
		.data_in_11(relu_out_5_1[11]),
		.data_in_12(relu_out_5_1[12]),
		.data_in_13(relu_out_5_1[13]),
		.data_in_14(relu_out_5_1[14]),
		.data_in_15(relu_out_5_1[15]),
		.data_out_conv_0(conv_out_5_2[0]),
		.data_out_conv_1(conv_out_5_2[1]),
		.data_out_conv_2(conv_out_5_2[2]),
		.data_out_conv_3(conv_out_5_2[3]),
		.data_out_conv_4(conv_out_5_2[4]),
		.data_out_conv_5(conv_out_5_2[5]),
		.data_out_conv_6(conv_out_5_2[6]),
		.data_out_conv_7(conv_out_5_2[7]),
		.data_out_conv_8(conv_out_5_2[8]),
		.data_out_conv_9(conv_out_5_2[9]),
		.data_out_conv_10(conv_out_5_2[10]),
		.data_out_conv_11(conv_out_5_2[11]),
		.data_out_conv_12(conv_out_5_2[12]),
		.data_out_conv_13(conv_out_5_2[13]),
		.data_out_conv_14(conv_out_5_2[14]),
		.data_out_conv_15(conv_out_5_2[15]),
		.valid_out_pixel(conv_valid_out_5_2),
		.done(done_conv_5_2)
		);





	generate
    for (i = 0; i < CHANNEL_OUT*2; i=i+1) 
    begin : relu_5_2 // needs CHANNEL_OUT*2 relu

        activate #(
            .DATA_WIDTH(32)
        )
        relu (
            .in(conv_out_5_2[i]),			// Edit here
            .out(relu_out_5_2[i])
        );
    end
    endgenerate




	conv3d_16_kernel_16_channel_size_3 #(
		.DATA_WIDTH(32),.IMG_WIDTH(WIDTH/16),.IMG_HEIGHT(HEIGHT/16),	// Edit here
		.K0_C0_W0(32'hbdffb130), .K0_C0_W1(32'hbdc4e6dd), .K0_C0_W2(32'h3d18d00f), .K0_C0_W3(32'hbdb589a5), .K0_C0_W4(32'h3c81e479), .K0_C0_W5(32'hbb759485), .K0_C0_W6(32'h3e375086), .K0_C0_W7(32'hbdeeefa7), .K0_C0_W8(32'h3da0db80), 
		.K0_C1_W0(32'hbd674b25), .K0_C1_W1(32'h3e1f6580), .K0_C1_W2(32'hbd7fb906), .K0_C1_W3(32'h3dc854b6), .K0_C1_W4(32'hbd9ba290), .K0_C1_W5(32'h3b34d208), .K0_C1_W6(32'h3e2e700a), .K0_C1_W7(32'h3d8d2e7f), .K0_C1_W8(32'hbda1da3a), 
		.K0_C2_W0(32'h3dff5004), .K0_C2_W1(32'h3dab4561), .K0_C2_W2(32'hbd99c8a7), .K0_C2_W3(32'hbbadd011), .K0_C2_W4(32'h3e00dd9b), .K0_C2_W5(32'hbc8fb1cf), .K0_C2_W6(32'h3ca5c7f1), .K0_C2_W7(32'h3d622b6e), .K0_C2_W8(32'h3ddd44b8), 
		.K0_C3_W0(32'h3e0ce261), .K0_C3_W1(32'h3dfe398f), .K0_C3_W2(32'hbc98c687), .K0_C3_W3(32'hbd9572fb), .K0_C3_W4(32'h3e07d89c), .K0_C3_W5(32'hbc12af69), .K0_C3_W6(32'hbdb6098d), .K0_C3_W7(32'h3cc57faa), .K0_C3_W8(32'h3d658df5), 
		.K0_C4_W0(32'h3d810ca4), .K0_C4_W1(32'hbdd474c2), .K0_C4_W2(32'hbd25ae06), .K0_C4_W3(32'hbd309a66), .K0_C4_W4(32'h3e10fb55), .K0_C4_W5(32'hbdaf30e4), .K0_C4_W6(32'hbe0e88c3), .K0_C4_W7(32'h3d0cfafd), .K0_C4_W8(32'hbd707856), 
		.K0_C5_W0(32'h3d49f048), .K0_C5_W1(32'h3d26f4e2), .K0_C5_W2(32'hbccebef1), .K0_C5_W3(32'h3c4f8b3a), .K0_C5_W4(32'hbd5a951f), .K0_C5_W5(32'hbe22a5ab), .K0_C5_W6(32'hbd89295a), .K0_C5_W7(32'hbd984823), .K0_C5_W8(32'h3d046611), 
		.K0_C6_W0(32'hbdab2319), .K0_C6_W1(32'hbdbfabdf), .K0_C6_W2(32'h3d2c206e), .K0_C6_W3(32'hbdf16d32), .K0_C6_W4(32'h3c5d2313), .K0_C6_W5(32'h3e0cd9a8), .K0_C6_W6(32'h3da2fc20), .K0_C6_W7(32'hbd57ee0c), .K0_C6_W8(32'h3d2c9204), 
		.K0_C7_W0(32'hbda63a9e), .K0_C7_W1(32'h3da0e943), .K0_C7_W2(32'h3e225123), .K0_C7_W3(32'h3d0a45b5), .K0_C7_W4(32'h3c3d2d3e), .K0_C7_W5(32'h3da77c68), .K0_C7_W6(32'h3d691d2b), .K0_C7_W7(32'h3d33c121), .K0_C7_W8(32'hbd134f2a), 
		.K0_C8_W0(32'h3d28fe09), .K0_C8_W1(32'hbdcff8af), .K0_C8_W2(32'hbdc8d627), .K0_C8_W3(32'h3d85f427), .K0_C8_W4(32'h3e1fd418), .K0_C8_W5(32'h3e1391c6), .K0_C8_W6(32'hbc39a05f), .K0_C8_W7(32'h3e0549e5), .K0_C8_W8(32'h3b38c473), 
		.K0_C9_W0(32'hbcf018a8), .K0_C9_W1(32'h3dd41cc8), .K0_C9_W2(32'h3dbdfd91), .K0_C9_W3(32'hbc23293e), .K0_C9_W4(32'h3d120c0d), .K0_C9_W5(32'h3dbf1557), .K0_C9_W6(32'h3bbfdbcb), .K0_C9_W7(32'h3de05fcc), .K0_C9_W8(32'h3d77e897), 
		.K0_C10_W0(32'h3d02b583), .K0_C10_W1(32'h3d99539b), .K0_C10_W2(32'h3daecf6a), .K0_C10_W3(32'h3dde34de), .K0_C10_W4(32'hbd9fcfd5), .K0_C10_W5(32'h3be17f41), .K0_C10_W6(32'h3db02712), .K0_C10_W7(32'hbd38e456), .K0_C10_W8(32'h3d90a05d), 
		.K0_C11_W0(32'h3dce63b0), .K0_C11_W1(32'hbceaa7a6), .K0_C11_W2(32'h3d2a733b), .K0_C11_W3(32'h3be63271), .K0_C11_W4(32'h3bfcb901), .K0_C11_W5(32'h3d17ae52), .K0_C11_W6(32'h3d5e2737), .K0_C11_W7(32'hbdbba8e3), .K0_C11_W8(32'hbdea86f8), 
		.K0_C12_W0(32'h3e0acc8f), .K0_C12_W1(32'hbdfa5e1d), .K0_C12_W2(32'hbcf66793), .K0_C12_W3(32'h3e2812c5), .K0_C12_W4(32'h3db80697), .K0_C12_W5(32'hbdf3be15), .K0_C12_W6(32'h3a7e6a78), .K0_C12_W7(32'hbe102de5), .K0_C12_W8(32'h3e1b930f), 
		.K0_C13_W0(32'hbdc850a7), .K0_C13_W1(32'h3cd65ac5), .K0_C13_W2(32'hbdec9806), .K0_C13_W3(32'h3b789c0b), .K0_C13_W4(32'hbd18720d), .K0_C13_W5(32'hbcd8ef65), .K0_C13_W6(32'hbdae77c2), .K0_C13_W7(32'hbdafeba9), .K0_C13_W8(32'h3d030560), 
		.K0_C14_W0(32'h3e0ab371), .K0_C14_W1(32'hbde4c7a0), .K0_C14_W2(32'hbda4e136), .K0_C14_W3(32'h3de61d22), .K0_C14_W4(32'hbc823ba1), .K0_C14_W5(32'hbcbfec4e), .K0_C14_W6(32'hbcecccae), .K0_C14_W7(32'hbdda3699), .K0_C14_W8(32'hbd8dddc8), 
		.K0_C15_W0(32'h3de70e6b), .K0_C15_W1(32'hbd59dcec), .K0_C15_W2(32'hbe2217da), .K0_C15_W3(32'h3d0012d5), .K0_C15_W4(32'h3d4c1cc5), .K0_C15_W5(32'hbdd7c848), .K0_C15_W6(32'h3e09a613), .K0_C15_W7(32'h3d2ce774), .K0_C15_W8(32'hbd87396b), 
		.K0_BIAS (32'h3cd76316),

		.K1_C0_W0(32'h3dd9cb42), .K1_C0_W1(32'hbd921f03), .K1_C0_W2(32'hbd0a6bc2), .K1_C0_W3(32'h3dc816fc), .K1_C0_W4(32'h3d1fc53c), .K1_C0_W5(32'h3e14f6de), .K1_C0_W6(32'h3d15265c), .K1_C0_W7(32'hbe10117d), .K1_C0_W8(32'hbe1e6c6f), 
		.K1_C1_W0(32'h3d7919ae), .K1_C1_W1(32'h3c1c5101), .K1_C1_W2(32'hbda4ec56), .K1_C1_W3(32'h3df53d65), .K1_C1_W4(32'hbde64442), .K1_C1_W5(32'hbdd592a4), .K1_C1_W6(32'h3dc63f00), .K1_C1_W7(32'h3b0d8fcf), .K1_C1_W8(32'h3e034fa8), 
		.K1_C2_W0(32'hbd82bee4), .K1_C2_W1(32'h3da64811), .K1_C2_W2(32'hbd889e5a), .K1_C2_W3(32'hbdb4a5c3), .K1_C2_W4(32'hbdca1a0c), .K1_C2_W5(32'hbd09c5bc), .K1_C2_W6(32'hbd3f3130), .K1_C2_W7(32'h3db15867), .K1_C2_W8(32'h3d936716), 
		.K1_C3_W0(32'hbe14a3d4), .K1_C3_W1(32'h3bd239ef), .K1_C3_W2(32'h3c5285df), .K1_C3_W3(32'hbe3ad537), .K1_C3_W4(32'h3e20c21e), .K1_C3_W5(32'h3d5ec239), .K1_C3_W6(32'hbcecd52b), .K1_C3_W7(32'hbde2fb7f), .K1_C3_W8(32'hbe0bc6d5), 
		.K1_C4_W0(32'h3de941dc), .K1_C4_W1(32'h3c688eab), .K1_C4_W2(32'hbe05f5c2), .K1_C4_W3(32'hbe061104), .K1_C4_W4(32'h3d30909b), .K1_C4_W5(32'h3dfedfcd), .K1_C4_W6(32'h3d2794c4), .K1_C4_W7(32'h3de0a8b1), .K1_C4_W8(32'h3e036b2f), 
		.K1_C5_W0(32'hbd2fcc2a), .K1_C5_W1(32'hbcf49dd2), .K1_C5_W2(32'h3d2be374), .K1_C5_W3(32'h3d14ed86), .K1_C5_W4(32'hbc125e9a), .K1_C5_W5(32'hbe07b00b), .K1_C5_W6(32'hbdf08d77), .K1_C5_W7(32'h3c565ccd), .K1_C5_W8(32'hbd861295), 
		.K1_C6_W0(32'hbd6743e7), .K1_C6_W1(32'h3d8a84b0), .K1_C6_W2(32'h3dc80f7e), .K1_C6_W3(32'hbd94f650), .K1_C6_W4(32'h3d1f272a), .K1_C6_W5(32'h3cfd7cb7), .K1_C6_W6(32'h3dca8535), .K1_C6_W7(32'hbe00f952), .K1_C6_W8(32'hbae40ecc), 
		.K1_C7_W0(32'h3d49aeab), .K1_C7_W1(32'hbc10a4df), .K1_C7_W2(32'hbe0cae35), .K1_C7_W3(32'h3e0a7b46), .K1_C7_W4(32'hbcf23992), .K1_C7_W5(32'h3cd4d0da), .K1_C7_W6(32'h3ca31b90), .K1_C7_W7(32'hbddc1eaa), .K1_C7_W8(32'hbdc12ae4), 
		.K1_C8_W0(32'hbc5478eb), .K1_C8_W1(32'hbcd00147), .K1_C8_W2(32'h3d9e162c), .K1_C8_W3(32'hbd24862b), .K1_C8_W4(32'hbdb138dd), .K1_C8_W5(32'h3c242d34), .K1_C8_W6(32'hbcc3b06d), .K1_C8_W7(32'h3e067751), .K1_C8_W8(32'hbcbdf66f), 
		.K1_C9_W0(32'hbd65bbe7), .K1_C9_W1(32'h3cad88a6), .K1_C9_W2(32'hbcd9dd98), .K1_C9_W3(32'hbdba87c7), .K1_C9_W4(32'h3c337827), .K1_C9_W5(32'h3dc3b097), .K1_C9_W6(32'hbdf5cd12), .K1_C9_W7(32'hbd551ec5), .K1_C9_W8(32'h3c9a803b), 
		.K1_C10_W0(32'h3d9ad063), .K1_C10_W1(32'hbd4075c2), .K1_C10_W2(32'hbd6e5b81), .K1_C10_W3(32'hbe01cbfe), .K1_C10_W4(32'hbdb2d630), .K1_C10_W5(32'h3dc6413c), .K1_C10_W6(32'hbe2a3b2f), .K1_C10_W7(32'h3c38306e), .K1_C10_W8(32'hbc924786), 
		.K1_C11_W0(32'hbde01a9e), .K1_C11_W1(32'hbdb64d72), .K1_C11_W2(32'hbd04e14b), .K1_C11_W3(32'hbe1fe546), .K1_C11_W4(32'h3b5e615a), .K1_C11_W5(32'hbc9d3265), .K1_C11_W6(32'hbd3c86e9), .K1_C11_W7(32'hbd3b89c1), .K1_C11_W8(32'h3c4bdb43), 
		.K1_C12_W0(32'hbba91a46), .K1_C12_W1(32'h3e198f27), .K1_C12_W2(32'h3e0900c3), .K1_C12_W3(32'hbe1d56e9), .K1_C12_W4(32'h3e0dd292), .K1_C12_W5(32'h3dfc3f03), .K1_C12_W6(32'hbdfaa8a5), .K1_C12_W7(32'h3e065682), .K1_C12_W8(32'h3d6d92b1), 
		.K1_C13_W0(32'hbac1146a), .K1_C13_W1(32'h3dafbfce), .K1_C13_W2(32'h3ced710c), .K1_C13_W3(32'hbdb37b5d), .K1_C13_W4(32'hbbfc4bbe), .K1_C13_W5(32'hbde4477e), .K1_C13_W6(32'hbd718ed4), .K1_C13_W7(32'hbe33f769), .K1_C13_W8(32'hbdb30db5), 
		.K1_C14_W0(32'hbdf1cff1), .K1_C14_W1(32'hbe08bba8), .K1_C14_W2(32'h3e236a38), .K1_C14_W3(32'h3db3d761), .K1_C14_W4(32'hbe1034b8), .K1_C14_W5(32'h3dbe6d59), .K1_C14_W6(32'h3d8c1092), .K1_C14_W7(32'hbddc2e12), .K1_C14_W8(32'h3d51c6f1), 
		.K1_C15_W0(32'hbe1c9f5f), .K1_C15_W1(32'hbda5bcdc), .K1_C15_W2(32'h3da575f8), .K1_C15_W3(32'h3dd5a91c), .K1_C15_W4(32'h3b3d31d9), .K1_C15_W5(32'h3d8feb2e), .K1_C15_W6(32'hbdc7f67e), .K1_C15_W7(32'h3d745c03), .K1_C15_W8(32'hbb9dbeb6), 
		.K1_BIAS (32'hbcbbffa3),

		.K2_C0_W0(32'hbcaee327), .K2_C0_W1(32'hbdc12cdd), .K2_C0_W2(32'h3d8754ab), .K2_C0_W3(32'hbc4d0f27), .K2_C0_W4(32'hbdbf2537), .K2_C0_W5(32'hbcb00a8e), .K2_C0_W6(32'h3e00b4ae), .K2_C0_W7(32'hbd49605f), .K2_C0_W8(32'hbdea60fb), 
		.K2_C1_W0(32'hbdaef87d), .K2_C1_W1(32'h3d877b8b), .K2_C1_W2(32'h3e0d5f4b), .K2_C1_W3(32'h3d9de200), .K2_C1_W4(32'hbdd65a3f), .K2_C1_W5(32'hbe0b55c5), .K2_C1_W6(32'h3d1ac6d5), .K2_C1_W7(32'h3d039955), .K2_C1_W8(32'hbda4fd47), 
		.K2_C2_W0(32'hbd81745f), .K2_C2_W1(32'hbd8833b1), .K2_C2_W2(32'h3d8dfbdb), .K2_C2_W3(32'h3da71170), .K2_C2_W4(32'h3ccb65be), .K2_C2_W5(32'h3e1df817), .K2_C2_W6(32'hbd982b99), .K2_C2_W7(32'h3d7d4601), .K2_C2_W8(32'hbd17debc), 
		.K2_C3_W0(32'hbde466d7), .K2_C3_W1(32'hbdade8a2), .K2_C3_W2(32'hbd0b8737), .K2_C3_W3(32'hbe097560), .K2_C3_W4(32'hbe18fd99), .K2_C3_W5(32'hbe0b548e), .K2_C3_W6(32'h3e257940), .K2_C3_W7(32'hbe04f634), .K2_C3_W8(32'h3dc585c1), 
		.K2_C4_W0(32'hbdc1a5a2), .K2_C4_W1(32'h3cc29fbe), .K2_C4_W2(32'h3ceb1e38), .K2_C4_W3(32'hbd9afd56), .K2_C4_W4(32'hbd4964ad), .K2_C4_W5(32'h3c804708), .K2_C4_W6(32'hbe2341fb), .K2_C4_W7(32'hbc8a6c84), .K2_C4_W8(32'h3c8ec2b7), 
		.K2_C5_W0(32'hbe11b7fc), .K2_C5_W1(32'h3d803c19), .K2_C5_W2(32'hbdc6c06a), .K2_C5_W3(32'h3dc0c789), .K2_C5_W4(32'hbdb96cc5), .K2_C5_W5(32'hbe293415), .K2_C5_W6(32'hbd05a43f), .K2_C5_W7(32'hbdb15e16), .K2_C5_W8(32'h3ddbc319), 
		.K2_C6_W0(32'hbd85f80c), .K2_C6_W1(32'hbd80e27e), .K2_C6_W2(32'hbc518ff2), .K2_C6_W3(32'h3dac77b0), .K2_C6_W4(32'h3e0f91ad), .K2_C6_W5(32'h3df1de0d), .K2_C6_W6(32'hbe11d73d), .K2_C6_W7(32'hbcd10c43), .K2_C6_W8(32'h3e00de98), 
		.K2_C7_W0(32'h3d65cbee), .K2_C7_W1(32'h3b8a668a), .K2_C7_W2(32'h3de22a8d), .K2_C7_W3(32'hbca517af), .K2_C7_W4(32'hbd8ffd66), .K2_C7_W5(32'hbda28677), .K2_C7_W6(32'hbd552e47), .K2_C7_W7(32'h3ce52e03), .K2_C7_W8(32'h3e00ec93), 
		.K2_C8_W0(32'h3e01c8db), .K2_C8_W1(32'h3c80eb26), .K2_C8_W2(32'h3dc184ee), .K2_C8_W3(32'h3dd4a796), .K2_C8_W4(32'h3ddf0696), .K2_C8_W5(32'h3b7fe540), .K2_C8_W6(32'hbd5ead5f), .K2_C8_W7(32'hbdaf14a3), .K2_C8_W8(32'h3e166578), 
		.K2_C9_W0(32'hbd8d7a3b), .K2_C9_W1(32'hbd96aee8), .K2_C9_W2(32'hbdf3d906), .K2_C9_W3(32'h3d5761e5), .K2_C9_W4(32'h3e0d0e74), .K2_C9_W5(32'hbd654a7e), .K2_C9_W6(32'hbd8534b6), .K2_C9_W7(32'hbd907af2), .K2_C9_W8(32'h3e067708), 
		.K2_C10_W0(32'hbdd7f28d), .K2_C10_W1(32'h3d1b454e), .K2_C10_W2(32'h3dd52d8a), .K2_C10_W3(32'hbd4e0e83), .K2_C10_W4(32'h3d5ca14f), .K2_C10_W5(32'h3cdf8d48), .K2_C10_W6(32'hbd46416c), .K2_C10_W7(32'hbddaa00f), .K2_C10_W8(32'hbc0ab748), 
		.K2_C11_W0(32'hbdbbd068), .K2_C11_W1(32'h3e069b6a), .K2_C11_W2(32'hbd4f2ccf), .K2_C11_W3(32'h3c1973e8), .K2_C11_W4(32'h3ddec1ef), .K2_C11_W5(32'h3def4ebf), .K2_C11_W6(32'hbd810c84), .K2_C11_W7(32'hbde1808e), .K2_C11_W8(32'h3ba0ab74), 
		.K2_C12_W0(32'hbd8f3bf7), .K2_C12_W1(32'hbd6a2349), .K2_C12_W2(32'h3c5ba0a8), .K2_C12_W3(32'h3db9b257), .K2_C12_W4(32'h3dcf247d), .K2_C12_W5(32'h3cf8db57), .K2_C12_W6(32'h3db7f6a7), .K2_C12_W7(32'hbda80379), .K2_C12_W8(32'hbd88012d), 
		.K2_C13_W0(32'h3ddc5c40), .K2_C13_W1(32'h3d3a549c), .K2_C13_W2(32'hbc296ad0), .K2_C13_W3(32'h3dd8b84b), .K2_C13_W4(32'hbd99b087), .K2_C13_W5(32'hbda54f0a), .K2_C13_W6(32'hbcc9d5e8), .K2_C13_W7(32'hbe43c186), .K2_C13_W8(32'h3d9938bc), 
		.K2_C14_W0(32'hbd9899f9), .K2_C14_W1(32'hbde7af96), .K2_C14_W2(32'h3dab974f), .K2_C14_W3(32'h3d524155), .K2_C14_W4(32'hbd5d0252), .K2_C14_W5(32'hbd16c880), .K2_C14_W6(32'hbd9ff6ac), .K2_C14_W7(32'hbe1a094b), .K2_C14_W8(32'h3d5cb36c), 
		.K2_C15_W0(32'h3db624ed), .K2_C15_W1(32'h3e0ca4b2), .K2_C15_W2(32'h3dd962f9), .K2_C15_W3(32'hbca358a4), .K2_C15_W4(32'h3d987d23), .K2_C15_W5(32'hbdc88adf), .K2_C15_W6(32'hbdcf41b7), .K2_C15_W7(32'h3c05218c), .K2_C15_W8(32'h3d38496d), 
		.K2_BIAS (32'h3d781cc8),

		.K3_C0_W0(32'hbd602933), .K3_C0_W1(32'hbda63f2b), .K3_C0_W2(32'h3dd42a36), .K3_C0_W3(32'hbd0eeaab), .K3_C0_W4(32'hbd95038d), .K3_C0_W5(32'hbba6a887), .K3_C0_W6(32'hbbd4091b), .K3_C0_W7(32'h3d351a7e), .K3_C0_W8(32'h3d1d4aca), 
		.K3_C1_W0(32'hbd173fbe), .K3_C1_W1(32'hbdfb1af8), .K3_C1_W2(32'h3e06fee7), .K3_C1_W3(32'h3c980f94), .K3_C1_W4(32'hbdd7c9ce), .K3_C1_W5(32'h3d59a96b), .K3_C1_W6(32'hbde90ed0), .K3_C1_W7(32'hbd996a86), .K3_C1_W8(32'h3caf6494), 
		.K3_C2_W0(32'hbe011cbc), .K3_C2_W1(32'h3c8fc458), .K3_C2_W2(32'h3da1e8fa), .K3_C2_W3(32'h3d3f68e1), .K3_C2_W4(32'hbb5f40a2), .K3_C2_W5(32'h3e2dc1ed), .K3_C2_W6(32'hbde89c8d), .K3_C2_W7(32'hbc2fe80e), .K3_C2_W8(32'h3dccbd43), 
		.K3_C3_W0(32'hbc9ae114), .K3_C3_W1(32'h3c1b304c), .K3_C3_W2(32'hbd8bab80), .K3_C3_W3(32'hbd28d9ee), .K3_C3_W4(32'hbd4d0230), .K3_C3_W5(32'h3caca601), .K3_C3_W6(32'h3ce3975d), .K3_C3_W7(32'h3df051c0), .K3_C3_W8(32'hbd09af6f), 
		.K3_C4_W0(32'h3c7d3600), .K3_C4_W1(32'h3de35f0f), .K3_C4_W2(32'h3db961d4), .K3_C4_W3(32'hbd1a4325), .K3_C4_W4(32'hbd8323bb), .K3_C4_W5(32'h3dbeddcd), .K3_C4_W6(32'h3dbfd379), .K3_C4_W7(32'h3dba8b03), .K3_C4_W8(32'h3d82f753), 
		.K3_C5_W0(32'hbd94efb6), .K3_C5_W1(32'hbd7f8b9d), .K3_C5_W2(32'hbc5d1fc0), .K3_C5_W3(32'hbda2706b), .K3_C5_W4(32'h3c574e77), .K3_C5_W5(32'h3c963240), .K3_C5_W6(32'h3d9cdb8a), .K3_C5_W7(32'h3e1a9208), .K3_C5_W8(32'hbd63edde), 
		.K3_C6_W0(32'h3c6afe0f), .K3_C6_W1(32'hbe0ae2a4), .K3_C6_W2(32'h3e0cb693), .K3_C6_W3(32'hbde97909), .K3_C6_W4(32'hbdd78b3d), .K3_C6_W5(32'hbdfe1862), .K3_C6_W6(32'hbc16b344), .K3_C6_W7(32'hbcbccb95), .K3_C6_W8(32'hbddd24d4), 
		.K3_C7_W0(32'h3dd04c3c), .K3_C7_W1(32'hbdf96be0), .K3_C7_W2(32'h3e447eae), .K3_C7_W3(32'hbdae3b8a), .K3_C7_W4(32'hbd42118a), .K3_C7_W5(32'h3df96689), .K3_C7_W6(32'hbddd3842), .K3_C7_W7(32'h3df7d65b), .K3_C7_W8(32'h3e04e09c), 
		.K3_C8_W0(32'hbd2d2fb4), .K3_C8_W1(32'h3d4b9b17), .K3_C8_W2(32'h3b7045ec), .K3_C8_W3(32'h3d8c7907), .K3_C8_W4(32'hbcc56b34), .K3_C8_W5(32'h3dbc61b4), .K3_C8_W6(32'hbe181be5), .K3_C8_W7(32'hbd8b9ad4), .K3_C8_W8(32'h3d625755), 
		.K3_C9_W0(32'h3e027444), .K3_C9_W1(32'hbdc20f01), .K3_C9_W2(32'h3dc65a1b), .K3_C9_W3(32'hbdb1d1bc), .K3_C9_W4(32'h3caafb99), .K3_C9_W5(32'h3d8b7615), .K3_C9_W6(32'hbddfd449), .K3_C9_W7(32'hbdcf418b), .K3_C9_W8(32'h3de6b8ca), 
		.K3_C10_W0(32'h3d55cf36), .K3_C10_W1(32'h3dd3f0d8), .K3_C10_W2(32'hbcec0bcd), .K3_C10_W3(32'hbdd28773), .K3_C10_W4(32'h3d8fdd2c), .K3_C10_W5(32'hbe04af1f), .K3_C10_W6(32'hbd3fe053), .K3_C10_W7(32'h3e0584d6), .K3_C10_W8(32'h3dbefb44), 
		.K3_C11_W0(32'hbdf78944), .K3_C11_W1(32'h3df3f083), .K3_C11_W2(32'h3d26623e), .K3_C11_W3(32'hbe0284fd), .K3_C11_W4(32'h3ced7a0e), .K3_C11_W5(32'h3df85b74), .K3_C11_W6(32'h3df6c7e0), .K3_C11_W7(32'hbe087327), .K3_C11_W8(32'hbd2264b6), 
		.K3_C12_W0(32'hbdb81f9b), .K3_C12_W1(32'hbc81cb94), .K3_C12_W2(32'hbc38c3f0), .K3_C12_W3(32'h3de939cc), .K3_C12_W4(32'hbe033872), .K3_C12_W5(32'h3dbaf9a3), .K3_C12_W6(32'h3d1bbd62), .K3_C12_W7(32'h3e16e385), .K3_C12_W8(32'hbdbfd57a), 
		.K3_C13_W0(32'h3d6d1444), .K3_C13_W1(32'h3d98d1f3), .K3_C13_W2(32'h3d8e70e9), .K3_C13_W3(32'h3be0bc5e), .K3_C13_W4(32'hbdf82a76), .K3_C13_W5(32'h3d4ac780), .K3_C13_W6(32'hbe2212e9), .K3_C13_W7(32'hbd4bb6b8), .K3_C13_W8(32'hbd5a2d4d), 
		.K3_C14_W0(32'hbd7735d4), .K3_C14_W1(32'h3dd14517), .K3_C14_W2(32'hbdd78947), .K3_C14_W3(32'hbd3b8844), .K3_C14_W4(32'h3e17a34d), .K3_C14_W5(32'hbdbb6763), .K3_C14_W6(32'hbe04a3be), .K3_C14_W7(32'h3d19b598), .K3_C14_W8(32'h3c9d6deb), 
		.K3_C15_W0(32'hbc5e731d), .K3_C15_W1(32'h3e07fc31), .K3_C15_W2(32'h3e028262), .K3_C15_W3(32'hbdf8c89c), .K3_C15_W4(32'hbd972355), .K3_C15_W5(32'h3dabfc4f), .K3_C15_W6(32'h3dbf8770), .K3_C15_W7(32'h3e01f9f9), .K3_C15_W8(32'h3dc049ed), 
		.K3_BIAS (32'h3ced8e1c),

		.K4_C0_W0(32'hbd08fec9), .K4_C0_W1(32'hbd818cac), .K4_C0_W2(32'hbe06b2fe), .K4_C0_W3(32'hbe023b59), .K4_C0_W4(32'hbd1f5900), .K4_C0_W5(32'h3da934f8), .K4_C0_W6(32'h3decc78f), .K4_C0_W7(32'hbd9d5f10), .K4_C0_W8(32'hbd7c3cf9), 
		.K4_C1_W0(32'hbdd9bd67), .K4_C1_W1(32'h3ddb9a8f), .K4_C1_W2(32'h3c819951), .K4_C1_W3(32'hbe01a534), .K4_C1_W4(32'h3d276025), .K4_C1_W5(32'h3df1dbc0), .K4_C1_W6(32'h3a37ece4), .K4_C1_W7(32'hbde316b4), .K4_C1_W8(32'h3c673b03), 
		.K4_C2_W0(32'h3cc65408), .K4_C2_W1(32'h3d995d07), .K4_C2_W2(32'h3e0055ca), .K4_C2_W3(32'h3da214b0), .K4_C2_W4(32'h3d8bbc58), .K4_C2_W5(32'hbe0ebc59), .K4_C2_W6(32'h3ddd5b5a), .K4_C2_W7(32'hbd77f49a), .K4_C2_W8(32'hbdb2b66d), 
		.K4_C3_W0(32'hbdb19e8c), .K4_C3_W1(32'h3ccfc23a), .K4_C3_W2(32'h3c40bb9e), .K4_C3_W3(32'hbe081b78), .K4_C3_W4(32'h3da326ca), .K4_C3_W5(32'hbdf02225), .K4_C3_W6(32'h3d727c3b), .K4_C3_W7(32'h3d888642), .K4_C3_W8(32'h3d9ab7ab), 
		.K4_C4_W0(32'h3d903c17), .K4_C4_W1(32'h3d130b3c), .K4_C4_W2(32'h3d837776), .K4_C4_W3(32'hbdaa187b), .K4_C4_W4(32'hbd35ef12), .K4_C4_W5(32'hbe08f988), .K4_C4_W6(32'hbd817afa), .K4_C4_W7(32'h3d0f9a80), .K4_C4_W8(32'hbc8cb2f0), 
		.K4_C5_W0(32'h3cb002e0), .K4_C5_W1(32'hbdf57201), .K4_C5_W2(32'hbd956734), .K4_C5_W3(32'h3de96135), .K4_C5_W4(32'h3db78b3c), .K4_C5_W5(32'h3dad88b2), .K4_C5_W6(32'hbc6bb229), .K4_C5_W7(32'h3d549538), .K4_C5_W8(32'hbe0965dd), 
		.K4_C6_W0(32'h3cdf8d25), .K4_C6_W1(32'hbdc33a4a), .K4_C6_W2(32'h3d8d800a), .K4_C6_W3(32'hbde755c0), .K4_C6_W4(32'h3d27ef50), .K4_C6_W5(32'hbe011b2d), .K4_C6_W6(32'hbc2a5f3b), .K4_C6_W7(32'hbdca8246), .K4_C6_W8(32'h3d1c569f), 
		.K4_C7_W0(32'hbceef2e5), .K4_C7_W1(32'h3cb6b790), .K4_C7_W2(32'h3c00a890), .K4_C7_W3(32'hbdbfd5e9), .K4_C7_W4(32'hbda7ecb2), .K4_C7_W5(32'h3ddda29d), .K4_C7_W6(32'hbd54e009), .K4_C7_W7(32'h3d2d1555), .K4_C7_W8(32'hbd002c62), 
		.K4_C8_W0(32'h3d13c73c), .K4_C8_W1(32'hbdcbc1a2), .K4_C8_W2(32'h3da2964a), .K4_C8_W3(32'h3dc0ff52), .K4_C8_W4(32'hbe0e821f), .K4_C8_W5(32'h3d6f7361), .K4_C8_W6(32'hbcc328bb), .K4_C8_W7(32'hbc5d8768), .K4_C8_W8(32'hbd924c3a), 
		.K4_C9_W0(32'hbdf0f22b), .K4_C9_W1(32'hbdfa46f9), .K4_C9_W2(32'hbc2d1823), .K4_C9_W3(32'h3d52ac52), .K4_C9_W4(32'hbd942a99), .K4_C9_W5(32'hbdb1189d), .K4_C9_W6(32'hbdd3d403), .K4_C9_W7(32'hbcbc6b57), .K4_C9_W8(32'h3e0047cc), 
		.K4_C10_W0(32'hbe0ca88b), .K4_C10_W1(32'h3d3a3540), .K4_C10_W2(32'hbe27ef0a), .K4_C10_W3(32'h3dc7ba8d), .K4_C10_W4(32'h3d34c651), .K4_C10_W5(32'h3dc24683), .K4_C10_W6(32'h3d985aa1), .K4_C10_W7(32'hbd749797), .K4_C10_W8(32'h3d432579), 
		.K4_C11_W0(32'h3d723732), .K4_C11_W1(32'hbd5ff7e1), .K4_C11_W2(32'hbc2e414d), .K4_C11_W3(32'hbd8d8987), .K4_C11_W4(32'hbdf22427), .K4_C11_W5(32'h3cedab71), .K4_C11_W6(32'h3d1ea18c), .K4_C11_W7(32'h3e0d01d1), .K4_C11_W8(32'hbdd16349), 
		.K4_C12_W0(32'h3d24b794), .K4_C12_W1(32'h3dd4aea1), .K4_C12_W2(32'hbe1289ce), .K4_C12_W3(32'h3d4730aa), .K4_C12_W4(32'hbde6fefb), .K4_C12_W5(32'hbe0415d9), .K4_C12_W6(32'hbd2cec37), .K4_C12_W7(32'hbd8988b1), .K4_C12_W8(32'hbd8657cb), 
		.K4_C13_W0(32'h3d0dbf06), .K4_C13_W1(32'h3db1a76e), .K4_C13_W2(32'h3cc1cfaa), .K4_C13_W3(32'h3c3717ac), .K4_C13_W4(32'h3de604ce), .K4_C13_W5(32'h3c8f8e81), .K4_C13_W6(32'hbdd7b1cc), .K4_C13_W7(32'h3b66a31c), .K4_C13_W8(32'hbd101484), 
		.K4_C14_W0(32'h3d8a9f41), .K4_C14_W1(32'hbdb6f646), .K4_C14_W2(32'hbe219222), .K4_C14_W3(32'h3bb49ff8), .K4_C14_W4(32'hbd76d03c), .K4_C14_W5(32'hbdb0afde), .K4_C14_W6(32'hbe1ca8a5), .K4_C14_W7(32'h3df9b628), .K4_C14_W8(32'h3c09705b), 
		.K4_C15_W0(32'hbe128dfd), .K4_C15_W1(32'hbe0490c3), .K4_C15_W2(32'h3ce67eb8), .K4_C15_W3(32'h3e17a077), .K4_C15_W4(32'hbde36ce1), .K4_C15_W5(32'hbe0b7172), .K4_C15_W6(32'h3de9b82b), .K4_C15_W7(32'h3db17968), .K4_C15_W8(32'hbe07bed0), 
		.K4_BIAS (32'hbc5c9177),

		.K5_C0_W0(32'hbd411692), .K5_C0_W1(32'h3d5b84ce), .K5_C0_W2(32'h3db83c05), .K5_C0_W3(32'h3dcd5201), .K5_C0_W4(32'h3df8d436), .K5_C0_W5(32'hbbd06dd8), .K5_C0_W6(32'h3dded6c0), .K5_C0_W7(32'hbd3f0199), .K5_C0_W8(32'h3e028671), 
		.K5_C1_W0(32'h3dc32e15), .K5_C1_W1(32'hbdbfe05d), .K5_C1_W2(32'h3ce98fee), .K5_C1_W3(32'hbdc798a7), .K5_C1_W4(32'hbe043a09), .K5_C1_W5(32'h3dc916ef), .K5_C1_W6(32'h3d95e8a3), .K5_C1_W7(32'hbcf8676c), .K5_C1_W8(32'hbdda61f6), 
		.K5_C2_W0(32'h3df02c04), .K5_C2_W1(32'hbdefa446), .K5_C2_W2(32'h3d2601a4), .K5_C2_W3(32'hbd628dff), .K5_C2_W4(32'h3dbe0aa4), .K5_C2_W5(32'h3d94f42d), .K5_C2_W6(32'hbdf501de), .K5_C2_W7(32'h3c8442b9), .K5_C2_W8(32'hbdaebd8a), 
		.K5_C3_W0(32'hbe32c05e), .K5_C3_W1(32'h3d9fef3a), .K5_C3_W2(32'hbbeff74c), .K5_C3_W3(32'hbdbb53cb), .K5_C3_W4(32'hba93c5c0), .K5_C3_W5(32'h3ce1bdcb), .K5_C3_W6(32'hbb6c1391), .K5_C3_W7(32'h3e13c7fb), .K5_C3_W8(32'h3c8405de), 
		.K5_C4_W0(32'hbddf2ba8), .K5_C4_W1(32'h3c5cfa60), .K5_C4_W2(32'hbdae78b3), .K5_C4_W3(32'hbddbbf64), .K5_C4_W4(32'h3d980699), .K5_C4_W5(32'hbda8a2c6), .K5_C4_W6(32'h3da5c8d5), .K5_C4_W7(32'hbcb1ac7b), .K5_C4_W8(32'hbdc46974), 
		.K5_C5_W0(32'hbcd7dc5f), .K5_C5_W1(32'h3df85fb2), .K5_C5_W2(32'h3d917956), .K5_C5_W3(32'h3deea36d), .K5_C5_W4(32'hbd4e2009), .K5_C5_W5(32'hbdbebbc0), .K5_C5_W6(32'hbddc9d3e), .K5_C5_W7(32'hbe07158d), .K5_C5_W8(32'hbe3aea1f), 
		.K5_C6_W0(32'hbe21a150), .K5_C6_W1(32'hbd25406d), .K5_C6_W2(32'hbd9fbc57), .K5_C6_W3(32'h3de1c088), .K5_C6_W4(32'hbd5feb23), .K5_C6_W5(32'hbd141eba), .K5_C6_W6(32'h3e002441), .K5_C6_W7(32'hbd1dfbc5), .K5_C6_W8(32'hbe0143ac), 
		.K5_C7_W0(32'hbe0281f6), .K5_C7_W1(32'hbc6b9b84), .K5_C7_W2(32'hbc303a0d), .K5_C7_W3(32'h3df44249), .K5_C7_W4(32'h3db437c5), .K5_C7_W5(32'hbe0a12f1), .K5_C7_W6(32'hbdb48b02), .K5_C7_W7(32'h3d71c67e), .K5_C7_W8(32'h3d53b8cb), 
		.K5_C8_W0(32'h3d017b60), .K5_C8_W1(32'hbe1bd4d1), .K5_C8_W2(32'hbd08c937), .K5_C8_W3(32'hbdf5a3c7), .K5_C8_W4(32'h3cbd4590), .K5_C8_W5(32'h3dce69c1), .K5_C8_W6(32'h3c65e967), .K5_C8_W7(32'hbd943e41), .K5_C8_W8(32'h3d3363bf), 
		.K5_C9_W0(32'h3d868ce7), .K5_C9_W1(32'hbe2c643f), .K5_C9_W2(32'h3cb540bd), .K5_C9_W3(32'hbe021899), .K5_C9_W4(32'h3d8cb921), .K5_C9_W5(32'h3c91f9ca), .K5_C9_W6(32'h3dad34dd), .K5_C9_W7(32'h3d8f5766), .K5_C9_W8(32'hbca4ec84), 
		.K5_C10_W0(32'h3de6a9f6), .K5_C10_W1(32'hbcb7b0c4), .K5_C10_W2(32'h3c84d09d), .K5_C10_W3(32'hbd520149), .K5_C10_W4(32'hbdd38faa), .K5_C10_W5(32'h3ca67a91), .K5_C10_W6(32'hbdcc6a61), .K5_C10_W7(32'h3e0b5ec4), .K5_C10_W8(32'hbc6f87c6), 
		.K5_C11_W0(32'h3dd69351), .K5_C11_W1(32'hbdb14813), .K5_C11_W2(32'hbe2f7513), .K5_C11_W3(32'hbe048eb5), .K5_C11_W4(32'h39b16110), .K5_C11_W5(32'hbdefd96e), .K5_C11_W6(32'hbc851c6f), .K5_C11_W7(32'h3e1c6451), .K5_C11_W8(32'h3d43e498), 
		.K5_C12_W0(32'h3dae865d), .K5_C12_W1(32'hbdde59e4), .K5_C12_W2(32'hbe10f3cd), .K5_C12_W3(32'hbdffb0be), .K5_C12_W4(32'h3df88cc3), .K5_C12_W5(32'h3dd5480f), .K5_C12_W6(32'hbd5908dc), .K5_C12_W7(32'h3ce72c06), .K5_C12_W8(32'hbdc6476d), 
		.K5_C13_W0(32'h3ccd88ca), .K5_C13_W1(32'hbdbd95ef), .K5_C13_W2(32'hbe0507c2), .K5_C13_W3(32'h3e1d7739), .K5_C13_W4(32'h3b95b92d), .K5_C13_W5(32'h3d1cb609), .K5_C13_W6(32'hbd23bcd8), .K5_C13_W7(32'h3d6682c6), .K5_C13_W8(32'h3d052115), 
		.K5_C14_W0(32'hbdcdbeb1), .K5_C14_W1(32'h3bc87ed6), .K5_C14_W2(32'h3d8db640), .K5_C14_W3(32'h3c64271c), .K5_C14_W4(32'hbce345e2), .K5_C14_W5(32'hbc7472ba), .K5_C14_W6(32'h3d6ba462), .K5_C14_W7(32'hbdb1793d), .K5_C14_W8(32'hbc96be9a), 
		.K5_C15_W0(32'hbe0d359d), .K5_C15_W1(32'hbe0bb2d3), .K5_C15_W2(32'h3d6318f8), .K5_C15_W3(32'h3e236daa), .K5_C15_W4(32'hbe0523da), .K5_C15_W5(32'h3d1350d7), .K5_C15_W6(32'h3c96ffc6), .K5_C15_W7(32'h3df3a1a5), .K5_C15_W8(32'hbd1c53a6), 
		.K5_BIAS (32'hbca291e1),

		.K6_C0_W0(32'hbc8a7ee6), .K6_C0_W1(32'h3e139dd9), .K6_C0_W2(32'hbb716459), .K6_C0_W3(32'hbc85a37f), .K6_C0_W4(32'h3da4fa82), .K6_C0_W5(32'hbe028b9a), .K6_C0_W6(32'h3e18163f), .K6_C0_W7(32'hbdd5a1a7), .K6_C0_W8(32'h3dd80d75), 
		.K6_C1_W0(32'h3d944981), .K6_C1_W1(32'h3e0cf531), .K6_C1_W2(32'h3df6f9c5), .K6_C1_W3(32'h3da4905e), .K6_C1_W4(32'hbda9da9a), .K6_C1_W5(32'h3c359bd1), .K6_C1_W6(32'h3ceebc5c), .K6_C1_W7(32'hbdb9d43b), .K6_C1_W8(32'hbe24746d), 
		.K6_C2_W0(32'h3d33e25b), .K6_C2_W1(32'hbd275f94), .K6_C2_W2(32'h3d29649a), .K6_C2_W3(32'h3dc4a91d), .K6_C2_W4(32'h3d9f8bb4), .K6_C2_W5(32'hbdcba9c3), .K6_C2_W6(32'h3d4c68ee), .K6_C2_W7(32'h3df06a21), .K6_C2_W8(32'hbd81bd64), 
		.K6_C3_W0(32'h3e085a21), .K6_C3_W1(32'h3d929bb6), .K6_C3_W2(32'hbcec50e3), .K6_C3_W3(32'h3cbceaea), .K6_C3_W4(32'h3dc51f38), .K6_C3_W5(32'hbcc75766), .K6_C3_W6(32'h3d1dea16), .K6_C3_W7(32'hbcab32af), .K6_C3_W8(32'h3dcfdfca), 
		.K6_C4_W0(32'hbd243aaf), .K6_C4_W1(32'h3e0d9e7a), .K6_C4_W2(32'h3d60b120), .K6_C4_W3(32'hbdab4ca4), .K6_C4_W4(32'hbbc103cd), .K6_C4_W5(32'hb996dd50), .K6_C4_W6(32'hbd8bbe14), .K6_C4_W7(32'hbe5c570f), .K6_C4_W8(32'h3db1b6fe), 
		.K6_C5_W0(32'h3d08b304), .K6_C5_W1(32'hbe1a9c2e), .K6_C5_W2(32'h3d82ff32), .K6_C5_W3(32'h3cd14619), .K6_C5_W4(32'hbddd3b3e), .K6_C5_W5(32'h3d8a9851), .K6_C5_W6(32'h3d633278), .K6_C5_W7(32'h3e08f8a2), .K6_C5_W8(32'hbdfb7392), 
		.K6_C6_W0(32'h3dd64631), .K6_C6_W1(32'h3dda9d38), .K6_C6_W2(32'h3dbe1a20), .K6_C6_W3(32'h3da681ce), .K6_C6_W4(32'hbdcff948), .K6_C6_W5(32'h3d9cf086), .K6_C6_W6(32'hbdccc0cc), .K6_C6_W7(32'hbdb2ccf1), .K6_C6_W8(32'h3dbf1312), 
		.K6_C7_W0(32'hbd4ecd57), .K6_C7_W1(32'hbd1f773c), .K6_C7_W2(32'h3e076d94), .K6_C7_W3(32'hbd58bf6e), .K6_C7_W4(32'hbcf77aba), .K6_C7_W5(32'hbdfceb29), .K6_C7_W6(32'h3e0843ba), .K6_C7_W7(32'hbd4f9318), .K6_C7_W8(32'hbe01bef9), 
		.K6_C8_W0(32'hbd2825d9), .K6_C8_W1(32'hbc424a88), .K6_C8_W2(32'hbe2e0adb), .K6_C8_W3(32'h3c056c1a), .K6_C8_W4(32'h3e0e0416), .K6_C8_W5(32'hbb84547a), .K6_C8_W6(32'hbd962cd7), .K6_C8_W7(32'hbddbd421), .K6_C8_W8(32'h3d0b33bf), 
		.K6_C9_W0(32'h3e13dd30), .K6_C9_W1(32'h3c314618), .K6_C9_W2(32'h3e0207af), .K6_C9_W3(32'hbdf9dd53), .K6_C9_W4(32'hbe022f36), .K6_C9_W5(32'h3e24bf50), .K6_C9_W6(32'h3d9b7c10), .K6_C9_W7(32'hbc364497), .K6_C9_W8(32'h3dff085d), 
		.K6_C10_W0(32'h3dc000b8), .K6_C10_W1(32'h3df9b7b4), .K6_C10_W2(32'h3da0cccf), .K6_C10_W3(32'h3df2799e), .K6_C10_W4(32'h3d043d86), .K6_C10_W5(32'hbd1a1796), .K6_C10_W6(32'h3e0fdea0), .K6_C10_W7(32'hbde762d7), .K6_C10_W8(32'hbdf4053b), 
		.K6_C11_W0(32'hbd47854e), .K6_C11_W1(32'h3db6c627), .K6_C11_W2(32'h3db9a48f), .K6_C11_W3(32'hbda27c24), .K6_C11_W4(32'h3e10ab05), .K6_C11_W5(32'h3d4adc1a), .K6_C11_W6(32'h3db11fbf), .K6_C11_W7(32'h3cf8d91f), .K6_C11_W8(32'h3d28789d), 
		.K6_C12_W0(32'h3dc22ba2), .K6_C12_W1(32'hbd8d8d6e), .K6_C12_W2(32'h3c8e06e0), .K6_C12_W3(32'h3d45394f), .K6_C12_W4(32'hbd778119), .K6_C12_W5(32'hbc8dbd12), .K6_C12_W6(32'hbd1464aa), .K6_C12_W7(32'hbe01f91e), .K6_C12_W8(32'h3d41b945), 
		.K6_C13_W0(32'h3c5ca63d), .K6_C13_W1(32'h3daffa72), .K6_C13_W2(32'hbe09ee1c), .K6_C13_W3(32'h3d612c4c), .K6_C13_W4(32'hbe0f1b80), .K6_C13_W5(32'h3de81d26), .K6_C13_W6(32'hbc46c583), .K6_C13_W7(32'hbe3067ea), .K6_C13_W8(32'h3cb22d5b), 
		.K6_C14_W0(32'hbdae452c), .K6_C14_W1(32'h3d737ac6), .K6_C14_W2(32'h3d41093b), .K6_C14_W3(32'h3e0887ab), .K6_C14_W4(32'hbde66e39), .K6_C14_W5(32'h3c87254f), .K6_C14_W6(32'hbdfd8d74), .K6_C14_W7(32'hbd5c8f80), .K6_C14_W8(32'h3d7072b9), 
		.K6_C15_W0(32'hbdfc4d36), .K6_C15_W1(32'h3d51927f), .K6_C15_W2(32'hbdde00df), .K6_C15_W3(32'h3db3e193), .K6_C15_W4(32'hbd67a4d7), .K6_C15_W5(32'h3db8e799), .K6_C15_W6(32'hbce592e2), .K6_C15_W7(32'h3c018f41), .K6_C15_W8(32'h3e0c0ef5), 
		.K6_BIAS (32'h3cd93ada),

		.K7_C0_W0(32'h3d63dd6a), .K7_C0_W1(32'hbdf5199a), .K7_C0_W2(32'h3da666df), .K7_C0_W3(32'h3c9e3f84), .K7_C0_W4(32'hbba6b7b4), .K7_C0_W5(32'hbd0d7ad5), .K7_C0_W6(32'h3d6f2a18), .K7_C0_W7(32'h3c237cbc), .K7_C0_W8(32'hbdc52a60), 
		.K7_C1_W0(32'hbd05e6e2), .K7_C1_W1(32'hbe4472b3), .K7_C1_W2(32'h3d822a7f), .K7_C1_W3(32'hbbc83354), .K7_C1_W4(32'h3e0af8dc), .K7_C1_W5(32'h3d1fc73a), .K7_C1_W6(32'hbda9ee3b), .K7_C1_W7(32'hbdbcb7f5), .K7_C1_W8(32'h3d039762), 
		.K7_C2_W0(32'hbdd8eb85), .K7_C2_W1(32'hbe19d5ae), .K7_C2_W2(32'h3e15dda8), .K7_C2_W3(32'h3de439dc), .K7_C2_W4(32'h3dcedfa1), .K7_C2_W5(32'hbd77f731), .K7_C2_W6(32'hbd96fcc5), .K7_C2_W7(32'hbd46bbd0), .K7_C2_W8(32'h3c9a09ce), 
		.K7_C3_W0(32'h3c943fe6), .K7_C3_W1(32'hbd972b7e), .K7_C3_W2(32'hbd4467a3), .K7_C3_W3(32'h3e1d5d33), .K7_C3_W4(32'hbcce002a), .K7_C3_W5(32'hbcf17816), .K7_C3_W6(32'hbdbc3108), .K7_C3_W7(32'h3d8302cd), .K7_C3_W8(32'h3dbecc15), 
		.K7_C4_W0(32'h3d7c1259), .K7_C4_W1(32'hbd80dfe3), .K7_C4_W2(32'hbdead28e), .K7_C4_W3(32'h3d208bbc), .K7_C4_W4(32'h3df7f3e6), .K7_C4_W5(32'h3cdcafc2), .K7_C4_W6(32'hbd88c7ef), .K7_C4_W7(32'hbd8da15f), .K7_C4_W8(32'hbdedb885), 
		.K7_C5_W0(32'hbd9e9560), .K7_C5_W1(32'h3e13fef2), .K7_C5_W2(32'hbcd62a0a), .K7_C5_W3(32'hbd6497b6), .K7_C5_W4(32'h3d5b2d5c), .K7_C5_W5(32'h3d38c29b), .K7_C5_W6(32'hbd799c66), .K7_C5_W7(32'hbdbe49d2), .K7_C5_W8(32'hbcd69cbf), 
		.K7_C6_W0(32'hbcc61260), .K7_C6_W1(32'hbdcce6d6), .K7_C6_W2(32'hbd11ce7e), .K7_C6_W3(32'h3dce07f1), .K7_C6_W4(32'hbdd479f3), .K7_C6_W5(32'h3d066562), .K7_C6_W6(32'hbe10d610), .K7_C6_W7(32'h3de56dc8), .K7_C6_W8(32'hbd2b359a), 
		.K7_C7_W0(32'hbd541102), .K7_C7_W1(32'h3d85efe9), .K7_C7_W2(32'hbc68d858), .K7_C7_W3(32'h3ce975c0), .K7_C7_W4(32'hbe134efb), .K7_C7_W5(32'h3cedad52), .K7_C7_W6(32'h3df469df), .K7_C7_W7(32'h3df8e400), .K7_C7_W8(32'h3ce86f93), 
		.K7_C8_W0(32'h3d6f8b81), .K7_C8_W1(32'h3bf0f88e), .K7_C8_W2(32'h3cefbcdf), .K7_C8_W3(32'h3dc53d25), .K7_C8_W4(32'h3df6dc94), .K7_C8_W5(32'h3bc585a2), .K7_C8_W6(32'h3cdff99b), .K7_C8_W7(32'h3daab77d), .K7_C8_W8(32'hbdf1a42a), 
		.K7_C9_W0(32'hbdfedc80), .K7_C9_W1(32'hbd62eaa7), .K7_C9_W2(32'hbd5665d0), .K7_C9_W3(32'h3d6d95e1), .K7_C9_W4(32'h3ccad8ef), .K7_C9_W5(32'h3dcb5f73), .K7_C9_W6(32'hbdc6b706), .K7_C9_W7(32'h3dd1e3d6), .K7_C9_W8(32'hbcba440e), 
		.K7_C10_W0(32'h3d8d482a), .K7_C10_W1(32'hbd74e310), .K7_C10_W2(32'h3e09a5be), .K7_C10_W3(32'hbdeb49ef), .K7_C10_W4(32'hbdcb42a5), .K7_C10_W5(32'hbdfe1ce1), .K7_C10_W6(32'h3cf06914), .K7_C10_W7(32'h3d60b433), .K7_C10_W8(32'hbd8c09a8), 
		.K7_C11_W0(32'h3cfc4ec9), .K7_C11_W1(32'h3e027914), .K7_C11_W2(32'hbd9f4bf9), .K7_C11_W3(32'h3e0ca548), .K7_C11_W4(32'h3e16762f), .K7_C11_W5(32'h3ce203ca), .K7_C11_W6(32'hbd9367e3), .K7_C11_W7(32'h3d6d9ce6), .K7_C11_W8(32'hbd712267), 
		.K7_C12_W0(32'hbdffabd4), .K7_C12_W1(32'h3d8de23b), .K7_C12_W2(32'h3b448fdf), .K7_C12_W3(32'h3d91c015), .K7_C12_W4(32'hbd06cdc0), .K7_C12_W5(32'hbdc625e1), .K7_C12_W6(32'h3dcd2727), .K7_C12_W7(32'h3d9e8768), .K7_C12_W8(32'hbdb5808f), 
		.K7_C13_W0(32'hbd7e86f1), .K7_C13_W1(32'h3d852e5f), .K7_C13_W2(32'hbdc17831), .K7_C13_W3(32'h3e0a47a2), .K7_C13_W4(32'hbdad8384), .K7_C13_W5(32'hbd3de43f), .K7_C13_W6(32'h3dfe5ac2), .K7_C13_W7(32'h3d8a0051), .K7_C13_W8(32'hbd43d913), 
		.K7_C14_W0(32'hbdc2f7eb), .K7_C14_W1(32'h3d7cb080), .K7_C14_W2(32'hbdaf3aa3), .K7_C14_W3(32'hbdf3062e), .K7_C14_W4(32'hbd9f4eb3), .K7_C14_W5(32'h3b093914), .K7_C14_W6(32'h3df953e3), .K7_C14_W7(32'hbcc34b32), .K7_C14_W8(32'hbc7dff4e), 
		.K7_C15_W0(32'h3e06901a), .K7_C15_W1(32'hbd907667), .K7_C15_W2(32'hbd79e3a6), .K7_C15_W3(32'hbcc6cf6e), .K7_C15_W4(32'h3d5e0d02), .K7_C15_W5(32'hbdadf68f), .K7_C15_W6(32'h3da1f8d6), .K7_C15_W7(32'h3d02741b), .K7_C15_W8(32'h3dd66ea9), 
		.K7_BIAS (32'hbce2ae28),

		.K8_C0_W0(32'hbdd52a07), .K8_C0_W1(32'hbdcc1d4f), .K8_C0_W2(32'hbe1b744e), .K8_C0_W3(32'hbd865641), .K8_C0_W4(32'hbcc6f9ce), .K8_C0_W5(32'h3cc2459f), .K8_C0_W6(32'hbc4542ca), .K8_C0_W7(32'hbe051d8a), .K8_C0_W8(32'hbe16f228), 
		.K8_C1_W0(32'h3ddb967f), .K8_C1_W1(32'h3d2ef91f), .K8_C1_W2(32'h3d750851), .K8_C1_W3(32'hbb18540a), .K8_C1_W4(32'hbe06b30c), .K8_C1_W5(32'h3d98a9be), .K8_C1_W6(32'h3e1bdd49), .K8_C1_W7(32'hbdb7f0fa), .K8_C1_W8(32'h3d06fa38), 
		.K8_C2_W0(32'h3e0aed00), .K8_C2_W1(32'hbdbf0983), .K8_C2_W2(32'hbb5cbf8c), .K8_C2_W3(32'h3d489de4), .K8_C2_W4(32'hbd9020d8), .K8_C2_W5(32'h3e0a7654), .K8_C2_W6(32'hbd5696f8), .K8_C2_W7(32'hbd57e3f2), .K8_C2_W8(32'h3df55ecd), 
		.K8_C3_W0(32'hbdd0a9f0), .K8_C3_W1(32'hbe5ba5e1), .K8_C3_W2(32'hbe105ea9), .K8_C3_W3(32'hbe0a4542), .K8_C3_W4(32'hbdca3a5f), .K8_C3_W5(32'h3dde8db8), .K8_C3_W6(32'hbde522ec), .K8_C3_W7(32'h3d020c0a), .K8_C3_W8(32'hbcd13a81), 
		.K8_C4_W0(32'h3dd61c7a), .K8_C4_W1(32'h3cb76780), .K8_C4_W2(32'hbd87556b), .K8_C4_W3(32'hbde7bd56), .K8_C4_W4(32'hbda9e24e), .K8_C4_W5(32'h3de526c8), .K8_C4_W6(32'h3db77b19), .K8_C4_W7(32'hbd9e5c45), .K8_C4_W8(32'h3db55f5e), 
		.K8_C5_W0(32'h3d3ac538), .K8_C5_W1(32'hbcb13d1f), .K8_C5_W2(32'hbc9f05f7), .K8_C5_W3(32'hbd9b94d8), .K8_C5_W4(32'h3dc4bf38), .K8_C5_W5(32'hbdbf6261), .K8_C5_W6(32'hbe013c48), .K8_C5_W7(32'h3d1863bb), .K8_C5_W8(32'h3db30f9a), 
		.K8_C6_W0(32'hbd2fb98a), .K8_C6_W1(32'hbdcaeb6e), .K8_C6_W2(32'h3b866d4f), .K8_C6_W3(32'hbd7a13f6), .K8_C6_W4(32'h3ddab2e1), .K8_C6_W5(32'h3db2a398), .K8_C6_W6(32'h3e00d0a2), .K8_C6_W7(32'hbc02d3d8), .K8_C6_W8(32'h3dd86d7a), 
		.K8_C7_W0(32'h3d6ddfa0), .K8_C7_W1(32'hbda65fd8), .K8_C7_W2(32'h3e08844f), .K8_C7_W3(32'hbc54fbc0), .K8_C7_W4(32'h3cd19be3), .K8_C7_W5(32'hbda250f2), .K8_C7_W6(32'hbe097ca5), .K8_C7_W7(32'h3dc49c20), .K8_C7_W8(32'hbdd01df5), 
		.K8_C8_W0(32'hbd84395c), .K8_C8_W1(32'h39356a42), .K8_C8_W2(32'h3d299760), .K8_C8_W3(32'h3db62d49), .K8_C8_W4(32'hbe245b6d), .K8_C8_W5(32'hbde27161), .K8_C8_W6(32'h3daf3d9d), .K8_C8_W7(32'hbd9aed32), .K8_C8_W8(32'h3dc002d8), 
		.K8_C9_W0(32'h3da641ce), .K8_C9_W1(32'hbd3dbc12), .K8_C9_W2(32'hbbe5b7a8), .K8_C9_W3(32'hbd6b4514), .K8_C9_W4(32'h3d1b1a19), .K8_C9_W5(32'hbe0b930c), .K8_C9_W6(32'hbdec7e30), .K8_C9_W7(32'h3db9341a), .K8_C9_W8(32'h3da0ab6b), 
		.K8_C10_W0(32'h3d6f416c), .K8_C10_W1(32'h3da99090), .K8_C10_W2(32'h3d2c76c4), .K8_C10_W3(32'h3cb0fb40), .K8_C10_W4(32'hbe08d673), .K8_C10_W5(32'h3e0f6c48), .K8_C10_W6(32'h3e02aa8e), .K8_C10_W7(32'h3dffa0cf), .K8_C10_W8(32'h3d4e28b2), 
		.K8_C11_W0(32'hbe129611), .K8_C11_W1(32'h3c35d2be), .K8_C11_W2(32'h3d301ab2), .K8_C11_W3(32'h3dba44b7), .K8_C11_W4(32'hb7e0e7df), .K8_C11_W5(32'hbd8b5774), .K8_C11_W6(32'h3d86a836), .K8_C11_W7(32'hbc10f407), .K8_C11_W8(32'hbbdc1157), 
		.K8_C12_W0(32'h3ddd7ed5), .K8_C12_W1(32'hbd5d5a24), .K8_C12_W2(32'h3d752fa8), .K8_C12_W3(32'h3e1d9762), .K8_C12_W4(32'hbd6604d0), .K8_C12_W5(32'hbd3fa3e8), .K8_C12_W6(32'hbc040991), .K8_C12_W7(32'hbce175fa), .K8_C12_W8(32'h3e2fc026), 
		.K8_C13_W0(32'hbad883f2), .K8_C13_W1(32'hbdf13dae), .K8_C13_W2(32'hbded11e8), .K8_C13_W3(32'h3cfabeb1), .K8_C13_W4(32'h3d165fff), .K8_C13_W5(32'h3c843562), .K8_C13_W6(32'hbce43d18), .K8_C13_W7(32'hbdfcaaf3), .K8_C13_W8(32'h3dfdc058), 
		.K8_C14_W0(32'hbe0c748f), .K8_C14_W1(32'hbdcd63ee), .K8_C14_W2(32'hbe308a8a), .K8_C14_W3(32'h3d20b47e), .K8_C14_W4(32'hbc29d34c), .K8_C14_W5(32'hbdd72154), .K8_C14_W6(32'h3d03ae66), .K8_C14_W7(32'hbda81865), .K8_C14_W8(32'hbcbc44e5), 
		.K8_C15_W0(32'hbdd511ee), .K8_C15_W1(32'h3d554f02), .K8_C15_W2(32'h3dd6ec3c), .K8_C15_W3(32'h3d96cdb4), .K8_C15_W4(32'hbe00ae3c), .K8_C15_W5(32'hbd1db2db), .K8_C15_W6(32'hbd124f53), .K8_C15_W7(32'hbdac9079), .K8_C15_W8(32'h3d282237), 
		.K8_BIAS (32'h3d2a5e23),

		.K9_C0_W0(32'hbd77ef8a), .K9_C0_W1(32'hbd056186), .K9_C0_W2(32'h3e1a7e5d), .K9_C0_W3(32'h3d7b3206), .K9_C0_W4(32'hbb16c229), .K9_C0_W5(32'h3d1cd9ee), .K9_C0_W6(32'h3bafbd2f), .K9_C0_W7(32'h3dc2abe5), .K9_C0_W8(32'h3dbeb643), 
		.K9_C1_W0(32'h3e075388), .K9_C1_W1(32'hbde35296), .K9_C1_W2(32'h3d70961f), .K9_C1_W3(32'hbdc923d0), .K9_C1_W4(32'h3dd6018f), .K9_C1_W5(32'h3dd598e3), .K9_C1_W6(32'hbe070044), .K9_C1_W7(32'hbcc9894b), .K9_C1_W8(32'hbdb90987), 
		.K9_C2_W0(32'hbd407094), .K9_C2_W1(32'hbdcd8fd1), .K9_C2_W2(32'h3c96d5d2), .K9_C2_W3(32'h3e13438c), .K9_C2_W4(32'h3b7c3ebc), .K9_C2_W5(32'h3e3f5ef6), .K9_C2_W6(32'h3d6040e3), .K9_C2_W7(32'hbdbca31b), .K9_C2_W8(32'hbd75f81b), 
		.K9_C3_W0(32'h3ddb4923), .K9_C3_W1(32'h3e001b2f), .K9_C3_W2(32'h3cad9c96), .K9_C3_W3(32'hbde8ff40), .K9_C3_W4(32'hbdb4a615), .K9_C3_W5(32'hbd9830ac), .K9_C3_W6(32'hbdc007eb), .K9_C3_W7(32'h3db98670), .K9_C3_W8(32'hbc38b1c9), 
		.K9_C4_W0(32'hbd7bc98c), .K9_C4_W1(32'h3e1cc6a4), .K9_C4_W2(32'hbe0b7b5b), .K9_C4_W3(32'hbd801ca8), .K9_C4_W4(32'hbda94e7c), .K9_C4_W5(32'h3d0cbef4), .K9_C4_W6(32'h3d8e740a), .K9_C4_W7(32'h3d226c3f), .K9_C4_W8(32'hbce6e14b), 
		.K9_C5_W0(32'h3cce5388), .K9_C5_W1(32'hbae08bea), .K9_C5_W2(32'hbceb852f), .K9_C5_W3(32'h3db96778), .K9_C5_W4(32'h3df0f9cf), .K9_C5_W5(32'h3de0f96d), .K9_C5_W6(32'hbddaf933), .K9_C5_W7(32'hbcab0d58), .K9_C5_W8(32'hbdc34a76), 
		.K9_C6_W0(32'h3c831390), .K9_C6_W1(32'h3b90f589), .K9_C6_W2(32'h3d1267e1), .K9_C6_W3(32'h3d5e3400), .K9_C6_W4(32'hbe163253), .K9_C6_W5(32'h3e0b3a9d), .K9_C6_W6(32'hbe06698e), .K9_C6_W7(32'h3becca8b), .K9_C6_W8(32'h3dc83656), 
		.K9_C7_W0(32'h3b84b56c), .K9_C7_W1(32'h3dd43b0e), .K9_C7_W2(32'hbc77a0fe), .K9_C7_W3(32'hbd03c9ec), .K9_C7_W4(32'hbd5dd79b), .K9_C7_W5(32'hbd8c0499), .K9_C7_W6(32'h3db532d6), .K9_C7_W7(32'h3e0aa50f), .K9_C7_W8(32'hbad6fc04), 
		.K9_C8_W0(32'hbd998c30), .K9_C8_W1(32'hbdf918db), .K9_C8_W2(32'h3ccf6da7), .K9_C8_W3(32'h3dc951a7), .K9_C8_W4(32'hbdcb701f), .K9_C8_W5(32'h3de7ef8d), .K9_C8_W6(32'hbdaa79a5), .K9_C8_W7(32'h3e00fd85), .K9_C8_W8(32'hbd83697b), 
		.K9_C9_W0(32'hbd6c169d), .K9_C9_W1(32'hbdbbe3dc), .K9_C9_W2(32'hbdc3ebe5), .K9_C9_W3(32'h3d95acc7), .K9_C9_W4(32'h3d8caaf5), .K9_C9_W5(32'h3dcef804), .K9_C9_W6(32'hbdef43b5), .K9_C9_W7(32'h3d7f8333), .K9_C9_W8(32'hbe14386c), 
		.K9_C10_W0(32'hbdd42421), .K9_C10_W1(32'h3d3fe655), .K9_C10_W2(32'hbb186b26), .K9_C10_W3(32'hbda882ab), .K9_C10_W4(32'hbcc0e30e), .K9_C10_W5(32'hbd31c4c9), .K9_C10_W6(32'hbddc6f2e), .K9_C10_W7(32'h3d73ccd5), .K9_C10_W8(32'h3db331b1), 
		.K9_C11_W0(32'hbd99a6a8), .K9_C11_W1(32'h3d9af375), .K9_C11_W2(32'h3bac7bfd), .K9_C11_W3(32'hbd8073ac), .K9_C11_W4(32'hbd2be9c7), .K9_C11_W5(32'hbdbc9581), .K9_C11_W6(32'h3deb1cfc), .K9_C11_W7(32'hbdb2c849), .K9_C11_W8(32'h3d1d540c), 
		.K9_C12_W0(32'h3d8064b5), .K9_C12_W1(32'h3cd60ced), .K9_C12_W2(32'hbd5b4a1c), .K9_C12_W3(32'h3ca16f1f), .K9_C12_W4(32'hbd931aca), .K9_C12_W5(32'h3d4ea7b2), .K9_C12_W6(32'h3d716fb0), .K9_C12_W7(32'h3c1483ca), .K9_C12_W8(32'h3d88cd80), 
		.K9_C13_W0(32'hbd8d53c3), .K9_C13_W1(32'h3cd4c65d), .K9_C13_W2(32'hbd1d3498), .K9_C13_W3(32'hbd93b618), .K9_C13_W4(32'h3d664805), .K9_C13_W5(32'h3e0578c1), .K9_C13_W6(32'hbe17cfb3), .K9_C13_W7(32'hbdde42e8), .K9_C13_W8(32'hbd3c193e), 
		.K9_C14_W0(32'hbc1b9cd3), .K9_C14_W1(32'hbd052949), .K9_C14_W2(32'hbdb7c746), .K9_C14_W3(32'h3c892312), .K9_C14_W4(32'hbc50b148), .K9_C14_W5(32'h3dff32ee), .K9_C14_W6(32'hbd6b8d54), .K9_C14_W7(32'h3e121f9a), .K9_C14_W8(32'hbd970da8), 
		.K9_C15_W0(32'h3d4c778a), .K9_C15_W1(32'h3d7e2134), .K9_C15_W2(32'h3d35d031), .K9_C15_W3(32'h3d0f5222), .K9_C15_W4(32'h3d6a7928), .K9_C15_W5(32'h3d5b99dc), .K9_C15_W6(32'hbe027e77), .K9_C15_W7(32'h3e0f4ed6), .K9_C15_W8(32'h3de41e5d), 
		.K9_BIAS (32'h3cd8c836),

		.K10_C0_W0(32'h3e055c06), .K10_C0_W1(32'hbdbd9b87), .K10_C0_W2(32'hbca7b10f), .K10_C0_W3(32'hbdde65fc), .K10_C0_W4(32'h3c9fe382), .K10_C0_W5(32'hbe1bccb1), .K10_C0_W6(32'h3d5514d7), .K10_C0_W7(32'hbdd4bccd), .K10_C0_W8(32'h3de28543), 
		.K10_C1_W0(32'h3d57e3d6), .K10_C1_W1(32'h3ceaed2e), .K10_C1_W2(32'h3d383cee), .K10_C1_W3(32'hbd2d10b1), .K10_C1_W4(32'h3d13dc78), .K10_C1_W5(32'hbd6e70d9), .K10_C1_W6(32'h3a963662), .K10_C1_W7(32'h3de291f1), .K10_C1_W8(32'h3c5ad173), 
		.K10_C2_W0(32'hbd704a64), .K10_C2_W1(32'hbd037452), .K10_C2_W2(32'h3dccbaad), .K10_C2_W3(32'hbd8edc5c), .K10_C2_W4(32'hbdc5dae2), .K10_C2_W5(32'hbd169a05), .K10_C2_W6(32'hbd44bb42), .K10_C2_W7(32'hbe25c092), .K10_C2_W8(32'h3d3498d1), 
		.K10_C3_W0(32'hbde8152a), .K10_C3_W1(32'hbae3354d), .K10_C3_W2(32'h3d67efb4), .K10_C3_W3(32'h3da5275b), .K10_C3_W4(32'h3d1afb84), .K10_C3_W5(32'hbdfa65d8), .K10_C3_W6(32'hbd6a0c0f), .K10_C3_W7(32'hbdf948ac), .K10_C3_W8(32'hbe248ecc), 
		.K10_C4_W0(32'hbdf94d21), .K10_C4_W1(32'h3dabbb59), .K10_C4_W2(32'hbdafcf16), .K10_C4_W3(32'h3ddeb80c), .K10_C4_W4(32'h3de590d9), .K10_C4_W5(32'h3c7c1e92), .K10_C4_W6(32'h3d1838ef), .K10_C4_W7(32'hbd896bdd), .K10_C4_W8(32'h3d5506be), 
		.K10_C5_W0(32'hbdf9879f), .K10_C5_W1(32'hbd6d45b6), .K10_C5_W2(32'h3d108237), .K10_C5_W3(32'h3dfdba8f), .K10_C5_W4(32'hbdef28a5), .K10_C5_W5(32'hbbe05c82), .K10_C5_W6(32'h3d1fae49), .K10_C5_W7(32'h3db2d14a), .K10_C5_W8(32'hbcdbf6c2), 
		.K10_C6_W0(32'hbe0ad919), .K10_C6_W1(32'h3de3f098), .K10_C6_W2(32'h3ca81b22), .K10_C6_W3(32'h3da8768b), .K10_C6_W4(32'h3b290eac), .K10_C6_W5(32'h3c1475f4), .K10_C6_W6(32'h3ce384f6), .K10_C6_W7(32'hbd8c683d), .K10_C6_W8(32'h3d71aa2b), 
		.K10_C7_W0(32'h3db67f5d), .K10_C7_W1(32'hbc4adcd8), .K10_C7_W2(32'h3dd8a7ed), .K10_C7_W3(32'hbd81530c), .K10_C7_W4(32'h3d3cba8f), .K10_C7_W5(32'h3d5461a9), .K10_C7_W6(32'h3d9551ab), .K10_C7_W7(32'h3b9789ac), .K10_C7_W8(32'h3d52f1c2), 
		.K10_C8_W0(32'h3e13a954), .K10_C8_W1(32'h3d836894), .K10_C8_W2(32'hbd4ae1be), .K10_C8_W3(32'hbd19393f), .K10_C8_W4(32'h3ce1b864), .K10_C8_W5(32'hbe047310), .K10_C8_W6(32'h3db012a4), .K10_C8_W7(32'h3dc5563b), .K10_C8_W8(32'hbd720daa), 
		.K10_C9_W0(32'h3cc98b9e), .K10_C9_W1(32'hbe1f181c), .K10_C9_W2(32'hbda9e043), .K10_C9_W3(32'hbdddfba1), .K10_C9_W4(32'h3d28b465), .K10_C9_W5(32'h3d3922f2), .K10_C9_W6(32'hbdf5d94f), .K10_C9_W7(32'hbd049b30), .K10_C9_W8(32'hbd00ac20), 
		.K10_C10_W0(32'h3de6c889), .K10_C10_W1(32'h3dab16af), .K10_C10_W2(32'hbdc827ea), .K10_C10_W3(32'hbe006aba), .K10_C10_W4(32'hbe160964), .K10_C10_W5(32'hbc470485), .K10_C10_W6(32'hbd8fc34b), .K10_C10_W7(32'h3ca6b991), .K10_C10_W8(32'h3dcc5e09), 
		.K10_C11_W0(32'h3c5f7552), .K10_C11_W1(32'hbd4ead18), .K10_C11_W2(32'h3c73f483), .K10_C11_W3(32'hbd98bc25), .K10_C11_W4(32'h3e0e9272), .K10_C11_W5(32'h3e0bf711), .K10_C11_W6(32'h3c58c158), .K10_C11_W7(32'hbd48dd46), .K10_C11_W8(32'hbe00d3d3), 
		.K10_C12_W0(32'hbdc2e081), .K10_C12_W1(32'hbd9200c9), .K10_C12_W2(32'h3e1b3a2f), .K10_C12_W3(32'hbdcee4da), .K10_C12_W4(32'h3cbf2492), .K10_C12_W5(32'h3d9c0f23), .K10_C12_W6(32'hbda40265), .K10_C12_W7(32'hbd9282fc), .K10_C12_W8(32'hbe086871), 
		.K10_C13_W0(32'h3dc20e42), .K10_C13_W1(32'h3e06660f), .K10_C13_W2(32'hbe07687e), .K10_C13_W3(32'h3d06219e), .K10_C13_W4(32'h3d8a1d00), .K10_C13_W5(32'hbd8015e5), .K10_C13_W6(32'hbe15a784), .K10_C13_W7(32'h3d02c562), .K10_C13_W8(32'hbca754ed), 
		.K10_C14_W0(32'h3e217303), .K10_C14_W1(32'h3d42b4cc), .K10_C14_W2(32'h3c908086), .K10_C14_W3(32'hbce13f44), .K10_C14_W4(32'h3dde68d8), .K10_C14_W5(32'h3ba2e631), .K10_C14_W6(32'hbdce633b), .K10_C14_W7(32'hbd5ce0b5), .K10_C14_W8(32'h3d91f17b), 
		.K10_C15_W0(32'hbca06ff4), .K10_C15_W1(32'h3e27bb51), .K10_C15_W2(32'hbd72d350), .K10_C15_W3(32'hbca54e30), .K10_C15_W4(32'h3e094d95), .K10_C15_W5(32'h3d986dc8), .K10_C15_W6(32'hbe10c5ea), .K10_C15_W7(32'hbbd56c60), .K10_C15_W8(32'h3da1cdab), 
		.K10_BIAS (32'h3c079887),

		.K11_C0_W0(32'h3c75fe83), .K11_C0_W1(32'hbddd2638), .K11_C0_W2(32'h3decc4e3), .K11_C0_W3(32'h3d3c7699), .K11_C0_W4(32'hbe23fe20), .K11_C0_W5(32'h3d65048d), .K11_C0_W6(32'hbe0cd743), .K11_C0_W7(32'hbd880ac2), .K11_C0_W8(32'h3dd04046), 
		.K11_C1_W0(32'h3d9fbb71), .K11_C1_W1(32'h3de6bace), .K11_C1_W2(32'h3d53312c), .K11_C1_W3(32'hbc42751b), .K11_C1_W4(32'hbe045407), .K11_C1_W5(32'hbc855f82), .K11_C1_W6(32'hbce856f4), .K11_C1_W7(32'h3e1b8ae8), .K11_C1_W8(32'hbd34f44e), 
		.K11_C2_W0(32'h3e042892), .K11_C2_W1(32'h3c96d2f0), .K11_C2_W2(32'hbdfee3b8), .K11_C2_W3(32'hbdff5196), .K11_C2_W4(32'h3d960b76), .K11_C2_W5(32'h3df43cd2), .K11_C2_W6(32'hbda039e4), .K11_C2_W7(32'h3cd347b1), .K11_C2_W8(32'hbce6bd64), 
		.K11_C3_W0(32'hbde7d667), .K11_C3_W1(32'hbdb923e0), .K11_C3_W2(32'h3d507db0), .K11_C3_W3(32'hbc8d0f4d), .K11_C3_W4(32'hbdc9478f), .K11_C3_W5(32'h3c417092), .K11_C3_W6(32'hbd924397), .K11_C3_W7(32'h3d572928), .K11_C3_W8(32'h3dfeec5f), 
		.K11_C4_W0(32'hbe0008b7), .K11_C4_W1(32'h3e11bcf4), .K11_C4_W2(32'hbdd9c2ec), .K11_C4_W3(32'h3b2e8542), .K11_C4_W4(32'hbb65a786), .K11_C4_W5(32'h3dc65e74), .K11_C4_W6(32'h3d138198), .K11_C4_W7(32'h3d652318), .K11_C4_W8(32'hb88e0d8c), 
		.K11_C5_W0(32'hbd65f59a), .K11_C5_W1(32'h3da58704), .K11_C5_W2(32'h3d47af94), .K11_C5_W3(32'h3deb0a42), .K11_C5_W4(32'h3e0b6cef), .K11_C5_W5(32'hbdd7f34c), .K11_C5_W6(32'h3d816476), .K11_C5_W7(32'h3e17360e), .K11_C5_W8(32'h3d285b86), 
		.K11_C6_W0(32'h3c36aa8c), .K11_C6_W1(32'hbda40106), .K11_C6_W2(32'h3e204b0f), .K11_C6_W3(32'h3d99ce20), .K11_C6_W4(32'h3e0607a8), .K11_C6_W5(32'h3e24c0e7), .K11_C6_W6(32'hbcb91de8), .K11_C6_W7(32'hbe1af055), .K11_C6_W8(32'h3d4bfe65), 
		.K11_C7_W0(32'hbdd55dbe), .K11_C7_W1(32'h3e11f576), .K11_C7_W2(32'h3da22c7a), .K11_C7_W3(32'h3d183ac6), .K11_C7_W4(32'hbdc9a4da), .K11_C7_W5(32'h3d8a68f4), .K11_C7_W6(32'h3d976b39), .K11_C7_W7(32'h3de135c3), .K11_C7_W8(32'hbd4c4f30), 
		.K11_C8_W0(32'hbddfa988), .K11_C8_W1(32'h3d5b659f), .K11_C8_W2(32'h3d6724d2), .K11_C8_W3(32'hbb67b588), .K11_C8_W4(32'hbd1bc8c3), .K11_C8_W5(32'h3e00288f), .K11_C8_W6(32'h3cfb9aab), .K11_C8_W7(32'h3da10f04), .K11_C8_W8(32'h3d76a5c3), 
		.K11_C9_W0(32'hbc82c78d), .K11_C9_W1(32'h3da75276), .K11_C9_W2(32'h3e1ead3e), .K11_C9_W3(32'hbdf7d9cb), .K11_C9_W4(32'hbe0d5949), .K11_C9_W5(32'h3d89ece8), .K11_C9_W6(32'hbd6b23e9), .K11_C9_W7(32'hbe192182), .K11_C9_W8(32'hbc869d24), 
		.K11_C10_W0(32'hbd95ed62), .K11_C10_W1(32'hbe0e3504), .K11_C10_W2(32'h3df4b133), .K11_C10_W3(32'hbde399c9), .K11_C10_W4(32'h3d165502), .K11_C10_W5(32'hbd9be9ba), .K11_C10_W6(32'h3d86c844), .K11_C10_W7(32'hbd78f176), .K11_C10_W8(32'h3da211ae), 
		.K11_C11_W0(32'hbe1a20d2), .K11_C11_W1(32'h3de21d2e), .K11_C11_W2(32'hbd786777), .K11_C11_W3(32'h3e001ac9), .K11_C11_W4(32'h3c9393e7), .K11_C11_W5(32'hbd941f5f), .K11_C11_W6(32'hbd51ef1d), .K11_C11_W7(32'h3c1b405c), .K11_C11_W8(32'hbd909cd4), 
		.K11_C12_W0(32'hbde72837), .K11_C12_W1(32'h3e091281), .K11_C12_W2(32'h3cbca956), .K11_C12_W3(32'h3dadbd4b), .K11_C12_W4(32'h3d92b3e2), .K11_C12_W5(32'hbd8644c5), .K11_C12_W6(32'h3da5dafc), .K11_C12_W7(32'hbcfc1a24), .K11_C12_W8(32'hbb238011), 
		.K11_C13_W0(32'hbc70e6b3), .K11_C13_W1(32'h3d8732c4), .K11_C13_W2(32'h3ddfc466), .K11_C13_W3(32'hbe1f8524), .K11_C13_W4(32'hbdf74f99), .K11_C13_W5(32'hbb9688db), .K11_C13_W6(32'hbd24f60c), .K11_C13_W7(32'hbd891f26), .K11_C13_W8(32'h3d1d6e17), 
		.K11_C14_W0(32'hbd5066d3), .K11_C14_W1(32'h3dfd78ca), .K11_C14_W2(32'h3c9e2938), .K11_C14_W3(32'hbdb39808), .K11_C14_W4(32'h3c59bcd5), .K11_C14_W5(32'h3e030f19), .K11_C14_W6(32'hbd43bb30), .K11_C14_W7(32'hbdca4b1c), .K11_C14_W8(32'h3b6778eb), 
		.K11_C15_W0(32'h3d838a37), .K11_C15_W1(32'hbd2d94d5), .K11_C15_W2(32'hbdf5eaee), .K11_C15_W3(32'hbc8c448f), .K11_C15_W4(32'hbe066c63), .K11_C15_W5(32'h3d2f9ade), .K11_C15_W6(32'hbcd04842), .K11_C15_W7(32'h3e3ac2df), .K11_C15_W8(32'h3e0f491e), 
		.K11_BIAS (32'h3d1b73a2),

		.K12_C0_W0(32'h3e120080), .K12_C0_W1(32'hbcc3f824), .K12_C0_W2(32'h3d23125b), .K12_C0_W3(32'h3d5f1835), .K12_C0_W4(32'hbd7c6c3a), .K12_C0_W5(32'hbca92b2f), .K12_C0_W6(32'hbde577d3), .K12_C0_W7(32'hbd216329), .K12_C0_W8(32'h3c03879c), 
		.K12_C1_W0(32'hbe09ded9), .K12_C1_W1(32'h3d75e7b2), .K12_C1_W2(32'hbd77ba99), .K12_C1_W3(32'h3cf7606e), .K12_C1_W4(32'hbe295fda), .K12_C1_W5(32'h3da7349e), .K12_C1_W6(32'h3dacb2f0), .K12_C1_W7(32'h3dcf6482), .K12_C1_W8(32'hbda9bf10), 
		.K12_C2_W0(32'hbb899fe0), .K12_C2_W1(32'hbdbf85c3), .K12_C2_W2(32'hbd32c23a), .K12_C2_W3(32'h3d99eddd), .K12_C2_W4(32'hbe04d3e8), .K12_C2_W5(32'hbd3bd7da), .K12_C2_W6(32'h3c8e1315), .K12_C2_W7(32'hbb4e0ef3), .K12_C2_W8(32'hbc6a5bb6), 
		.K12_C3_W0(32'h3e074202), .K12_C3_W1(32'hbe008601), .K12_C3_W2(32'hbd1d4170), .K12_C3_W3(32'hbdec82b8), .K12_C3_W4(32'hbcaed0a6), .K12_C3_W5(32'hbdadb57f), .K12_C3_W6(32'hbe0f1491), .K12_C3_W7(32'h3e14bc33), .K12_C3_W8(32'h3e0c277e), 
		.K12_C4_W0(32'h3ca2def0), .K12_C4_W1(32'h3dd37df8), .K12_C4_W2(32'hbd807b9c), .K12_C4_W3(32'hbdb3859d), .K12_C4_W4(32'h3d45d361), .K12_C4_W5(32'h3c84dfc0), .K12_C4_W6(32'h3dc09336), .K12_C4_W7(32'h3dca0924), .K12_C4_W8(32'h3e1415fd), 
		.K12_C5_W0(32'h3d5b4c64), .K12_C5_W1(32'h3d0c2031), .K12_C5_W2(32'hbcfe86d7), .K12_C5_W3(32'hbb5e1440), .K12_C5_W4(32'hbe13e7ce), .K12_C5_W5(32'h3dee43a7), .K12_C5_W6(32'hb970f6d8), .K12_C5_W7(32'h3d9662a8), .K12_C5_W8(32'h3dc19854), 
		.K12_C6_W0(32'h3dc25948), .K12_C6_W1(32'hbe09e32c), .K12_C6_W2(32'h3dfb333d), .K12_C6_W3(32'hbe2d0219), .K12_C6_W4(32'hbd9dccd2), .K12_C6_W5(32'hbe12be2b), .K12_C6_W6(32'hbd8e6122), .K12_C6_W7(32'h3df015fe), .K12_C6_W8(32'hbda84a20), 
		.K12_C7_W0(32'h3cfd5aa8), .K12_C7_W1(32'hbdceb4b9), .K12_C7_W2(32'hbd0b6a5f), .K12_C7_W3(32'hbe29d7b9), .K12_C7_W4(32'h3d6735bb), .K12_C7_W5(32'h3da43a0d), .K12_C7_W6(32'h3daa68e5), .K12_C7_W7(32'hbcf78643), .K12_C7_W8(32'hbd6df031), 
		.K12_C8_W0(32'hbd5bb418), .K12_C8_W1(32'hbc1e926e), .K12_C8_W2(32'h3d7f145c), .K12_C8_W3(32'hbd8b088b), .K12_C8_W4(32'hbd043067), .K12_C8_W5(32'hbe10f64b), .K12_C8_W6(32'hbe22d403), .K12_C8_W7(32'hbd620c6d), .K12_C8_W8(32'hbd80d7e5), 
		.K12_C9_W0(32'hbc819f80), .K12_C9_W1(32'hbcc4189c), .K12_C9_W2(32'h3b00cc5e), .K12_C9_W3(32'hbdf0399b), .K12_C9_W4(32'h3c51dfbd), .K12_C9_W5(32'h3d074c4f), .K12_C9_W6(32'hbb8c7ec5), .K12_C9_W7(32'h3dfc9f5d), .K12_C9_W8(32'h3cfacc52), 
		.K12_C10_W0(32'h3d5bed88), .K12_C10_W1(32'h3d385540), .K12_C10_W2(32'hbe0aefb5), .K12_C10_W3(32'h3d7db47d), .K12_C10_W4(32'h3ddd891b), .K12_C10_W5(32'hbdd3c391), .K12_C10_W6(32'hbd9b3b2c), .K12_C10_W7(32'h3d245a6e), .K12_C10_W8(32'h3e0b878d), 
		.K12_C11_W0(32'hbdfe9adb), .K12_C11_W1(32'hbe015d34), .K12_C11_W2(32'h3d697da2), .K12_C11_W3(32'h3cc7ab8a), .K12_C11_W4(32'hbd246bf9), .K12_C11_W5(32'h3e133a82), .K12_C11_W6(32'hbe207918), .K12_C11_W7(32'hbd0965b4), .K12_C11_W8(32'h3dcd2986), 
		.K12_C12_W0(32'hbe061da4), .K12_C12_W1(32'h3d984270), .K12_C12_W2(32'hbe19821f), .K12_C12_W3(32'hbd812b27), .K12_C12_W4(32'hbe089a4f), .K12_C12_W5(32'h3df4534d), .K12_C12_W6(32'hbd1ee400), .K12_C12_W7(32'h3c385d9b), .K12_C12_W8(32'hbdbe9864), 
		.K12_C13_W0(32'h3d63f950), .K12_C13_W1(32'hbddc624b), .K12_C13_W2(32'hbe04c838), .K12_C13_W3(32'h3d9f47f1), .K12_C13_W4(32'hbb89b66d), .K12_C13_W5(32'hbd4426ad), .K12_C13_W6(32'h3c44e997), .K12_C13_W7(32'h3ddf7fc9), .K12_C13_W8(32'h3d46fb06), 
		.K12_C14_W0(32'h3d70868c), .K12_C14_W1(32'hbdc18a8a), .K12_C14_W2(32'hbd6bee04), .K12_C14_W3(32'h3df9764c), .K12_C14_W4(32'h3d8ed714), .K12_C14_W5(32'h3dc6dd6c), .K12_C14_W6(32'hbe492b50), .K12_C14_W7(32'h3db0b027), .K12_C14_W8(32'h3d93936d), 
		.K12_C15_W0(32'h3e0320c2), .K12_C15_W1(32'hbe1d46a3), .K12_C15_W2(32'h3d5f56f9), .K12_C15_W3(32'hbe029586), .K12_C15_W4(32'h3dcb3b86), .K12_C15_W5(32'hbcbb6ae0), .K12_C15_W6(32'hbdef920e), .K12_C15_W7(32'hbdd8e93d), .K12_C15_W8(32'hbdacf32f), 
		.K12_BIAS (32'hbc9f93de),

		.K13_C0_W0(32'hbddd570e), .K13_C0_W1(32'h3d873895), .K13_C0_W2(32'hbdb1a708), .K13_C0_W3(32'h3d8ee82f), .K13_C0_W4(32'hbc0a9c02), .K13_C0_W5(32'hbc9f1fdb), .K13_C0_W6(32'h3df5f5f2), .K13_C0_W7(32'hbd046595), .K13_C0_W8(32'h3dafc0bb), 
		.K13_C1_W0(32'hbd859cd5), .K13_C1_W1(32'h3df02257), .K13_C1_W2(32'hbbd22c53), .K13_C1_W3(32'hbd5fd08a), .K13_C1_W4(32'h3dfd68ac), .K13_C1_W5(32'h3d724242), .K13_C1_W6(32'hbbea65e2), .K13_C1_W7(32'h3e10dc1b), .K13_C1_W8(32'hbd415eaa), 
		.K13_C2_W0(32'h3deacfb8), .K13_C2_W1(32'h3c4bfb85), .K13_C2_W2(32'hbcfba686), .K13_C2_W3(32'h3c7a279e), .K13_C2_W4(32'h3d876c6a), .K13_C2_W5(32'hbdbf6172), .K13_C2_W6(32'hbce3b551), .K13_C2_W7(32'hbddad272), .K13_C2_W8(32'hbdede6c7), 
		.K13_C3_W0(32'h3d8f2ce6), .K13_C3_W1(32'h3c05b13a), .K13_C3_W2(32'hbcaf2f93), .K13_C3_W3(32'hbda06bad), .K13_C3_W4(32'hbbee0914), .K13_C3_W5(32'hbdbc7a7b), .K13_C3_W6(32'hbc17f769), .K13_C3_W7(32'hbdc90962), .K13_C3_W8(32'hbc9e04c5), 
		.K13_C4_W0(32'h3c2ed522), .K13_C4_W1(32'h3d42baec), .K13_C4_W2(32'hbe0de2d9), .K13_C4_W3(32'h3d313e17), .K13_C4_W4(32'h3ca1c2a3), .K13_C4_W5(32'h3c43be42), .K13_C4_W6(32'h3da5b426), .K13_C4_W7(32'hbcded19c), .K13_C4_W8(32'h3e0906ed), 
		.K13_C5_W0(32'h3ceb6efd), .K13_C5_W1(32'h3e0220a2), .K13_C5_W2(32'hbcaf6e43), .K13_C5_W3(32'h3d614021), .K13_C5_W4(32'h3e14f6bd), .K13_C5_W5(32'h3d66a832), .K13_C5_W6(32'hbe124770), .K13_C5_W7(32'hbe24d6c4), .K13_C5_W8(32'h3dc03471), 
		.K13_C6_W0(32'hbdf11571), .K13_C6_W1(32'hbda138ae), .K13_C6_W2(32'hbe34a1b2), .K13_C6_W3(32'h3d962718), .K13_C6_W4(32'h3dbc3713), .K13_C6_W5(32'hbd5e7f3a), .K13_C6_W6(32'h3db79881), .K13_C6_W7(32'h3dfae063), .K13_C6_W8(32'hbda20fd4), 
		.K13_C7_W0(32'h3dc4a88d), .K13_C7_W1(32'hbd7c02e4), .K13_C7_W2(32'hbc8833ec), .K13_C7_W3(32'hbdee3ef3), .K13_C7_W4(32'h3d85e7af), .K13_C7_W5(32'hbd3a7ab6), .K13_C7_W6(32'h3d0fcd00), .K13_C7_W7(32'hbd092d61), .K13_C7_W8(32'h3dd87fdc), 
		.K13_C8_W0(32'h3e03392c), .K13_C8_W1(32'hbd671b08), .K13_C8_W2(32'hbd1ff241), .K13_C8_W3(32'h3d9d3741), .K13_C8_W4(32'hbd1341c4), .K13_C8_W5(32'h3d9073f1), .K13_C8_W6(32'h3b50a42f), .K13_C8_W7(32'hbdb79b70), .K13_C8_W8(32'h3d917ab4), 
		.K13_C9_W0(32'hbcefef55), .K13_C9_W1(32'hbe1000fa), .K13_C9_W2(32'h3d62a7c9), .K13_C9_W3(32'h3d800d62), .K13_C9_W4(32'hbcb9aaa4), .K13_C9_W5(32'h3d7686e3), .K13_C9_W6(32'h3d18b418), .K13_C9_W7(32'hb9014546), .K13_C9_W8(32'hbe0e1943), 
		.K13_C10_W0(32'h3db1a0cb), .K13_C10_W1(32'h3d9d06c8), .K13_C10_W2(32'h3dc20826), .K13_C10_W3(32'hbd10e94a), .K13_C10_W4(32'h3da0a6b0), .K13_C10_W5(32'h3d17926e), .K13_C10_W6(32'hbde2a292), .K13_C10_W7(32'h3d2a5a3f), .K13_C10_W8(32'h3de7e1e3), 
		.K13_C11_W0(32'hbb6bcabc), .K13_C11_W1(32'h3bac7d41), .K13_C11_W2(32'hbdba89b7), .K13_C11_W3(32'hbdb511bd), .K13_C11_W4(32'h3cc6e50d), .K13_C11_W5(32'hbd1c5c37), .K13_C11_W6(32'h3dbae232), .K13_C11_W7(32'h3e100ecc), .K13_C11_W8(32'hb94586f6), 
		.K13_C12_W0(32'h3d80e3a2), .K13_C12_W1(32'h3bd7cbdb), .K13_C12_W2(32'h3dfcc9c3), .K13_C12_W3(32'hbde54fdb), .K13_C12_W4(32'h3dd28f85), .K13_C12_W5(32'hbc36808f), .K13_C12_W6(32'h3d827b7e), .K13_C12_W7(32'hbbdd04aa), .K13_C12_W8(32'hbdca0209), 
		.K13_C13_W0(32'hbe255c9b), .K13_C13_W1(32'hbd8316f4), .K13_C13_W2(32'hbd87b7d6), .K13_C13_W3(32'hbd74c72d), .K13_C13_W4(32'hbe0da369), .K13_C13_W5(32'hbe05b80f), .K13_C13_W6(32'hbcdd1247), .K13_C13_W7(32'h3cf66a93), .K13_C13_W8(32'hbd84275b), 
		.K13_C14_W0(32'h3d8d7e70), .K13_C14_W1(32'hbc42141e), .K13_C14_W2(32'hbd31c45a), .K13_C14_W3(32'hbd8687fb), .K13_C14_W4(32'h3dfdad67), .K13_C14_W5(32'h3dfa0ad8), .K13_C14_W6(32'hbe18a133), .K13_C14_W7(32'hbdbeb089), .K13_C14_W8(32'hbde5f475), 
		.K13_C15_W0(32'hbdc1ae2d), .K13_C15_W1(32'hbd41317f), .K13_C15_W2(32'hbc9a6ca4), .K13_C15_W3(32'h3e05dd77), .K13_C15_W4(32'hbe00714f), .K13_C15_W5(32'hbba302e9), .K13_C15_W6(32'hbc7fc407), .K13_C15_W7(32'hbd71afd5), .K13_C15_W8(32'hbdab4f64), 
		.K13_BIAS (32'hbae45909),

		.K14_C0_W0(32'hbe49a770), .K14_C0_W1(32'hbe56d20e), .K14_C0_W2(32'hbd47a636), .K14_C0_W3(32'hbe099aef), .K14_C0_W4(32'h3e03439d), .K14_C0_W5(32'h3cdc1b67), .K14_C0_W6(32'h3dca2ebf), .K14_C0_W7(32'hbc67e690), .K14_C0_W8(32'hbd28b482), 
		.K14_C1_W0(32'h3c32f82f), .K14_C1_W1(32'hbe075c33), .K14_C1_W2(32'h3ce77688), .K14_C1_W3(32'h3d71ab95), .K14_C1_W4(32'hbd759c01), .K14_C1_W5(32'h3da76123), .K14_C1_W6(32'hbdf06efe), .K14_C1_W7(32'hbd9cef8c), .K14_C1_W8(32'hbe0b86c3), 
		.K14_C2_W0(32'hbded1c3a), .K14_C2_W1(32'hbe0317aa), .K14_C2_W2(32'hbd03993a), .K14_C2_W3(32'h3dbdf47c), .K14_C2_W4(32'h3dc8b3f6), .K14_C2_W5(32'h3cfe3f04), .K14_C2_W6(32'hbd8e91a6), .K14_C2_W7(32'h3e326fb6), .K14_C2_W8(32'hbdbc158e), 
		.K14_C3_W0(32'hbd0e1bc0), .K14_C3_W1(32'hbe2c5967), .K14_C3_W2(32'hbde6099e), .K14_C3_W3(32'h3e2491c6), .K14_C3_W4(32'hbd88d17f), .K14_C3_W5(32'h3e0d8566), .K14_C3_W6(32'hbca899cb), .K14_C3_W7(32'h3dc3682e), .K14_C3_W8(32'h3d31c653), 
		.K14_C4_W0(32'h3dea660c), .K14_C4_W1(32'h3cd72ae8), .K14_C4_W2(32'hbd427ce2), .K14_C4_W3(32'h3dfc1242), .K14_C4_W4(32'hbd44425a), .K14_C4_W5(32'h3dc33222), .K14_C4_W6(32'h3dcdbb69), .K14_C4_W7(32'h3d8aa8b9), .K14_C4_W8(32'hbda73629), 
		.K14_C5_W0(32'h3c772d4a), .K14_C5_W1(32'hbdada2ad), .K14_C5_W2(32'h3d99205a), .K14_C5_W3(32'h3d7fc1d6), .K14_C5_W4(32'h3c6d2c3a), .K14_C5_W5(32'hbba4fd66), .K14_C5_W6(32'h3bbfca98), .K14_C5_W7(32'h3dd81c42), .K14_C5_W8(32'h3e0b1a89), 
		.K14_C6_W0(32'hbe5015a3), .K14_C6_W1(32'hbd57039d), .K14_C6_W2(32'hbe1a4429), .K14_C6_W3(32'hbdc6f814), .K14_C6_W4(32'hbd13601c), .K14_C6_W5(32'hbdb16dac), .K14_C6_W6(32'h3d361bf8), .K14_C6_W7(32'h3d426cf6), .K14_C6_W8(32'hbda43a52), 
		.K14_C7_W0(32'h3def9c3d), .K14_C7_W1(32'h3dc11b61), .K14_C7_W2(32'h3e1224dc), .K14_C7_W3(32'h3e053821), .K14_C7_W4(32'h3d3e7d3e), .K14_C7_W5(32'hbe02bd23), .K14_C7_W6(32'hbc80dd26), .K14_C7_W7(32'h3d414cc7), .K14_C7_W8(32'hbdbc20b4), 
		.K14_C8_W0(32'h3d1bd5f8), .K14_C8_W1(32'h3cb39f7a), .K14_C8_W2(32'h3d82670c), .K14_C8_W3(32'h3e20d86e), .K14_C8_W4(32'hbdefe239), .K14_C8_W5(32'h3d17df03), .K14_C8_W6(32'hbd8a65b3), .K14_C8_W7(32'h3d66ca0e), .K14_C8_W8(32'hbdba5436), 
		.K14_C9_W0(32'hbd910fd8), .K14_C9_W1(32'hbe59635b), .K14_C9_W2(32'hbe4066ac), .K14_C9_W3(32'hbd595a23), .K14_C9_W4(32'hbe03c0b9), .K14_C9_W5(32'hbdb16dc6), .K14_C9_W6(32'h3e113756), .K14_C9_W7(32'hbd550c5d), .K14_C9_W8(32'h3b9ec6d7), 
		.K14_C10_W0(32'hbd99fe20), .K14_C10_W1(32'hbe41acd2), .K14_C10_W2(32'hbe6183e2), .K14_C10_W3(32'hbdcce3b0), .K14_C10_W4(32'h3c2bac00), .K14_C10_W5(32'h3c12db20), .K14_C10_W6(32'h3dc961b5), .K14_C10_W7(32'h3cddeee2), .K14_C10_W8(32'h3d555b44), 
		.K14_C11_W0(32'h3d9c1094), .K14_C11_W1(32'h3d48f3bf), .K14_C11_W2(32'hbda80a7c), .K14_C11_W3(32'hbdb04318), .K14_C11_W4(32'hbe0bb972), .K14_C11_W5(32'h3e1e8808), .K14_C11_W6(32'h3e2aee4a), .K14_C11_W7(32'hbda0e340), .K14_C11_W8(32'hbdf7a520), 
		.K14_C12_W0(32'hbe24eed3), .K14_C12_W1(32'h3c964d45), .K14_C12_W2(32'hbdd52a95), .K14_C12_W3(32'h3df651b7), .K14_C12_W4(32'hbcde2a83), .K14_C12_W5(32'h3ba10a78), .K14_C12_W6(32'h3d2eb8d8), .K14_C12_W7(32'hbd532833), .K14_C12_W8(32'hbdb7add2), 
		.K14_C13_W0(32'hbe57611d), .K14_C13_W1(32'h3d40729b), .K14_C13_W2(32'h3dbe0f65), .K14_C13_W3(32'h3cd13f19), .K14_C13_W4(32'h3df685b3), .K14_C13_W5(32'h3b196d38), .K14_C13_W6(32'h3dc9f6a2), .K14_C13_W7(32'hbde42429), .K14_C13_W8(32'hbd91c2c4), 
		.K14_C14_W0(32'hbc19fe56), .K14_C14_W1(32'h3d89ba55), .K14_C14_W2(32'hbc9f5c46), .K14_C14_W3(32'h3e1989f6), .K14_C14_W4(32'h3dda60a9), .K14_C14_W5(32'hbcf4d451), .K14_C14_W6(32'h3dd98111), .K14_C14_W7(32'h3e0e586c), .K14_C14_W8(32'h3d812572), 
		.K14_C15_W0(32'hbd56452c), .K14_C15_W1(32'h3b09a5c3), .K14_C15_W2(32'hbe07f987), .K14_C15_W3(32'hbd0a8ed2), .K14_C15_W4(32'hbc3ff259), .K14_C15_W5(32'hbe203a50), .K14_C15_W6(32'h3d0a862e), .K14_C15_W7(32'hbdf4acf6), .K14_C15_W8(32'h3cfb5516), 
		.K14_BIAS (32'h3d1fe0d4),

		.K15_C0_W0(32'h3d4f9f70), .K15_C0_W1(32'hbc8cf594), .K15_C0_W2(32'hbdb198f7), .K15_C0_W3(32'h3cfdcc69), .K15_C0_W4(32'hbae1d974), .K15_C0_W5(32'h3cf65b7a), .K15_C0_W6(32'hbdc041a9), .K15_C0_W7(32'hbdb0c169), .K15_C0_W8(32'h3da34d18), 
		.K15_C1_W0(32'h3dddaa30), .K15_C1_W1(32'h3b499813), .K15_C1_W2(32'h3d1472ac), .K15_C1_W3(32'h3d671743), .K15_C1_W4(32'h3e02eb42), .K15_C1_W5(32'h3d0f0d36), .K15_C1_W6(32'h3d785ea2), .K15_C1_W7(32'hbd9446b8), .K15_C1_W8(32'hbe10efe3), 
		.K15_C2_W0(32'hbbf482e0), .K15_C2_W1(32'hbcf683d8), .K15_C2_W2(32'hbdfa0bb5), .K15_C2_W3(32'hbd12c622), .K15_C2_W4(32'hbdbec80b), .K15_C2_W5(32'hbe12c105), .K15_C2_W6(32'hbd8dc188), .K15_C2_W7(32'hbd863461), .K15_C2_W8(32'h3b80bcc7), 
		.K15_C3_W0(32'h3d768f70), .K15_C3_W1(32'h3d10d1de), .K15_C3_W2(32'hbe091347), .K15_C3_W3(32'hbe063158), .K15_C3_W4(32'hbd9eb260), .K15_C3_W5(32'hbc908545), .K15_C3_W6(32'h3d2a4a98), .K15_C3_W7(32'h3d836823), .K15_C3_W8(32'h3c789024), 
		.K15_C4_W0(32'h3d74ea00), .K15_C4_W1(32'hbcbc3bd0), .K15_C4_W2(32'h3df8835c), .K15_C4_W3(32'hbda6da11), .K15_C4_W4(32'h3c714a70), .K15_C4_W5(32'h3d0e014c), .K15_C4_W6(32'hbd11ce62), .K15_C4_W7(32'h3cd28653), .K15_C4_W8(32'hbda9efbd), 
		.K15_C5_W0(32'h3d9b8ee0), .K15_C5_W1(32'hbd042998), .K15_C5_W2(32'hbd3e54f8), .K15_C5_W3(32'h3dc94259), .K15_C5_W4(32'hbe1b0cd6), .K15_C5_W5(32'h3d31ff71), .K15_C5_W6(32'hbdb0de7f), .K15_C5_W7(32'hbd748f4f), .K15_C5_W8(32'hbdaa6514), 
		.K15_C6_W0(32'hbd24bdd0), .K15_C6_W1(32'hbe018682), .K15_C6_W2(32'h3d8d1f27), .K15_C6_W3(32'hbdda2a10), .K15_C6_W4(32'hbe16f304), .K15_C6_W5(32'hbd9d84d8), .K15_C6_W6(32'h3dfc8e66), .K15_C6_W7(32'h3d78f496), .K15_C6_W8(32'hbda2ffc1), 
		.K15_C7_W0(32'h3d709000), .K15_C7_W1(32'h3cee3bd0), .K15_C7_W2(32'hbd52b018), .K15_C7_W3(32'hbe036819), .K15_C7_W4(32'hbd0f4bd7), .K15_C7_W5(32'h3d6029a0), .K15_C7_W6(32'hbd9320b0), .K15_C7_W7(32'h3c1aaa6b), .K15_C7_W8(32'h3e0a7526), 
		.K15_C8_W0(32'hbda0044d), .K15_C8_W1(32'h3e04e7d9), .K15_C8_W2(32'h3c27b73d), .K15_C8_W3(32'h3cf96105), .K15_C8_W4(32'h3ca3858a), .K15_C8_W5(32'hbd88d396), .K15_C8_W6(32'hbe0f0ea7), .K15_C8_W7(32'hbdedeae2), .K15_C8_W8(32'hbdefd64d), 
		.K15_C9_W0(32'hbe0b4820), .K15_C9_W1(32'hbd3f5702), .K15_C9_W2(32'h3dcc349c), .K15_C9_W3(32'h3df06118), .K15_C9_W4(32'h3dd0144c), .K15_C9_W5(32'hbdb1e809), .K15_C9_W6(32'hbdd1e175), .K15_C9_W7(32'h3d836f8c), .K15_C9_W8(32'h3db6b6bc), 
		.K15_C10_W0(32'h3d8e659c), .K15_C10_W1(32'hbbe9fb24), .K15_C10_W2(32'hbdd0ae54), .K15_C10_W3(32'hbe03b141), .K15_C10_W4(32'h3d1b0841), .K15_C10_W5(32'hbe1e82e5), .K15_C10_W6(32'hbd288b91), .K15_C10_W7(32'h3cbcda7e), .K15_C10_W8(32'h3d9e2db8), 
		.K15_C11_W0(32'hbde4fe2e), .K15_C11_W1(32'hbe043010), .K15_C11_W2(32'h3d380d4f), .K15_C11_W3(32'hbe15b866), .K15_C11_W4(32'hbd53ff6c), .K15_C11_W5(32'hbd99c5a6), .K15_C11_W6(32'hbdb1f3e9), .K15_C11_W7(32'hbdf50b4b), .K15_C11_W8(32'hbac36ddc), 
		.K15_C12_W0(32'hbd944ce0), .K15_C12_W1(32'hbda1ad26), .K15_C12_W2(32'h3dca23e6), .K15_C12_W3(32'hbd20855d), .K15_C12_W4(32'h3dd31873), .K15_C12_W5(32'hbe1b5f67), .K15_C12_W6(32'hbdf16dba), .K15_C12_W7(32'hbdfea59f), .K15_C12_W8(32'hbe140374), 
		.K15_C13_W0(32'h3d1b56bc), .K15_C13_W1(32'h3d8b1c53), .K15_C13_W2(32'hbcec9ff6), .K15_C13_W3(32'hbc2d2460), .K15_C13_W4(32'hbdf25ff5), .K15_C13_W5(32'hbd886385), .K15_C13_W6(32'h3dc5f7ab), .K15_C13_W7(32'hbbac8a25), .K15_C13_W8(32'h3da5c629), 
		.K15_C14_W0(32'hbe00ffd9), .K15_C14_W1(32'h3d5c6fd5), .K15_C14_W2(32'h3abcdbb8), .K15_C14_W3(32'hbdc2c18a), .K15_C14_W4(32'h3dbdb011), .K15_C14_W5(32'hbd448675), .K15_C14_W6(32'hbd1444b4), .K15_C14_W7(32'hbdbaa19b), .K15_C14_W8(32'hbd6653f6), 
		.K15_C15_W0(32'hbb5e0400), .K15_C15_W1(32'hbe0a3df2), .K15_C15_W2(32'hbc48c270), .K15_C15_W3(32'hbd82080a), .K15_C15_W4(32'h3d1aace3), .K15_C15_W5(32'hbda02deb), .K15_C15_W6(32'h3ddc0965), .K15_C15_W7(32'hbdff5dd6), .K15_C15_W8(32'hbd2528d6), 
		.K15_BIAS (32'hbcaffc61)
		)
		block5_conv3(
		.clk(clk),
		.resetn(resetn),
		.data_valid_in(conv_valid_out_5_2),
		.data_in_0(relu_out_5_2[0]),
		.data_in_1(relu_out_5_2[1]),
		.data_in_2(relu_out_5_2[2]),
		.data_in_3(relu_out_5_2[3]),
		.data_in_4(relu_out_5_2[4]),
		.data_in_5(relu_out_5_2[5]),
		.data_in_6(relu_out_5_2[6]),
		.data_in_7(relu_out_5_2[7]),
		.data_in_8(relu_out_5_2[8]),
		.data_in_9(relu_out_5_2[9]),
		.data_in_10(relu_out_5_2[10]),
		.data_in_11(relu_out_5_2[11]),
		.data_in_12(relu_out_5_2[12]),
		.data_in_13(relu_out_5_2[13]),
		.data_in_14(relu_out_5_2[14]),
		.data_in_15(relu_out_5_2[15]),
		.data_out_conv_0(conv_out_5_3[0]),
		.data_out_conv_1(conv_out_5_3[1]),
		.data_out_conv_2(conv_out_5_3[2]),
		.data_out_conv_3(conv_out_5_3[3]),
		.data_out_conv_4(conv_out_5_3[4]),
		.data_out_conv_5(conv_out_5_3[5]),
		.data_out_conv_6(conv_out_5_3[6]),
		.data_out_conv_7(conv_out_5_3[7]),
		.data_out_conv_8(conv_out_5_3[8]),
		.data_out_conv_9(conv_out_5_3[9]),
		.data_out_conv_10(conv_out_5_3[10]),
		.data_out_conv_11(conv_out_5_3[11]),
		.data_out_conv_12(conv_out_5_3[12]),
		.data_out_conv_13(conv_out_5_3[13]),
		.data_out_conv_14(conv_out_5_3[14]),
		.data_out_conv_15(conv_out_5_3[15]),
		.valid_out_pixel(conv_valid_out_5_3),
		.done(done_conv_5_3)
		);



	generate
    for (i = 0; i < CHANNEL_OUT*2; i=i+1) 
    begin : relu_5_3 // needs CHANNEL_OUT*2 relu

        activate #(
            .DATA_WIDTH(32)
        )
        relu (
            .in(conv_out_5_3[i]),			// Edit here
            .out(relu_out_5_3[i])
        );
    end
    endgenerate


	generate
    for (i = 0; i < CHANNEL_OUT*2; i=i+1) 
    begin : max_pool_5 // needs CHANNEL_OUT*2 max_pooling		// Edit here - name

        max_pooling #(
            .DATA_WIDTH(32),
            .WIDTH(WIDTH/16),							// Edit here
            .HEIGHT(HEIGHT/16)							// Edit here
        )
        max_pool(
            .clk(clk),
			.ack(done_conv_5_3),					// Edit here
            .resetn(resetn),
            .valid_in(conv_valid_out_5_3),			// Edit here
            .data_in(relu_out_5_3[i]),
            .data_out(data_out_pool_5_3[i]),
            .valid_out(valid_out_pool_5_3[i]),
            .done(done_pool_5_3[i])
        );
    end
    endgenerate

	wire valid_out_fc;
	wire [DATA_WIDTH-1:0] data_out_fc;

	fully_connected_16 fc_16 (
		.clk(clk),
		.resetn(resetn),
		.valid_in(done_pool_5_3[0]),
		.data_in_0(data_out_pool_5_3[0]),
		.data_in_1(data_out_pool_5_3[1]),
		.data_in_2(data_out_pool_5_3[2]),
		.data_in_3(data_out_pool_5_3[3]),
		.data_in_4(data_out_pool_5_3[4]),
		.data_in_5(data_out_pool_5_3[5]),
		.data_in_6(data_out_pool_5_3[6]),
		.data_in_7(data_out_pool_5_3[7]),
		.data_in_8(data_out_pool_5_3[8]),
		.data_in_9(data_out_pool_5_3[9]),
		.data_in_10(data_out_pool_5_3[10]),
		.data_in_11(data_out_pool_5_3[11]),
		.data_in_12(data_out_pool_5_3[12]),
		.data_in_13(data_out_pool_5_3[13]),
		.data_in_14(data_out_pool_5_3[14]),
		.data_in_15(data_out_pool_5_3[15]),
		.data_out(data_out_fc),
		.valid_out(valid_out_fc)
	);


	// wire image_class;
	

	sigmoid sigmoid_activate(
    	.clk(clk),
    	.resetn(resetn),
    	.valid_in(valid_out_fc),
    	.x(data_out_fc),
		.f_x(data_out_sigmoid),
    	.image_class(image_class),
    	.valid_out(done_sigmoid)
    );


endmodule