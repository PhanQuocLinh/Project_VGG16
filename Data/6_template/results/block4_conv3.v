`ifndef ACTIVATE_INCLUDED
    `include "activate.v"
    `define ACTIVATE_INCLUDED
`endif
`ifndef MAX_POOLING_INCLUDED
    `include "max_pooling.v"
    `define MAX_POOLING_INCLUDED
`endif

module block4_conv3 #(
    parameter DATA_WIDTH = 32,
    parameter WIDTH = 56,
    parameter HEIGHT = 56,
    parameter CHANNEL_OUT = 16
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
	input	[DATA_WIDTH-1:0]	data_in_8,
	input	[DATA_WIDTH-1:0]	data_in_9,
	input	[DATA_WIDTH-1:0]	data_in_10,
	input	[DATA_WIDTH-1:0]	data_in_11,
	input	[DATA_WIDTH-1:0]	data_in_12,
	input	[DATA_WIDTH-1:0]	data_in_13,
	input	[DATA_WIDTH-1:0]	data_in_14,
	input	[DATA_WIDTH-1:0]	data_in_15,
	output	[DATA_WIDTH-1:0]	data_out_0,
	output	[DATA_WIDTH-1:0]	data_out_1,
	output	[DATA_WIDTH-1:0]	data_out_2,
	output	[DATA_WIDTH-1:0]	data_out_3,
	output	[DATA_WIDTH-1:0]	data_out_4,
	output	[DATA_WIDTH-1:0]	data_out_5,
	output	[DATA_WIDTH-1:0]	data_out_6,
	output	[DATA_WIDTH-1:0]	data_out_7,
	output	[DATA_WIDTH-1:0]	data_out_8,
	output	[DATA_WIDTH-1:0]	data_out_9,
	output	[DATA_WIDTH-1:0]	data_out_10,
	output	[DATA_WIDTH-1:0]	data_out_11,
	output	[DATA_WIDTH-1:0]	data_out_12,
	output	[DATA_WIDTH-1:0]	data_out_13,
	output	[DATA_WIDTH-1:0]	data_out_14,
	output	[DATA_WIDTH-1:0]	data_out_15,
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
	assign data_out_8 = conv_out[8];
	assign data_out_9 = conv_out[9];
	assign data_out_10 = conv_out[10];
	assign data_out_11 = conv_out[11];
	assign data_out_12 = conv_out[12];
	assign data_out_13 = conv_out[13];
	assign data_out_14 = conv_out[14];
	assign data_out_15 = conv_out[15];

	conv3d_16_kernel_16_channel_size_3 #(
		.DATA_WIDTH(32),.IMG_WIDTH(WIDTH),.IMG_HEIGHT(HEIGHT),
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
		.data_valid_in(valid_in),
		.data_in_0(data_in_0),
		.data_in_1(data_in_1),
		.data_in_2(data_in_2),
		.data_in_3(data_in_3),
		.data_in_4(data_in_4),
		.data_in_5(data_in_5),
		.data_in_6(data_in_6),
		.data_in_7(data_in_7),
		.data_in_8(data_in_8),
		.data_in_9(data_in_9),
		.data_in_10(data_in_10),
		.data_in_11(data_in_11),
		.data_in_12(data_in_12),
		.data_in_13(data_in_13),
		.data_in_14(data_in_14),
		.data_in_15(data_in_15),
		.data_out_conv_0(conv_out[0]),
		.data_out_conv_1(conv_out[1]),
		.data_out_conv_2(conv_out[2]),
		.data_out_conv_3(conv_out[3]),
		.data_out_conv_4(conv_out[4]),
		.data_out_conv_5(conv_out[5]),
		.data_out_conv_6(conv_out[6]),
		.data_out_conv_7(conv_out[7]),
		.data_out_conv_8(conv_out[8]),
		.data_out_conv_9(conv_out[9]),
		.data_out_conv_10(conv_out[10]),
		.data_out_conv_11(conv_out[11]),
		.data_out_conv_12(conv_out[12]),
		.data_out_conv_13(conv_out[13]),
		.data_out_conv_14(conv_out[14]),
		.data_out_conv_15(conv_out[15]),
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