`define f2r(z) ({z[31], z[30], {3{~z[30]}}, z[29:23], z[22:0], {29{1'b0}}})
`define r2f(z) ({z[63], z[62], z[58:52], z[51:29]})

module sigmoid(
    clk,
    resetn,
    valid_in,
    x,
    f_x,
    image_class,
    valid_out
    );
    input clk;
	input resetn;
	input valid_in;
    input [31:0] x;
    output reg [31:0] f_x;
    output image_class;
    output reg valid_out;
    
    wire [31:0] x1;
    assign x1 = (x[31] == 1'b0) ? {1'b1, x[30:0]} : {1'b0, x[30:0]};
    reg [63:0] tp, fx;
    reg valid_s1, valid_s2, valid_s3;
    real r0;

    // s1: chuyen float sang real
    always @ (posedge clk or negedge resetn)begin
        if (resetn == 1'b0)begin
            tp <= 0;
            valid_s1 <= 0;
        end
        else if(valid_in == 1'b1)begin
            tp <= `f2r(x1);
            valid_s1 <= valid_in;
        end
        else begin
            tp <= tp;
            valid_s1 <= 0;
        end
    end

    // s2: tinh r0 = 1+e^(-tp)
    always @ (posedge clk or negedge resetn)begin
        if (resetn == 1'b0)begin
            r0 <= 0;
            valid_s2 <= 0;
        end
        else if(valid_s1 == 1'b1)begin
            r0 <= 1 + 2.71828182846**$bitstoreal(tp);
            valid_s2 <= valid_s1;
        end
        else begin
            r0 <= r0;
            valid_s2 <= 0;
        end
    end
    
    // s3: fx = 1/r0
    always @ (posedge clk or negedge resetn)begin
        if (resetn == 1'b0)begin
            fx <= 0;
            valid_s3 <= 0;
        end
        else if(valid_s2 == 1'b1)begin
            fx <= $realtobits(1 / r0);
            valid_s3 <= valid_s2;
        end
        else begin
            fx <= fx;
            valid_s3 <= 0;
        end
    end

    // Done
    always @(posedge clk or negedge resetn) begin
        if(resetn == 1'b0) begin
            valid_out <= 0;
            f_x <= 0;
        end
        else if(valid_s3 == 1'b1) begin
            valid_out <= valid_s3;
            f_x <= `r2f(fx);
        end
        else begin 
            f_x <= f_x;
            valid_out <= 0;
        end
    end

    // if f_x < 0.5 return image_class = 0 else image_class = 1
    assign image_class = (f_x[31] == 1'b1) ? 1'b0 : ((f_x < 32'h3f000000) ? 1'b0 : 1'b1);
  
endmodule