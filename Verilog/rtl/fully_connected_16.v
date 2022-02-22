module fully_connected_16 # (
	parameter DATA_WIDTH = 32,
	parameter W0 = 32'h3dd1027c,
	parameter W1 = 32'hbf007fd2,
	parameter W2 = 32'h3e1818f3,
	parameter W3 = 32'h3eefbc82,
	parameter W4 = 32'hbf01f50a,
	parameter W5 = 32'hbe805870,
	parameter W6 = 32'h3e7245a8,
	parameter W7 = 32'hbe34e423,
	parameter W8 = 32'h3eac4c94,
	parameter W9 = 32'h3e28fb83,
	parameter W10 = 32'hbeb2aecd,
	parameter W11 = 32'h3d91a2c1,
	parameter W12 = 32'hbf08a17d,
	parameter W13 = 32'hbe92b3c0,
	parameter W14 = 32'h3eba6b7a,
	parameter W15 = 32'h3d800fef,
	parameter BIAS = 32'h3cdc146e

	// parameter WIDTH = 4, // after maxpool
	// parameter HEIGHT = 4 // after maxpool
	)
	(
	input 	clk,
	input 	resetn,
	
	input 	valid_in,
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
	output	[DATA_WIDTH-1:0]	data_out,
	output valid_out

	// feature,
	// full, valid_out_mult,
	// load_weight_done//,
	
	);

	localparam NUM_OPERANDs = 16+1;

// 	input clk;
// 	input resetn;
// 	// input ack;
// 	input load_weight;
	
// 	input valid_in;
// 	input [31:0] data_in;
// 	input [31:0] weight;
	
// 	output [31:0] feature;
// 	output valid_out;
// 	output load_weight_done;
	

// 	localparam STAGES = 5; 
// 	localparam NUM_DELAY = 4; 


// 	wire enable_2;
// 	function integer clogb2;
//    input [31:0] value;
//    integer 	i;
//    begin
//       clogb2 = 0;
//       for(i = 0; 2**i < value; i = i + 1)
// 	clogb2 = i + 1;
//    end
// endfunction
//   localparam COUNTER_WIDTH = clogb2(WIDTH*HEIGHT+1);
// 	reg [COUNTER_WIDTH-1:0] counter,counter_1,counter_2;
// 	output reg full;
	
// 	reg load_weight_done;
	
	// reg [31:0] tmp [WIDTH*HEIGHT:0];
	// wire [31:0] product [0:WIDTH*HEIGHT-1];
	// output wire valid_out_mult;


    wire [DATA_WIDTH-1:0] x [0:16-1];
    wire [16-1:0] valid_out_mult;
	
	FP_Top_Mult mult_weight_0(
                        clk,
                        resetn,
                        //enable,
                        valid_in,
                        W0,
                        data_in_0,
                        x[0],
                        valid_out_mult[0]
                        );                  
    FP_Top_Mult mult_weight_1(
                        clk,
                        resetn,
                        //enable,
                        valid_in,
                        W1,
                        data_in_1,
                        x[1],
                        valid_out_mult[1]
                        );
    FP_Top_Mult mult_weight_2(
                        clk,
                        resetn,
                        //enable,
                        valid_in,
                        W2,
                        data_in_2,
                        x[2],
                        valid_out_mult[2]
                        );
    FP_Top_Mult mult_weight_3(
                        clk,
                        resetn,
                        //enable,
                        valid_in,
                        W3,
                        data_in_3,
                        x[3],
                        valid_out_mult[3]
                        );
    FP_Top_Mult mult_weight_4(
                        clk,
                        resetn,
                        //enable,
                        valid_in,
                        W4,
                        data_in_4,
                        x[4],
                        valid_out_mult[4]
                        );
    FP_Top_Mult mult_weight_5(
                        clk,
                        resetn,
                        //enable,
                        valid_in,
                        W5,
                        data_in_5,
                        x[5],
                        valid_out_mult[5]
                        );
    FP_Top_Mult mult_weight_6(
                        clk,
                        resetn,
                        //enable,
                        valid_in,
                        W6,
                        data_in_6,
                        x[6],
                        valid_out_mult[6]
                        );
    FP_Top_Mult mult_weight_7(
                        clk,
                        resetn,
                        //enable,
                        valid_in,
                        W7,
                        data_in_7,
                        x[7],
                        valid_out_mult[7]
                        );
    FP_Top_Mult mult_weight_8(
                        clk,
                        resetn,
                        //enable,
                        valid_in,
                        W8,
                        data_in_8,
                        x[8],
                        valid_out_mult[8]
                        );

	FP_Top_Mult mult_weight_9(
                        clk,
                        resetn,
                        //enable,
                        valid_in,
                        W9,
                        data_in_9,
                        x[9],
                        valid_out_mult[9]
                        );
                            
    FP_Top_Mult mult_weight_10(
                        clk,
                        resetn,
                        //enable,
                        valid_in,
                        W10,
                        data_in_10,
                        x[10],
                        valid_out_mult[10]
                        );
    FP_Top_Mult mult_weight_11(
                        clk,
                        resetn,
                        //enable,
                        valid_in,
                        W11,
                        data_in_11,
                        x[11],
                        valid_out_mult[11]
                        );
    FP_Top_Mult mult_weight_12(
                        clk,
                        resetn,
                        //enable,
                        valid_in,
                        W12,
                        data_in_12,
                        x[12],
                        valid_out_mult[12]
                        );
    FP_Top_Mult mult_weight_13(
                        clk,
                        resetn,
                        //enable,
                        valid_in,
                        W13,
                        data_in_13,
                        x[13],
                        valid_out_mult[13]
                        );
    FP_Top_Mult mult_weight_14(
                        clk,
                        resetn,
                        //enable,
                        valid_in,
                        W14,
                        data_in_14,
                        x[14],
                        valid_out_mult[14]
                        );
    FP_Top_Mult mult_weight_15(
                        clk,
                        resetn,
                        //enable,
                        valid_in,
                        W15,
                        data_in_15,
                        x[15],
                        valid_out_mult[15]
                        );



	wire [NUM_OPERANDs-2:0] valid_in_add;
	wire [NUM_OPERANDs-2:0] valid_out_add;
	wire [31:0] output_add [0:NUM_OPERANDs-2];
	wire [31:0] op_1 [0:NUM_OPERANDs-2];
	wire [31:0] op_2 [0:NUM_OPERANDs-2];


	genvar i;

	generate
	for (i = 0; i < NUM_OPERANDs-1; i=i+1) 
	begin :initial_adders // needs (NUM_OPERANDs - 1) adders
		FP_Top_AddSub fp_adders(clk,resetn,valid_in_add[i],op_1[i],op_2[i],output_add[i],valid_out_add[i]);
	end
	endgenerate


	// wire [31:0] in_delay [0:NUM_DELAY-1];
    // wire [31:0] out_delay [0:NUM_DELAY-1];

    // generate 
	// for (i = 0; i < NUM_DELAY; i=i+1) 
	// begin :delay_clocksssss
	// 	delay_clock #(.DATA_WIDTH(32),.N_CLOCKs(1)) delay_xxx(clk,resetn,enable_2,in_delay[i],out_delay[i]);
	// end
    // endgenerate 

    assign op_1[0] = x[0];
    assign op_2[0] = x[1];
    assign valid_in_add[0] = valid_out_mult[15];
    assign op_1[1] = x[2];
    assign op_2[1] = x[3];
    assign valid_in_add[1] = valid_out_mult[15];
    assign op_1[2] = x[4];
    assign op_2[2] = x[5];
    assign valid_in_add[2] = valid_out_mult[15];
    assign op_1[3] = x[6];
    assign op_2[3] = x[7];
    assign valid_in_add[3] = valid_out_mult[15];
    assign op_1[4] = x[8];
    assign op_2[4] = x[9];
    assign valid_in_add[4] = valid_out_mult[15];
    assign op_1[5] = x[10];
    assign op_2[5] = x[11];
    assign valid_in_add[5] = valid_out_mult[15];
    assign op_1[6] = x[12];
    assign op_2[6] = x[13];
    assign valid_in_add[6] = valid_out_mult[15];
    assign op_1[7] = x[14];
    assign op_2[7] = x[15];
    assign valid_in_add[7] = valid_out_mult[15];
	
    assign op_1[8] = output_add[0];
    assign op_2[8] = output_add[1];
    assign valid_in_add[8] = valid_out_add[1];
    assign op_1[9] = output_add[2];
    assign op_2[9] = output_add[3];
    assign valid_in_add[9] = valid_out_add[3];
    assign op_1[10] = output_add[4];
    assign op_2[10] = output_add[5];
    assign valid_in_add[10] = valid_out_add[5];
    assign op_1[11] = output_add[6];
    assign op_2[11] = output_add[7];
    assign valid_in_add[11] = valid_out_add[7];
	
    assign op_1[12] = output_add[8];
    assign op_2[12] = output_add[9];
    assign valid_in_add[12] = valid_out_add[9];
    assign op_1[13] = output_add[10];
    assign op_2[13] = output_add[11];
    assign valid_in_add[13] = valid_out_add[11];
	
    assign op_1[14] = output_add[12];
    assign op_2[14] = output_add[13];
    assign valid_in_add[14] = valid_out_add[13];
	
    assign op_1[15] = output_add[14];
    assign op_2[15] = BIAS;
    assign valid_in_add[15] = valid_out_add[14];


	assign data_out = output_add[15];
	assign valid_out = valid_out_add[15];


	
	
// 	always @(posedge clk)
//       if (load_weight)
//         tmp[counter] <= weight;
// 	always @ (posedge clk or negedge resetn) begin
// 		if(resetn == 1'b0) begin
// 			counter <= 32'b0;
// 		end
// 		else if (load_weight == 1'b1) begin
// 			counter <= counter + 1;
// 		end
// 		else if (load_weight == 1'b0) begin
// 			counter <= counter;
// 		end
// 	end
// 	always @ (posedge clk or negedge resetn) begin
// 		if(resetn == 1'b0) begin
// 			load_weight_done <= 1'b0;
// 		end
// 		else if (counter == WIDTH*HEIGHT) begin
// 			load_weight_done <= 1'b1;
// 		end
// 		else begin
// 			load_weight_done <= load_weight_done;
// 		end
// 	end


// 	wire [31:0] result;
	

// 	FP_Top_Mult mult_weight(clk,resetn,valid_in,data_in,tmp[counter_1],result,valid_out_mult);

// 	generate
// 	for (i = 0; i < WIDTH*HEIGHT; i=i+1) begin
// 		if(i == 0) 
// 			nbit_dff #(32) nbit_dff_ins_result_mult(clk,resetn,valid_out_mult,result,product[i]);
// 		else 
// 			nbit_dff#(32) nbit_dff_ins_result_mul(clk,resetn,valid_out_mult,product[i-1],product[i]);
// 	end
// 	endgenerate
	
// 	always @ (posedge clk or negedge resetn) begin
// 		if(resetn == 1'b0) begin
// 			counter_1 <= 10'b0;
// 		end
// 		else if (valid_in == 1'b1) begin
// 			if(counter_1 == WIDTH*HEIGHT - 1) counter_1 <= 0; //0 to 15
// 			else counter_1 <= counter_1 + 10'b1;
			
// 		end
// 		else if (valid_in == 1'b0) begin
// 			counter_1 <= counter_1;
// 		end
// 	end
	
// 	// */
// 	always @ (posedge clk or negedge resetn) begin
// 		if(resetn == 1'b0) begin
// 			counter_2 <= 10'b0;
// 		end
// 		else 
//             if (valid_out_mult == 1'b1) 
//             begin
//                 if(counter_2 == WIDTH*HEIGHT-1) 
//                     counter_2 <= 0;
//                 else 
//                     counter_2 <= counter_2 + 10'b1;
//             end
//             else 
//                 counter_2 <= counter_2;
// 	end
// 	//assign full = (counter_2 == WIDTH*HEIGHT -1)?1'b1:1'b0;
	
// 	always @ (posedge clk or negedge resetn) 
//     begin
// 		if(resetn == 1'b0) begin
// 			full <= 1'b0;
// 		end
// 		else 
//             if(full == 1'b1) 
//                 full <= 1'b0;
//             else 
//                 if (counter_2 == WIDTH*HEIGHT-1) 
//                 begin
//                     if(valid_out_mult==1'b1)
//                         full <= 1'b1;
//                     else 
//                         full <= 1'b0;
//                 end
//                 else 
//                     full <= 1'b0;
// 	end
	
// 	reg [31:0] counter_top_2;
// 	always @(posedge clk or negedge resetn) 
//     begin
// 		if (resetn == 1'b0) 
//             counter_top_2 <= 0;
// 		else 
//             if(full == 1'b1) 
//                 counter_top_2 <= STAGES * 6 ; //8*6
//             else 
//                 if(counter_top_2 == 32'b0) 
//                     counter_top_2 <= 0;
//                 else 
//                     counter_top_2 <= counter_top_2 - 32'b1;
//     end

// 	assign enable_2 = (counter_top_2 > 0 | full == 1'b1)?1'b1:1'b0;
	
// 	wire [31:0] add_this [0:NUM_OPERANDs-1];
// 	generate
// 	for (i = 0; i < NUM_OPERANDs; i=i+1) 
//     begin :assign_addthis
// 		//j=j+1;
// 		if(i == NUM_OPERANDs -1 ) 
//             assign add_this[i]=tmp[WIDTH*HEIGHT];
// 		else 
//             assign add_this[i] = product[i];
// 	end
// 	endgenerate
	
	
// //////////////////////

// 	wire [NUM_OPERANDs-2:0] valid_in_add;
// 	wire [NUM_OPERANDs-2:0] valid_out_add;
// 	wire [31:0] output_add [0:NUM_OPERANDs-2];
// 	wire [31:0] op_1 [0:NUM_OPERANDs-2];
// 	wire [31:0] op_2 [0:NUM_OPERANDs-2];

// 	generate
// 	for (i = 0; i < NUM_OPERANDs-1; i=i+1) 
// 	 begin :initial_adders // needs (NUM_OPERANDs - 1) adders
// 		//j=j+1;
// 	FP_Top_AddSub fp_adders(clk,resetn,valid_in_add[i],op_1[i],op_2[i],output_add[i],valid_out_add[i]);
// 	end
// 	endgenerate


// 	wire [31:0] in_delay [0:NUM_DELAY-1];
//     wire [31:0] out_delay [0:NUM_DELAY-1];

//     generate 
// 	for (i = 0; i < NUM_DELAY; i=i+1) 
// 	begin :delay_clocksssss
// 	//  `ifdef XILINX
// 	// 	delay_clock #(.DATA_WIDTH(32),.N_CLOCKs(`XILINX_ADDER_LATENCY)) delay_xxx(clk,resetn,enable_2,in_delay[i],out_delay[i]);
// 	// 	`else
// 	// 	delay_clock #(.DATA_WIDTH(32),.N_CLOCKs(`ADDER_LATENCY)) delay_xxx(clk,resetn,enable_2,in_delay[i],out_delay[i]);
// 	// 	`endif
// 	delay_clock #(.DATA_WIDTH(32),.N_CLOCKs(4)) delay_xxx(clk,resetn,enable_2,in_delay[i],out_delay[i]);
// 	end
//     endgenerate 

//     assign op_1[0] = add_this[0];
//     assign op_2[0] = add_this[1];
//     assign valid_in_add[0] = full;
//     assign op_1[1] = add_this[2];
//     assign op_2[1] = add_this[3];
//     assign valid_in_add[1] = full;
//     assign op_1[2] = add_this[4];
//     assign op_2[2] = add_this[5];
//     assign valid_in_add[2] = full;
//     assign op_1[3] = add_this[6];
//     assign op_2[3] = add_this[7];
//     assign valid_in_add[3] = full;
//     assign op_1[4] = add_this[8];
//     assign op_2[4] = add_this[9];
//     assign valid_in_add[4] = full;
//     assign op_1[5] = add_this[10];
//     assign op_2[5] = add_this[11];
//     assign valid_in_add[5] = full;
//     assign op_1[6] = add_this[12];
//     assign op_2[6] = add_this[13];
//     assign valid_in_add[6] = full;
//     assign op_1[7] = add_this[14];
//     assign op_2[7] = add_this[15];
//     assign valid_in_add[7] = full;
//     assign in_delay[0] = add_this[16];
//     assign op_1[8] = output_add[0];
//     assign op_2[8] = output_add[1];
//     assign valid_in_add[8] = valid_out_add[1];
//     assign op_1[9] = output_add[2];
//     assign op_2[9] = output_add[3];
//     assign valid_in_add[9] = valid_out_add[3];
//     assign op_1[10] = output_add[4];
//     assign op_2[10] = output_add[5];
//     assign valid_in_add[10] = valid_out_add[5];
//     assign op_1[11] = output_add[6];
//     assign op_2[11] = output_add[7];
//     assign valid_in_add[11] = valid_out_add[7];
//     assign in_delay[1] = out_delay[0];
//     assign op_1[12] = output_add[8];
//     assign op_2[12] = output_add[9];
//     assign valid_in_add[12] = valid_out_add[9];
//     assign op_1[13] = output_add[10];
//     assign op_2[13] = output_add[11];
//     assign valid_in_add[13] = valid_out_add[11];
//     assign in_delay[2] = out_delay[1];
//     assign op_1[14] = output_add[12];
//     assign op_2[14] = output_add[13];
//     assign valid_in_add[14] = valid_out_add[13];
//     assign in_delay[3] = out_delay[2];
//     assign op_1[15] = output_add[14];
//     assign op_2[15] = out_delay[3];
//     assign valid_in_add[15] = valid_out_add[14];


// 	wire valid_out_0;
// 	wire [31:0] feature_0;
// 	dff valid_out_delay_inst (clk, resetn, 1'b1, valid_out_add[NUM_OPERANDs-2],valid_out_0);
// 	nbit_dff #(32) data_delay_inst (clk, resetn, valid_out_add[NUM_OPERANDs-2], output_add[NUM_OPERANDs-2],feature_0);
// 	FP_Top_AddSub add_bias (clk, resetn, valid_out_0, feature_0, tmp[16], feature, valid_out);


endmodule