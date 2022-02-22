module FP_nhan (Out, InA, InB);

	output [31:0] Out;
	input [31:0] InA, InB;
	reg [31:0] Out;
	reg sign;
	reg [7:0] expA, expB, PhanMu, expTemp;
	reg [47:0] mantise, mantiseB, mantiseA;
	reg [22:0]mantiseTemp;
	
	always @(*)
	begin
	sign = 1'b0;
	expA = 8'b0; expB = 8'b0; PhanMu = 8'b0; expTemp = 8'b0;
	mantise = 48'b0; mantiseB = 48'b0; mantiseA = 48'b0;
	mantiseTemp = 23'b0;
	
	if (InA == 32'b0 || InB == 32'b0)
			Out = 32'b0;
	else 
	begin
		sign = InA[31] ^ InB[31];
		expA = InA[30:23];
		expB = InB[30:23];
		mantiseA = {24'b0, 1'b1, InA[22:0]};
		mantiseB = {24'b0, 1'b1, InB[22:0]};
		PhanMu = (expA - 8'd127) + (expB - 8'd127) + 8'd127;
		mantise = mantiseA * mantiseB;
		// ---------
		begin
			if (mantise[47] == 1'b1)
			begin
				mantiseTemp = {mantise[46:24]};
				expTemp = PhanMu + 8'b1;
			end
			else
			begin
				mantiseTemp = {mantise[45:23]};
				expTemp = PhanMu;
			end
		end
		
		Out = {sign, expTemp, mantiseTemp};
	end
	end
endmodule
