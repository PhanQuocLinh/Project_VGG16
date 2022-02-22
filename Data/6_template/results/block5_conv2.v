`ifndef ACTIVATE_INCLUDED
    `include "activate.v"
    `define ACTIVATE_INCLUDED
`endif
`ifndef MAX_POOLING_INCLUDED
    `include "max_pooling.v"
    `define MAX_POOLING_INCLUDED
`endif

module block5_conv2 #(
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