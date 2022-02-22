`ifndef ACTIVATE_INCLUDED
    `include "activate.v"
    `define ACTIVATE_INCLUDED
`endif
`ifndef MAX_POOLING_INCLUDED
    `include "max_pooling.v"
    `define MAX_POOLING_INCLUDED
`endif

module block3_conv2 #(
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
		.K0_C0_W0(32'h3ca607a8), .K0_C0_W1(32'h3de96376), .K0_C0_W2(32'h3d85f7cc), .K0_C0_W3(32'h3dddfa44), .K0_C0_W4(32'hbdaaf5c6), .K0_C0_W5(32'h3adb76fb), .K0_C0_W6(32'h3de05fb4), .K0_C0_W7(32'hbdf87687), .K0_C0_W8(32'h3dd6fcd5), 
		.K0_C1_W0(32'h3d4ddbf1), .K0_C1_W1(32'hbd2d7388), .K0_C1_W2(32'h3d1b32db), .K0_C1_W3(32'h3e022e25), .K0_C1_W4(32'h3e46b4d7), .K0_C1_W5(32'hbdd6ab31), .K0_C1_W6(32'hbdc3e90b), .K0_C1_W7(32'hbe532cba), .K0_C1_W8(32'hbe3c81c7), 
		.K0_C2_W0(32'h3c7ce30a), .K0_C2_W1(32'hbd89f129), .K0_C2_W2(32'hbdd6429c), .K0_C2_W3(32'hbd7222a9), .K0_C2_W4(32'hbe266b01), .K0_C2_W5(32'hbe1c8285), .K0_C2_W6(32'h3e020195), .K0_C2_W7(32'h3e4a36bf), .K0_C2_W8(32'h3e014e88), 
		.K0_C3_W0(32'hbe3fa808), .K0_C3_W1(32'hbcd7dd7d), .K0_C3_W2(32'hbde09fda), .K0_C3_W3(32'h3d531ebe), .K0_C3_W4(32'hbe2ae9e9), .K0_C3_W5(32'h3c6faf3d), .K0_C3_W6(32'hbcf69033), .K0_C3_W7(32'hbd94ae7f), .K0_C3_W8(32'h3dbbf134), 
		.K0_C4_W0(32'hbe195083), .K0_C4_W1(32'hbe29a9e2), .K0_C4_W2(32'hbd02a1d3), .K0_C4_W3(32'h3d218c80), .K0_C4_W4(32'h3ce7afc3), .K0_C4_W5(32'h3e3cbb92), .K0_C4_W6(32'hbc11743c), .K0_C4_W7(32'hbe22360b), .K0_C4_W8(32'h3e46f010), 
		.K0_C5_W0(32'hbd8ffcbf), .K0_C5_W1(32'hbe36b284), .K0_C5_W2(32'hbe4e9bb2), .K0_C5_W3(32'hbca2944a), .K0_C5_W4(32'hbd8c2af8), .K0_C5_W5(32'hbbe061c8), .K0_C5_W6(32'hbdcebb8b), .K0_C5_W7(32'hba9d17d6), .K0_C5_W8(32'hbc8cf8f8), 
		.K0_C6_W0(32'hbdc9ba03), .K0_C6_W1(32'hbd6447e7), .K0_C6_W2(32'h3e37d488), .K0_C6_W3(32'h3dad1512), .K0_C6_W4(32'hbe478bab), .K0_C6_W5(32'h3d7fee07), .K0_C6_W6(32'h3de270b5), .K0_C6_W7(32'hbe22f560), .K0_C6_W8(32'h3e4f0b60), 
		.K0_C7_W0(32'h3da4336f), .K0_C7_W1(32'h3d802eb5), .K0_C7_W2(32'h3cce1305), .K0_C7_W3(32'h3e2377dd), .K0_C7_W4(32'h3ddd8134), .K0_C7_W5(32'h3ded0828), .K0_C7_W6(32'h3e05d8df), .K0_C7_W7(32'h3dc2415f), .K0_C7_W8(32'hbd86dc1a), 
		.K0_BIAS (32'h3c068884),

		.K1_C0_W0(32'hbdce9ce0), .K1_C0_W1(32'hbe049e32), .K1_C0_W2(32'hbe16097e), .K1_C0_W3(32'h3d3c26d2), .K1_C0_W4(32'hbd883246), .K1_C0_W5(32'hbe1bf3b4), .K1_C0_W6(32'hbe8afca5), .K1_C0_W7(32'h3e0c74ac), .K1_C0_W8(32'hbe4d0fa3), 
		.K1_C1_W0(32'hbdb9abf5), .K1_C1_W1(32'h3e3dcecf), .K1_C1_W2(32'hbe1c0aa4), .K1_C1_W3(32'h3dce755c), .K1_C1_W4(32'hbe30847f), .K1_C1_W5(32'h3e3bfae4), .K1_C1_W6(32'hbdb181c2), .K1_C1_W7(32'h3d70b3af), .K1_C1_W8(32'hbe4dcec6), 
		.K1_C2_W0(32'hbd4a4610), .K1_C2_W1(32'hbddf9312), .K1_C2_W2(32'hbda83ddf), .K1_C2_W3(32'hbd8754dc), .K1_C2_W4(32'h3caab8b2), .K1_C2_W5(32'hbd9fde86), .K1_C2_W6(32'h3e209dff), .K1_C2_W7(32'h3e328afb), .K1_C2_W8(32'h3e321df8), 
		.K1_C3_W0(32'hbe52ad33), .K1_C3_W1(32'hbe1db51c), .K1_C3_W2(32'h3c20557b), .K1_C3_W3(32'hbdcff90f), .K1_C3_W4(32'h3d24c4bc), .K1_C3_W5(32'hbc9a85e8), .K1_C3_W6(32'h3c8176f0), .K1_C3_W7(32'hbde10879), .K1_C3_W8(32'h3d1956be), 
		.K1_C4_W0(32'h3e174bc9), .K1_C4_W1(32'h3d307fbc), .K1_C4_W2(32'hbcb4dd2d), .K1_C4_W3(32'hbe4d12e9), .K1_C4_W4(32'hbc178a0c), .K1_C4_W5(32'hbe4616b8), .K1_C4_W6(32'h3d366bf9), .K1_C4_W7(32'h3c1f28b3), .K1_C4_W8(32'hbce82413), 
		.K1_C5_W0(32'hbd930a9c), .K1_C5_W1(32'h3e464a3f), .K1_C5_W2(32'h3caba3a5), .K1_C5_W3(32'hbd547cc9), .K1_C5_W4(32'h3dd023c8), .K1_C5_W5(32'h3c9daed9), .K1_C5_W6(32'h3e557339), .K1_C5_W7(32'h3dc5a06f), .K1_C5_W8(32'h3e241dff), 
		.K1_C6_W0(32'hbe0478d5), .K1_C6_W1(32'hbc74d9db), .K1_C6_W2(32'hbd45d381), .K1_C6_W3(32'hbdf17300), .K1_C6_W4(32'h3e0bbba1), .K1_C6_W5(32'h3e134bea), .K1_C6_W6(32'h3d1e5138), .K1_C6_W7(32'h3c74acc4), .K1_C6_W8(32'hbe343d3a), 
		.K1_C7_W0(32'h3d893b9b), .K1_C7_W1(32'hbe40c7e7), .K1_C7_W2(32'h3e48739b), .K1_C7_W3(32'hbe41f150), .K1_C7_W4(32'hbe416f26), .K1_C7_W5(32'h3d7754e1), .K1_C7_W6(32'h3e20bbfb), .K1_C7_W7(32'hbe4607ed), .K1_C7_W8(32'hbdd7b579), 
		.K1_BIAS (32'h3cd3cf03),

		.K2_C0_W0(32'hbdc81bfc), .K2_C0_W1(32'h3e3fded1), .K2_C0_W2(32'h3b26794d), .K2_C0_W3(32'h3da77c5b), .K2_C0_W4(32'h3d9458d8), .K2_C0_W5(32'h3d9368bb), .K2_C0_W6(32'hbd05eeb5), .K2_C0_W7(32'h3e34062c), .K2_C0_W8(32'h3e470db1), 
		.K2_C1_W0(32'h3df53572), .K2_C1_W1(32'h3cec8e6c), .K2_C1_W2(32'h3e001eb4), .K2_C1_W3(32'h3da138f5), .K2_C1_W4(32'h3da9328b), .K2_C1_W5(32'h3d50c007), .K2_C1_W6(32'h3d4c0b80), .K2_C1_W7(32'h3de2fea3), .K2_C1_W8(32'h3df40865), 
		.K2_C2_W0(32'hbe2b0f7c), .K2_C2_W1(32'hbe54cc12), .K2_C2_W2(32'h3e0ddc71), .K2_C2_W3(32'h3e2fb7aa), .K2_C2_W4(32'h3e513ade), .K2_C2_W5(32'h3e26849d), .K2_C2_W6(32'h3e2b14c7), .K2_C2_W7(32'hbc8546b1), .K2_C2_W8(32'h3e35e2f7), 
		.K2_C3_W0(32'h3e442861), .K2_C3_W1(32'hbdd12670), .K2_C3_W2(32'hbdbee694), .K2_C3_W3(32'hbe534e11), .K2_C3_W4(32'hbddbc8b1), .K2_C3_W5(32'h3c555ba7), .K2_C3_W6(32'hbc48c36a), .K2_C3_W7(32'hbbc1a170), .K2_C3_W8(32'hbdfb59e5), 
		.K2_C4_W0(32'hbd92c137), .K2_C4_W1(32'h3dbc25df), .K2_C4_W2(32'h3e218358), .K2_C4_W3(32'hbdb906a1), .K2_C4_W4(32'h3df0735f), .K2_C4_W5(32'h3df4c74c), .K2_C4_W6(32'h3b43f5b6), .K2_C4_W7(32'hbc4b96de), .K2_C4_W8(32'hbdf80304), 
		.K2_C5_W0(32'hbcbe82ef), .K2_C5_W1(32'hbddf230b), .K2_C5_W2(32'h3e254fe1), .K2_C5_W3(32'hbd4fec4a), .K2_C5_W4(32'hbdbf6585), .K2_C5_W5(32'hbd954de3), .K2_C5_W6(32'hbe1804f1), .K2_C5_W7(32'hbda33467), .K2_C5_W8(32'h3d454af9), 
		.K2_C6_W0(32'hbd85673f), .K2_C6_W1(32'h3d06772e), .K2_C6_W2(32'hbc74c789), .K2_C6_W3(32'hbcf57939), .K2_C6_W4(32'h3df9a157), .K2_C6_W5(32'h3bf182b1), .K2_C6_W6(32'h3cc0c12f), .K2_C6_W7(32'h3d940a7d), .K2_C6_W8(32'h3d61e238), 
		.K2_C7_W0(32'hbe200d4a), .K2_C7_W1(32'h3db52ecb), .K2_C7_W2(32'hbd414c48), .K2_C7_W3(32'h3e3f3b55), .K2_C7_W4(32'hbe2ea40d), .K2_C7_W5(32'hbbff0b14), .K2_C7_W6(32'hbd43ea92), .K2_C7_W7(32'hbda12e9a), .K2_C7_W8(32'h3de34122), 
		.K2_BIAS (32'hbc95b58d),

		.K3_C0_W0(32'hbe70397d), .K3_C0_W1(32'h3e138efa), .K3_C0_W2(32'hbe505586), .K3_C0_W3(32'h3d83d748), .K3_C0_W4(32'h3c9b689d), .K3_C0_W5(32'h3cd30466), .K3_C0_W6(32'h3de94dfb), .K3_C0_W7(32'hbd6b0083), .K3_C0_W8(32'hbd114f65), 
		.K3_C1_W0(32'hbe41bd84), .K3_C1_W1(32'hbde8cfcc), .K3_C1_W2(32'hbdaa1649), .K3_C1_W3(32'hbe4e0190), .K3_C1_W4(32'h3ca63ffe), .K3_C1_W5(32'h3da499d9), .K3_C1_W6(32'h3ddfca9f), .K3_C1_W7(32'hbe290b6b), .K3_C1_W8(32'h3e38c7dc), 
		.K3_C2_W0(32'h3c5bc0d2), .K3_C2_W1(32'h3e54549f), .K3_C2_W2(32'h3cf5ecaf), .K3_C2_W3(32'hbe3af1d5), .K3_C2_W4(32'hbdb0dfc8), .K3_C2_W5(32'h3e335cb4), .K3_C2_W6(32'h3e117a20), .K3_C2_W7(32'h3d1c2620), .K3_C2_W8(32'h3e1b216b), 
		.K3_C3_W0(32'h3dd1d248), .K3_C3_W1(32'hbdb04af1), .K3_C3_W2(32'hbdacac45), .K3_C3_W3(32'h3e7dfffc), .K3_C3_W4(32'h3d3f6dcb), .K3_C3_W5(32'h3e227f64), .K3_C3_W6(32'hbe2f6cad), .K3_C3_W7(32'hbd327ebb), .K3_C3_W8(32'h3dbe23cf), 
		.K3_C4_W0(32'h3e2f142a), .K3_C4_W1(32'h3c236c0d), .K3_C4_W2(32'hbe35ff7f), .K3_C4_W3(32'hbde0563d), .K3_C4_W4(32'h3e6a6b1c), .K3_C4_W5(32'h3d1bf0cd), .K3_C4_W6(32'h3e0a23e4), .K3_C4_W7(32'h3e750b69), .K3_C4_W8(32'h3e29a9f8), 
		.K3_C5_W0(32'hbe0987ab), .K3_C5_W1(32'hbda6f5ff), .K3_C5_W2(32'h3e43335c), .K3_C5_W3(32'hbdeb3e39), .K3_C5_W4(32'h3dbbed5d), .K3_C5_W5(32'hbd5518f2), .K3_C5_W6(32'hbdd58d05), .K3_C5_W7(32'h3e1293bd), .K3_C5_W8(32'hbc9fb2d2), 
		.K3_C6_W0(32'h3dd432ff), .K3_C6_W1(32'h3e063647), .K3_C6_W2(32'h3e242554), .K3_C6_W3(32'h3e2a81d5), .K3_C6_W4(32'h3e04c79b), .K3_C6_W5(32'h3db0f6e3), .K3_C6_W6(32'h3d990de0), .K3_C6_W7(32'h3e34bec0), .K3_C6_W8(32'hbcb84229), 
		.K3_C7_W0(32'hbe0abe9b), .K3_C7_W1(32'h3e0022c5), .K3_C7_W2(32'h3d4f11d7), .K3_C7_W3(32'hbd5e247c), .K3_C7_W4(32'h3c94e0df), .K3_C7_W5(32'hbe456197), .K3_C7_W6(32'hbd9fb147), .K3_C7_W7(32'h3dce35f3), .K3_C7_W8(32'hbb0d56b4), 
		.K3_BIAS (32'hbc56eb83),

		.K4_C0_W0(32'hbe2ca45b), .K4_C0_W1(32'h3d315c7a), .K4_C0_W2(32'hbe17d2a6), .K4_C0_W3(32'hbcccea01), .K4_C0_W4(32'hbbd06234), .K4_C0_W5(32'h3d515d8d), .K4_C0_W6(32'hbd820742), .K4_C0_W7(32'h3e2c526c), .K4_C0_W8(32'hbd1a988d), 
		.K4_C1_W0(32'hbc8a5586), .K4_C1_W1(32'h3e07a9fb), .K4_C1_W2(32'hbdcb148d), .K4_C1_W3(32'hbdbda847), .K4_C1_W4(32'hbc75519e), .K4_C1_W5(32'hbd20b63e), .K4_C1_W6(32'h3dda5556), .K4_C1_W7(32'h3e33c83e), .K4_C1_W8(32'hbdb3b4b6), 
		.K4_C2_W0(32'h3d1f43b7), .K4_C2_W1(32'hbe3f6e5d), .K4_C2_W2(32'h3e495810), .K4_C2_W3(32'h3c95c8f6), .K4_C2_W4(32'h3e198922), .K4_C2_W5(32'hbcb0ad95), .K4_C2_W6(32'h3e30d076), .K4_C2_W7(32'hbe1f6e5e), .K4_C2_W8(32'hbdb0f5e3), 
		.K4_C3_W0(32'hbd4a9557), .K4_C3_W1(32'hbe240100), .K4_C3_W2(32'h3e2e5191), .K4_C3_W3(32'h3e3e222b), .K4_C3_W4(32'h3de3c4f9), .K4_C3_W5(32'h3e20c879), .K4_C3_W6(32'h3c15e8e6), .K4_C3_W7(32'hbe385549), .K4_C3_W8(32'hbdd4d82a), 
		.K4_C4_W0(32'hbe0464a8), .K4_C4_W1(32'h3d11f87e), .K4_C4_W2(32'hbd0982a1), .K4_C4_W3(32'h3db93bbb), .K4_C4_W4(32'h3c1a736a), .K4_C4_W5(32'hbe085478), .K4_C4_W6(32'hbe1f6359), .K4_C4_W7(32'hbd8d1e6e), .K4_C4_W8(32'h3dafe1e8), 
		.K4_C5_W0(32'hbab28c24), .K4_C5_W1(32'hbe449d79), .K4_C5_W2(32'h3d19c0e1), .K4_C5_W3(32'h3e1aa2b6), .K4_C5_W4(32'h3d8c0cab), .K4_C5_W5(32'hbdf5c458), .K4_C5_W6(32'hbd0bfee3), .K4_C5_W7(32'h3df5d2e9), .K4_C5_W8(32'hbcd5bf9f), 
		.K4_C6_W0(32'hbafcccb8), .K4_C6_W1(32'h3d014cf7), .K4_C6_W2(32'h3d87f837), .K4_C6_W3(32'hbe2f1a25), .K4_C6_W4(32'hbe3bbe37), .K4_C6_W5(32'hbe599081), .K4_C6_W6(32'hbe044dd0), .K4_C6_W7(32'hbdc5c612), .K4_C6_W8(32'hbe4be8bb), 
		.K4_C7_W0(32'hbdf8697b), .K4_C7_W1(32'hbe095198), .K4_C7_W2(32'hbd109d69), .K4_C7_W3(32'hbd83433c), .K4_C7_W4(32'h3db0c15c), .K4_C7_W5(32'h3dc85ec2), .K4_C7_W6(32'h3e0a80f4), .K4_C7_W7(32'hbe288266), .K4_C7_W8(32'h3e4139c5), 
		.K4_BIAS (32'hbca500eb),

		.K5_C0_W0(32'h3d68e892), .K5_C0_W1(32'hbe1d7d7b), .K5_C0_W2(32'h3d956667), .K5_C0_W3(32'h3e069e3a), .K5_C0_W4(32'h3ceaf635), .K5_C0_W5(32'h3d4e0f83), .K5_C0_W6(32'h3dc461bf), .K5_C0_W7(32'h3d265b27), .K5_C0_W8(32'hbe345a9e), 
		.K5_C1_W0(32'hbe6054a7), .K5_C1_W1(32'hbdb8d168), .K5_C1_W2(32'hbe02571c), .K5_C1_W3(32'hbcd6ad89), .K5_C1_W4(32'hbdeca2e8), .K5_C1_W5(32'hbd665ccb), .K5_C1_W6(32'h3e31465d), .K5_C1_W7(32'h3d40ab4a), .K5_C1_W8(32'hbe51fd27), 
		.K5_C2_W0(32'hbcb39d35), .K5_C2_W1(32'hbcfe6ed0), .K5_C2_W2(32'h3d880907), .K5_C2_W3(32'h3c540798), .K5_C2_W4(32'h3e3b52e6), .K5_C2_W5(32'h3ccecbd6), .K5_C2_W6(32'hbdefc6f1), .K5_C2_W7(32'hbbace01a), .K5_C2_W8(32'hbdb38636), 
		.K5_C3_W0(32'hbe048e0b), .K5_C3_W1(32'hbd8c7491), .K5_C3_W2(32'h3e231c04), .K5_C3_W3(32'hbd4256e1), .K5_C3_W4(32'hbd5c621a), .K5_C3_W5(32'hbe45cbb7), .K5_C3_W6(32'h3d99beb1), .K5_C3_W7(32'hbd32b2db), .K5_C3_W8(32'hbe278869), 
		.K5_C4_W0(32'h3e592700), .K5_C4_W1(32'h3d28df5a), .K5_C4_W2(32'hbdebf58b), .K5_C4_W3(32'h3ddf3490), .K5_C4_W4(32'h3e1c3efe), .K5_C4_W5(32'h3e09dbf9), .K5_C4_W6(32'hbdab2146), .K5_C4_W7(32'h3e592b40), .K5_C4_W8(32'hbd886a96), 
		.K5_C5_W0(32'hbd872380), .K5_C5_W1(32'h3e047def), .K5_C5_W2(32'h3b738879), .K5_C5_W3(32'h3d7abc3c), .K5_C5_W4(32'h3e3e8747), .K5_C5_W5(32'h3dde53ea), .K5_C5_W6(32'hbd8eb557), .K5_C5_W7(32'hbe5dfa47), .K5_C5_W8(32'hbe696363), 
		.K5_C6_W0(32'hbe19d216), .K5_C6_W1(32'hbc35dd45), .K5_C6_W2(32'hbd6db2bf), .K5_C6_W3(32'h3e469082), .K5_C6_W4(32'hbddc347b), .K5_C6_W5(32'hbd5f7456), .K5_C6_W6(32'hbca61cdb), .K5_C6_W7(32'hbe007c15), .K5_C6_W8(32'hbcb400a9), 
		.K5_C7_W0(32'hbe143670), .K5_C7_W1(32'h3e2082ed), .K5_C7_W2(32'h3d8ec92e), .K5_C7_W3(32'h3df837ca), .K5_C7_W4(32'h3c20750b), .K5_C7_W5(32'hbde9952c), .K5_C7_W6(32'hbd863179), .K5_C7_W7(32'hbe28a225), .K5_C7_W8(32'hbd9ef4ce), 
		.K5_BIAS (32'hbcc9887b),

		.K6_C0_W0(32'hbe33b8a8), .K6_C0_W1(32'hbe13ceb2), .K6_C0_W2(32'h3ca13299), .K6_C0_W3(32'hbdde9b4a), .K6_C0_W4(32'hbd78097c), .K6_C0_W5(32'h3d0ad880), .K6_C0_W6(32'hbdcf8cf7), .K6_C0_W7(32'hbe754082), .K6_C0_W8(32'h3e3ca984), 
		.K6_C1_W0(32'h3e29297e), .K6_C1_W1(32'h3e0d4c5b), .K6_C1_W2(32'hbe1f4177), .K6_C1_W3(32'h3ddac4a9), .K6_C1_W4(32'h3d7babdb), .K6_C1_W5(32'hbd1780fa), .K6_C1_W6(32'h3e4ffbac), .K6_C1_W7(32'h3cd4dd01), .K6_C1_W8(32'hbde908fc), 
		.K6_C2_W0(32'h3e054e76), .K6_C2_W1(32'h3d9619fe), .K6_C2_W2(32'h3dcca3ed), .K6_C2_W3(32'hbe0c736c), .K6_C2_W4(32'h3cbdd547), .K6_C2_W5(32'hbc19f149), .K6_C2_W6(32'hbe712698), .K6_C2_W7(32'hbe2c1a1b), .K6_C2_W8(32'h3e1798cf), 
		.K6_C3_W0(32'h3d24e0c1), .K6_C3_W1(32'hbd114268), .K6_C3_W2(32'h3ddd55bb), .K6_C3_W3(32'h3def1b9f), .K6_C3_W4(32'h3dc5e75b), .K6_C3_W5(32'h3e18686f), .K6_C3_W6(32'hbcc54aa9), .K6_C3_W7(32'h3d996e38), .K6_C3_W8(32'hbe1060c1), 
		.K6_C4_W0(32'h3e0b7cb9), .K6_C4_W1(32'hbdef3b00), .K6_C4_W2(32'hbd05bc83), .K6_C4_W3(32'h3e129764), .K6_C4_W4(32'hbe33cb17), .K6_C4_W5(32'hbe54e9c4), .K6_C4_W6(32'hbe47c3b8), .K6_C4_W7(32'h3e43e0a8), .K6_C4_W8(32'hbd207828), 
		.K6_C5_W0(32'h3d999fa3), .K6_C5_W1(32'hbd41b273), .K6_C5_W2(32'h3e0895e2), .K6_C5_W3(32'h3d80be15), .K6_C5_W4(32'hbdc2a428), .K6_C5_W5(32'h3e095371), .K6_C5_W6(32'hbd64d964), .K6_C5_W7(32'h3e0ffed5), .K6_C5_W8(32'hbd13e115), 
		.K6_C6_W0(32'hbe027db2), .K6_C6_W1(32'hbdc0fae5), .K6_C6_W2(32'hbe459fd4), .K6_C6_W3(32'h3dfe9844), .K6_C6_W4(32'h3e27d8aa), .K6_C6_W5(32'hbe23d29a), .K6_C6_W6(32'hbd78721f), .K6_C6_W7(32'hbc65fe13), .K6_C6_W8(32'h3c8b56eb), 
		.K6_C7_W0(32'hbc66401e), .K6_C7_W1(32'h3d959fa8), .K6_C7_W2(32'h3e0ec7d5), .K6_C7_W3(32'h3d8e2d27), .K6_C7_W4(32'hbdb956d2), .K6_C7_W5(32'h3e30f676), .K6_C7_W6(32'hbe11e868), .K6_C7_W7(32'hbe0afe5e), .K6_C7_W8(32'h3d5a1629), 
		.K6_BIAS (32'h3ca09608),

		.K7_C0_W0(32'hbd8864e1), .K7_C0_W1(32'hbd4f8c7b), .K7_C0_W2(32'hbd22a676), .K7_C0_W3(32'h3e21e14a), .K7_C0_W4(32'h3db58819), .K7_C0_W5(32'h3d4ce6fd), .K7_C0_W6(32'hbd89c55c), .K7_C0_W7(32'h3d562107), .K7_C0_W8(32'h3e459d8e), 
		.K7_C1_W0(32'h3e35cdfb), .K7_C1_W1(32'hbd23f87a), .K7_C1_W2(32'h3e4b1834), .K7_C1_W3(32'hbe04c40c), .K7_C1_W4(32'h3e3df8e1), .K7_C1_W5(32'hbdca4fe5), .K7_C1_W6(32'hbe744510), .K7_C1_W7(32'hbd6d7a7f), .K7_C1_W8(32'h3cc31582), 
		.K7_C2_W0(32'hbdf0a2ee), .K7_C2_W1(32'hbe32cf8f), .K7_C2_W2(32'hbd7104f2), .K7_C2_W3(32'hbe3a00e5), .K7_C2_W4(32'h3c9ffd70), .K7_C2_W5(32'hbdd7d380), .K7_C2_W6(32'h3e2bbad2), .K7_C2_W7(32'h3e2a8d61), .K7_C2_W8(32'h3d065bb9), 
		.K7_C3_W0(32'hbd92576a), .K7_C3_W1(32'hbe371bae), .K7_C3_W2(32'hbd65e46a), .K7_C3_W3(32'h3e0110ca), .K7_C3_W4(32'h3dc2bbe9), .K7_C3_W5(32'hbdc6dc7d), .K7_C3_W6(32'h3de48857), .K7_C3_W7(32'h3e2c3123), .K7_C3_W8(32'hbe37b479), 
		.K7_C4_W0(32'h3e0d86c8), .K7_C4_W1(32'hbc41b9e0), .K7_C4_W2(32'hbe2f79d2), .K7_C4_W3(32'h3d57d4a8), .K7_C4_W4(32'hbe5e7a37), .K7_C4_W5(32'hbdfbabd8), .K7_C4_W6(32'h3d2dfb91), .K7_C4_W7(32'hbd7fbec5), .K7_C4_W8(32'h3d1409f8), 
		.K7_C5_W0(32'h3e21c9c4), .K7_C5_W1(32'h3d0c9364), .K7_C5_W2(32'hbc604fb7), .K7_C5_W3(32'h3dfbf845), .K7_C5_W4(32'h3e493dcd), .K7_C5_W5(32'h3e411b7f), .K7_C5_W6(32'h3e17a23c), .K7_C5_W7(32'hbe089aa9), .K7_C5_W8(32'h3ce464f2), 
		.K7_C6_W0(32'hbdbfee77), .K7_C6_W1(32'hbb0af69d), .K7_C6_W2(32'hbe22a876), .K7_C6_W3(32'h3e1675ba), .K7_C6_W4(32'hbcc0fd1f), .K7_C6_W5(32'hbe332dc6), .K7_C6_W6(32'hbe218ac0), .K7_C6_W7(32'h3e20eb20), .K7_C6_W8(32'hbe150d4c), 
		.K7_C7_W0(32'hbe00cd78), .K7_C7_W1(32'hbe3b6747), .K7_C7_W2(32'h3d136aab), .K7_C7_W3(32'hbe2df31b), .K7_C7_W4(32'hbba0753b), .K7_C7_W5(32'h3e38045f), .K7_C7_W6(32'h3d62e264), .K7_C7_W7(32'hbe108a2f), .K7_C7_W8(32'h3e413438), 
		.K7_BIAS (32'h3c8702ff)
		)
		block3_conv2(
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