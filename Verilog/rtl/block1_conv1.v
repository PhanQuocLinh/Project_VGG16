`ifndef ACTIVATE_INCLUDED
    `include "activate.v"
    `define ACTIVATE_INCLUDED
`endif
`ifndef MAX_POOLING_INCLUDED
    `include "max_pooling.v"
    `define MAX_POOLING_INCLUDED
`endif

module block1_conv1 #(
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


    
	conv3d_8_kernel_3_channel_size_3 #(
		.DATA_WIDTH(32),.IMG_WIDTH(WIDTH),.IMG_HEIGHT(HEIGHT),
		.K0_C0_W0(32'h3e03af92), .K0_C0_W1(32'hbe312f96), .K0_C0_W2(32'hbcd59d96), .K0_C0_W3(32'hbd8c2fcf), .K0_C0_W4(32'h3bd5d77e), .K0_C0_W5(32'hbe3864f6), .K0_C0_W6(32'h3e72d9b6), .K0_C0_W7(32'hb9ac13e9), .K0_C0_W8(32'h3e2c9376), 
		.K0_C1_W0(32'h3d4a40c0), .K0_C1_W1(32'h3d451008), .K0_C1_W2(32'hbe0080cb), .K0_C1_W3(32'hbd05f9a6), .K0_C1_W4(32'h3e261d8a), .K0_C1_W5(32'hbe077817), .K0_C1_W6(32'h3e14cb32), .K0_C1_W7(32'h3e2fd1ca), .K0_C1_W8(32'h3e5dddd0), 
		.K0_C2_W0(32'h3dc88f42), .K0_C2_W1(32'hbe82db3a), .K0_C2_W2(32'hbe5ec93c), .K0_C2_W3(32'hbe74195a), .K0_C2_W4(32'hbe3b5440), .K0_C2_W5(32'hbe4fe93b), .K0_C2_W6(32'hbe7b9d22), .K0_C2_W7(32'hbe85a2be), .K0_C2_W8(32'hbce092ee), 
		.K0_BIAS (32'h3cab182a),

		.K1_C0_W0(32'hbe3aa047), .K1_C0_W1(32'hbe22ffd1), .K1_C0_W2(32'hbe3c488e), .K1_C0_W3(32'h3e67b834), .K1_C0_W4(32'h3e2f0022), .K1_C0_W5(32'h3e50f969), .K1_C0_W6(32'hbd2698bc), .K1_C0_W7(32'h3e050f19), .K1_C0_W8(32'h3e4a02a4), 
		.K1_C1_W0(32'h3d5cf514), .K1_C1_W1(32'hbe17a6c0), .K1_C1_W2(32'h3e374ce4), .K1_C1_W3(32'h3dd8680f), .K1_C1_W4(32'hbe559df6), .K1_C1_W5(32'hbd9807c1), .K1_C1_W6(32'hbc350ebd), .K1_C1_W7(32'hbdf987c4), .K1_C1_W8(32'hbce9f649), 
		.K1_C2_W0(32'h3e4e896e), .K1_C2_W1(32'h3e2b709c), .K1_C2_W2(32'hbe48d607), .K1_C2_W3(32'h3d0bb2ab), .K1_C2_W4(32'h3e1566b4), .K1_C2_W5(32'h3e68ef93), .K1_C2_W6(32'h3e520e89), .K1_C2_W7(32'h3e44bfc5), .K1_C2_W8(32'hbe131e67), 
		.K1_BIAS (32'hbd2acfbb),

		.K2_C0_W0(32'hbde3d6d9), .K2_C0_W1(32'h3e2be023), .K2_C0_W2(32'hbe5a5abd), .K2_C0_W3(32'hbe787512), .K2_C0_W4(32'hbd31b193), .K2_C0_W5(32'hbe39025f), .K2_C0_W6(32'h3e65e9ac), .K2_C0_W7(32'h3cec9e40), .K2_C0_W8(32'h3e5778c4), 
		.K2_C1_W0(32'hbe4e6acd), .K2_C1_W1(32'hbd55c70c), .K2_C1_W2(32'h3dea32f4), .K2_C1_W3(32'h3d2a5010), .K2_C1_W4(32'h3e60ff92), .K2_C1_W5(32'h3d9e2189), .K2_C1_W6(32'h3d81bb62), .K2_C1_W7(32'h3e585597), .K2_C1_W8(32'h3e24cae3), 
		.K2_C2_W0(32'h3b295922), .K2_C2_W1(32'hbdfa1351), .K2_C2_W2(32'h3d5d7ea8), .K2_C2_W3(32'hbdf6c2c9), .K2_C2_W4(32'h3ba3bbf5), .K2_C2_W5(32'h3e229301), .K2_C2_W6(32'h3e4380c1), .K2_C2_W7(32'h3e6986f2), .K2_C2_W8(32'h3c38988d), 
		.K2_BIAS (32'hbd303aee),

		.K3_C0_W0(32'h3d6f6dd4), .K3_C0_W1(32'hba8a9dba), .K3_C0_W2(32'h3d3e9bce), .K3_C0_W3(32'hbc920707), .K3_C0_W4(32'hbe71549d), .K3_C0_W5(32'hbdef8f7a), .K3_C0_W6(32'hbe5fcdf6), .K3_C0_W7(32'hbd1be1d7), .K3_C0_W8(32'hbd04d281), 
		.K3_C1_W0(32'hbe2224e2), .K3_C1_W1(32'h3dcce458), .K3_C1_W2(32'hbe2aea2b), .K3_C1_W3(32'hbcdc70c8), .K3_C1_W4(32'hbe407aa9), .K3_C1_W5(32'h3d931ee0), .K3_C1_W6(32'hbd8c3b80), .K3_C1_W7(32'hbd8840d4), .K3_C1_W8(32'hbdec2044), 
		.K3_C2_W0(32'h3e6847e1), .K3_C2_W1(32'h3de0270e), .K3_C2_W2(32'h3e7bf1ee), .K3_C2_W3(32'h3d51d845), .K3_C2_W4(32'hbe04fefb), .K3_C2_W5(32'hbe4ccbdb), .K3_C2_W6(32'h3d865aec), .K3_C2_W7(32'h3e4f2501), .K3_C2_W8(32'hbe0ac2f3), 
		.K3_BIAS (32'hbc364f45),

		.K4_C0_W0(32'hbe65e7a0), .K4_C0_W1(32'hbe73fa0f), .K4_C0_W2(32'hbe409817), .K4_C0_W3(32'h3dd38455), .K4_C0_W4(32'hbcdce87b), .K4_C0_W5(32'hbe71b1dc), .K4_C0_W6(32'hbd957f3d), .K4_C0_W7(32'h3ba86972), .K4_C0_W8(32'h3e2b3d3b), 
		.K4_C1_W0(32'hbe1c7c72), .K4_C1_W1(32'h3e074da3), .K4_C1_W2(32'hbd7f7027), .K4_C1_W3(32'hbb95b79f), .K4_C1_W4(32'hbcead505), .K4_C1_W5(32'hbe271278), .K4_C1_W6(32'hbe42100f), .K4_C1_W7(32'h3d42eca7), .K4_C1_W8(32'h3e414c86), 
		.K4_C2_W0(32'hbd553664), .K4_C2_W1(32'hbe460039), .K4_C2_W2(32'hbda1880c), .K4_C2_W3(32'hbdc2a06e), .K4_C2_W4(32'hbe4cee1e), .K4_C2_W5(32'hbe590e22), .K4_C2_W6(32'hbe5b6c35), .K4_C2_W7(32'h3dad79d7), .K4_C2_W8(32'hbd153384), 
		.K4_BIAS (32'h3db1d5b9),

		.K5_C0_W0(32'hbb0328a3), .K5_C0_W1(32'h3e00f9a8), .K5_C0_W2(32'h3df9e27f), .K5_C0_W3(32'hbbea88ec), .K5_C0_W4(32'hbaa17e91), .K5_C0_W5(32'h3e3d2986), .K5_C0_W6(32'hbe5e85cf), .K5_C0_W7(32'hbd37f3ba), .K5_C0_W8(32'h3e3bd783), 
		.K5_C1_W0(32'hbe54f21f), .K5_C1_W1(32'h3d36dd48), .K5_C1_W2(32'h3e36e8d6), .K5_C1_W3(32'h3e05f992), .K5_C1_W4(32'h3db1e11d), .K5_C1_W5(32'h3e18283c), .K5_C1_W6(32'h3d836982), .K5_C1_W7(32'h3e43dd76), .K5_C1_W8(32'h3cdaeab4), 
		.K5_C2_W0(32'h3d9e4690), .K5_C2_W1(32'hbd6d284d), .K5_C2_W2(32'h3e06101d), .K5_C2_W3(32'hbdf13984), .K5_C2_W4(32'h3e288f64), .K5_C2_W5(32'h3e131d7a), .K5_C2_W6(32'hbbbdf02f), .K5_C2_W7(32'h3e726a1e), .K5_C2_W8(32'h3da24f89), 
		.K5_BIAS (32'hbd023697),

		.K6_C0_W0(32'h3de0489a), .K6_C0_W1(32'h3d7ddc7e), .K6_C0_W2(32'hbd4271a0), .K6_C0_W3(32'h3d79500a), .K6_C0_W4(32'h3d80f05f), .K6_C0_W5(32'hbe5893dd), .K6_C0_W6(32'h3e5ac1cf), .K6_C0_W7(32'hbe0207e8), .K6_C0_W8(32'hbe148bf3), 
		.K6_C1_W0(32'h3d16e19f), .K6_C1_W1(32'hbe0bea29), .K6_C1_W2(32'h3e230fb1), .K6_C1_W3(32'hbd168201), .K6_C1_W4(32'h3d6e4ec5), .K6_C1_W5(32'h3e666725), .K6_C1_W6(32'hbd121e63), .K6_C1_W7(32'h3e83786a), .K6_C1_W8(32'hbc69d90c), 
		.K6_C2_W0(32'h3d534845), .K6_C2_W1(32'hbdd289fc), .K6_C2_W2(32'hbdb19d4c), .K6_C2_W3(32'h3e5b36ce), .K6_C2_W4(32'hbe5961ed), .K6_C2_W5(32'hbe7025cc), .K6_C2_W6(32'h3db48b3f), .K6_C2_W7(32'hbe13f921), .K6_C2_W8(32'hbe3866c4), 
		.K6_BIAS (32'h3c1806d8),

		.K7_C0_W0(32'h3e812242), .K7_C0_W1(32'hbe2943d6), .K7_C0_W2(32'h3e7fe866), .K7_C0_W3(32'hbd748e3c), .K7_C0_W4(32'hbe18999c), .K7_C0_W5(32'h3dab7d0f), .K7_C0_W6(32'hbe4846c6), .K7_C0_W7(32'h3d529ea8), .K7_C0_W8(32'h3d1eca9f), 
		.K7_C1_W0(32'h3e28c13c), .K7_C1_W1(32'h3e806212), .K7_C1_W2(32'h3e0f3a6f), .K7_C1_W3(32'hbe2b6446), .K7_C1_W4(32'h3ce15d5d), .K7_C1_W5(32'hbd9917c0), .K7_C1_W6(32'hbe42c5b8), .K7_C1_W7(32'h3d5d49c6), .K7_C1_W8(32'h3d10764a), 
		.K7_C2_W0(32'hbe7c9a23), .K7_C2_W1(32'h3dbf318d), .K7_C2_W2(32'h3e095cba), .K7_C2_W3(32'hbdec78c8), .K7_C2_W4(32'hbdc97c75), .K7_C2_W5(32'h3e442625), .K7_C2_W6(32'hbe42e725), .K7_C2_W7(32'hbe56a5d4), .K7_C2_W8(32'hbdffe3d1), 
		.K7_BIAS (32'hb9fc0878)
		)
		block1_conv1(
		.clk(clk),
		.resetn(resetn),
		.data_valid_in(valid_in),
		.data_in_0(data_in_0),
		.data_in_1(data_in_1),
		.data_in_2(data_in_2),
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