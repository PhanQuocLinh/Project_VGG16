`ifndef CONV_2D_KERNEL_SIZE_3_INCLUDED
    `include "conv2d_kernel_size_3.v"
    `define CONV_2D_KERNEL_SIZE_3_INCLUDED
`endif

module conv3d_kernel_3_channel_size_3 #(
    parameter DATA_WIDTH = 32,
    parameter IMG_WIDTH = 56,
    parameter IMG_HEIGHT = 56,
    parameter CHANNEL = 3,

    // Cx_Wy = CHANNELx_WEIGHTy
    
	parameter C0_W0 = 32'h0, C0_W1 = 32'h0, C0_W2 = 32'h0, C0_W3 = 32'h0, C0_W4 = 32'h0, C0_W5 = 32'h0, C0_W6 = 32'h0, C0_W7 = 32'h0, C0_W8 = 32'h0,
	parameter C1_W0 = 32'h0, C1_W1 = 32'h0, C1_W2 = 32'h0, C1_W3 = 32'h0, C1_W4 = 32'h0, C1_W5 = 32'h0, C1_W6 = 32'h0, C1_W7 = 32'h0, C1_W8 = 32'h0,
	parameter C2_W0 = 32'h0, C2_W1 = 32'h0, C2_W2 = 32'h0, C2_W3 = 32'h0, C2_W4 = 32'h0, C2_W5 = 32'h0, C2_W6 = 32'h0, C2_W7 = 32'h0, C2_W8 = 32'h0,
	parameter BIAS  = 32'h0
    )
    (
    input	clk,
	input	resetn,
	input	data_valid_in,
	input	[DATA_WIDTH-1:0]	data_in_0,
	input	[DATA_WIDTH-1:0]	data_in_1,
	input	[DATA_WIDTH-1:0]	data_in_2,
	output	[DATA_WIDTH-1:0]	data_out,
	output	valid_out_pixel,
	output	done
    );
    localparam NUM_OPERANDs = CHANNEL;
    localparam NUM_DELAY = 1;           

    reg  [31:0] counter;
    wire [31:0] data_out_conv_kernel [0:CHANNEL-1];
    wire [CHANNEL-1:0] valid_out_conv_kernel;
    wire [CHANNEL-1:0] done_conv;

    wire [NUM_OPERANDs-2:0] valid_in_add;
    wire [NUM_OPERANDs-2:0] valid_out_add;
    wire [31:0] output_add [0:NUM_OPERANDs-2];
    wire [31:0] op_1 [0:NUM_OPERANDs-2];
    wire [31:0] op_2 [0:NUM_OPERANDs-2];

    wire [31:0] in_delay [0:NUM_DELAY-1];
    wire [31:0] out_delay [0:NUM_DELAY-1];

    
	conv2d_kernel_size_3 #(
		.DATA_WIDTH(32),.IMG_WIDTH(IMG_WIDTH),.IMG_HEIGHT(IMG_HEIGHT),
		.kernelR0(C0_W0),
		.kernelR1(C0_W1),
		.kernelR2(C0_W2),
		.kernelR3(C0_W3),
		.kernelR4(C0_W4),
		.kernelR5(C0_W5),
		.kernelR6(C0_W6),
		.kernelR7(C0_W7),
		.kernelR8(C0_W8)
		)
		conv2d_0(
		.clk(clk),
		.resetn(resetn),
		.data_valid_in(data_valid_in),
		.data_in(data_in_0),
		.data_out(data_out_conv_kernel[0]),
		.valid_out_pixel(valid_out_conv_kernel[0]),
		.done(done_conv[0])
		);
	conv2d_kernel_size_3 #(
		.DATA_WIDTH(32),.IMG_WIDTH(IMG_WIDTH),.IMG_HEIGHT(IMG_HEIGHT),
		.kernelR0(C1_W0),
		.kernelR1(C1_W1),
		.kernelR2(C1_W2),
		.kernelR3(C1_W3),
		.kernelR4(C1_W4),
		.kernelR5(C1_W5),
		.kernelR6(C1_W6),
		.kernelR7(C1_W7),
		.kernelR8(C1_W8)
		)
		conv2d_1(
		.clk(clk),
		.resetn(resetn),
		.data_valid_in(data_valid_in),
		.data_in(data_in_1),
		.data_out(data_out_conv_kernel[1]),
		.valid_out_pixel(valid_out_conv_kernel[1]),
		.done(done_conv[1])
		);
	conv2d_kernel_size_3 #(
		.DATA_WIDTH(32),.IMG_WIDTH(IMG_WIDTH),.IMG_HEIGHT(IMG_HEIGHT),
		.kernelR0(C2_W0),
		.kernelR1(C2_W1),
		.kernelR2(C2_W2),
		.kernelR3(C2_W3),
		.kernelR4(C2_W4),
		.kernelR5(C2_W5),
		.kernelR6(C2_W6),
		.kernelR7(C2_W7),
		.kernelR8(C2_W8)
		)
		conv2d_2(
		.clk(clk),
		.resetn(resetn),
		.data_valid_in(data_valid_in),
		.data_in(data_in_2),
		.data_out(data_out_conv_kernel[2]),
		.valid_out_pixel(valid_out_conv_kernel[2]),
		.done(done_conv[2])
		);


    
	assign op_1[0] = data_out_conv_kernel[0];
	assign op_2[0] = data_out_conv_kernel[1];
	assign valid_in_add[0] = valid_out_conv_kernel[2];
	assign in_delay[0] = data_out_conv_kernel[2];
	assign op_1[1] = output_add[0];
	assign op_2[1] = out_delay[0];
	assign valid_in_add[1] = valid_out_add[0];


    // Tao ra (NUM_OPERANDs - 1) bo fp add
    genvar i;
    generate
        for (i = 0; i < NUM_OPERANDs-1; i=i+1) 
        begin :initial_adders // needs (NUM_OPERANDs - 1) adders
            FP_Top_AddSub fp_adders(clk,resetn,valid_in_add[i],op_1[i],op_2[i],output_add[i],valid_out_add[i]);
        end
    endgenerate

    // Delay input cho bo fp add
    generate 
        for (i = 0; i < NUM_DELAY; i=i+1) 
        begin :delay_clocksssss
            // ------------ Thay doi do delay theo mach cong ------------
            delay_clock #(.DATA_WIDTH(32),.N_CLOCKs(1)) delay_xxx(clk,resetn,1'b1,in_delay[i],out_delay[i]);
        end
    endgenerate

    
    wire valid_temp;
    wire [31:0] data_temp;
    assign valid_temp = valid_out_add[NUM_OPERANDs-2];
	assign data_temp = output_add[NUM_OPERANDs-2];

    wire temp_valid;
    FP_Top_AddSub add_bias(clk, resetn, valid_temp, data_temp, BIAS, data_out, temp_valid);

    assign valid_out_pixel = temp_valid;


    always @ (posedge clk or negedge resetn) 
    begin
        if(resetn == 1'b0)
            counter <= 0;
        else 
            if (done == 1'b1) 
                counter <= 0;
            else 
                if(valid_out_pixel == 1'b1)
                begin
                    if(counter == (IMG_WIDTH)*(IMG_HEIGHT) -1 )
                    counter <= 0;
                    else 
                    counter <= counter + 1;
                end
                else
                    counter <= counter;
    end
    
    assign done = (counter == (IMG_WIDTH)*(IMG_HEIGHT) -1) & valid_out_pixel;

  endmodule