`ifndef ACTIVATE_INCLUDED
    `include "activate.v"
    `define ACTIVATE_INCLUDED
`endif
`ifndef MAX_POOLING_INCLUDED
    `include "max_pooling.v"
    `define MAX_POOLING_INCLUDED
`endif

module block4_conv2 #(
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