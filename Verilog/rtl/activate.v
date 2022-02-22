module activate # (
			parameter DATA_WIDTH = 32 // 9 for integer
			// parameter ALPHA = 0
			)
		(in,out);
	input [DATA_WIDTH -1 :0] in;
	output [DATA_WIDTH -1 :0] out;

	assign out = (in[DATA_WIDTH -1]) ? 32'b0: in; // in < 0, out = alpha, in > 0, out = in
	

endmodule 
