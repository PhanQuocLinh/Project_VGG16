`include "FP_cong.v"
// `include "delay_clock.v"

module FP_Top_AddSub (
    input  clk, resetn, valid_in,
    input  [31:0] a, b,
    output reg [31:0] out,
    output valid_out    
);
    // reg [31:0] out;
    wire [31:0] out_addsub;

    FP_cong cong_fp (out_addsub, a, b);

    always @(posedge clk or negedge resetn) 
    begin
        if (resetn == 1'b0)
        begin
            out <= 32'b0;
        end 
		else 
            if(valid_in == 1'b1)
            begin
                out <= out_addsub;
                // in1 <= a;
                // in2 <= b;
            end 
            else 
            // if (valid_in == 1'b0) 
            begin
                out <= out;
                // in1 <= in1;
                // in2 <= in2;
            end
    end

    delay_clock #(.DATA_WIDTH(1),.N_CLOCKs(1)) valid_inst(clk, resetn, 1'b1, valid_in, valid_out);

endmodule