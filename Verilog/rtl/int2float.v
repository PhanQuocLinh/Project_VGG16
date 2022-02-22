// this module works only with unsigned 8 bit int (image's pixel)
module int2float(
                input clk,
		        input resetn,
		        input enable,
                input [7:0] int_value,
                //input valid_in,
		        output [31:0] flt_value,
                output reg valid_out
		);

    integer i;
    reg s;
    reg [7:0] exp;
    reg [22:0] mantissa;
    //wire [7:0] in;

    //assign in = (valid_in)?int_value:8'bx;

    assign flt_value = {s, exp, mantissa}; // positive int

    always @(posedge clk or negedge resetn) begin
        if(resetn == 1'b0) begin
            s = 1'b0;
            exp = 8'b0;
            mantissa = 23'b0;
            valid_out = 1'b0;
        end
        else 
        if(enable == 1'b1 /*&& valid_in == 1'b1*/) 
        begin
            if(int_value != 8'b0) 
            begin
                for(i = 0; i < 8; i = i + 1)
                    if(int_value[i]==1'b1) exp = i;
                //if(exp > 23)
                //    mantissa = int_value >> (exp - 23);
                //else if(exp < 23)
                s = 1'b0;
                mantissa = int_value << (23 - exp);
                //else
                //    mantissa = int_value;
                exp = exp + 127;
                valid_out = 1'b1;
            end
            else 
            begin 
                s = 1'b0;
                exp = 8'b0;
                mantissa = 23'b0;
                valid_out = 1'b1;
            end
        end
        else 
        begin 
            s = 0;
            exp = 0;
            mantissa = 0;
            valid_out = 1'b0;
        end
    end
endmodule
