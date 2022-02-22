`ifndef ACTIVATE_INCLUDED
    `include "activate.v"
    `define ACTIVATE_INCLUDED
`endif
`ifndef MAX_POOLING_INCLUDED
    `include "max_pooling.v"
    `define MAX_POOLING_INCLUDED
`endif

module block5_conv1 #(
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