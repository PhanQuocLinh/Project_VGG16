`ifndef ACTIVATE_INCLUDED
    `include "activate.v"
    `define ACTIVATE_INCLUDED
`endif
`ifndef MAX_POOLING_INCLUDED
    `include "max_pooling.v"
    `define MAX_POOLING_INCLUDED
`endif

module block3_conv3 #(
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
		.K0_C0_W0(32'h3da18e86), .K0_C0_W1(32'h3bb38bce), .K0_C0_W2(32'hbe0f300f), .K0_C0_W3(32'h3dab8d90), .K0_C0_W4(32'hbe10aec5), .K0_C0_W5(32'hbd80dc2b), .K0_C0_W6(32'hbdbdde5e), .K0_C0_W7(32'hbdad3186), .K0_C0_W8(32'h3c848b30), 
		.K0_C1_W0(32'h3d66b415), .K0_C1_W1(32'hbda4f64f), .K0_C1_W2(32'h3e14e79f), .K0_C1_W3(32'hbdb33263), .K0_C1_W4(32'hbe380a86), .K0_C1_W5(32'hbe16b37e), .K0_C1_W6(32'hbcf141b0), .K0_C1_W7(32'hbe1048a7), .K0_C1_W8(32'hbe106987), 
		.K0_C2_W0(32'hbd8fef8a), .K0_C2_W1(32'hbcd4b102), .K0_C2_W2(32'hbd290a86), .K0_C2_W3(32'h3d4c4507), .K0_C2_W4(32'h3ae2b1bd), .K0_C2_W5(32'h3e19c9aa), .K0_C2_W6(32'h3e772a6d), .K0_C2_W7(32'h3e6d8797), .K0_C2_W8(32'hbe25430c), 
		.K0_C3_W0(32'h3e47c559), .K0_C3_W1(32'h3e650277), .K0_C3_W2(32'hbdf1f3e2), .K0_C3_W3(32'hbd0dd6da), .K0_C3_W4(32'hbe0c1238), .K0_C3_W5(32'hbafa7110), .K0_C3_W6(32'h3d3b75ab), .K0_C3_W7(32'hbe2e5b7c), .K0_C3_W8(32'h3d050e57), 
		.K0_C4_W0(32'h3da2dda9), .K0_C4_W1(32'h3c82c9e6), .K0_C4_W2(32'h3e169c11), .K0_C4_W3(32'h3dbb4266), .K0_C4_W4(32'h3d48310d), .K0_C4_W5(32'h3e02aa3d), .K0_C4_W6(32'h3df36490), .K0_C4_W7(32'h3df4c350), .K0_C4_W8(32'hbd901f4d), 
		.K0_C5_W0(32'h3e49592c), .K0_C5_W1(32'h3d481245), .K0_C5_W2(32'h3e4ae5de), .K0_C5_W3(32'hbda38b5a), .K0_C5_W4(32'h3dc6fac8), .K0_C5_W5(32'h3e3e70b5), .K0_C5_W6(32'hbe33bfc8), .K0_C5_W7(32'h3d5f736a), .K0_C5_W8(32'h3d0c1b04), 
		.K0_C6_W0(32'h3d604078), .K0_C6_W1(32'hbd29c980), .K0_C6_W2(32'hbd3bedf1), .K0_C6_W3(32'hbc33c0f6), .K0_C6_W4(32'hbdbde286), .K0_C6_W5(32'hbddf813a), .K0_C6_W6(32'h3cb164ac), .K0_C6_W7(32'hbcabfbfa), .K0_C6_W8(32'hbd05e542), 
		.K0_C7_W0(32'hbe3b4dd7), .K0_C7_W1(32'hbda7fe2e), .K0_C7_W2(32'hbe45f0b2), .K0_C7_W3(32'hbdeba5d9), .K0_C7_W4(32'h3c3b333c), .K0_C7_W5(32'hbe1a08ef), .K0_C7_W6(32'h3d9ba903), .K0_C7_W7(32'hbe487c5f), .K0_C7_W8(32'hbcb66565), 
		.K0_BIAS (32'hbc95915c),

		.K1_C0_W0(32'hbe2f85bd), .K1_C0_W1(32'hbe13e16f), .K1_C0_W2(32'hbe0f1b35), .K1_C0_W3(32'h3d3f31a4), .K1_C0_W4(32'h3e288014), .K1_C0_W5(32'hbdfd0469), .K1_C0_W6(32'h3d028b1e), .K1_C0_W7(32'h3de679a5), .K1_C0_W8(32'h3d4b7697), 
		.K1_C1_W0(32'h3cc80a74), .K1_C1_W1(32'h3e155405), .K1_C1_W2(32'h3df7885a), .K1_C1_W3(32'h3e3476d5), .K1_C1_W4(32'h3da8bbe4), .K1_C1_W5(32'h3b3483d8), .K1_C1_W6(32'h3d3ddefc), .K1_C1_W7(32'hbdc48c1f), .K1_C1_W8(32'h3cde6a39), 
		.K1_C2_W0(32'hbe32552c), .K1_C2_W1(32'hbde8442f), .K1_C2_W2(32'h3e34e765), .K1_C2_W3(32'hbd56439e), .K1_C2_W4(32'hbe059411), .K1_C2_W5(32'h3e242bca), .K1_C2_W6(32'h3dff0259), .K1_C2_W7(32'hbb3b580d), .K1_C2_W8(32'h3de90d34), 
		.K1_C3_W0(32'h3dd24f14), .K1_C3_W1(32'h3db81ad2), .K1_C3_W2(32'h3cab8c0f), .K1_C3_W3(32'hbe3cd6d1), .K1_C3_W4(32'hbd2d2f48), .K1_C3_W5(32'h3cd032a6), .K1_C3_W6(32'hbe3a1640), .K1_C3_W7(32'h3dc9c43e), .K1_C3_W8(32'hbcdce648), 
		.K1_C4_W0(32'h3ce6d4b5), .K1_C4_W1(32'hbe4b08b6), .K1_C4_W2(32'hbdeb35b3), .K1_C4_W3(32'h3e206532), .K1_C4_W4(32'h3e29bcb6), .K1_C4_W5(32'h3df13e5d), .K1_C4_W6(32'h3b093155), .K1_C4_W7(32'h3dd22b01), .K1_C4_W8(32'hbe129530), 
		.K1_C5_W0(32'h3de8cbcc), .K1_C5_W1(32'h3cabfa79), .K1_C5_W2(32'h3d99293a), .K1_C5_W3(32'hbd82748c), .K1_C5_W4(32'hbd88d44e), .K1_C5_W5(32'hbe34d76c), .K1_C5_W6(32'hbe0f60bc), .K1_C5_W7(32'hbe2edd21), .K1_C5_W8(32'h3e0230c3), 
		.K1_C6_W0(32'h3e319699), .K1_C6_W1(32'h3d883272), .K1_C6_W2(32'h3e32af6a), .K1_C6_W3(32'h3d8765b5), .K1_C6_W4(32'hbbea40f0), .K1_C6_W5(32'h3e53af11), .K1_C6_W6(32'h3e5d0ce1), .K1_C6_W7(32'h3d30cb70), .K1_C6_W8(32'h3e404ede), 
		.K1_C7_W0(32'h3d757b3e), .K1_C7_W1(32'hbd32fff6), .K1_C7_W2(32'hbd53fd9c), .K1_C7_W3(32'h3c1e21ca), .K1_C7_W4(32'hbe00557a), .K1_C7_W5(32'hbd846a95), .K1_C7_W6(32'h3e08aa8b), .K1_C7_W7(32'h3d90b5ac), .K1_C7_W8(32'hbdf7b80b), 
		.K1_BIAS (32'h3cdda2df),

		.K2_C0_W0(32'h3df06c9c), .K2_C0_W1(32'h3dfb6780), .K2_C0_W2(32'hbd34c4ad), .K2_C0_W3(32'h3e11bd40), .K2_C0_W4(32'h3e5b77e6), .K2_C0_W5(32'h3cb5c214), .K2_C0_W6(32'h3e22e23d), .K2_C0_W7(32'hbd3491a4), .K2_C0_W8(32'h3e1214ff), 
		.K2_C1_W0(32'hbd89b706), .K2_C1_W1(32'h3deece35), .K2_C1_W2(32'h3d72edfd), .K2_C1_W3(32'hbe077323), .K2_C1_W4(32'hbde9d651), .K2_C1_W5(32'h3e640e22), .K2_C1_W6(32'hbda3f141), .K2_C1_W7(32'h3e38fcb9), .K2_C1_W8(32'h3e3c6300), 
		.K2_C2_W0(32'hbd67d089), .K2_C2_W1(32'h3e230900), .K2_C2_W2(32'hbe4881f8), .K2_C2_W3(32'hbe2a7f29), .K2_C2_W4(32'h3be95c53), .K2_C2_W5(32'h3cfa9c6b), .K2_C2_W6(32'h3c938666), .K2_C2_W7(32'hbd0b05f3), .K2_C2_W8(32'hbdb2d624), 
		.K2_C3_W0(32'hbd766cc8), .K2_C3_W1(32'h3e2c229f), .K2_C3_W2(32'hbe155ae3), .K2_C3_W3(32'hbe23f99d), .K2_C3_W4(32'hbdd6eefc), .K2_C3_W5(32'h3d696ab9), .K2_C3_W6(32'h3d5a0428), .K2_C3_W7(32'h3d41d2d6), .K2_C3_W8(32'h3e3808db), 
		.K2_C4_W0(32'h3d30958e), .K2_C4_W1(32'hbdedce7f), .K2_C4_W2(32'h3dd38866), .K2_C4_W3(32'hbd68fb6d), .K2_C4_W4(32'h3d1da6ff), .K2_C4_W5(32'h3c83d62c), .K2_C4_W6(32'hbd76ce90), .K2_C4_W7(32'hbe5db3e7), .K2_C4_W8(32'hbdfc7a44), 
		.K2_C5_W0(32'h3de44298), .K2_C5_W1(32'hbe1a4277), .K2_C5_W2(32'h3e05a6cd), .K2_C5_W3(32'hbdfd3c7f), .K2_C5_W4(32'hbd591fcd), .K2_C5_W5(32'hbd9e00b0), .K2_C5_W6(32'hbe498f9d), .K2_C5_W7(32'hbe1f584e), .K2_C5_W8(32'hbae07bb3), 
		.K2_C6_W0(32'h3dc7912f), .K2_C6_W1(32'h3d9cc984), .K2_C6_W2(32'hbe3e8c78), .K2_C6_W3(32'hbc9d222f), .K2_C6_W4(32'h3d1733b5), .K2_C6_W5(32'h3e44774f), .K2_C6_W6(32'h3db2d83f), .K2_C6_W7(32'hbe1a9382), .K2_C6_W8(32'h3d962346), 
		.K2_C7_W0(32'hbe2a32e3), .K2_C7_W1(32'h3e3473ca), .K2_C7_W2(32'h3d97d781), .K2_C7_W3(32'h3e5f46b7), .K2_C7_W4(32'hbe35911a), .K2_C7_W5(32'hbe461b57), .K2_C7_W6(32'h3da9c883), .K2_C7_W7(32'h3dd3830d), .K2_C7_W8(32'h3e47a016), 
		.K2_BIAS (32'h3cf2eb27),

		.K3_C0_W0(32'h3d97786b), .K3_C0_W1(32'hbb617466), .K3_C0_W2(32'h3d22491e), .K3_C0_W3(32'hbdb555fc), .K3_C0_W4(32'hbe33a92b), .K3_C0_W5(32'hbd7bafc4), .K3_C0_W6(32'h3e27f018), .K3_C0_W7(32'h3db91766), .K3_C0_W8(32'h3d8e8287), 
		.K3_C1_W0(32'hbe1a94bd), .K3_C1_W1(32'h3e0fa5ea), .K3_C1_W2(32'hbd0810da), .K3_C1_W3(32'hbcdc6433), .K3_C1_W4(32'hbda9de08), .K3_C1_W5(32'hbd16a624), .K3_C1_W6(32'h3e608d55), .K3_C1_W7(32'h3dcc8df8), .K3_C1_W8(32'h3e684a9c), 
		.K3_C2_W0(32'h3d8ca254), .K3_C2_W1(32'h3cd858a2), .K3_C2_W2(32'h3d0335eb), .K3_C2_W3(32'h3e25fca9), .K3_C2_W4(32'hbdbbe076), .K3_C2_W5(32'h3e0649ca), .K3_C2_W6(32'hbe0615c7), .K3_C2_W7(32'h3dbe196d), .K3_C2_W8(32'h3d86a987), 
		.K3_C3_W0(32'h3e662efb), .K3_C3_W1(32'hbc7b059a), .K3_C3_W2(32'hbde147de), .K3_C3_W3(32'h3dd62000), .K3_C3_W4(32'hbe2ce852), .K3_C3_W5(32'hbe45df93), .K3_C3_W6(32'hbe2786f7), .K3_C3_W7(32'h3df0c6fb), .K3_C3_W8(32'hbe161fe4), 
		.K3_C4_W0(32'hbe688120), .K3_C4_W1(32'hbc44190f), .K3_C4_W2(32'h3ded50fd), .K3_C4_W3(32'hbdd7e04d), .K3_C4_W4(32'h3e132936), .K3_C4_W5(32'hbd57db4f), .K3_C4_W6(32'hbdc05e18), .K3_C4_W7(32'h3c0395c6), .K3_C4_W8(32'h3e1da4f0), 
		.K3_C5_W0(32'h3e4fc943), .K3_C5_W1(32'hbcf19f44), .K3_C5_W2(32'h3dc4b8d7), .K3_C5_W3(32'hbe3320cd), .K3_C5_W4(32'hbdb9d732), .K3_C5_W5(32'hbcfc3f55), .K3_C5_W6(32'h3e380fb7), .K3_C5_W7(32'h3e498c30), .K3_C5_W8(32'hbcc236c0), 
		.K3_C6_W0(32'hbcc2d9f8), .K3_C6_W1(32'hbd948c92), .K3_C6_W2(32'h3b13e8e6), .K3_C6_W3(32'h3e07b5bd), .K3_C6_W4(32'h3e263703), .K3_C6_W5(32'h3daf1989), .K3_C6_W6(32'h3d245e7f), .K3_C6_W7(32'h3db6302a), .K3_C6_W8(32'hbd887400), 
		.K3_C7_W0(32'hbdb01e5d), .K3_C7_W1(32'hbdb446b0), .K3_C7_W2(32'h3d9fed67), .K3_C7_W3(32'hbce5ddad), .K3_C7_W4(32'hbda8e6a9), .K3_C7_W5(32'h3d5739ec), .K3_C7_W6(32'h3e4e6662), .K3_C7_W7(32'h3e1f0261), .K3_C7_W8(32'h3e4022f2), 
		.K3_BIAS (32'hbc2b5ff3),

		.K4_C0_W0(32'h3cfe4fb3), .K4_C0_W1(32'hbdc865d0), .K4_C0_W2(32'h3e479366), .K4_C0_W3(32'hbe39a71c), .K4_C0_W4(32'h3e52bde5), .K4_C0_W5(32'h3e03f395), .K4_C0_W6(32'h3c24c16a), .K4_C0_W7(32'hbd75ab41), .K4_C0_W8(32'h3df78539), 
		.K4_C1_W0(32'hbe038b67), .K4_C1_W1(32'hbd158308), .K4_C1_W2(32'hbd0d0cb8), .K4_C1_W3(32'h3e48d4d0), .K4_C1_W4(32'h3d61a0b9), .K4_C1_W5(32'h3e04d26a), .K4_C1_W6(32'hbdb8de6a), .K4_C1_W7(32'h3e0f3798), .K4_C1_W8(32'hbd035f2e), 
		.K4_C2_W0(32'hbe47a562), .K4_C2_W1(32'hbd35bc20), .K4_C2_W2(32'h3e4080ba), .K4_C2_W3(32'hbe107b57), .K4_C2_W4(32'h3df1caf5), .K4_C2_W5(32'h3e352ce6), .K4_C2_W6(32'h3deef7dd), .K4_C2_W7(32'h3dcb7d46), .K4_C2_W8(32'h3d8dab46), 
		.K4_C3_W0(32'hbde2cb0c), .K4_C3_W1(32'hbe039f0f), .K4_C3_W2(32'h3d5b2453), .K4_C3_W3(32'hbbdeeaba), .K4_C3_W4(32'hbd82e294), .K4_C3_W5(32'hbe314735), .K4_C3_W6(32'h3e2773d6), .K4_C3_W7(32'hbded0313), .K4_C3_W8(32'h3dcac8b8), 
		.K4_C4_W0(32'hbcbc20c2), .K4_C4_W1(32'hbe32deb1), .K4_C4_W2(32'hbdffd118), .K4_C4_W3(32'hbde67268), .K4_C4_W4(32'h3bacee84), .K4_C4_W5(32'hbca13624), .K4_C4_W6(32'h3cb94940), .K4_C4_W7(32'hbe33bf80), .K4_C4_W8(32'h3d33801d), 
		.K4_C5_W0(32'h3e1bbb10), .K4_C5_W1(32'hbe209a00), .K4_C5_W2(32'hbdaed0d3), .K4_C5_W3(32'hbe4786b3), .K4_C5_W4(32'hbdd219bb), .K4_C5_W5(32'h3e0f623d), .K4_C5_W6(32'h3dee4063), .K4_C5_W7(32'h3e147151), .K4_C5_W8(32'h3b22a97b), 
		.K4_C6_W0(32'hbde51a13), .K4_C6_W1(32'h3dafece3), .K4_C6_W2(32'hbdc392eb), .K4_C6_W3(32'h3e1c333e), .K4_C6_W4(32'hbd81cd56), .K4_C6_W5(32'h3dde550c), .K4_C6_W6(32'h3e3f8229), .K4_C6_W7(32'hbcbd1ad7), .K4_C6_W8(32'hbd443d39), 
		.K4_C7_W0(32'hbdd520ee), .K4_C7_W1(32'hbe431766), .K4_C7_W2(32'hbda79f88), .K4_C7_W3(32'h3d622cf8), .K4_C7_W4(32'hbda886fd), .K4_C7_W5(32'hbd320a12), .K4_C7_W6(32'h3c784377), .K4_C7_W7(32'hbe04dd9c), .K4_C7_W8(32'hbdc3f8e8), 
		.K4_BIAS (32'h3c4cc76f),

		.K5_C0_W0(32'hbc39aac8), .K5_C0_W1(32'hbe4611c5), .K5_C0_W2(32'hbe47db4f), .K5_C0_W3(32'hbe00a071), .K5_C0_W4(32'h3d85d952), .K5_C0_W5(32'hbb09ea5c), .K5_C0_W6(32'h3df77050), .K5_C0_W7(32'h3de8ff7d), .K5_C0_W8(32'h3e465144), 
		.K5_C1_W0(32'h3de880d5), .K5_C1_W1(32'hbd17cb80), .K5_C1_W2(32'hbe4cbb5e), .K5_C1_W3(32'h3e3936f8), .K5_C1_W4(32'h3dab95a0), .K5_C1_W5(32'h3d8ea96e), .K5_C1_W6(32'h3cbcfb21), .K5_C1_W7(32'hbe49fe9d), .K5_C1_W8(32'h3d037587), 
		.K5_C2_W0(32'hbe5eed78), .K5_C2_W1(32'h3c1b97c1), .K5_C2_W2(32'h3d933c6f), .K5_C2_W3(32'hbc0c8dcb), .K5_C2_W4(32'hbe2e3cd0), .K5_C2_W5(32'hbe200a8b), .K5_C2_W6(32'hbdbf5c02), .K5_C2_W7(32'h3e40d269), .K5_C2_W8(32'hbca2497f), 
		.K5_C3_W0(32'hbc5f2508), .K5_C3_W1(32'hbcc11019), .K5_C3_W2(32'h3cf774c8), .K5_C3_W3(32'hbe114c72), .K5_C3_W4(32'hbe27effd), .K5_C3_W5(32'h3e39e893), .K5_C3_W6(32'hbe03a479), .K5_C3_W7(32'hbe03b926), .K5_C3_W8(32'h3d8361ea), 
		.K5_C4_W0(32'hbca027d7), .K5_C4_W1(32'h3d8a9ed8), .K5_C4_W2(32'hbdbeeeba), .K5_C4_W3(32'h3c65731e), .K5_C4_W4(32'h3dc2d235), .K5_C4_W5(32'h3ba49e8f), .K5_C4_W6(32'hbc409061), .K5_C4_W7(32'h3c606d6a), .K5_C4_W8(32'hbdf474d8), 
		.K5_C5_W0(32'h3d701ef6), .K5_C5_W1(32'hbd963ce1), .K5_C5_W2(32'h3e016869), .K5_C5_W3(32'h3cc23247), .K5_C5_W4(32'hbe56de5a), .K5_C5_W5(32'hbddc075b), .K5_C5_W6(32'hbb13003f), .K5_C5_W7(32'hbd37c56c), .K5_C5_W8(32'hbe5ea80a), 
		.K5_C6_W0(32'hbe052cd8), .K5_C6_W1(32'h3d42a50f), .K5_C6_W2(32'h3df9dbd6), .K5_C6_W3(32'h3bd55c4a), .K5_C6_W4(32'hbc3294c4), .K5_C6_W5(32'hbd9bb117), .K5_C6_W6(32'h3e19a00f), .K5_C6_W7(32'hbcf93096), .K5_C6_W8(32'h3d114ae7), 
		.K5_C7_W0(32'h3d2395db), .K5_C7_W1(32'hbe40bd24), .K5_C7_W2(32'hbc8ec8ac), .K5_C7_W3(32'h3e333342), .K5_C7_W4(32'hbd868bdb), .K5_C7_W5(32'h3dd45aa1), .K5_C7_W6(32'h3e58eb11), .K5_C7_W7(32'hbe103c05), .K5_C7_W8(32'hb99b9436), 
		.K5_BIAS (32'h3c658832),

		.K6_C0_W0(32'h3e4be71e), .K6_C0_W1(32'h3d871f18), .K6_C0_W2(32'h3d674af7), .K6_C0_W3(32'h3e1d1926), .K6_C0_W4(32'hbd561af9), .K6_C0_W5(32'h3e21d81a), .K6_C0_W6(32'hbde16a30), .K6_C0_W7(32'hbdef6e8c), .K6_C0_W8(32'h3c0e3043), 
		.K6_C1_W0(32'h3d105744), .K6_C1_W1(32'hbd9bfcca), .K6_C1_W2(32'hbe547aba), .K6_C1_W3(32'hbdc3ab9b), .K6_C1_W4(32'h3e1670b3), .K6_C1_W5(32'hbe11cb30), .K6_C1_W6(32'h3e2e8d22), .K6_C1_W7(32'h3d80133a), .K6_C1_W8(32'h3e85d374), 
		.K6_C2_W0(32'hbe1fbb19), .K6_C2_W1(32'hbdec4dfe), .K6_C2_W2(32'h3e68861f), .K6_C2_W3(32'hbdbcfed4), .K6_C2_W4(32'h3e098f75), .K6_C2_W5(32'h3c517423), .K6_C2_W6(32'hbe1ad3d9), .K6_C2_W7(32'h3dc52719), .K6_C2_W8(32'h3db2e17d), 
		.K6_C3_W0(32'hbe4718f6), .K6_C3_W1(32'h3a394258), .K6_C3_W2(32'hbc9320f5), .K6_C3_W3(32'h3dd6edab), .K6_C3_W4(32'hbe19dbbc), .K6_C3_W5(32'hbd28eee0), .K6_C3_W6(32'hbd51d58b), .K6_C3_W7(32'hbe1c1ef5), .K6_C3_W8(32'h3e238e70), 
		.K6_C4_W0(32'h3d82f840), .K6_C4_W1(32'h3e2ec4cc), .K6_C4_W2(32'hba41c82c), .K6_C4_W3(32'hbe1376d6), .K6_C4_W4(32'h3d570705), .K6_C4_W5(32'hbe11acfb), .K6_C4_W6(32'hbe347757), .K6_C4_W7(32'hbe00e457), .K6_C4_W8(32'hbe2cc6f6), 
		.K6_C5_W0(32'hbcbb8c4d), .K6_C5_W1(32'hbe262e78), .K6_C5_W2(32'hbe22c206), .K6_C5_W3(32'h3e210dcb), .K6_C5_W4(32'h3db23622), .K6_C5_W5(32'hbe033d2a), .K6_C5_W6(32'h3b13f1bf), .K6_C5_W7(32'hbd82f24f), .K6_C5_W8(32'hbd7375ce), 
		.K6_C6_W0(32'hbe5524b5), .K6_C6_W1(32'h3dd7be46), .K6_C6_W2(32'hbd813dad), .K6_C6_W3(32'h3d00867b), .K6_C6_W4(32'hbdb388c5), .K6_C6_W5(32'hbe4affc8), .K6_C6_W6(32'h3d50e8e8), .K6_C6_W7(32'hbe38d75e), .K6_C6_W8(32'hbe3b3b7e), 
		.K6_C7_W0(32'hbd0df552), .K6_C7_W1(32'hbdf363b1), .K6_C7_W2(32'h3e34b0ee), .K6_C7_W3(32'h3e3e0dab), .K6_C7_W4(32'hbc18860f), .K6_C7_W5(32'h3d8e4afb), .K6_C7_W6(32'hbd267c4d), .K6_C7_W7(32'h3da5fc1e), .K6_C7_W8(32'h3e6e0f7a), 
		.K6_BIAS (32'h3b4f2a1f),

		.K7_C0_W0(32'hbde05ae0), .K7_C0_W1(32'h3e087d6a), .K7_C0_W2(32'hbd5c334d), .K7_C0_W3(32'hbe04639b), .K7_C0_W4(32'h3c8d691b), .K7_C0_W5(32'hbe55aefa), .K7_C0_W6(32'h3dc920be), .K7_C0_W7(32'h3e0247e0), .K7_C0_W8(32'h3dfe806a), 
		.K7_C1_W0(32'h3e01cd16), .K7_C1_W1(32'hbe5035d2), .K7_C1_W2(32'hbe62a577), .K7_C1_W3(32'hbe259f7b), .K7_C1_W4(32'hbe5f0933), .K7_C1_W5(32'h3d157bf0), .K7_C1_W6(32'hbc2d6645), .K7_C1_W7(32'hbdfc52fd), .K7_C1_W8(32'hbdc4c663), 
		.K7_C2_W0(32'hbdc2aa71), .K7_C2_W1(32'hbdf21de4), .K7_C2_W2(32'h3e515133), .K7_C2_W3(32'h3e3a5158), .K7_C2_W4(32'hbdd14753), .K7_C2_W5(32'hba71a9c1), .K7_C2_W6(32'h3c2d5e0c), .K7_C2_W7(32'h3ca60d13), .K7_C2_W8(32'h3d7c7dff), 
		.K7_C3_W0(32'h3dc4176e), .K7_C3_W1(32'hbe2565e9), .K7_C3_W2(32'h3dfdabc9), .K7_C3_W3(32'hbe102260), .K7_C3_W4(32'h3ceb277a), .K7_C3_W5(32'hbda03eb4), .K7_C3_W6(32'hbd8bbcb5), .K7_C3_W7(32'hbe29c8f6), .K7_C3_W8(32'hbdda8929), 
		.K7_C4_W0(32'h3be98f67), .K7_C4_W1(32'hbe54fb9e), .K7_C4_W2(32'hbdf52475), .K7_C4_W3(32'h3e15035c), .K7_C4_W4(32'h3e2e0dac), .K7_C4_W5(32'hbe43f2dc), .K7_C4_W6(32'hbb91080e), .K7_C4_W7(32'h39a89979), .K7_C4_W8(32'hbc20722f), 
		.K7_C5_W0(32'h3defefd6), .K7_C5_W1(32'hbdb80424), .K7_C5_W2(32'hbe480d05), .K7_C5_W3(32'hbd9151a9), .K7_C5_W4(32'hb9e6c8fa), .K7_C5_W5(32'hbe3a39e7), .K7_C5_W6(32'hbe402201), .K7_C5_W7(32'hbdefc620), .K7_C5_W8(32'hba90c946), 
		.K7_C6_W0(32'hbe263fcb), .K7_C6_W1(32'hbe1e5be3), .K7_C6_W2(32'hbe450f0d), .K7_C6_W3(32'h3e188512), .K7_C6_W4(32'h3d9677ad), .K7_C6_W5(32'h3e21397d), .K7_C6_W6(32'h3e03bf92), .K7_C6_W7(32'h3dbe2e4e), .K7_C6_W8(32'hbe13f14b), 
		.K7_C7_W0(32'h3c6a35e0), .K7_C7_W1(32'h3df3c420), .K7_C7_W2(32'hbdf18e05), .K7_C7_W3(32'hbe2f01f1), .K7_C7_W4(32'h3e03b019), .K7_C7_W5(32'hbe2f81dd), .K7_C7_W6(32'hbe0cb970), .K7_C7_W7(32'hbc8b5975), .K7_C7_W8(32'hbdeb5375), 
		.K7_BIAS (32'h3cddcdf8)
		)
		block3_conv3(
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