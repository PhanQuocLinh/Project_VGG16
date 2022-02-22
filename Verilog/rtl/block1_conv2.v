`ifndef ACTIVATE_INCLUDED
    `include "activate.v"
    `define ACTIVATE_INCLUDED
`endif
`ifndef MAX_POOLING_INCLUDED
    `include "max_pooling.v"
    `define MAX_POOLING_INCLUDED
`endif

module block1_conv2 #(
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

    assign valid_out = conv_valid_out;
    assign done = done_conv;


    
	conv3d_8_kernel_8_channel_size_3 #(
		.DATA_WIDTH(32),.IMG_WIDTH(WIDTH),.IMG_HEIGHT(HEIGHT),
		.K0_C0_W0(32'h3ccecfc5), .K0_C0_W1(32'hbe3ee4de), .K0_C0_W2(32'h3dca8373), .K0_C0_W3(32'h3e031761), .K0_C0_W4(32'hbe48cc72), .K0_C0_W5(32'h3e38bc63), .K0_C0_W6(32'h3df4c430), .K0_C0_W7(32'hbd08c9bc), .K0_C0_W8(32'hbd73ae30), 
		.K0_C1_W0(32'hbe295179), .K0_C1_W1(32'h3e1818cf), .K0_C1_W2(32'h3dceddf8), .K0_C1_W3(32'h3d301f7e), .K0_C1_W4(32'hbe018b22), .K0_C1_W5(32'h3c795cc2), .K0_C1_W6(32'h3e002475), .K0_C1_W7(32'h3dee39f7), .K0_C1_W8(32'h3e146b21), 
		.K0_C2_W0(32'h3d83425f), .K0_C2_W1(32'hbe431c54), .K0_C2_W2(32'hbd320811), .K0_C2_W3(32'h3e058014), .K0_C2_W4(32'hbdd32eb0), .K0_C2_W5(32'hbccd42d1), .K0_C2_W6(32'h3dd3b694), .K0_C2_W7(32'hbe49e14e), .K0_C2_W8(32'hbd1c0eab), 
		.K0_C3_W0(32'h3dd62dfe), .K0_C3_W1(32'hbd826b69), .K0_C3_W2(32'hbd97a3bb), .K0_C3_W3(32'h3ca69d04), .K0_C3_W4(32'hbd916ad2), .K0_C3_W5(32'h3dbd60c7), .K0_C3_W6(32'hbe124c93), .K0_C3_W7(32'h3dfbcc29), .K0_C3_W8(32'hbe02606e), 
		.K0_C4_W0(32'hbe12a995), .K0_C4_W1(32'h3dc2a28b), .K0_C4_W2(32'h3dcd0649), .K0_C4_W3(32'h3deedb82), .K0_C4_W4(32'h3e22cfce), .K0_C4_W5(32'hbdda45d7), .K0_C4_W6(32'h3dadf7be), .K0_C4_W7(32'hbdfd84b6), .K0_C4_W8(32'h3e483129), 
		.K0_C5_W0(32'h3da226ab), .K0_C5_W1(32'h3dd910bc), .K0_C5_W2(32'h3e2f8871), .K0_C5_W3(32'hbde654d4), .K0_C5_W4(32'h3cfb399c), .K0_C5_W5(32'h3d9944ca), .K0_C5_W6(32'h3e10e53a), .K0_C5_W7(32'h3d94e3e6), .K0_C5_W8(32'hbdf09ec4), 
		.K0_C6_W0(32'h3e16af5a), .K0_C6_W1(32'hbe261959), .K0_C6_W2(32'hbd91e500), .K0_C6_W3(32'h3e0c4134), .K0_C6_W4(32'hbda9e0dc), .K0_C6_W5(32'hbe13c1c1), .K0_C6_W6(32'h3d0047cd), .K0_C6_W7(32'hbdbd90f4), .K0_C6_W8(32'hbc333ba8), 
		.K0_C7_W0(32'h3d591c76), .K0_C7_W1(32'h3e31c707), .K0_C7_W2(32'h3d6d79c0), .K0_C7_W3(32'h3e2c93d4), .K0_C7_W4(32'hbdb360f0), .K0_C7_W5(32'h3dacbcca), .K0_C7_W6(32'hbe0b8e67), .K0_C7_W7(32'h3d9a9b9e), .K0_C7_W8(32'h3e414233), 
		.K0_BIAS (32'hbd0e78a1),

		.K1_C0_W0(32'h3ce07dd2), .K1_C0_W1(32'hbe524c83), .K1_C0_W2(32'h3e1ac0b6), .K1_C0_W3(32'hbdbb5258), .K1_C0_W4(32'hbe1d5966), .K1_C0_W5(32'hbe494684), .K1_C0_W6(32'hbd97b820), .K1_C0_W7(32'h3e300dd9), .K1_C0_W8(32'hbd4f2ea6), 
		.K1_C1_W0(32'h3db275e8), .K1_C1_W1(32'h3e5b2b7d), .K1_C1_W2(32'h3dcc1664), .K1_C1_W3(32'hbd1ab998), .K1_C1_W4(32'h3d08bd76), .K1_C1_W5(32'hbe17a64c), .K1_C1_W6(32'hbd950943), .K1_C1_W7(32'hbe303d8e), .K1_C1_W8(32'h3d0b4fae), 
		.K1_C2_W0(32'h3e4d708c), .K1_C2_W1(32'hbdfb1d50), .K1_C2_W2(32'hbdb9012e), .K1_C2_W3(32'hbe2058f2), .K1_C2_W4(32'h3e22f275), .K1_C2_W5(32'hbd9fef4a), .K1_C2_W6(32'hbcafe35c), .K1_C2_W7(32'hbe41c3f3), .K1_C2_W8(32'h3dabb54d), 
		.K1_C3_W0(32'hbce9cf9a), .K1_C3_W1(32'h3dcd1e2b), .K1_C3_W2(32'h3dc1fd73), .K1_C3_W3(32'h3cc9fd63), .K1_C3_W4(32'h3d83c59e), .K1_C3_W5(32'hbe0cb2c4), .K1_C3_W6(32'h3de61e57), .K1_C3_W7(32'h3db66261), .K1_C3_W8(32'h3e0faa4a), 
		.K1_C4_W0(32'hbdc8ee1e), .K1_C4_W1(32'hbe5dfcb5), .K1_C4_W2(32'h3bb9dfcd), .K1_C4_W3(32'hbe54815e), .K1_C4_W4(32'h3e0d4fea), .K1_C4_W5(32'hbb89945f), .K1_C4_W6(32'h3d1cf714), .K1_C4_W7(32'h3e307eda), .K1_C4_W8(32'h3de359ae), 
		.K1_C5_W0(32'hbd5aaacb), .K1_C5_W1(32'hbd05d3d9), .K1_C5_W2(32'hbc874fd5), .K1_C5_W3(32'hbbb2a13b), .K1_C5_W4(32'h3ddcb0bc), .K1_C5_W5(32'hbdc3ca4e), .K1_C5_W6(32'hbcb493ae), .K1_C5_W7(32'h3deb815f), .K1_C5_W8(32'hbd944e4a), 
		.K1_C6_W0(32'hbd1ba18b), .K1_C6_W1(32'hbd239bf8), .K1_C6_W2(32'hbdb2029b), .K1_C6_W3(32'hbd8eec66), .K1_C6_W4(32'hbe3e2f0a), .K1_C6_W5(32'h3e1b5ede), .K1_C6_W6(32'h3d8d6bb9), .K1_C6_W7(32'hbd03bd31), .K1_C6_W8(32'hbc9042ee), 
		.K1_C7_W0(32'h3de61d5d), .K1_C7_W1(32'hbe3dad10), .K1_C7_W2(32'h3db3da6b), .K1_C7_W3(32'hbe444f02), .K1_C7_W4(32'hbdbeb79b), .K1_C7_W5(32'hbe1eb2fd), .K1_C7_W6(32'h3acaceb7), .K1_C7_W7(32'h3dba3747), .K1_C7_W8(32'hbe0fb55c), 
		.K1_BIAS (32'h3b1aed1d),

		.K2_C0_W0(32'h3c7f1814), .K2_C0_W1(32'h3d6ca048), .K2_C0_W2(32'hbdea31cb), .K2_C0_W3(32'hbe2b6451), .K2_C0_W4(32'h3e37aa12), .K2_C0_W5(32'h3e2e3408), .K2_C0_W6(32'hbe122724), .K2_C0_W7(32'hbd238c07), .K2_C0_W8(32'h3e2e0dd9), 
		.K2_C1_W0(32'hbd16e59a), .K2_C1_W1(32'hbda7398b), .K2_C1_W2(32'hbd9d7c3c), .K2_C1_W3(32'h3d9ffa76), .K2_C1_W4(32'hbe2fabde), .K2_C1_W5(32'hbda2fd9d), .K2_C1_W6(32'hbdc5b02f), .K2_C1_W7(32'h3e44847e), .K2_C1_W8(32'h3e0af18e), 
		.K2_C2_W0(32'h3d3d40a0), .K2_C2_W1(32'hbd95524c), .K2_C2_W2(32'h3e4ae131), .K2_C2_W3(32'hbe1cedc2), .K2_C2_W4(32'hbdfdb925), .K2_C2_W5(32'hbd00fc37), .K2_C2_W6(32'hbe234f7d), .K2_C2_W7(32'h3e443b47), .K2_C2_W8(32'h3dd8c3c7), 
		.K2_C3_W0(32'h3e361835), .K2_C3_W1(32'h3b6d1ff0), .K2_C3_W2(32'hbe19ab9a), .K2_C3_W3(32'hbe261961), .K2_C3_W4(32'h3c0d9f7f), .K2_C3_W5(32'h3d6ea544), .K2_C3_W6(32'h3dd17364), .K2_C3_W7(32'hbe1ca0b2), .K2_C3_W8(32'hbd638e4e), 
		.K2_C4_W0(32'h3d90c25d), .K2_C4_W1(32'h3e0757dd), .K2_C4_W2(32'h3e05331b), .K2_C4_W3(32'hbe2aa740), .K2_C4_W4(32'hbe2dd632), .K2_C4_W5(32'h3e5d8992), .K2_C4_W6(32'hbdd670ab), .K2_C4_W7(32'hbe23adfc), .K2_C4_W8(32'h3dfaf633), 
		.K2_C5_W0(32'h3b06dc62), .K2_C5_W1(32'h3e355090), .K2_C5_W2(32'hbe2bfc2c), .K2_C5_W3(32'hbe3e1e82), .K2_C5_W4(32'h3ce44e90), .K2_C5_W5(32'h3e2e89ea), .K2_C5_W6(32'h3e0f910e), .K2_C5_W7(32'hbdc708b2), .K2_C5_W8(32'h3ddbf071), 
		.K2_C6_W0(32'hbdc43d98), .K2_C6_W1(32'h3dba3b41), .K2_C6_W2(32'hbe0368c2), .K2_C6_W3(32'h3e29367f), .K2_C6_W4(32'h3e27802e), .K2_C6_W5(32'hbd45fcd1), .K2_C6_W6(32'h3e482e84), .K2_C6_W7(32'hbd6c826b), .K2_C6_W8(32'h3e2e652e), 
		.K2_C7_W0(32'hbd7a4d8d), .K2_C7_W1(32'hbe65fb84), .K2_C7_W2(32'hbe3c36e1), .K2_C7_W3(32'hbe1ff463), .K2_C7_W4(32'hbdd49f62), .K2_C7_W5(32'h3e5a51a9), .K2_C7_W6(32'hbe25fb82), .K2_C7_W7(32'h3cddfd13), .K2_C7_W8(32'h3d4f7979), 
		.K2_BIAS (32'h3c146e9a),

		.K3_C0_W0(32'h3e112158), .K3_C0_W1(32'h3d4edb4a), .K3_C0_W2(32'h3e0d70c9), .K3_C0_W3(32'h3dd21a3d), .K3_C0_W4(32'hbc1a6dc6), .K3_C0_W5(32'h3db7ac8c), .K3_C0_W6(32'hbe1e6436), .K3_C0_W7(32'hbc9f55a9), .K3_C0_W8(32'h3e209578), 
		.K3_C1_W0(32'hbd16a936), .K3_C1_W1(32'hbe14b963), .K3_C1_W2(32'h3dd81528), .K3_C1_W3(32'h3d53dfa7), .K3_C1_W4(32'h3e1cb60b), .K3_C1_W5(32'h3e6381f3), .K3_C1_W6(32'hbd85b345), .K3_C1_W7(32'h3ddc9d01), .K3_C1_W8(32'h3e49ec87), 
		.K3_C2_W0(32'hbe2af153), .K3_C2_W1(32'hbc2042c4), .K3_C2_W2(32'hbdb672de), .K3_C2_W3(32'hbdb9ae57), .K3_C2_W4(32'hbd8632d4), .K3_C2_W5(32'hbdaf591c), .K3_C2_W6(32'hbcb721fc), .K3_C2_W7(32'hbe43b182), .K3_C2_W8(32'h3e108898), 
		.K3_C3_W0(32'h3d2aa125), .K3_C3_W1(32'h3e0a257c), .K3_C3_W2(32'hbddb28ef), .K3_C3_W3(32'hbe76ef25), .K3_C3_W4(32'hbde86434), .K3_C3_W5(32'h3de47a34), .K3_C3_W6(32'h3d522ddb), .K3_C3_W7(32'h3d81599c), .K3_C3_W8(32'hbe37a69d), 
		.K3_C4_W0(32'hbd09f419), .K3_C4_W1(32'h3e52579e), .K3_C4_W2(32'h3dde820a), .K3_C4_W3(32'h3e4f760d), .K3_C4_W4(32'h3d68a497), .K3_C4_W5(32'hbd89f3ef), .K3_C4_W6(32'hbe543213), .K3_C4_W7(32'hbe3b672e), .K3_C4_W8(32'hbe6cacd0), 
		.K3_C5_W0(32'hbe4b9576), .K3_C5_W1(32'hbc846b86), .K3_C5_W2(32'h3ace78a0), .K3_C5_W3(32'h3dc3d8f7), .K3_C5_W4(32'hbd4f5b7a), .K3_C5_W5(32'hbd834ad9), .K3_C5_W6(32'hbe117112), .K3_C5_W7(32'h3e59a1e8), .K3_C5_W8(32'hbe140bec), 
		.K3_C6_W0(32'hbe463acb), .K3_C6_W1(32'h3d7db1ca), .K3_C6_W2(32'h3da1def6), .K3_C6_W3(32'hbe43d82b), .K3_C6_W4(32'h3e18367b), .K3_C6_W5(32'h3e2b6b9a), .K3_C6_W6(32'hbceaa7ba), .K3_C6_W7(32'h3c10fe67), .K3_C6_W8(32'hbd97d5ae), 
		.K3_C7_W0(32'hbd922fb8), .K3_C7_W1(32'hbe0d1337), .K3_C7_W2(32'h3dc7912b), .K3_C7_W3(32'hbe4d1055), .K3_C7_W4(32'hbdde80b1), .K3_C7_W5(32'hbe6c651c), .K3_C7_W6(32'hbe02cb2d), .K3_C7_W7(32'h3c48681c), .K3_C7_W8(32'h3db168cc), 
		.K3_BIAS (32'h3d2fb8a8),

		.K4_C0_W0(32'h3e34d55c), .K4_C0_W1(32'hbacd583a), .K4_C0_W2(32'h3e0e3615), .K4_C0_W3(32'h3d3fc658), .K4_C0_W4(32'h3e447756), .K4_C0_W5(32'hbe10f3d7), .K4_C0_W6(32'hbdda511b), .K4_C0_W7(32'h3ddab716), .K4_C0_W8(32'hbcfb4931), 
		.K4_C1_W0(32'hbd41e2dd), .K4_C1_W1(32'h3d09facb), .K4_C1_W2(32'hbe208db1), .K4_C1_W3(32'h3cf930f0), .K4_C1_W4(32'h3e1f3c37), .K4_C1_W5(32'h3e2513c6), .K4_C1_W6(32'hbde30784), .K4_C1_W7(32'h3dc0c3b7), .K4_C1_W8(32'hbccfd2ef), 
		.K4_C2_W0(32'h3e2d991d), .K4_C2_W1(32'h3c841d57), .K4_C2_W2(32'h3dac3001), .K4_C2_W3(32'hbd9d1f42), .K4_C2_W4(32'hbd9b6c93), .K4_C2_W5(32'hbcac9f51), .K4_C2_W6(32'hbd4d15f4), .K4_C2_W7(32'h3d2e1dd5), .K4_C2_W8(32'hbd223bfd), 
		.K4_C3_W0(32'hbdb886e8), .K4_C3_W1(32'hbe43196e), .K4_C3_W2(32'hbe08d271), .K4_C3_W3(32'hbe09b3f4), .K4_C3_W4(32'hbe0ed5f9), .K4_C3_W5(32'hbe562627), .K4_C3_W6(32'h3e2acfa6), .K4_C3_W7(32'hbe527ee4), .K4_C3_W8(32'hbdf8a82d), 
		.K4_C4_W0(32'h3e12f28b), .K4_C4_W1(32'hbdba966e), .K4_C4_W2(32'hbe0cd8eb), .K4_C4_W3(32'hbccfb7bf), .K4_C4_W4(32'hbe01f6ef), .K4_C4_W5(32'hbd61c0fc), .K4_C4_W6(32'hbe12b3bc), .K4_C4_W7(32'hbd64b208), .K4_C4_W8(32'hbd6fde11), 
		.K4_C5_W0(32'hbe396107), .K4_C5_W1(32'hbd10eba8), .K4_C5_W2(32'h3e038404), .K4_C5_W3(32'hbc5b2c4f), .K4_C5_W4(32'hbe0bf77e), .K4_C5_W5(32'h3ceff2e7), .K4_C5_W6(32'hbd11a6be), .K4_C5_W7(32'hbd4dddd0), .K4_C5_W8(32'h3e266b27), 
		.K4_C6_W0(32'h3e55c773), .K4_C6_W1(32'h3e8014f8), .K4_C6_W2(32'h3d7a5ce1), .K4_C6_W3(32'h3cdec394), .K4_C6_W4(32'h3d4a4ac2), .K4_C6_W5(32'h3da8084c), .K4_C6_W6(32'h3dbf2532), .K4_C6_W7(32'hbde1115f), .K4_C6_W8(32'hbca87cc6), 
		.K4_C7_W0(32'h3c8dd883), .K4_C7_W1(32'hbe2b833b), .K4_C7_W2(32'h3e1ce11d), .K4_C7_W3(32'h3c973f7c), .K4_C7_W4(32'h3ddb4e83), .K4_C7_W5(32'h3e1791d1), .K4_C7_W6(32'h3e4b36ad), .K4_C7_W7(32'h3d5316b5), .K4_C7_W8(32'h3bd095cd), 
		.K4_BIAS (32'h3c4410de),

		.K5_C0_W0(32'hbe01a52c), .K5_C0_W1(32'hbde9a228), .K5_C0_W2(32'hbd5f4831), .K5_C0_W3(32'h3be42213), .K5_C0_W4(32'h3cbfa79f), .K5_C0_W5(32'hbce1a844), .K5_C0_W6(32'hbd870f2e), .K5_C0_W7(32'h3a279f78), .K5_C0_W8(32'hbe65b270), 
		.K5_C1_W0(32'h3e44e1f8), .K5_C1_W1(32'hbe05e89c), .K5_C1_W2(32'hbc32a486), .K5_C1_W3(32'h3e4c3f57), .K5_C1_W4(32'h3e42a233), .K5_C1_W5(32'hbd886d36), .K5_C1_W6(32'hbd4c9c42), .K5_C1_W7(32'h3ce4c0f7), .K5_C1_W8(32'h3e38789a), 
		.K5_C2_W0(32'h3e037f25), .K5_C2_W1(32'h3e12a5c4), .K5_C2_W2(32'hbe36b636), .K5_C2_W3(32'h3e3ee5e4), .K5_C2_W4(32'hbe00a366), .K5_C2_W5(32'hbd058fbe), .K5_C2_W6(32'h3e3a9bf1), .K5_C2_W7(32'hbcb396f9), .K5_C2_W8(32'h3da1545b), 
		.K5_C3_W0(32'hbe349152), .K5_C3_W1(32'hbd3e26a9), .K5_C3_W2(32'hbd0a3957), .K5_C3_W3(32'h3e0d2d23), .K5_C3_W4(32'h3dbb1d0a), .K5_C3_W5(32'h3e400c28), .K5_C3_W6(32'h3e4c4106), .K5_C3_W7(32'h3d6928b2), .K5_C3_W8(32'hbe0aa7e8), 
		.K5_C4_W0(32'hbe227a1a), .K5_C4_W1(32'hbdd63631), .K5_C4_W2(32'hbe0d6b6d), .K5_C4_W3(32'hbdbd6068), .K5_C4_W4(32'hbdc098ee), .K5_C4_W5(32'hbd004a69), .K5_C4_W6(32'hbd98b1aa), .K5_C4_W7(32'h3d5e4cce), .K5_C4_W8(32'hbe5b1879), 
		.K5_C5_W0(32'h3e37cd8d), .K5_C5_W1(32'h3bc1bd23), .K5_C5_W2(32'h3e007afe), .K5_C5_W3(32'hbdd29d24), .K5_C5_W4(32'hbc449a07), .K5_C5_W5(32'h3e17b76f), .K5_C5_W6(32'hbc021543), .K5_C5_W7(32'hbe41f3b1), .K5_C5_W8(32'h3d2af432), 
		.K5_C6_W0(32'hbdf8923f), .K5_C6_W1(32'h3db49556), .K5_C6_W2(32'h3d8836be), .K5_C6_W3(32'hbe8f6b15), .K5_C6_W4(32'hbdb9c4fb), .K5_C6_W5(32'hbda2ff0a), .K5_C6_W6(32'hbd291af8), .K5_C6_W7(32'h3ddca398), .K5_C6_W8(32'h3c4d5aa6), 
		.K5_C7_W0(32'h3ddf10f8), .K5_C7_W1(32'hbcc7d42e), .K5_C7_W2(32'hbddd8ef2), .K5_C7_W3(32'h3de67332), .K5_C7_W4(32'hbd9567c4), .K5_C7_W5(32'hbe6dd703), .K5_C7_W6(32'hbd5af61a), .K5_C7_W7(32'hbe06520d), .K5_C7_W8(32'h3cd46cae), 
		.K5_BIAS (32'hbcc74b7d),

		.K6_C0_W0(32'hbd8a0ed6), .K6_C0_W1(32'h3e101741), .K6_C0_W2(32'hbdb22e49), .K6_C0_W3(32'h3ddc8e63), .K6_C0_W4(32'h3d33a25d), .K6_C0_W5(32'hbde31f8c), .K6_C0_W6(32'h3e28c82b), .K6_C0_W7(32'hbe68de06), .K6_C0_W8(32'hbe28defd), 
		.K6_C1_W0(32'h3e2229ca), .K6_C1_W1(32'hbde9204c), .K6_C1_W2(32'h3e50a8b6), .K6_C1_W3(32'h3e180dc3), .K6_C1_W4(32'hbe346850), .K6_C1_W5(32'hbda04994), .K6_C1_W6(32'hbd370d3a), .K6_C1_W7(32'h3dc4c116), .K6_C1_W8(32'h3e69f453), 
		.K6_C2_W0(32'hbe4c77f2), .K6_C2_W1(32'h3d0c94f1), .K6_C2_W2(32'h3e28d408), .K6_C2_W3(32'h3e273709), .K6_C2_W4(32'hbe4a185f), .K6_C2_W5(32'h3db1d6b1), .K6_C2_W6(32'h3db2b37b), .K6_C2_W7(32'h3d8c2a81), .K6_C2_W8(32'hbe10b25c), 
		.K6_C3_W0(32'hbda33507), .K6_C3_W1(32'hbde09883), .K6_C3_W2(32'h3dcb3e41), .K6_C3_W3(32'h3db41f58), .K6_C3_W4(32'hbddb06d0), .K6_C3_W5(32'h3d18f0d7), .K6_C3_W6(32'h3e16a0c4), .K6_C3_W7(32'hbd80b8bf), .K6_C3_W8(32'hbe3fb354), 
		.K6_C4_W0(32'hbe02cc31), .K6_C4_W1(32'hbe2db3c4), .K6_C4_W2(32'hbd328102), .K6_C4_W3(32'h3e308105), .K6_C4_W4(32'h3c1278b2), .K6_C4_W5(32'hbdb57d3e), .K6_C4_W6(32'hbdf93aff), .K6_C4_W7(32'hbcd73943), .K6_C4_W8(32'hbe1dba2c), 
		.K6_C5_W0(32'h3e43e600), .K6_C5_W1(32'hbbac5c18), .K6_C5_W2(32'h3b1d64fa), .K6_C5_W3(32'h3ca8a63f), .K6_C5_W4(32'h3e2a3722), .K6_C5_W5(32'hbdc84b33), .K6_C5_W6(32'hbd44f926), .K6_C5_W7(32'h3df7afee), .K6_C5_W8(32'h3dfbb838), 
		.K6_C6_W0(32'hbdc59a52), .K6_C6_W1(32'hbca91843), .K6_C6_W2(32'h3de9c250), .K6_C6_W3(32'hbe665606), .K6_C6_W4(32'hbdc76314), .K6_C6_W5(32'h3e1a42b0), .K6_C6_W6(32'hbb389d85), .K6_C6_W7(32'hbe537bf3), .K6_C6_W8(32'hbe459e15), 
		.K6_C7_W0(32'hbe6802ad), .K6_C7_W1(32'hbd4d5db6), .K6_C7_W2(32'hbd8bd697), .K6_C7_W3(32'hbe284881), .K6_C7_W4(32'h3e283928), .K6_C7_W5(32'hbdd8bfd1), .K6_C7_W6(32'h3d33e425), .K6_C7_W7(32'h3d0602b4), .K6_C7_W8(32'hbe008112), 
		.K6_BIAS (32'hbd2f824c),

		.K7_C0_W0(32'h3c2b4ff5), .K7_C0_W1(32'h3deef644), .K7_C0_W2(32'hbc11e300), .K7_C0_W3(32'h3c73a02e), .K7_C0_W4(32'h3c1a567d), .K7_C0_W5(32'hbd53bcab), .K7_C0_W6(32'hbe46e574), .K7_C0_W7(32'hbd8ab383), .K7_C0_W8(32'h3e16b313), 
		.K7_C1_W0(32'h3e16111d), .K7_C1_W1(32'h3d86246a), .K7_C1_W2(32'hbdae7cfd), .K7_C1_W3(32'hbdc36a1a), .K7_C1_W4(32'hbe45e8b4), .K7_C1_W5(32'hbdf434ad), .K7_C1_W6(32'h3dfa7788), .K7_C1_W7(32'h3e43f88e), .K7_C1_W8(32'hbdc15aa6), 
		.K7_C2_W0(32'h3d16423b), .K7_C2_W1(32'h3c8b14b8), .K7_C2_W2(32'hbe243c87), .K7_C2_W3(32'h3dfdcf3c), .K7_C2_W4(32'h3d0a5300), .K7_C2_W5(32'h3d8f93b9), .K7_C2_W6(32'hbdeb202d), .K7_C2_W7(32'h3e23b1fb), .K7_C2_W8(32'hbe0c426e), 
		.K7_C3_W0(32'h3da8ffcb), .K7_C3_W1(32'h3e38fadf), .K7_C3_W2(32'h3d41a5b3), .K7_C3_W3(32'hbe4e20f2), .K7_C3_W4(32'h3d806e60), .K7_C3_W5(32'hbe182a14), .K7_C3_W6(32'h3e264bc8), .K7_C3_W7(32'hbd7b7bde), .K7_C3_W8(32'hbe075c5b), 
		.K7_C4_W0(32'h3db9a226), .K7_C4_W1(32'hbe336150), .K7_C4_W2(32'hbd8be0d4), .K7_C4_W3(32'h3d06b995), .K7_C4_W4(32'h3e0cab00), .K7_C4_W5(32'hbd858853), .K7_C4_W6(32'h3e25679a), .K7_C4_W7(32'h3e331455), .K7_C4_W8(32'h3e4b7703), 
		.K7_C5_W0(32'h3e1095dd), .K7_C5_W1(32'hbdf9f67c), .K7_C5_W2(32'hbcf94b9f), .K7_C5_W3(32'h3de96c6e), .K7_C5_W4(32'h3d8288ac), .K7_C5_W5(32'h3e4f95b0), .K7_C5_W6(32'h3d16f6f6), .K7_C5_W7(32'hba4453a4), .K7_C5_W8(32'hbe045b58), 
		.K7_C6_W0(32'hbdbc3595), .K7_C6_W1(32'hbd0a3550), .K7_C6_W2(32'hbe2fe799), .K7_C6_W3(32'hbdf0b54c), .K7_C6_W4(32'hbdb98476), .K7_C6_W5(32'h3e10166b), .K7_C6_W6(32'hbe2885ec), .K7_C6_W7(32'hbda01d9d), .K7_C6_W8(32'hbd5b337c), 
		.K7_C7_W0(32'hbd520671), .K7_C7_W1(32'hbd5dd339), .K7_C7_W2(32'h3e1291af), .K7_C7_W3(32'hbe5d3f43), .K7_C7_W4(32'hbd10382e), .K7_C7_W5(32'hbd8001ee), .K7_C7_W6(32'hbdd01d22), .K7_C7_W7(32'hbe678b5a), .K7_C7_W8(32'hbdaca6d2), 
		.K7_BIAS (32'h3d22f964)
		)
		block1_conv2(
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