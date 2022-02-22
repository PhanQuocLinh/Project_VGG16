`ifndef ACTIVATE_INCLUDED
    `include "activate.v"
    `define ACTIVATE_INCLUDED
`endif
`ifndef MAX_POOLING_INCLUDED
    `include "max_pooling.v"
    `define MAX_POOLING_INCLUDED
`endif

module block2_conv1 #(
    parameter DATA_WIDTH = 32,
    parameter WIDTH = 56,
    parameter HEIGHT = 56,
    parameter CHANNEL_OUT = 8
    ) 
    (
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
	output	[DATA_WIDTH-1:0]	data_out_0,
	output	[DATA_WIDTH-1:0]	data_out_1,
	output	[DATA_WIDTH-1:0]	data_out_2,
	output	[DATA_WIDTH-1:0]	data_out_3,
	output	[DATA_WIDTH-1:0]	data_out_4,
	output	[DATA_WIDTH-1:0]	data_out_5,
	output	[DATA_WIDTH-1:0]	data_out_6,
	output	[DATA_WIDTH-1:0]	data_out_7,
	output	valid_out,
	output	done
    );
    // testbench cho mach conv3d_8kernel_3channel
    wire [DATA_WIDTH-1:0] conv_out  [0: CHANNEL_OUT -1];    
    wire conv_valid_out;
    wire done_conv;

    assign valid_out = conv_valid_out;
    assign done = done_conv;

    // gan output cho block1_conv1-relu-maxpool
    // wire [DATA_WIDTH-1:0] relu_out  [0: CHANNEL_OUT -1];
    // wire [DATA_WIDTH-1:0] data_out_pool [0: CHANNEL_OUT -1];
    // wire [CHANNEL_OUT -1 : 0] valid_out_pool;
    // wire [CHANNEL_OUT -1 : 0] done_pool;


    // assign data_out_0 = data_out_pool[0];
    // assign data_out_1 = data_out_pool[1];
    // assign data_out_2 = data_out_pool[2];
    // assign data_out_3 = data_out_pool[3];
    // assign data_out_4 = data_out_pool[4];
    // assign data_out_5 = data_out_pool[5];
    // assign data_out_6 = data_out_pool[6];
    // assign data_out_7 = data_out_pool[7];

    // assign valid_out = valid_out_pool[CHANNEL_OUT -1];
    // assign done = done_pool[CHANNEL_OUT -1];


    // gan output cho block1_conv1

    
	assign data_out_0 = conv_out[0];
	assign data_out_1 = conv_out[1];
	assign data_out_2 = conv_out[2];
	assign data_out_3 = conv_out[3];
	assign data_out_4 = conv_out[4];
	assign data_out_5 = conv_out[5];
	assign data_out_6 = conv_out[6];
	assign data_out_7 = conv_out[7];

	conv3d_8_kernel_8_channel_size_3 #(
		.DATA_WIDTH(32),.IMG_WIDTH(WIDTH),.IMG_HEIGHT(HEIGHT),
		.K0_C0_W0(32'hbe0af8ac), .K0_C0_W1(32'hbdafd1c5), .K0_C0_W2(32'h3e0928f7), .K0_C0_W3(32'h3d899783), .K0_C0_W4(32'hbe4b9c5c), .K0_C0_W5(32'hbe5e0af4), .K0_C0_W6(32'hbe09b2c9), .K0_C0_W7(32'hbe67cdf3), .K0_C0_W8(32'h3daada5d), 
		.K0_C1_W0(32'hbbd1511b), .K0_C1_W1(32'h3e3b963b), .K0_C1_W2(32'h3d97dce4), .K0_C1_W3(32'h3e4ebc5e), .K0_C1_W4(32'h3da3e058), .K0_C1_W5(32'h3db1223d), .K0_C1_W6(32'h3e3c5a8f), .K0_C1_W7(32'h3d20b438), .K0_C1_W8(32'hbd273373), 
		.K0_C2_W0(32'h3e1987e5), .K0_C2_W1(32'hbce8660e), .K0_C2_W2(32'h3c94c31f), .K0_C2_W3(32'hbd1a9219), .K0_C2_W4(32'h3e37bb6b), .K0_C2_W5(32'hbdf2d082), .K0_C2_W6(32'h3d0c9cad), .K0_C2_W7(32'h3d205be3), .K0_C2_W8(32'hbd3f4adf), 
		.K0_C3_W0(32'hbe54fa8f), .K0_C3_W1(32'hbe5d84ff), .K0_C3_W2(32'hbe5552cf), .K0_C3_W3(32'h3dcea217), .K0_C3_W4(32'hbe271686), .K0_C3_W5(32'hbdece868), .K0_C3_W6(32'h3e2a06ff), .K0_C3_W7(32'h3d9a74f2), .K0_C3_W8(32'h3db574a2), 
		.K0_C4_W0(32'hbd349f99), .K0_C4_W1(32'hbdbba2d7), .K0_C4_W2(32'h3de829d2), .K0_C4_W3(32'hbd00b6ea), .K0_C4_W4(32'h3d72ed9c), .K0_C4_W5(32'hbe4c7193), .K0_C4_W6(32'hbe1214cd), .K0_C4_W7(32'hbdba698a), .K0_C4_W8(32'hbde4be4c), 
		.K0_C5_W0(32'hbdd04585), .K0_C5_W1(32'hbe474cb6), .K0_C5_W2(32'h3e47f2fd), .K0_C5_W3(32'h3e46688e), .K0_C5_W4(32'hbe221187), .K0_C5_W5(32'hbd865fd1), .K0_C5_W6(32'h3e3ef28e), .K0_C5_W7(32'h3e4270a1), .K0_C5_W8(32'h3d419aa9), 
		.K0_C6_W0(32'hbc1726d2), .K0_C6_W1(32'h3dfb3fbe), .K0_C6_W2(32'hbdd1156c), .K0_C6_W3(32'hbc05463d), .K0_C6_W4(32'hbd7ba021), .K0_C6_W5(32'hbbef62de), .K0_C6_W6(32'h3d82676d), .K0_C6_W7(32'hbe4cec1a), .K0_C6_W8(32'hbe3d7fbe), 
		.K0_C7_W0(32'h3ccd9c15), .K0_C7_W1(32'hbe24f83c), .K0_C7_W2(32'h3e027359), .K0_C7_W3(32'h3e2d277c), .K0_C7_W4(32'hbd83bf08), .K0_C7_W5(32'hbd9d94bc), .K0_C7_W6(32'hbc13dc39), .K0_C7_W7(32'h3d243579), .K0_C7_W8(32'hbe0f5aa7), 
		.K0_BIAS (32'hbc6b7a74),

		.K1_C0_W0(32'h3e1a10f3), .K1_C0_W1(32'h3d061187), .K1_C0_W2(32'h3cb7323d), .K1_C0_W3(32'hbe23fa7f), .K1_C0_W4(32'h3e28207f), .K1_C0_W5(32'h3c6f8b14), .K1_C0_W6(32'hbc0c9460), .K1_C0_W7(32'hbd13293f), .K1_C0_W8(32'h3e26fdae), 
		.K1_C1_W0(32'h3e4db4bf), .K1_C1_W1(32'hbd44415a), .K1_C1_W2(32'h3e188d4c), .K1_C1_W3(32'hbe199a27), .K1_C1_W4(32'hbd2ad478), .K1_C1_W5(32'hbbe345e9), .K1_C1_W6(32'hbdbde4e3), .K1_C1_W7(32'h3e40f094), .K1_C1_W8(32'h3d7424dd), 
		.K1_C2_W0(32'h3e348b6b), .K1_C2_W1(32'hbdfe4efb), .K1_C2_W2(32'hbdc22482), .K1_C2_W3(32'hbb6814bd), .K1_C2_W4(32'hbe016e54), .K1_C2_W5(32'h3db8070e), .K1_C2_W6(32'h3e46ac3f), .K1_C2_W7(32'h3e169dde), .K1_C2_W8(32'hbe154a44), 
		.K1_C3_W0(32'hbe21da78), .K1_C3_W1(32'h3e27db6e), .K1_C3_W2(32'h3d9d196d), .K1_C3_W3(32'hbd8e59e5), .K1_C3_W4(32'hbdc5ec05), .K1_C3_W5(32'h3de0909b), .K1_C3_W6(32'h3d0ea0a9), .K1_C3_W7(32'h3e826de2), .K1_C3_W8(32'h3d100851), 
		.K1_C4_W0(32'hba59e265), .K1_C4_W1(32'hbd2535c3), .K1_C4_W2(32'h3c816eea), .K1_C4_W3(32'h3c879afc), .K1_C4_W4(32'hbdd4bd82), .K1_C4_W5(32'hbe27612c), .K1_C4_W6(32'h3e03a722), .K1_C4_W7(32'h3de4558d), .K1_C4_W8(32'hbbd1544f), 
		.K1_C5_W0(32'hbe4d7270), .K1_C5_W1(32'h3e1efa51), .K1_C5_W2(32'hbe56d863), .K1_C5_W3(32'h3e464ed4), .K1_C5_W4(32'hbe46f58b), .K1_C5_W5(32'h3e2d2d55), .K1_C5_W6(32'h3e3c8751), .K1_C5_W7(32'hbcf58d98), .K1_C5_W8(32'hbbce33bd), 
		.K1_C6_W0(32'hbdd85eb2), .K1_C6_W1(32'h3e0143dc), .K1_C6_W2(32'hbcc1135f), .K1_C6_W3(32'h3d396bfb), .K1_C6_W4(32'h3daea43b), .K1_C6_W5(32'hbdd72992), .K1_C6_W6(32'h3e326775), .K1_C6_W7(32'h3d9d3d9d), .K1_C6_W8(32'h3e07eba0), 
		.K1_C7_W0(32'h3bf8bae5), .K1_C7_W1(32'hbc9544b7), .K1_C7_W2(32'h3e69d9c8), .K1_C7_W3(32'hbbffde01), .K1_C7_W4(32'h3e4be0c7), .K1_C7_W5(32'h3dc03a8d), .K1_C7_W6(32'h3e62ca95), .K1_C7_W7(32'hbdfeb22d), .K1_C7_W8(32'h3e711317), 
		.K1_BIAS (32'h3c58294c),

		.K2_C0_W0(32'hbbc9df53), .K2_C0_W1(32'h3dedece2), .K2_C0_W2(32'h3e386762), .K2_C0_W3(32'h3d1af585), .K2_C0_W4(32'hbd5ac8ef), .K2_C0_W5(32'hbe4a9019), .K2_C0_W6(32'h3de2cbec), .K2_C0_W7(32'hbd7d610e), .K2_C0_W8(32'h3e27bef9), 
		.K2_C1_W0(32'hbb224c5f), .K2_C1_W1(32'hbe1eb370), .K2_C1_W2(32'h3d29a4ea), .K2_C1_W3(32'hbd1f6d08), .K2_C1_W4(32'h3d844145), .K2_C1_W5(32'hbe0a3805), .K2_C1_W6(32'h3d4022d5), .K2_C1_W7(32'hbbcc6fee), .K2_C1_W8(32'h3c12a15d), 
		.K2_C2_W0(32'hbd4f9584), .K2_C2_W1(32'h3e3a297a), .K2_C2_W2(32'h3d82d815), .K2_C2_W3(32'hbbd6395a), .K2_C2_W4(32'hbe178cb6), .K2_C2_W5(32'h3ddebcff), .K2_C2_W6(32'h3d226d3f), .K2_C2_W7(32'hbe45ffb1), .K2_C2_W8(32'hbda8b3d3), 
		.K2_C3_W0(32'h3de11a51), .K2_C3_W1(32'hbcdf521e), .K2_C3_W2(32'hbe49c352), .K2_C3_W3(32'hbe22009f), .K2_C3_W4(32'hbde41db8), .K2_C3_W5(32'h3e45802c), .K2_C3_W6(32'h3e60d5ea), .K2_C3_W7(32'h3c7f2a5e), .K2_C3_W8(32'hbd37b96f), 
		.K2_C4_W0(32'h3dde212b), .K2_C4_W1(32'hbe2d1cb4), .K2_C4_W2(32'hbe098ff1), .K2_C4_W3(32'h3d392e75), .K2_C4_W4(32'hbe1547da), .K2_C4_W5(32'h3d872e71), .K2_C4_W6(32'hbdcb9edc), .K2_C4_W7(32'hbe2cbbe5), .K2_C4_W8(32'hbdc5c84c), 
		.K2_C5_W0(32'h3e22e460), .K2_C5_W1(32'h3e65c39d), .K2_C5_W2(32'hbe09653f), .K2_C5_W3(32'hbd6a3da4), .K2_C5_W4(32'h3e0732da), .K2_C5_W5(32'h3d59e950), .K2_C5_W6(32'h3df287bc), .K2_C5_W7(32'hbe01e938), .K2_C5_W8(32'hbe01b00f), 
		.K2_C6_W0(32'h3e38eadc), .K2_C6_W1(32'h3e24541c), .K2_C6_W2(32'hbe085a6a), .K2_C6_W3(32'hbd51d14b), .K2_C6_W4(32'h3e099368), .K2_C6_W5(32'h3d6b1e48), .K2_C6_W6(32'h3e13f437), .K2_C6_W7(32'hbd862c84), .K2_C6_W8(32'hbc449a5c), 
		.K2_C7_W0(32'h3e45f69a), .K2_C7_W1(32'hbd8c915c), .K2_C7_W2(32'h3dc53498), .K2_C7_W3(32'hbe2bc14e), .K2_C7_W4(32'h3bd59392), .K2_C7_W5(32'hbd809fa8), .K2_C7_W6(32'h3db0d2b7), .K2_C7_W7(32'h3d2ede18), .K2_C7_W8(32'hbe4bc317), 
		.K2_BIAS (32'hbc84f60f),

		.K3_C0_W0(32'hbe2929c5), .K3_C0_W1(32'h3ddbc0f0), .K3_C0_W2(32'h3dabd18b), .K3_C0_W3(32'h3e024df0), .K3_C0_W4(32'h3d98f09d), .K3_C0_W5(32'hbe10b6ce), .K3_C0_W6(32'h3ddea1bf), .K3_C0_W7(32'h3d997170), .K3_C0_W8(32'h3d49bd9a), 
		.K3_C1_W0(32'h3cad1997), .K3_C1_W1(32'h3e253918), .K3_C1_W2(32'hbdef4e98), .K3_C1_W3(32'hbe202b4f), .K3_C1_W4(32'h3d99bc99), .K3_C1_W5(32'h3d4673cc), .K3_C1_W6(32'hbe257054), .K3_C1_W7(32'h3d96600d), .K3_C1_W8(32'h3d204e2d), 
		.K3_C2_W0(32'hbe42de4f), .K3_C2_W1(32'hbdfdf98e), .K3_C2_W2(32'h3dd59b92), .K3_C2_W3(32'hbe551625), .K3_C2_W4(32'h3e2c545d), .K3_C2_W5(32'h3e0e310f), .K3_C2_W6(32'hbe532cee), .K3_C2_W7(32'hbdf7219b), .K3_C2_W8(32'hbdb7ffca), 
		.K3_C3_W0(32'hbe4a77cc), .K3_C3_W1(32'hbc967140), .K3_C3_W2(32'hbd74a05c), .K3_C3_W3(32'hbd22b34f), .K3_C3_W4(32'hbbff3d50), .K3_C3_W5(32'h3e21144f), .K3_C3_W6(32'hbda8a71e), .K3_C3_W7(32'h3dcbed93), .K3_C3_W8(32'h3da78b78), 
		.K3_C4_W0(32'hbe431d17), .K3_C4_W1(32'hbdd91d0f), .K3_C4_W2(32'h3e23b6e1), .K3_C4_W3(32'h3b8a5718), .K3_C4_W4(32'hbdf2a210), .K3_C4_W5(32'h3ce1c8d6), .K3_C4_W6(32'h3d239bda), .K3_C4_W7(32'hbe43034b), .K3_C4_W8(32'h3def102a), 
		.K3_C5_W0(32'h3e5ea7ba), .K3_C5_W1(32'h3e3b3e9f), .K3_C5_W2(32'hbe151d52), .K3_C5_W3(32'h3e3ae34b), .K3_C5_W4(32'h3e1fc29e), .K3_C5_W5(32'h3d8364e4), .K3_C5_W6(32'hbe32c25a), .K3_C5_W7(32'h3d2ac439), .K3_C5_W8(32'h3db297e0), 
		.K3_C6_W0(32'h3dd1b9e0), .K3_C6_W1(32'h3d4b4db7), .K3_C6_W2(32'hbe1aa83f), .K3_C6_W3(32'h3e2a9f6c), .K3_C6_W4(32'h3df9a428), .K3_C6_W5(32'h3aa9e58c), .K3_C6_W6(32'h3e067d81), .K3_C6_W7(32'h3c9402e9), .K3_C6_W8(32'hbbb954ba), 
		.K3_C7_W0(32'hbe0465b0), .K3_C7_W1(32'hbce853ef), .K3_C7_W2(32'hbdb9adc2), .K3_C7_W3(32'h3da5b0c4), .K3_C7_W4(32'hbdc07ffe), .K3_C7_W5(32'h3d854944), .K3_C7_W6(32'h3de439f3), .K3_C7_W7(32'hbda18c62), .K3_C7_W8(32'h3e1cc57d), 
		.K3_BIAS (32'hbcbd6d30),

		.K4_C0_W0(32'h3d83eb8d), .K4_C0_W1(32'hbde1b0e9), .K4_C0_W2(32'h3e254b91), .K4_C0_W3(32'h3e05078b), .K4_C0_W4(32'hbda43feb), .K4_C0_W5(32'h3e341da4), .K4_C0_W6(32'h3d5bac72), .K4_C0_W7(32'hbd5ada8c), .K4_C0_W8(32'hbd9ef920), 
		.K4_C1_W0(32'h3d9399f9), .K4_C1_W1(32'hbe31840f), .K4_C1_W2(32'hbdc083f4), .K4_C1_W3(32'hbda3cd4a), .K4_C1_W4(32'hbdf46771), .K4_C1_W5(32'hbe3bc9ba), .K4_C1_W6(32'hbd724324), .K4_C1_W7(32'h3ca84b1c), .K4_C1_W8(32'h3e57f9c2), 
		.K4_C2_W0(32'hbe4f6a7b), .K4_C2_W1(32'h3cea037c), .K4_C2_W2(32'hbd5f5360), .K4_C2_W3(32'hbdaa3b4a), .K4_C2_W4(32'hbdda108e), .K4_C2_W5(32'hbccbd8cf), .K4_C2_W6(32'h3e0d069a), .K4_C2_W7(32'hbe0f5b57), .K4_C2_W8(32'hbc408006), 
		.K4_C3_W0(32'h3d6a56e1), .K4_C3_W1(32'hbd163667), .K4_C3_W2(32'hbdec1c29), .K4_C3_W3(32'hbe66f3b1), .K4_C3_W4(32'hbdf9886f), .K4_C3_W5(32'hbd60470f), .K4_C3_W6(32'hbe3b4812), .K4_C3_W7(32'h3afe0446), .K4_C3_W8(32'h3df43cae), 
		.K4_C4_W0(32'h3c9aab15), .K4_C4_W1(32'h3d377ddf), .K4_C4_W2(32'h3cd44835), .K4_C4_W3(32'hbe0285d9), .K4_C4_W4(32'hbe2387bd), .K4_C4_W5(32'h3e2dd9fb), .K4_C4_W6(32'hbdd620c2), .K4_C4_W7(32'hbe11ca5c), .K4_C4_W8(32'hbe265e4e), 
		.K4_C5_W0(32'hbe0fd7ef), .K4_C5_W1(32'h3d27c96a), .K4_C5_W2(32'h3ca4a13b), .K4_C5_W3(32'hbe371732), .K4_C5_W4(32'hbdcc0072), .K4_C5_W5(32'hbd13f4f2), .K4_C5_W6(32'hbdd94e4f), .K4_C5_W7(32'hbd9f0b62), .K4_C5_W8(32'h3dbc49ef), 
		.K4_C6_W0(32'h3e0fb44b), .K4_C6_W1(32'h3e0c83be), .K4_C6_W2(32'h3e40ff3d), .K4_C6_W3(32'h3dd750e9), .K4_C6_W4(32'hbcb98a93), .K4_C6_W5(32'h3c1fb349), .K4_C6_W6(32'h3b1281fe), .K4_C6_W7(32'h3c4495ee), .K4_C6_W8(32'h3e32a818), 
		.K4_C7_W0(32'h3d59c485), .K4_C7_W1(32'hbb080e7a), .K4_C7_W2(32'h3d8cf352), .K4_C7_W3(32'h3cfdd80a), .K4_C7_W4(32'hbe1ed66e), .K4_C7_W5(32'h3d7c50ae), .K4_C7_W6(32'hbe7872f1), .K4_C7_W7(32'hbe3fff96), .K4_C7_W8(32'hbe14330d), 
		.K4_BIAS (32'h3c81ccd3),

		.K5_C0_W0(32'h3dd0439c), .K5_C0_W1(32'hbe187f75), .K5_C0_W2(32'hbe48c164), .K5_C0_W3(32'h3e081a8c), .K5_C0_W4(32'hbd22c4c8), .K5_C0_W5(32'hbc88b328), .K5_C0_W6(32'h3c91375d), .K5_C0_W7(32'h3dce924f), .K5_C0_W8(32'h3dc0b59e), 
		.K5_C1_W0(32'hbe4793fc), .K5_C1_W1(32'hbe4818f4), .K5_C1_W2(32'hbe210d1c), .K5_C1_W3(32'hbe1e4849), .K5_C1_W4(32'hbe432341), .K5_C1_W5(32'hbe6a95dd), .K5_C1_W6(32'h3d4895ef), .K5_C1_W7(32'hbe10bd3a), .K5_C1_W8(32'hbe46a8b0), 
		.K5_C2_W0(32'h3d339158), .K5_C2_W1(32'h3dc20d8e), .K5_C2_W2(32'hbe0ccdac), .K5_C2_W3(32'h3db70932), .K5_C2_W4(32'hbe3a2d21), .K5_C2_W5(32'h3cd29dbd), .K5_C2_W6(32'hbddaf060), .K5_C2_W7(32'h3dc50084), .K5_C2_W8(32'hbe39aa6c), 
		.K5_C3_W0(32'hbe2a5af7), .K5_C3_W1(32'hbdfc1c76), .K5_C3_W2(32'hbe197c34), .K5_C3_W3(32'hbdde910f), .K5_C3_W4(32'h3e734411), .K5_C3_W5(32'h3e0144e7), .K5_C3_W6(32'hbe2c222a), .K5_C3_W7(32'h3e0b0417), .K5_C3_W8(32'h3e62e365), 
		.K5_C4_W0(32'hbd8ddb3f), .K5_C4_W1(32'h3d71128f), .K5_C4_W2(32'h3e005688), .K5_C4_W3(32'h3be9abdb), .K5_C4_W4(32'h3e389045), .K5_C4_W5(32'hbe026026), .K5_C4_W6(32'hbe25e79f), .K5_C4_W7(32'h3e14329d), .K5_C4_W8(32'h3e4dbec9), 
		.K5_C5_W0(32'hbe478e7f), .K5_C5_W1(32'h3dfafbb0), .K5_C5_W2(32'hbdf441a4), .K5_C5_W3(32'h3d7b4d4d), .K5_C5_W4(32'h3e4cdb69), .K5_C5_W5(32'h3e5c980e), .K5_C5_W6(32'hbe35c71c), .K5_C5_W7(32'h3cbb8bcc), .K5_C5_W8(32'hbdd1986d), 
		.K5_C6_W0(32'hbe420a5a), .K5_C6_W1(32'hbe138a32), .K5_C6_W2(32'hbd8be3f5), .K5_C6_W3(32'hbd8d3151), .K5_C6_W4(32'h3e5da554), .K5_C6_W5(32'h3e2def19), .K5_C6_W6(32'h3d9ca399), .K5_C6_W7(32'h3e33209d), .K5_C6_W8(32'h3e5a43c7), 
		.K5_C7_W0(32'h3d1b7edd), .K5_C7_W1(32'h3d44f4c2), .K5_C7_W2(32'hbb9a16be), .K5_C7_W3(32'h3e6c6d2e), .K5_C7_W4(32'h3e30a968), .K5_C7_W5(32'h3e58174a), .K5_C7_W6(32'h3d343ca5), .K5_C7_W7(32'h3d267e85), .K5_C7_W8(32'h3e48790e), 
		.K5_BIAS (32'hbc83dcb9),

		.K6_C0_W0(32'hbde3ed44), .K6_C0_W1(32'h3dad7ed9), .K6_C0_W2(32'h3c9643f3), .K6_C0_W3(32'h3da83b59), .K6_C0_W4(32'hbe164c39), .K6_C0_W5(32'h3b1b532f), .K6_C0_W6(32'hbe17476a), .K6_C0_W7(32'h3d6b54d2), .K6_C0_W8(32'h3de67d39), 
		.K6_C1_W0(32'hbe48ec64), .K6_C1_W1(32'hbe67efa1), .K6_C1_W2(32'h3db29537), .K6_C1_W3(32'hbdccd674), .K6_C1_W4(32'h3b8b0f63), .K6_C1_W5(32'h3e36ebff), .K6_C1_W6(32'h3dd1365b), .K6_C1_W7(32'hbd9e0a24), .K6_C1_W8(32'h3d1edd19), 
		.K6_C2_W0(32'h3d208798), .K6_C2_W1(32'h3d57dedc), .K6_C2_W2(32'hbe0d9d0b), .K6_C2_W3(32'hbde04a57), .K6_C2_W4(32'hbe353d8f), .K6_C2_W5(32'h3e4d6e09), .K6_C2_W6(32'hbc8a1678), .K6_C2_W7(32'hbccee273), .K6_C2_W8(32'h3d974b55), 
		.K6_C3_W0(32'hbda32d7f), .K6_C3_W1(32'hbc677c8b), .K6_C3_W2(32'h3cd4bfd7), .K6_C3_W3(32'h3e10e570), .K6_C3_W4(32'h3beaa6ad), .K6_C3_W5(32'hbd70696f), .K6_C3_W6(32'hbe55f508), .K6_C3_W7(32'h3c11c584), .K6_C3_W8(32'h3dccfde9), 
		.K6_C4_W0(32'h3951b005), .K6_C4_W1(32'hbde02b33), .K6_C4_W2(32'h3e5eaf33), .K6_C4_W3(32'hbd952bac), .K6_C4_W4(32'hbd27a078), .K6_C4_W5(32'h3e4a264d), .K6_C4_W6(32'h3de03655), .K6_C4_W7(32'h3bfc3b8d), .K6_C4_W8(32'h3cfa53f1), 
		.K6_C5_W0(32'hbd0e3c94), .K6_C5_W1(32'hbd02d18e), .K6_C5_W2(32'h3d94900e), .K6_C5_W3(32'hbbd91c05), .K6_C5_W4(32'hbd05c2e8), .K6_C5_W5(32'hbc3f2089), .K6_C5_W6(32'hbe00feba), .K6_C5_W7(32'hbe44771a), .K6_C5_W8(32'hbd32ecd0), 
		.K6_C6_W0(32'hbd877abb), .K6_C6_W1(32'hbd0411f1), .K6_C6_W2(32'h3df65c4c), .K6_C6_W3(32'h3d4c9286), .K6_C6_W4(32'h3aa56479), .K6_C6_W5(32'hbd88f76b), .K6_C6_W6(32'hbe325fb7), .K6_C6_W7(32'h3e342eaa), .K6_C6_W8(32'h3c6df533), 
		.K6_C7_W0(32'hbdb75184), .K6_C7_W1(32'h3df0868b), .K6_C7_W2(32'hbe1547c9), .K6_C7_W3(32'hbe125c48), .K6_C7_W4(32'h3e19d7c7), .K6_C7_W5(32'hbdb66927), .K6_C7_W6(32'hbddcef69), .K6_C7_W7(32'hbcee8a76), .K6_C7_W8(32'hbe63f4a6), 
		.K6_BIAS (32'h3c841271),

		.K7_C0_W0(32'hbcfa8237), .K7_C0_W1(32'h3d9f8872), .K7_C0_W2(32'hbc58bf09), .K7_C0_W3(32'hbd9b1884), .K7_C0_W4(32'hbdfb0002), .K7_C0_W5(32'h3d924611), .K7_C0_W6(32'h3d98c1b2), .K7_C0_W7(32'h3e4ffe8b), .K7_C0_W8(32'h3d472f42), 
		.K7_C1_W0(32'h3dfa49a8), .K7_C1_W1(32'hbe535b9f), .K7_C1_W2(32'h3de6b6a6), .K7_C1_W3(32'hbc28b96c), .K7_C1_W4(32'h3dd770b5), .K7_C1_W5(32'hbd434a8a), .K7_C1_W6(32'hbe3cf96a), .K7_C1_W7(32'hbe2a9fa0), .K7_C1_W8(32'hbd97e607), 
		.K7_C2_W0(32'hbe19985f), .K7_C2_W1(32'h3d1e8c94), .K7_C2_W2(32'h3d4255ab), .K7_C2_W3(32'h3d9e2fdf), .K7_C2_W4(32'h3d53cacd), .K7_C2_W5(32'h3da3f0dc), .K7_C2_W6(32'h3e4eb3ec), .K7_C2_W7(32'hbb37f96e), .K7_C2_W8(32'h3cb6dc04), 
		.K7_C3_W0(32'hbe2f78b8), .K7_C3_W1(32'h3e18868d), .K7_C3_W2(32'hbdd8b45d), .K7_C3_W3(32'hbe81c5a3), .K7_C3_W4(32'hbe6dab40), .K7_C3_W5(32'hbd9666b0), .K7_C3_W6(32'hbe19f062), .K7_C3_W7(32'hbd3bf591), .K7_C3_W8(32'hbb82bdb8), 
		.K7_C4_W0(32'hbc99326c), .K7_C4_W1(32'h3d463c4c), .K7_C4_W2(32'h3dacfd48), .K7_C4_W3(32'h3df75f16), .K7_C4_W4(32'hbe1034b8), .K7_C4_W5(32'hbc286b03), .K7_C4_W6(32'h3d86496a), .K7_C4_W7(32'h3d6f3244), .K7_C4_W8(32'h3d8e57bd), 
		.K7_C5_W0(32'hbe193da9), .K7_C5_W1(32'h3dbebfd9), .K7_C5_W2(32'h3e146422), .K7_C5_W3(32'hbe2d0f89), .K7_C5_W4(32'hbd0eef93), .K7_C5_W5(32'hbde0d877), .K7_C5_W6(32'hbe25c555), .K7_C5_W7(32'h3dc97bcb), .K7_C5_W8(32'h3d85fa20), 
		.K7_C6_W0(32'hbdd81657), .K7_C6_W1(32'hbaba11f9), .K7_C6_W2(32'hbdbda5fd), .K7_C6_W3(32'hbe3b026b), .K7_C6_W4(32'hbd07543c), .K7_C6_W5(32'hbcd3b62e), .K7_C6_W6(32'h3e11964d), .K7_C6_W7(32'hbd0662b3), .K7_C6_W8(32'hbd98519c), 
		.K7_C7_W0(32'hbe4b9d3a), .K7_C7_W1(32'hbe0e1565), .K7_C7_W2(32'h3e1d10fb), .K7_C7_W3(32'h3d11e11d), .K7_C7_W4(32'hbe6c5562), .K7_C7_W5(32'h3b734691), .K7_C7_W6(32'hbe0c0288), .K7_C7_W7(32'h3dfdf592), .K7_C7_W8(32'hbe35e5a9), 
		.K7_BIAS (32'h3cdf7df0)
		)
		block2_conv1(
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
		.data_out_conv_0(conv_out[0]),
		.data_out_conv_1(conv_out[1]),
		.data_out_conv_2(conv_out[2]),
		.data_out_conv_3(conv_out[3]),
		.data_out_conv_4(conv_out[4]),
		.data_out_conv_5(conv_out[5]),
		.data_out_conv_6(conv_out[6]),
		.data_out_conv_7(conv_out[7]),
		.valid_out_pixel(conv_valid_out),
		.done(done_conv)
		);

    // genvar i;

    // generate
    // for (i = 0; i < CHANNEL_OUT; i=i+1) 
    // begin :initial_relu_and_max_pool // needs CHANNEL_OUT relu
    //     // FP_Top_AddSub fp_adders(clk,resetn,valid_in_add[i],op_1[i],op_2[i],output_add[i],valid_out_add[i]);

    //     activate #(
    //         .DATA_WIDTH(32)
    //     )
    //     relu (
    //         .in(conv_out[i]),
    //         .out(relu_out[i])
    //     );

    //     max_pooling #(
    //         .DATA_WIDTH(32),
    //         .WIDTH(WIDTH),
    //         .HEIGHT(HEIGHT)
    //     )
    //     max_pool(
    //         .clk(clk),
    //         .resetn(resetn),
    //         .valid_in(conv_valid_out),
    //         .data_in(relu_out[i]),
    //         .data_out(data_out_pool[i]),
    //         .valid_out(valid_out_pool[i]),
    //         .done(done_pool[i])
    //     );
    // end
    // endgenerate

endmodule