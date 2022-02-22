`ifndef ACTIVATE_INCLUDED
    `include "activate.v"
    `define ACTIVATE_INCLUDED
`endif
`ifndef MAX_POOLING_INCLUDED
    `include "max_pooling.v"
    `define MAX_POOLING_INCLUDED
`endif

module block5_conv3 #(
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