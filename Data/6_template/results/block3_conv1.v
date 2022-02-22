`ifndef ACTIVATE_INCLUDED
    `include "activate.v"
    `define ACTIVATE_INCLUDED
`endif
`ifndef MAX_POOLING_INCLUDED
    `include "max_pooling.v"
    `define MAX_POOLING_INCLUDED
`endif

module block3_conv1 #(
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
		.K0_C0_W0(32'h3e2e9b62), .K0_C0_W1(32'h3e0f5996), .K0_C0_W2(32'hbd9cd5a0), .K0_C0_W3(32'h3e0f733f), .K0_C0_W4(32'h3e2c113f), .K0_C0_W5(32'hbe2e2112), .K0_C0_W6(32'hbd8924e9), .K0_C0_W7(32'h3e796e41), .K0_C0_W8(32'h3e617e63), 
		.K0_C1_W0(32'hbde29c3c), .K0_C1_W1(32'hbc876419), .K0_C1_W2(32'h3e375bbd), .K0_C1_W3(32'h3cd5ecfb), .K0_C1_W4(32'hbe043b24), .K0_C1_W5(32'h3e23f6e0), .K0_C1_W6(32'h3e1cfb38), .K0_C1_W7(32'hbdccd648), .K0_C1_W8(32'hbe2f2311), 
		.K0_C2_W0(32'hbe599262), .K0_C2_W1(32'h3e01bab4), .K0_C2_W2(32'h3da61ecd), .K0_C2_W3(32'h3e24a9d3), .K0_C2_W4(32'hbc5457a1), .K0_C2_W5(32'hbd66c781), .K0_C2_W6(32'h3d1080fa), .K0_C2_W7(32'h3e0dd78d), .K0_C2_W8(32'hbe026846), 
		.K0_C3_W0(32'hbe2bf942), .K0_C3_W1(32'h3d030e52), .K0_C3_W2(32'hbc2141b0), .K0_C3_W3(32'h3dc99d1b), .K0_C3_W4(32'h3dc88a8b), .K0_C3_W5(32'h3dec1ed2), .K0_C3_W6(32'hbe2ce8a0), .K0_C3_W7(32'h3d91e1ef), .K0_C3_W8(32'hbe3d5c41), 
		.K0_C4_W0(32'hbe369453), .K0_C4_W1(32'hbd1f8145), .K0_C4_W2(32'hbdbcd894), .K0_C4_W3(32'h3de61641), .K0_C4_W4(32'hbdb4c491), .K0_C4_W5(32'h3cc0423d), .K0_C4_W6(32'hbc4d4e26), .K0_C4_W7(32'h3d7bd520), .K0_C4_W8(32'hbbba43f8), 
		.K0_C5_W0(32'hbe285a5a), .K0_C5_W1(32'hbdfa4140), .K0_C5_W2(32'h3d3b286c), .K0_C5_W3(32'h3cef6ceb), .K0_C5_W4(32'h3dc1e74e), .K0_C5_W5(32'hbe4557bc), .K0_C5_W6(32'h3dfd0cd3), .K0_C5_W7(32'h3dcbedbb), .K0_C5_W8(32'hbe193edb), 
		.K0_C6_W0(32'h3cb55a3f), .K0_C6_W1(32'hbdde772a), .K0_C6_W2(32'h3e17d2fc), .K0_C6_W3(32'hbe32f29b), .K0_C6_W4(32'hbe46c677), .K0_C6_W5(32'h3d86bf2c), .K0_C6_W6(32'hbe0ee46e), .K0_C6_W7(32'hbe5f633f), .K0_C6_W8(32'h3dbcceba), 
		.K0_C7_W0(32'h3d4fd217), .K0_C7_W1(32'h3e4803b6), .K0_C7_W2(32'h3e518107), .K0_C7_W3(32'h3e1bfe8a), .K0_C7_W4(32'h3e425843), .K0_C7_W5(32'h3dd2b134), .K0_C7_W6(32'hbdf776c7), .K0_C7_W7(32'hbdad0979), .K0_C7_W8(32'h3d8f5fb9), 
		.K0_BIAS (32'hbcb6a174),

		.K1_C0_W0(32'h3d941846), .K1_C0_W1(32'h3d106e9d), .K1_C0_W2(32'hbe2bfb12), .K1_C0_W3(32'hbe10508f), .K1_C0_W4(32'hbe0c4656), .K1_C0_W5(32'hbce25afa), .K1_C0_W6(32'h3d8ffc7f), .K1_C0_W7(32'h3e4885d3), .K1_C0_W8(32'h3d0fc435), 
		.K1_C1_W0(32'h3dbcb435), .K1_C1_W1(32'h3d5674c4), .K1_C1_W2(32'hbd7da07f), .K1_C1_W3(32'hbc2e8941), .K1_C1_W4(32'hbd1517d6), .K1_C1_W5(32'h3e27cfd0), .K1_C1_W6(32'h3ceb11a4), .K1_C1_W7(32'hbdd8b581), .K1_C1_W8(32'h3db1023c), 
		.K1_C2_W0(32'hbca4ccb1), .K1_C2_W1(32'h3e403c3d), .K1_C2_W2(32'h3e27e947), .K1_C2_W3(32'h3d64451f), .K1_C2_W4(32'hbe395c39), .K1_C2_W5(32'h3d60cb1c), .K1_C2_W6(32'hbe518ae9), .K1_C2_W7(32'hbddef321), .K1_C2_W8(32'hbe39f02c), 
		.K1_C3_W0(32'h3de2b9e2), .K1_C3_W1(32'hbe597e8a), .K1_C3_W2(32'h3c0af39c), .K1_C3_W3(32'h3da1d8d9), .K1_C3_W4(32'h3d73c99c), .K1_C3_W5(32'hbe2bba92), .K1_C3_W6(32'hbd8b408a), .K1_C3_W7(32'hbe27c78d), .K1_C3_W8(32'hbde3f101), 
		.K1_C4_W0(32'hbe42a079), .K1_C4_W1(32'hbdaa6cf7), .K1_C4_W2(32'h3e130fe4), .K1_C4_W3(32'hbdd18dda), .K1_C4_W4(32'hbd3893f2), .K1_C4_W5(32'hbd37a6fc), .K1_C4_W6(32'hbd9ed558), .K1_C4_W7(32'h3d96fe02), .K1_C4_W8(32'hbe503469), 
		.K1_C5_W0(32'h3e395212), .K1_C5_W1(32'h3e242522), .K1_C5_W2(32'h3dfe63e0), .K1_C5_W3(32'h3d01f56f), .K1_C5_W4(32'hbe07dd55), .K1_C5_W5(32'h3d9d9b70), .K1_C5_W6(32'hbca42af2), .K1_C5_W7(32'hbd384185), .K1_C5_W8(32'hbca53566), 
		.K1_C6_W0(32'h3db0a8d7), .K1_C6_W1(32'h3e5972d7), .K1_C6_W2(32'hbe002769), .K1_C6_W3(32'h3e0aa88c), .K1_C6_W4(32'hbd1f134e), .K1_C6_W5(32'h3dcbf57c), .K1_C6_W6(32'h3e155bc4), .K1_C6_W7(32'hbcf02eb3), .K1_C6_W8(32'hbe0feb96), 
		.K1_C7_W0(32'h3e2b040b), .K1_C7_W1(32'h3dab67bd), .K1_C7_W2(32'hbdbd74bc), .K1_C7_W3(32'h3e03498a), .K1_C7_W4(32'h3cd28ccc), .K1_C7_W5(32'h3e049bbd), .K1_C7_W6(32'hbd927877), .K1_C7_W7(32'hbe283144), .K1_C7_W8(32'hbda70b15), 
		.K1_BIAS (32'h3d76a30e),

		.K2_C0_W0(32'h3e48be1b), .K2_C0_W1(32'h3e357ac5), .K2_C0_W2(32'h3e53000e), .K2_C0_W3(32'hbda8718d), .K2_C0_W4(32'h3da1d9ea), .K2_C0_W5(32'h3e396a74), .K2_C0_W6(32'h3e26db66), .K2_C0_W7(32'h3e122841), .K2_C0_W8(32'h3df42350), 
		.K2_C1_W0(32'hbcff530f), .K2_C1_W1(32'h3e459ba1), .K2_C1_W2(32'hbe18f2a1), .K2_C1_W3(32'h3d8b044f), .K2_C1_W4(32'h3e0da0e8), .K2_C1_W5(32'h3cbfc053), .K2_C1_W6(32'h3d8d680c), .K2_C1_W7(32'hbe409576), .K2_C1_W8(32'hbcbe8243), 
		.K2_C2_W0(32'hbe2d938f), .K2_C2_W1(32'h3e4e52b0), .K2_C2_W2(32'hbe1c6bba), .K2_C2_W3(32'hbe369833), .K2_C2_W4(32'h3c8d3f34), .K2_C2_W5(32'hba8bfc87), .K2_C2_W6(32'h3e395619), .K2_C2_W7(32'h3e04f5b4), .K2_C2_W8(32'h3da7ba02), 
		.K2_C3_W0(32'h3d870f3d), .K2_C3_W1(32'hbe196e2c), .K2_C3_W2(32'hbce91d6d), .K2_C3_W3(32'h3cf01fa0), .K2_C3_W4(32'h3d0c132e), .K2_C3_W5(32'h3dba498d), .K2_C3_W6(32'h3e417f37), .K2_C3_W7(32'h3b4ef31d), .K2_C3_W8(32'h3dbc46b9), 
		.K2_C4_W0(32'hbd7a8305), .K2_C4_W1(32'h3d9ea07c), .K2_C4_W2(32'h3bed4663), .K2_C4_W3(32'hbd5fcb29), .K2_C4_W4(32'hbda42858), .K2_C4_W5(32'hbc99ee08), .K2_C4_W6(32'hbdd85c04), .K2_C4_W7(32'h3db9328f), .K2_C4_W8(32'h3db4a4cf), 
		.K2_C5_W0(32'h3d00da76), .K2_C5_W1(32'hbe300c6a), .K2_C5_W2(32'hbe4f07ca), .K2_C5_W3(32'h3ddb01e8), .K2_C5_W4(32'h3dd5dfdc), .K2_C5_W5(32'h3daa8004), .K2_C5_W6(32'hbb152342), .K2_C5_W7(32'hbe19f85d), .K2_C5_W8(32'h3ddf60f1), 
		.K2_C6_W0(32'hbe0ff59f), .K2_C6_W1(32'h3e1be064), .K2_C6_W2(32'hbe033144), .K2_C6_W3(32'h3bc77e79), .K2_C6_W4(32'hbd879862), .K2_C6_W5(32'h3d91d6d4), .K2_C6_W6(32'hbc18b95e), .K2_C6_W7(32'hbd3ef532), .K2_C6_W8(32'h3e30a01a), 
		.K2_C7_W0(32'hbde5ce56), .K2_C7_W1(32'h3dad682d), .K2_C7_W2(32'hbd29e470), .K2_C7_W3(32'hbd9d2805), .K2_C7_W4(32'h3db5a2c9), .K2_C7_W5(32'h3d0e4fa5), .K2_C7_W6(32'h3e63ea36), .K2_C7_W7(32'h3dd8bd0f), .K2_C7_W8(32'h3d491349), 
		.K2_BIAS (32'hbd32014c),

		.K3_C0_W0(32'hbd4791e9), .K3_C0_W1(32'hbc13caab), .K3_C0_W2(32'hbe0ae5a9), .K3_C0_W3(32'h3ddaa60a), .K3_C0_W4(32'h3d94d43e), .K3_C0_W5(32'hbdde278c), .K3_C0_W6(32'hbe315a0a), .K3_C0_W7(32'hbe1d4eef), .K3_C0_W8(32'hbe2b1f6f), 
		.K3_C1_W0(32'hbe329ee7), .K3_C1_W1(32'hbe40b5bf), .K3_C1_W2(32'hbe743d3c), .K3_C1_W3(32'h3e1a43d3), .K3_C1_W4(32'hbe0b92d0), .K3_C1_W5(32'hbe1e84b3), .K3_C1_W6(32'h3df84502), .K3_C1_W7(32'hbe12bd2a), .K3_C1_W8(32'hbdffe39a), 
		.K3_C2_W0(32'hbe0f590d), .K3_C2_W1(32'h3e16d18d), .K3_C2_W2(32'h3e10ef83), .K3_C2_W3(32'hbcfafd62), .K3_C2_W4(32'hbe3059a6), .K3_C2_W5(32'h3e33828d), .K3_C2_W6(32'hbd789aba), .K3_C2_W7(32'hbdd227eb), .K3_C2_W8(32'h3e1adcf6), 
		.K3_C3_W0(32'h3d837c50), .K3_C3_W1(32'h3e424421), .K3_C3_W2(32'h3d17cd69), .K3_C3_W3(32'hbddd8eba), .K3_C3_W4(32'hbc8846bf), .K3_C3_W5(32'hbd4d2fbb), .K3_C3_W6(32'h3e2ab26b), .K3_C3_W7(32'hbe2b84cd), .K3_C3_W8(32'h3e08793e), 
		.K3_C4_W0(32'hbe20f668), .K3_C4_W1(32'h3d650a1a), .K3_C4_W2(32'hbe092380), .K3_C4_W3(32'h3df4ece6), .K3_C4_W4(32'h3e46df14), .K3_C4_W5(32'h3dd0c386), .K3_C4_W6(32'h3d39008a), .K3_C4_W7(32'hbc519abb), .K3_C4_W8(32'h3d9356e5), 
		.K3_C5_W0(32'h3c4246c1), .K3_C5_W1(32'hbd98bf94), .K3_C5_W2(32'h3e273862), .K3_C5_W3(32'hbda28078), .K3_C5_W4(32'h3e301f92), .K3_C5_W5(32'h3d1d7d2a), .K3_C5_W6(32'h3c25318c), .K3_C5_W7(32'h3c74fd73), .K3_C5_W8(32'hbe164b94), 
		.K3_C6_W0(32'hbd021133), .K3_C6_W1(32'h3d71139d), .K3_C6_W2(32'h3e0c504e), .K3_C6_W3(32'h3e4da414), .K3_C6_W4(32'hbe0ad5f3), .K3_C6_W5(32'h3e3c6b67), .K3_C6_W6(32'hbdc5fc03), .K3_C6_W7(32'hbb9e22f8), .K3_C6_W8(32'h3e1aa83f), 
		.K3_C7_W0(32'hbd30339d), .K3_C7_W1(32'h3e2eb713), .K3_C7_W2(32'h3e207c56), .K3_C7_W3(32'h3e4c7528), .K3_C7_W4(32'h3db799d1), .K3_C7_W5(32'h3e5d7e45), .K3_C7_W6(32'h3c5ba024), .K3_C7_W7(32'h3d19c270), .K3_C7_W8(32'hbc79fb2f), 
		.K3_BIAS (32'hbcac6ba1),

		.K4_C0_W0(32'h3dd8f95d), .K4_C0_W1(32'hbe389bcb), .K4_C0_W2(32'h3d7ea09f), .K4_C0_W3(32'hbe2f4dd4), .K4_C0_W4(32'h3e446c5f), .K4_C0_W5(32'hbd859a48), .K4_C0_W6(32'hbe21ea8e), .K4_C0_W7(32'h3e4ba546), .K4_C0_W8(32'h3e2ffef5), 
		.K4_C1_W0(32'h3c18fb24), .K4_C1_W1(32'h3dbb0896), .K4_C1_W2(32'hbe0d415c), .K4_C1_W3(32'hbd672018), .K4_C1_W4(32'h3dbccfca), .K4_C1_W5(32'h3cadd506), .K4_C1_W6(32'hbda402ee), .K4_C1_W7(32'h3e098084), .K4_C1_W8(32'hbddb1c23), 
		.K4_C2_W0(32'h3df5ad57), .K4_C2_W1(32'hbdcb0d7a), .K4_C2_W2(32'h3e02c386), .K4_C2_W3(32'hbcfe3a3f), .K4_C2_W4(32'h3d8a4f70), .K4_C2_W5(32'h3e17fbb3), .K4_C2_W6(32'h3e40bbe5), .K4_C2_W7(32'hbbf329de), .K4_C2_W8(32'h3dfb59eb), 
		.K4_C3_W0(32'hbe1ce0df), .K4_C3_W1(32'hbc83b0be), .K4_C3_W2(32'h3da1a30f), .K4_C3_W3(32'h3e4467a7), .K4_C3_W4(32'hbe3b1fc6), .K4_C3_W5(32'hbe3b103a), .K4_C3_W6(32'hbe3b945c), .K4_C3_W7(32'h3d1c8fe4), .K4_C3_W8(32'h3e0d50b9), 
		.K4_C4_W0(32'h3d319bc1), .K4_C4_W1(32'h3e5d5fef), .K4_C4_W2(32'h3e1cd257), .K4_C4_W3(32'h3e281b01), .K4_C4_W4(32'h3c6ef865), .K4_C4_W5(32'h3e595bc2), .K4_C4_W6(32'hbe118a43), .K4_C4_W7(32'h3e5044f6), .K4_C4_W8(32'h3e183831), 
		.K4_C5_W0(32'hbcfed49a), .K4_C5_W1(32'hbe0b9bfd), .K4_C5_W2(32'h3d4e3f67), .K4_C5_W3(32'hbdfecfa9), .K4_C5_W4(32'hbb71ab64), .K4_C5_W5(32'h3d6004e8), .K4_C5_W6(32'h3cc6e41d), .K4_C5_W7(32'h3d957cb9), .K4_C5_W8(32'h3e0f669d), 
		.K4_C6_W0(32'hbdf9417e), .K4_C6_W1(32'h3cce974e), .K4_C6_W2(32'h3e1b95bf), .K4_C6_W3(32'h3e097a62), .K4_C6_W4(32'h3d800bfa), .K4_C6_W5(32'hbe1c1025), .K4_C6_W6(32'hbd940e42), .K4_C6_W7(32'hbe1c66e9), .K4_C6_W8(32'hbda54df6), 
		.K4_C7_W0(32'h3ddbc1f9), .K4_C7_W1(32'hbd95a0cf), .K4_C7_W2(32'h3e5d0b2d), .K4_C7_W3(32'h3d20a755), .K4_C7_W4(32'h3d997b59), .K4_C7_W5(32'h3e598fbc), .K4_C7_W6(32'hbe0a2cc3), .K4_C7_W7(32'h3e452241), .K4_C7_W8(32'h3e00de0e), 
		.K4_BIAS (32'hbd0ba20b),

		.K5_C0_W0(32'hbe0432eb), .K5_C0_W1(32'hbd254488), .K5_C0_W2(32'h3e103149), .K5_C0_W3(32'hbdf0cb03), .K5_C0_W4(32'h3e125062), .K5_C0_W5(32'hbe027552), .K5_C0_W6(32'h3e1bbba2), .K5_C0_W7(32'h3e023c9a), .K5_C0_W8(32'hbe29f45a), 
		.K5_C1_W0(32'hbda119ff), .K5_C1_W1(32'h3d9d5159), .K5_C1_W2(32'h3d312e75), .K5_C1_W3(32'h3cb7105b), .K5_C1_W4(32'hbe687f95), .K5_C1_W5(32'h3da7383a), .K5_C1_W6(32'h3e16f98a), .K5_C1_W7(32'hbe0bec4b), .K5_C1_W8(32'h3e3f6c35), 
		.K5_C2_W0(32'hbdb75677), .K5_C2_W1(32'h3d91e3b0), .K5_C2_W2(32'hbddf331e), .K5_C2_W3(32'h3da6cb8a), .K5_C2_W4(32'h3de6e10e), .K5_C2_W5(32'h3e078956), .K5_C2_W6(32'hbb5f94ce), .K5_C2_W7(32'h3e5af306), .K5_C2_W8(32'hbe016ad3), 
		.K5_C3_W0(32'hbd9f5f29), .K5_C3_W1(32'h3e4b6448), .K5_C3_W2(32'hbe44cb75), .K5_C3_W3(32'hbdfbeaff), .K5_C3_W4(32'h3e1e40bc), .K5_C3_W5(32'hbe4ec6f7), .K5_C3_W6(32'h3cbe96c0), .K5_C3_W7(32'h3e53f5ce), .K5_C3_W8(32'h3e44cecf), 
		.K5_C4_W0(32'h3c1b2ff6), .K5_C4_W1(32'hbdfb89db), .K5_C4_W2(32'hbd8aaf6a), .K5_C4_W3(32'h3e57b788), .K5_C4_W4(32'hbdac4597), .K5_C4_W5(32'hbcc471df), .K5_C4_W6(32'hbb07c68d), .K5_C4_W7(32'hbe316fbf), .K5_C4_W8(32'hbdbc6d53), 
		.K5_C5_W0(32'hbd3a9a2c), .K5_C5_W1(32'hbc1d3a4b), .K5_C5_W2(32'hbe24cd96), .K5_C5_W3(32'h3e0e42b2), .K5_C5_W4(32'hbd1f0a51), .K5_C5_W5(32'h3d82dffc), .K5_C5_W6(32'h3bb970d2), .K5_C5_W7(32'h3deadea2), .K5_C5_W8(32'h3dfa47a5), 
		.K5_C6_W0(32'hbdfd33a6), .K5_C6_W1(32'hbe2f4547), .K5_C6_W2(32'h3d097b3e), .K5_C6_W3(32'h3e3eed13), .K5_C6_W4(32'h3dfa9e6c), .K5_C6_W5(32'h3e091dbe), .K5_C6_W6(32'hbe2a21ea), .K5_C6_W7(32'h3e344ba4), .K5_C6_W8(32'h3e0b155a), 
		.K5_C7_W0(32'hbe1d13f6), .K5_C7_W1(32'hbe2cfd5c), .K5_C7_W2(32'h3e1d2d04), .K5_C7_W3(32'h3d83dba3), .K5_C7_W4(32'hbd997534), .K5_C7_W5(32'hbe37a090), .K5_C7_W6(32'hbe306fc1), .K5_C7_W7(32'hbce4cb8a), .K5_C7_W8(32'hbdc89da8), 
		.K5_BIAS (32'h3ce4dbb6),

		.K6_C0_W0(32'hbde31158), .K6_C0_W1(32'hbe0e1dee), .K6_C0_W2(32'hbdbc489d), .K6_C0_W3(32'h3de8136d), .K6_C0_W4(32'hbe2b8982), .K6_C0_W5(32'hbdd97c21), .K6_C0_W6(32'hbe636ffc), .K6_C0_W7(32'h3dfeb464), .K6_C0_W8(32'hbe1751e8), 
		.K6_C1_W0(32'hbdb6f13e), .K6_C1_W1(32'hbe441dd1), .K6_C1_W2(32'hbd2b4ad5), .K6_C1_W3(32'h3db3f86e), .K6_C1_W4(32'hbcd85a6b), .K6_C1_W5(32'hbe43353e), .K6_C1_W6(32'hbcd073f2), .K6_C1_W7(32'h3e1f0af8), .K6_C1_W8(32'h3cf40fef), 
		.K6_C2_W0(32'hbe1f6712), .K6_C2_W1(32'h3e359b7b), .K6_C2_W2(32'hbddd9866), .K6_C2_W3(32'hbe0d42e7), .K6_C2_W4(32'h3ac8f8a4), .K6_C2_W5(32'hbcdee264), .K6_C2_W6(32'hbe463982), .K6_C2_W7(32'h3d90ae49), .K6_C2_W8(32'h3d2e07bb), 
		.K6_C3_W0(32'h3e472780), .K6_C3_W1(32'h3cb24b66), .K6_C3_W2(32'h3be6682a), .K6_C3_W3(32'h3e692bdf), .K6_C3_W4(32'h3e488254), .K6_C3_W5(32'h3dc50636), .K6_C3_W6(32'h3dc649a7), .K6_C3_W7(32'hbc6b2b06), .K6_C3_W8(32'hbd554fac), 
		.K6_C4_W0(32'hbd04e602), .K6_C4_W1(32'h3dd67d1f), .K6_C4_W2(32'hbd168646), .K6_C4_W3(32'h3d326768), .K6_C4_W4(32'h3e034d5f), .K6_C4_W5(32'h3e0d75ef), .K6_C4_W6(32'h3daa14cb), .K6_C4_W7(32'hbd7ac7b9), .K6_C4_W8(32'hbd239922), 
		.K6_C5_W0(32'h3cc7f006), .K6_C5_W1(32'h3e56a8ec), .K6_C5_W2(32'h3dd90387), .K6_C5_W3(32'h3df892c0), .K6_C5_W4(32'hbd918d8b), .K6_C5_W5(32'hbdc84ba0), .K6_C5_W6(32'h3b70cc4f), .K6_C5_W7(32'h3cbeffc9), .K6_C5_W8(32'h3dee3e90), 
		.K6_C6_W0(32'hbe569969), .K6_C6_W1(32'h3bd1bde9), .K6_C6_W2(32'hbdfdac39), .K6_C6_W3(32'h3de65070), .K6_C6_W4(32'hbd822075), .K6_C6_W5(32'hbc5b8388), .K6_C6_W6(32'h3e045086), .K6_C6_W7(32'h3e35dd6b), .K6_C6_W8(32'h3cea8b66), 
		.K6_C7_W0(32'h3e43fe8b), .K6_C7_W1(32'h3e159b75), .K6_C7_W2(32'h3d92f505), .K6_C7_W3(32'hbe481bf8), .K6_C7_W4(32'h3d0a7eb9), .K6_C7_W5(32'h3d92024f), .K6_C7_W6(32'hbda984a1), .K6_C7_W7(32'hbe51b588), .K6_C7_W8(32'h3ddc0007), 
		.K6_BIAS (32'h399b13f1),

		.K7_C0_W0(32'hbe263af9), .K7_C0_W1(32'hbd9e3fe9), .K7_C0_W2(32'hbc999c8e), .K7_C0_W3(32'h3cfa517b), .K7_C0_W4(32'h3d85524c), .K7_C0_W5(32'h3d81902f), .K7_C0_W6(32'h3df26798), .K7_C0_W7(32'hbe2c6f60), .K7_C0_W8(32'hbbb50481), 
		.K7_C1_W0(32'h3d901d34), .K7_C1_W1(32'h3d45ba9f), .K7_C1_W2(32'h3dc9ae0d), .K7_C1_W3(32'hbd9870fe), .K7_C1_W4(32'h3d6009b4), .K7_C1_W5(32'h3e3ba4ed), .K7_C1_W6(32'hbde04c7c), .K7_C1_W7(32'h3c8e085f), .K7_C1_W8(32'h3e66e88c), 
		.K7_C2_W0(32'h3d202d2c), .K7_C2_W1(32'hbe46f7cc), .K7_C2_W2(32'hbe09b48c), .K7_C2_W3(32'hbe4b94a8), .K7_C2_W4(32'hbe479b69), .K7_C2_W5(32'h3e094a61), .K7_C2_W6(32'hbdbe8475), .K7_C2_W7(32'hbe473a47), .K7_C2_W8(32'h3d99dcf8), 
		.K7_C3_W0(32'h3d0dd46f), .K7_C3_W1(32'hbe4b9ee6), .K7_C3_W2(32'hbe3e4a80), .K7_C3_W3(32'h3dade172), .K7_C3_W4(32'hbe2420a5), .K7_C3_W5(32'hbda722c7), .K7_C3_W6(32'h3e639770), .K7_C3_W7(32'hbd359ef3), .K7_C3_W8(32'hbe0632ff), 
		.K7_C4_W0(32'h3cec9c0a), .K7_C4_W1(32'h3dec9e5d), .K7_C4_W2(32'hbddbbe9a), .K7_C4_W3(32'hbe189db2), .K7_C4_W4(32'h3d2a03aa), .K7_C4_W5(32'h3e475f9d), .K7_C4_W6(32'hbc7f4ff5), .K7_C4_W7(32'h3e507d9a), .K7_C4_W8(32'h3dca5b8d), 
		.K7_C5_W0(32'h3b821644), .K7_C5_W1(32'h3e4f6f57), .K7_C5_W2(32'hbbaf3ee0), .K7_C5_W3(32'h3e2d4243), .K7_C5_W4(32'hbe11f536), .K7_C5_W5(32'h3dcf46b5), .K7_C5_W6(32'hbe16b0f4), .K7_C5_W7(32'h3e093d87), .K7_C5_W8(32'h3e2f63af), 
		.K7_C6_W0(32'h3d2b7a78), .K7_C6_W1(32'h3e074df2), .K7_C6_W2(32'hbe46cae1), .K7_C6_W3(32'hbe563edb), .K7_C6_W4(32'h3df372e8), .K7_C6_W5(32'hbd85ce1b), .K7_C6_W6(32'h3e4707c4), .K7_C6_W7(32'h3db7af27), .K7_C6_W8(32'hbda9ab41), 
		.K7_C7_W0(32'hbda978f7), .K7_C7_W1(32'hbd98d676), .K7_C7_W2(32'hbd9185ca), .K7_C7_W3(32'h3d9e7e6b), .K7_C7_W4(32'h3e52dad0), .K7_C7_W5(32'hbdcbb470), .K7_C7_W6(32'hbce3b81b), .K7_C7_W7(32'h3da62683), .K7_C7_W8(32'hbd78eacb), 
		.K7_BIAS (32'h3c43974d)
		)
		block3_conv1(
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