`ifndef DFF_INCLUDED
`include "dff.v"
`define DFF_INCLUDED
`endif
module nbit_dff(
		clk,
		resetn,
		enable,
		in,
		out
);
	parameter DATA_WIDTH = 8;
	//parameter N_CLOCKs = 20;

	input clk;
	input resetn;
	input enable;
	input [DATA_WIDTH-1:0] in;
	output [DATA_WIDTH-1:0] out;
	/*
	reg [DATA_WIDTH-1:0] R;
	
	assign out = R;
	
	always @ (posedge clk or negedge resetn) begin
		if (resetn == 1'b0) R <= 1'b0;
		else if (enable == 1'b1) R <= in;
		else R <= R;
	end
	*/
	genvar i;
	generate 
		for(i=0;i<DATA_WIDTH;i=i+1) begin
			dff dff_inst(clk,resetn,enable,in[i],out[i]);
		end
	endgenerate
endmodule
