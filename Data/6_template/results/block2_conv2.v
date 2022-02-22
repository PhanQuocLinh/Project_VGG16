`ifndef ACTIVATE_INCLUDED
    `include "activate.v"
    `define ACTIVATE_INCLUDED
`endif
`ifndef MAX_POOLING_INCLUDED
    `include "max_pooling.v"
    `define MAX_POOLING_INCLUDED
`endif

module block2_conv2 #(
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
		.K0_C0_W0(32'hbe0da359), .K0_C0_W1(32'h3dfc8ad7), .K0_C0_W2(32'hbd1af968), .K0_C0_W3(32'h3e2b761a), .K0_C0_W4(32'h3e152f6f), .K0_C0_W5(32'h3d53c402), .K0_C0_W6(32'h3dc2a129), .K0_C0_W7(32'hbd6a699a), .K0_C0_W8(32'hbd4dd614), 
		.K0_C1_W0(32'hbd0d36cb), .K0_C1_W1(32'h3ceb81ed), .K0_C1_W2(32'hbd8cb5d3), .K0_C1_W3(32'hbdf9384c), .K0_C1_W4(32'hbdc5b5b4), .K0_C1_W5(32'hbe1d35ef), .K0_C1_W6(32'h3d8ef6d8), .K0_C1_W7(32'h3e2e0506), .K0_C1_W8(32'hbb832405), 
		.K0_C2_W0(32'h3deff8e4), .K0_C2_W1(32'h3e2d4aa9), .K0_C2_W2(32'h3e599465), .K0_C2_W3(32'hbc4cd25f), .K0_C2_W4(32'hbcc30dc5), .K0_C2_W5(32'h3e565a90), .K0_C2_W6(32'h3e2c0f1d), .K0_C2_W7(32'h3d81d908), .K0_C2_W8(32'h3e0498b7), 
		.K0_C3_W0(32'h3e459a2e), .K0_C3_W1(32'h3dbf1576), .K0_C3_W2(32'h3b36d9c6), .K0_C3_W3(32'hbe308358), .K0_C3_W4(32'h3db5fdb0), .K0_C3_W5(32'hbd40c069), .K0_C3_W6(32'h3dca2a85), .K0_C3_W7(32'h3e057e63), .K0_C3_W8(32'h3e4d93f8), 
		.K0_C4_W0(32'h3dc7b6eb), .K0_C4_W1(32'hbe5b8fad), .K0_C4_W2(32'hbd928b80), .K0_C4_W3(32'h3da26eef), .K0_C4_W4(32'hbd574e59), .K0_C4_W5(32'hbcc4c014), .K0_C4_W6(32'hbceac551), .K0_C4_W7(32'h3ddbc38a), .K0_C4_W8(32'hbceedda4), 
		.K0_C5_W0(32'hbcc7b397), .K0_C5_W1(32'hbd00765d), .K0_C5_W2(32'hbe0fadfe), .K0_C5_W3(32'h3e140e7b), .K0_C5_W4(32'h3de73545), .K0_C5_W5(32'hbe0b124a), .K0_C5_W6(32'hbdb1b41a), .K0_C5_W7(32'h3d6a67a3), .K0_C5_W8(32'hbe3dae41), 
		.K0_C6_W0(32'hbe17145b), .K0_C6_W1(32'h3e07512f), .K0_C6_W2(32'h3e11d893), .K0_C6_W3(32'hbe048462), .K0_C6_W4(32'h3c2d8708), .K0_C6_W5(32'hbcfd822a), .K0_C6_W6(32'hbdbd4b3c), .K0_C6_W7(32'hbdad77ec), .K0_C6_W8(32'hbe3a05ba), 
		.K0_C7_W0(32'h3e069210), .K0_C7_W1(32'h3da6e275), .K0_C7_W2(32'hbcd5c330), .K0_C7_W3(32'h3e246fc3), .K0_C7_W4(32'hbe19c55c), .K0_C7_W5(32'h3d871b2f), .K0_C7_W6(32'hbe415395), .K0_C7_W7(32'hbd85db42), .K0_C7_W8(32'hbd990ff0), 
		.K0_BIAS (32'hbc18ec33),

		.K1_C0_W0(32'h3e0a1943), .K1_C0_W1(32'h3e2fc3df), .K1_C0_W2(32'h3ca44fd5), .K1_C0_W3(32'hbe388da2), .K1_C0_W4(32'h3d7ecb2f), .K1_C0_W5(32'hbe128807), .K1_C0_W6(32'h3e0a1282), .K1_C0_W7(32'h3d25bd48), .K1_C0_W8(32'h3dc6b317), 
		.K1_C1_W0(32'hbc1ef402), .K1_C1_W1(32'h3db983be), .K1_C1_W2(32'h3de69538), .K1_C1_W3(32'hbe3f1a5a), .K1_C1_W4(32'h3d136ff3), .K1_C1_W5(32'hbe18c015), .K1_C1_W6(32'h3de4102d), .K1_C1_W7(32'hbe0eb0b6), .K1_C1_W8(32'h3cf761b9), 
		.K1_C2_W0(32'hbdd52614), .K1_C2_W1(32'hbd93dae1), .K1_C2_W2(32'h3d5f2995), .K1_C2_W3(32'hbbfeaee9), .K1_C2_W4(32'hbda16be7), .K1_C2_W5(32'h3ccfe053), .K1_C2_W6(32'h3d36e2da), .K1_C2_W7(32'hbc851421), .K1_C2_W8(32'h3d38720b), 
		.K1_C3_W0(32'hbd19345c), .K1_C3_W1(32'h3db32c8f), .K1_C3_W2(32'hbe0ab4ba), .K1_C3_W3(32'hbce6d1f4), .K1_C3_W4(32'h3de5852c), .K1_C3_W5(32'hbde888ec), .K1_C3_W6(32'h3e0a5b33), .K1_C3_W7(32'hbe0ce7a7), .K1_C3_W8(32'hbe0d6649), 
		.K1_C4_W0(32'h3e4fcf1b), .K1_C4_W1(32'h3dae1d31), .K1_C4_W2(32'hbd805788), .K1_C4_W3(32'hbb03ed8f), .K1_C4_W4(32'h3d2a2572), .K1_C4_W5(32'hbe74b8b9), .K1_C4_W6(32'h3dc0eb32), .K1_C4_W7(32'h3e05af85), .K1_C4_W8(32'hbe554afe), 
		.K1_C5_W0(32'h3da2471e), .K1_C5_W1(32'hbe21b19a), .K1_C5_W2(32'hbe329a29), .K1_C5_W3(32'h3aa2dc3d), .K1_C5_W4(32'h3e514221), .K1_C5_W5(32'h3d8bc52f), .K1_C5_W6(32'hbe4c7906), .K1_C5_W7(32'h3df86086), .K1_C5_W8(32'h3d9ebd5b), 
		.K1_C6_W0(32'hbdb623f0), .K1_C6_W1(32'h3e3c5f4e), .K1_C6_W2(32'hbe2f9a7f), .K1_C6_W3(32'h3dbc2f8d), .K1_C6_W4(32'hbd550727), .K1_C6_W5(32'h3dbaaee9), .K1_C6_W6(32'h3e0f2335), .K1_C6_W7(32'h3e051eec), .K1_C6_W8(32'h3e5b671f), 
		.K1_C7_W0(32'h3d893273), .K1_C7_W1(32'hbdc6490c), .K1_C7_W2(32'h3de85d2d), .K1_C7_W3(32'h3e2a74f4), .K1_C7_W4(32'h3e228470), .K1_C7_W5(32'hbd94822f), .K1_C7_W6(32'h3b07a973), .K1_C7_W7(32'h3dec1991), .K1_C7_W8(32'hbd9c8ee0), 
		.K1_BIAS (32'h3c9c7489),

		.K2_C0_W0(32'hbced4b5e), .K2_C0_W1(32'hbe05678e), .K2_C0_W2(32'h3dce3535), .K2_C0_W3(32'h3c965888), .K2_C0_W4(32'hbe1ce403), .K2_C0_W5(32'hbd936049), .K2_C0_W6(32'h3d34a48a), .K2_C0_W7(32'hbd161c1e), .K2_C0_W8(32'h3c965fdd), 
		.K2_C1_W0(32'h3d7bf94a), .K2_C1_W1(32'h3dfda5c8), .K2_C1_W2(32'h3e49d701), .K2_C1_W3(32'hbe3601a3), .K2_C1_W4(32'h3e15c264), .K2_C1_W5(32'h3dab5273), .K2_C1_W6(32'hbcc973d9), .K2_C1_W7(32'h3db35da8), .K2_C1_W8(32'h3d59f284), 
		.K2_C2_W0(32'hbdb68848), .K2_C2_W1(32'h3d8ae1ba), .K2_C2_W2(32'h3e02e244), .K2_C2_W3(32'h3d96e907), .K2_C2_W4(32'h3da21fde), .K2_C2_W5(32'h3e23acd5), .K2_C2_W6(32'h3e6573c2), .K2_C2_W7(32'hbd2f6fff), .K2_C2_W8(32'h3d325889), 
		.K2_C3_W0(32'hbe25c291), .K2_C3_W1(32'hbdb2562b), .K2_C3_W2(32'h3d26070f), .K2_C3_W3(32'hbdd4d04e), .K2_C3_W4(32'h3e04600d), .K2_C3_W5(32'h3dafe218), .K2_C3_W6(32'h3d65f761), .K2_C3_W7(32'hbd9c6920), .K2_C3_W8(32'h3e13f470), 
		.K2_C4_W0(32'hbdb2a9a9), .K2_C4_W1(32'hbcb87181), .K2_C4_W2(32'hbe4bd119), .K2_C4_W3(32'hbe225c3e), .K2_C4_W4(32'hbdfc4d90), .K2_C4_W5(32'hbe4af657), .K2_C4_W6(32'h3dd79aca), .K2_C4_W7(32'hbd495de1), .K2_C4_W8(32'hbde3b18e), 
		.K2_C5_W0(32'hbe391f26), .K2_C5_W1(32'h3e337505), .K2_C5_W2(32'h3b491086), .K2_C5_W3(32'hbd70e27d), .K2_C5_W4(32'hbd3d1887), .K2_C5_W5(32'hbe0a2ff3), .K2_C5_W6(32'hbd2c6ab9), .K2_C5_W7(32'h3be14e41), .K2_C5_W8(32'h3e0fd549), 
		.K2_C6_W0(32'h3d9a25c7), .K2_C6_W1(32'hbdb6bff4), .K2_C6_W2(32'h3d0bb37b), .K2_C6_W3(32'h3ddf274c), .K2_C6_W4(32'hbe599b4c), .K2_C6_W5(32'hbdec1238), .K2_C6_W6(32'h3da2b52f), .K2_C6_W7(32'h3d5531b6), .K2_C6_W8(32'h3df002dc), 
		.K2_C7_W0(32'hbe594fcb), .K2_C7_W1(32'hbd96f366), .K2_C7_W2(32'hbe32d478), .K2_C7_W3(32'h3d8452c2), .K2_C7_W4(32'h3dc29df7), .K2_C7_W5(32'hbe6d0e4e), .K2_C7_W6(32'h3d93e9d2), .K2_C7_W7(32'hbe23a575), .K2_C7_W8(32'hbca1862c), 
		.K2_BIAS (32'hbcfc30c7),

		.K3_C0_W0(32'hbd2792a3), .K3_C0_W1(32'hbd8ea36a), .K3_C0_W2(32'h3e5f52b7), .K3_C0_W3(32'hbd622ee0), .K3_C0_W4(32'hbc72b449), .K3_C0_W5(32'h3c0f1251), .K3_C0_W6(32'hbdaafc80), .K3_C0_W7(32'hbdb4b93e), .K3_C0_W8(32'h3ae59764), 
		.K3_C1_W0(32'hbe039f4e), .K3_C1_W1(32'h3d913729), .K3_C1_W2(32'h3d45eb98), .K3_C1_W3(32'h3d066206), .K3_C1_W4(32'h3e560772), .K3_C1_W5(32'h3d1d5b60), .K3_C1_W6(32'h3dc75649), .K3_C1_W7(32'hbe2e387c), .K3_C1_W8(32'h3e0ac2bc), 
		.K3_C2_W0(32'hbdade07d), .K3_C2_W1(32'hbe43cc3a), .K3_C2_W2(32'hbd92cd1b), .K3_C2_W3(32'h3de6fad0), .K3_C2_W4(32'h3e1c6479), .K3_C2_W5(32'h3d83325f), .K3_C2_W6(32'hbd44621d), .K3_C2_W7(32'hbb394170), .K3_C2_W8(32'h3e27a926), 
		.K3_C3_W0(32'hbd8234ce), .K3_C3_W1(32'hbd989b0a), .K3_C3_W2(32'h3d8601ae), .K3_C3_W3(32'hbd930a12), .K3_C3_W4(32'hbd6f64a0), .K3_C3_W5(32'h3e4d2e27), .K3_C3_W6(32'h3e24b414), .K3_C3_W7(32'hbe3b3b34), .K3_C3_W8(32'h3d70d893), 
		.K3_C4_W0(32'h3d6459c6), .K3_C4_W1(32'h3e051723), .K3_C4_W2(32'hbdba5a5e), .K3_C4_W3(32'h3d96b3d2), .K3_C4_W4(32'hbcd8ab2f), .K3_C4_W5(32'hbdd5c58f), .K3_C4_W6(32'h3deacd16), .K3_C4_W7(32'h3d1cfdd3), .K3_C4_W8(32'hbe5178af), 
		.K3_C5_W0(32'hbd1a9c2a), .K3_C5_W1(32'h3e4d14bb), .K3_C5_W2(32'hbdec41ed), .K3_C5_W3(32'h3dc57a9d), .K3_C5_W4(32'hbd356d9b), .K3_C5_W5(32'hbc911fae), .K3_C5_W6(32'h3e24c557), .K3_C5_W7(32'h3e3733b5), .K3_C5_W8(32'hbd9ac0b0), 
		.K3_C6_W0(32'h3dc0b204), .K3_C6_W1(32'hbe157a13), .K3_C6_W2(32'hbe5db530), .K3_C6_W3(32'h3d810588), .K3_C6_W4(32'h3dd738de), .K3_C6_W5(32'hbdf54191), .K3_C6_W6(32'hbe0500b2), .K3_C6_W7(32'hbd72e4b0), .K3_C6_W8(32'hbddd6cc8), 
		.K3_C7_W0(32'h3e1b97ed), .K3_C7_W1(32'h3c0e5a52), .K3_C7_W2(32'h3e124b96), .K3_C7_W3(32'h3e2e8529), .K3_C7_W4(32'h3c054720), .K3_C7_W5(32'hbd192ffe), .K3_C7_W6(32'h3e32d176), .K3_C7_W7(32'h3e2548ce), .K3_C7_W8(32'hbe290d51), 
		.K3_BIAS (32'hbc776d52),

		.K4_C0_W0(32'hbce23415), .K4_C0_W1(32'h3de899e9), .K4_C0_W2(32'h3e0d5168), .K4_C0_W3(32'hbceea09e), .K4_C0_W4(32'h3e41a9f3), .K4_C0_W5(32'hbc76e0a4), .K4_C0_W6(32'h3df22ca8), .K4_C0_W7(32'hbe3b62e7), .K4_C0_W8(32'hba8f2a87), 
		.K4_C1_W0(32'h3d11aa41), .K4_C1_W1(32'hbdf48cb7), .K4_C1_W2(32'h3e1b02ee), .K4_C1_W3(32'h3d519232), .K4_C1_W4(32'h3e4c9e53), .K4_C1_W5(32'hbe3eb907), .K4_C1_W6(32'hbe2e0c37), .K4_C1_W7(32'hbe1ffc71), .K4_C1_W8(32'hbdf48436), 
		.K4_C2_W0(32'hbdf9bf45), .K4_C2_W1(32'hbe0b8dbd), .K4_C2_W2(32'hbd947040), .K4_C2_W3(32'h3c5ed208), .K4_C2_W4(32'hbdd7d51e), .K4_C2_W5(32'h3df5008c), .K4_C2_W6(32'hbd73ed47), .K4_C2_W7(32'h3c76b28a), .K4_C2_W8(32'hbc4dcc68), 
		.K4_C3_W0(32'hbe2d12e8), .K4_C3_W1(32'hbd9cfc5a), .K4_C3_W2(32'hbe0ce1ac), .K4_C3_W3(32'h3e566b13), .K4_C3_W4(32'h3e49f62c), .K4_C3_W5(32'h3d649963), .K4_C3_W6(32'h3e4b2209), .K4_C3_W7(32'h3d1a1b20), .K4_C3_W8(32'h3e5ba41f), 
		.K4_C4_W0(32'hbe1cdf0e), .K4_C4_W1(32'h3e031e54), .K4_C4_W2(32'h3dc81c15), .K4_C4_W3(32'h3d89a77a), .K4_C4_W4(32'hbde1b56e), .K4_C4_W5(32'h3e2424ad), .K4_C4_W6(32'hbddfd3e7), .K4_C4_W7(32'hbe232d58), .K4_C4_W8(32'h3e57152c), 
		.K4_C5_W0(32'h3e1da66a), .K4_C5_W1(32'h3e068f50), .K4_C5_W2(32'h3e460dc9), .K4_C5_W3(32'hbd33d179), .K4_C5_W4(32'h389c6143), .K4_C5_W5(32'h3e54496d), .K4_C5_W6(32'hbe266e06), .K4_C5_W7(32'hbc2cf39b), .K4_C5_W8(32'h3d9c7175), 
		.K4_C6_W0(32'hbd2fa3db), .K4_C6_W1(32'hbca6ffef), .K4_C6_W2(32'hbd86851d), .K4_C6_W3(32'h3c8a5315), .K4_C6_W4(32'h3d5a4b92), .K4_C6_W5(32'hbe5b6bff), .K4_C6_W6(32'hbbe84e0b), .K4_C6_W7(32'hbdcf6b9f), .K4_C6_W8(32'hbd94449c), 
		.K4_C7_W0(32'hbd21cb35), .K4_C7_W1(32'hbd712490), .K4_C7_W2(32'hbe041031), .K4_C7_W3(32'hbe0d091d), .K4_C7_W4(32'hbe3ffb95), .K4_C7_W5(32'h3c228ba6), .K4_C7_W6(32'hbe087d06), .K4_C7_W7(32'hbe04f735), .K4_C7_W8(32'h3e0339ed), 
		.K4_BIAS (32'hbcf8946f),

		.K5_C0_W0(32'hbdbc8f9b), .K5_C0_W1(32'h3e1954a1), .K5_C0_W2(32'hbd5578ea), .K5_C0_W3(32'h3d406111), .K5_C0_W4(32'h3d7639d8), .K5_C0_W5(32'hbdba3ce0), .K5_C0_W6(32'hbd39c352), .K5_C0_W7(32'h3d3b29c4), .K5_C0_W8(32'h3bb7a538), 
		.K5_C1_W0(32'h3d989808), .K5_C1_W1(32'hbde83e49), .K5_C1_W2(32'h3e2ad7ea), .K5_C1_W3(32'hbe143611), .K5_C1_W4(32'h39b4a2ae), .K5_C1_W5(32'h3e4a760d), .K5_C1_W6(32'h3cf4fa84), .K5_C1_W7(32'hbca0e61d), .K5_C1_W8(32'h3df5fe61), 
		.K5_C2_W0(32'hbda45f26), .K5_C2_W1(32'h3d46e658), .K5_C2_W2(32'hbd2d33f0), .K5_C2_W3(32'h3ddb68e2), .K5_C2_W4(32'hbdd014de), .K5_C2_W5(32'h3d396a2b), .K5_C2_W6(32'hbe5bcd5d), .K5_C2_W7(32'hbde2b556), .K5_C2_W8(32'hbe33d48f), 
		.K5_C3_W0(32'hbe1dd332), .K5_C3_W1(32'h3d630015), .K5_C3_W2(32'h3d84bfe4), .K5_C3_W3(32'hbe3459f4), .K5_C3_W4(32'hbe2e06e7), .K5_C3_W5(32'h3decd583), .K5_C3_W6(32'hbce61e73), .K5_C3_W7(32'h3cf40911), .K5_C3_W8(32'h3e3988a4), 
		.K5_C4_W0(32'h3d32cf87), .K5_C4_W1(32'hbe2b0348), .K5_C4_W2(32'hbccef6d9), .K5_C4_W3(32'hbd5663c3), .K5_C4_W4(32'hbe5dbdca), .K5_C4_W5(32'h3da1bb70), .K5_C4_W6(32'hbd521d38), .K5_C4_W7(32'hbe161435), .K5_C4_W8(32'h3e11b948), 
		.K5_C5_W0(32'h3de2d8ce), .K5_C5_W1(32'hbd71e599), .K5_C5_W2(32'hbd8f1819), .K5_C5_W3(32'h3da872c7), .K5_C5_W4(32'h3e4b26d0), .K5_C5_W5(32'hbe09509a), .K5_C5_W6(32'hbbeb5517), .K5_C5_W7(32'h3d8504c3), .K5_C5_W8(32'hbc12c6ad), 
		.K5_C6_W0(32'h3be6fe75), .K5_C6_W1(32'h3d4d41d5), .K5_C6_W2(32'hbe0f3ee3), .K5_C6_W3(32'hbe0d900d), .K5_C6_W4(32'h3e30930f), .K5_C6_W5(32'hbbd84ad4), .K5_C6_W6(32'h3e4bb3bd), .K5_C6_W7(32'hbc5756f6), .K5_C6_W8(32'h3e45af03), 
		.K5_C7_W0(32'hbd55d5fe), .K5_C7_W1(32'hbd841202), .K5_C7_W2(32'h3d60d641), .K5_C7_W3(32'hbdbcc135), .K5_C7_W4(32'h3dec8d70), .K5_C7_W5(32'hbe2ffc1c), .K5_C7_W6(32'h3e1e2594), .K5_C7_W7(32'hbdfb683d), .K5_C7_W8(32'h3e45b762), 
		.K5_BIAS (32'h3d10ec02),

		.K6_C0_W0(32'hbdb769dc), .K6_C0_W1(32'hbdb1739b), .K6_C0_W2(32'h3ca7610a), .K6_C0_W3(32'hbd585595), .K6_C0_W4(32'hbe28bd7d), .K6_C0_W5(32'hbdfb3cf0), .K6_C0_W6(32'hbe2fd953), .K6_C0_W7(32'h3d8b9c2d), .K6_C0_W8(32'h3da20da9), 
		.K6_C1_W0(32'h3dfcb3a6), .K6_C1_W1(32'h3e2b8e35), .K6_C1_W2(32'h3da91a2d), .K6_C1_W3(32'h3dff3153), .K6_C1_W4(32'h3e5a455a), .K6_C1_W5(32'hbe3c03c5), .K6_C1_W6(32'h3e05fa35), .K6_C1_W7(32'h3dbc5c40), .K6_C1_W8(32'hbcf9e812), 
		.K6_C2_W0(32'hbe2a79c5), .K6_C2_W1(32'hbdb17ccf), .K6_C2_W2(32'hbd8c12f2), .K6_C2_W3(32'hbc4015f4), .K6_C2_W4(32'hbdaecf12), .K6_C2_W5(32'hbde48065), .K6_C2_W6(32'h3e282c57), .K6_C2_W7(32'h3e04e9f5), .K6_C2_W8(32'hbe17af44), 
		.K6_C3_W0(32'h3e13c0e9), .K6_C3_W1(32'h3d7840f4), .K6_C3_W2(32'hbe2c0f6d), .K6_C3_W3(32'hbbee69d1), .K6_C3_W4(32'hbe099876), .K6_C3_W5(32'hbd5467aa), .K6_C3_W6(32'hbe33e230), .K6_C3_W7(32'hbdf68f54), .K6_C3_W8(32'h3d72272a), 
		.K6_C4_W0(32'hbe32eb09), .K6_C4_W1(32'hbe09b869), .K6_C4_W2(32'hbe25bd07), .K6_C4_W3(32'h3e3e4cf5), .K6_C4_W4(32'hbe392c97), .K6_C4_W5(32'h3e2687d1), .K6_C4_W6(32'h3cacbe23), .K6_C4_W7(32'h3cc6defa), .K6_C4_W8(32'hbe0bb69f), 
		.K6_C5_W0(32'h3dff9c1d), .K6_C5_W1(32'h3e13c10a), .K6_C5_W2(32'h3d3651be), .K6_C5_W3(32'h3d54fc45), .K6_C5_W4(32'hbdc74e55), .K6_C5_W5(32'h3de3dd4f), .K6_C5_W6(32'h3dfcaa64), .K6_C5_W7(32'h3dd3b880), .K6_C5_W8(32'h3d2ab51b), 
		.K6_C6_W0(32'hbe54654d), .K6_C6_W1(32'h3e33c5d8), .K6_C6_W2(32'hbe1e7c75), .K6_C6_W3(32'h3cdd1813), .K6_C6_W4(32'h3df4105d), .K6_C6_W5(32'hbe1d3e0a), .K6_C6_W6(32'h3d3d3ae7), .K6_C6_W7(32'h3d8f969e), .K6_C6_W8(32'hbd03f19b), 
		.K6_C7_W0(32'h3db52392), .K6_C7_W1(32'hbdd52312), .K6_C7_W2(32'hbe07359b), .K6_C7_W3(32'hbd9bdfcf), .K6_C7_W4(32'h3cacec7b), .K6_C7_W5(32'h3da9c483), .K6_C7_W6(32'h3d9dee49), .K6_C7_W7(32'hbd8ec5d8), .K6_C7_W8(32'h3e2fc868), 
		.K6_BIAS (32'h3bdc1f75),

		.K7_C0_W0(32'h3cb7efc3), .K7_C0_W1(32'h3dc12ef7), .K7_C0_W2(32'h3d10666c), .K7_C0_W3(32'hbd18cbd7), .K7_C0_W4(32'h3b63c09f), .K7_C0_W5(32'hbe277b26), .K7_C0_W6(32'h3e0dd1a9), .K7_C0_W7(32'h3d85fb04), .K7_C0_W8(32'hbd52967e), 
		.K7_C1_W0(32'hbdf427ed), .K7_C1_W1(32'hbde2b8ec), .K7_C1_W2(32'hbdf14d77), .K7_C1_W3(32'h3de28d99), .K7_C1_W4(32'h3e136df8), .K7_C1_W5(32'h3a9e5422), .K7_C1_W6(32'hba625718), .K7_C1_W7(32'h3e007244), .K7_C1_W8(32'h3a7cd5c9), 
		.K7_C2_W0(32'h3dc4b1c1), .K7_C2_W1(32'hbdfd70a1), .K7_C2_W2(32'h3e0938dd), .K7_C2_W3(32'h3dee78d9), .K7_C2_W4(32'h3d07b869), .K7_C2_W5(32'hbdcfc927), .K7_C2_W6(32'h3d9461f2), .K7_C2_W7(32'hbe440465), .K7_C2_W8(32'h3d89cda5), 
		.K7_C3_W0(32'h3dcf7ffb), .K7_C3_W1(32'h3ddb03ea), .K7_C3_W2(32'h3e5276bd), .K7_C3_W3(32'hbe09bdbf), .K7_C3_W4(32'hbe4a75a4), .K7_C3_W5(32'hbdca147d), .K7_C3_W6(32'hbe23b69c), .K7_C3_W7(32'hbe2b6b10), .K7_C3_W8(32'h3dba96f8), 
		.K7_C4_W0(32'h3cff514c), .K7_C4_W1(32'hbd8f043f), .K7_C4_W2(32'h3e1ead8a), .K7_C4_W3(32'h3d8687ef), .K7_C4_W4(32'hbd728383), .K7_C4_W5(32'hbc8b2f8c), .K7_C4_W6(32'hbdd438dc), .K7_C4_W7(32'hb9b46fca), .K7_C4_W8(32'h3dddffb8), 
		.K7_C5_W0(32'h3dcab78b), .K7_C5_W1(32'h3e004060), .K7_C5_W2(32'h3e376280), .K7_C5_W3(32'hbe18e835), .K7_C5_W4(32'hbe086ac5), .K7_C5_W5(32'h3e37cf84), .K7_C5_W6(32'hbe6534a4), .K7_C5_W7(32'hbe113054), .K7_C5_W8(32'h3dfd2632), 
		.K7_C6_W0(32'h3e07e846), .K7_C6_W1(32'h3da54159), .K7_C6_W2(32'h3e3a999f), .K7_C6_W3(32'hbdbd7638), .K7_C6_W4(32'hbc317a87), .K7_C6_W5(32'hbdd127ac), .K7_C6_W6(32'h3d8cbfae), .K7_C6_W7(32'h3def5d70), .K7_C6_W8(32'h3e4a624f), 
		.K7_C7_W0(32'h3e40f6d8), .K7_C7_W1(32'hbe49c989), .K7_C7_W2(32'h3e467127), .K7_C7_W3(32'h3d9ad112), .K7_C7_W4(32'hbdaf5671), .K7_C7_W5(32'hbd9eb4f2), .K7_C7_W6(32'h3e45b7b1), .K7_C7_W7(32'h3dd40bac), .K7_C7_W8(32'h3e2bd4c4), 
		.K7_BIAS (32'hbd110f03)
		)
		block2_conv2(
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