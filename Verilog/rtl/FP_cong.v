module FP_cong ( o, a, b);
	input [31:0] a, b;
	output reg [31:0] o;
	
	reg [23:0] aM, bM, sM;
	reg [23:0]	tM;
	reg [7:0] aE, bE, tE;
	reg aS, bS, tS, x;
	
	always @ (*) begin
		aM[23:0] = {1'b1,a[22:0]};
		bM[23:0] = {1'b1,b[22:0]};
		
		aE[7:0] = a[30:23];
		bE[7:0] = b[30:23]; 
		
		aS = a[31];
		bS = b[31];
		
// Quy ve dong MU
		if (aE[7:0] > bE[7:0]) begin
			tE = aE - bE;	
			bM = bM >> tE;	
			tE = aE;
		end else if (bE[7:0] > aE[7:0]) begin
			tE = bE - aE;
			aM = aM >> tE;	
			tE = bE;
		end else begin
			tE = aE;
		end
// Xu ly theo dau	
		if ((aS^bS)==1'b1) begin // Khac dau
			if (aM>=bM) begin
				{x,tM} = aM - bM;
				if (bM==aM) begin
					tS = 0;
				end else begin
					tS = aS;
				end
			end else begin
				{x,tM} = bM - aM;
				tS = bS;
			end
//////////////////////////////////////////
			if(tM[23]==1) begin
					tM = tM;
			end else if (tM[22]==1) begin
					tM = tM << 1;
					tE = tE - 8'd1;
			end else if (tM[21]==1) begin
					tM = tM << 2;
					tE = tE - 8'd2;
			end else if (tM[20]==1) begin
					tM = tM << 3;
					tE = tE - 8'd3;
			end else if (tM[19]==1) begin
					tM = tM << 4;
					tE = tE - 8'd4;
			end else if (tM[18]==1) begin
					tM = tM << 5;
					tE = tE - 8'd5;
			end else if (tM[17]==1) begin
					tM = tM << 6;
					tE = tE - 8'd6;
			end else if (tM[16]==1) begin
					tM = tM << 7;
					tE = tE - 8'd7;
			end else if (tM[15]==1) begin
					tM = tM << 8;
					tE = tE - 8'd8;
			end else if (tM[14]==1) begin
					tM = tM << 9;
					tE = tE - 8'd9;
			end else if (tM[13]==1) begin
					tM = tM << 10;
					tE = tE - 8'd10;
			end else if (tM[12]==1) begin
					tM = tM << 11;
					tE = tE - 8'd11;
			end else if (tM[11]==1) begin
					tM = tM << 12;
					tE = tE - 8'd12;
			end else if (tM[10]==1) begin
					tM = tM << 13;
					tE = tE - 8'd13;
			end else if (tM[9]==1) begin
					tM = tM << 14;
					tE = tE - 8'd14;
			end else if (tM[8]==1) begin
					tM = tM << 15;
					tE = tE - 8'd15;
			end else if (tM[7]==1) begin
					tM = tM << 16;
					tE = tE - 8'd16;
			end else if (tM[6]==1) begin
					tM = tM << 17;
					tE = tE - 8'd17;
			end else if (tM[5]==1) begin
					tM = tM << 18;
					tE = tE - 8'd18;
			end else if (tM[4]==1) begin
					tM = tM << 19;
					tE = tE - 8'd19;
			end else if (tM[3]==1) begin
					tM = tM << 20;
					tE = tE - 8'd20;
			end else if (tM[2]==1) begin
					tM = tM << 21;
					tE = tE - 8'd21;
			end else if (tM[1]==1) begin
					tM = tM << 22;
					tE = tE - 8'd22;
			end else if (tM[0]==1) begin
					tM = tM << 23;
					tE = tE - 8'd23;
			end else begin
					tS = 0;
					tE = 0;
					tM = 0;
			end	
//////////////////////////////////////////////		
		end else begin // Cung dau
			{x,tM} = aM + bM;
			if (x==1) begin
				if ({aE, tM} == 32'b0)
					tE = 8'b0;
				else
				begin
					tE = tE + 8'd1;
					tM = tM >> 1;					
				end
			end
			tS = aS;
		end
		
		o[31] = tS;
		o[30:23] = tE[7:0];
		o[22:0] = tM[22:0];
	end
	
endmodule