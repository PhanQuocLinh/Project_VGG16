////////////////////////////////////////////
//  MODULE: LINE_BUFFER_USING_SHIFT_REGISTER
//  AUTHOR: VirosTeam
//  Created on Mar 15, 2017
////////////////////////////////////////////
//`include "../Lib_Cells/dff"
module line_buffer #(
	parameter DATA_WIDTH = 8,
    parameter IMG_WIDTH = 30
    )
    (
	input      wire                    clk,
	input      wire                    resetn,
	input      wire                    enable,
	input      wire     [DATA_WIDTH-1:0]    in,
	output     wire     [DATA_WIDTH-1:0]    out
);
    
	wire [DATA_WIDTH-1:0] tmp [0:IMG_WIDTH-1];
	assign out = tmp[IMG_WIDTH-1];
	//generate function
	genvar i;
	generate
	for (i = 0; i < IMG_WIDTH; i=i+1) begin
		if(i == 0) nbit_dff #(DATA_WIDTH) nbit_dff_ins(clk,resetn,enable,in,tmp[i]);
		else nbit_dff #(DATA_WIDTH) nbit_dff_ins(clk,resetn,enable,tmp[i-1],tmp[i]);
	end
	endgenerate
  
endmodule


