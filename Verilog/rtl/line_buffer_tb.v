`timescale 1ns/1ps

module line_buffer_tb;
  wire [7:0] w1,w2,w3,w4,w5,w6,w7,w8,w9;
  wire enable_mult;
  reg [7:0] in;
  reg clk, resetn, valid_in;
  
  integer i;
  initial
  begin
    clk = 1'b0;
    resetn = 1'b0;
    valid_in = 1'b1;
    in = 8'd13;
    #20 resetn = 1'b1; 
    for (i = 0; i < 70; i = i+1)
    begin
      in = i+1;  
      #20;
    end
    #700 $stop;
  end
  
  always #10 clk <= ~clk;


// //#(.DATA_WIDTH(DATA_WIDTH),.IMG_WIDTH(WIDTH)) 
//   line_buffer lb_1(   clk,
//                       resetn,
//                       valid_in,
//                       in,
//                       out);
  
  double_line_buffer #(.DATA_WIDTH(8),.IMG_WIDTH(4)) 
              double_lbs(
                clk,
                resetn,
                //enable,
                valid_in/*|push_remain*/,
                in,
                w1,
                w2,
                w3,
                w4,
                w5,
                w6,
                w7,
                w8,
                w9,
                enable_mult
              );
endmodule