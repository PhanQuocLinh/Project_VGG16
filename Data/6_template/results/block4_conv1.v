`ifndef ACTIVATE_INCLUDED
    `include "activate.v"
    `define ACTIVATE_INCLUDED
`endif
`ifndef MAX_POOLING_INCLUDED
    `include "max_pooling.v"
    `define MAX_POOLING_INCLUDED
`endif

module block4_conv1 #(
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

	conv3d_16_kernel_8_channel_size_3 #(
		.DATA_WIDTH(32),.IMG_WIDTH(WIDTH),.IMG_HEIGHT(HEIGHT),
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