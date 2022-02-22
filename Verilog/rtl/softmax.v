`define f2r(z) ({z[31], z[30], {3{~z[30]}}, z[29:23], z[22:0], {29{1'b0}}})
`define r2f(z) ({z[63], z[62], z[58:52], z[51:29]})
module softmax(
    clk,
    resetn,
    valid_in,
    class0,class1,
    percent0,percent1,
    valid_out
    );
    input clk;
	input resetn;
	input valid_in;
    input [31:0] class0,class1;
    output [31:0] percent0,percent1;
    output reg valid_out;

    

    reg [63:0] num0, num1, per0, per1;
    assign percent0 = `r2f(per0);
    assign percent1 = `r2f(per1);
    reg s1,s2,s3;
    real r0,r1,r_sum,r0_bk,r1_bk;
    always @ (posedge clk or negedge resetn)begin
        if (resetn == 1'b0)begin
            num0 <= 0;
            num1 <= 0;
            s1 <= 0;
        end
        else if(valid_in == 1'b1)begin
            num0 <= `f2r(class0);
            num1 <= `f2r(class1);
            s1 <= valid_in;
        end
        else begin
            num0 <= num0;
            num1 <= num1;
            s1 <= 0;
        end
    end
    always @ (posedge clk or negedge resetn)begin
        if (resetn == 1'b0)begin
            r0 <= 0;
            r1 <= 0;
            s2 <= 0;
        end
        else if(s1 == 1'b1)begin
            r0 <= 2.71828182846**$bitstoreal(num0);
            r1 <= 2.71828182846**$bitstoreal(num1);
            s2 <= s1;
        end
        else begin
            r0 <= r0;
            r1 <= r1;
            s2 <= 0;
        end
    end
    always @ (posedge clk or negedge resetn)begin
        if (resetn == 1'b0)begin
            r_sum <= 0;
            s3 <= 0;
            r0_bk <= 0;
            r1_bk <= 0;
        end
        else if(s2 == 1'b1)begin
            r_sum <= r0 + r1;
            r0_bk <= r0;
            r1_bk <= r1;
            s3 <= s2;
        end
        else begin
            r_sum <= r_sum;
            r0_bk <= r0_bk;
            r1_bk <= r1_bk;
            s3 <= 0;
        end
    end
    always @ (posedge clk or negedge resetn)begin
        if (resetn == 1'b0)begin
            per0 <= 0;
            per1 <= 0;
            valid_out <= 0;
        end
        else if(s3 == 1'b1)begin
            per0 <= $realtobits(r0_bk/r_sum);
            per1 <= $realtobits(r1_bk/r_sum);
            valid_out <= s3;
        end
        else begin
            per0 <= per0;
            per1 <= per1;
            valid_out <= 0;
        end
    end
endmodule