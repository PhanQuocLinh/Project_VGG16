`timescale 1ns/1ps
module max_pooing_tb;
  parameter Infile = "E:/LAB/LAB_20_21_HK_II/CE434-ChuyenDeTKVM/VGG16/CodePythonCNN/data_input.txt";
//parameter Outfile = "/v_env/ce434/demo_vivado/rgb2hsv/python_code/data_out_modelsim.txt";

  parameter k = 20;

  parameter DATA_WIDTH = 32;
  parameter WIDTH = 4;
  parameter HEIGHT = 4;
  parameter Total_Pixel = WIDTH * HEIGHT;
    
  reg clk;
  //reg ack;
  reg resetn;
  reg valid_in;
    
  reg [DATA_WIDTH-1:0] data_in;
  wire [DATA_WIDTH-1:0] data_out;
  wire valid_out;
  // ---------- DOAN NAY DE TEST ----------
  // wire [5-1:0] counter_1;
  // wire [8-1:0] counter_2;
  wire enable_count;    
  wire [DATA_WIDTH-1:0] w1, w2, w3, w4;
  wire valid_max;
  wire counter_h;
  // wire [6-1:0] counter_v;

  wire [3-1:0] counter_v;
  wire [2-1:0] counter_1;
  wire [2-1:0] counter_2;
  // ---------- DOAN NAY DE TEST ----------

  /*wire done;*/
  
  //wire [7:0] c2;

  reg [32-1:0] In_Memory [0:Total_Pixel-1];

initial begin
  $readmemh(Infile, In_Memory);
end

integer i;
initial begin 
  //#(k*2) data_in = In_Memory[i];
  #(k*3/2);
  for (i = 0; i < Total_Pixel; i = i + 1) begin
    /*
    if (i == 5)
      valid_in = 1'b0; 
    if (i == 7)
      valid_in = 1'b1; 
    */
    data_in = In_Memory[i];
    #(k*2);
    
  end
  
  #(k*4) $stop;
end

initial begin
  clk = 1'b0;
  //ack = 1'b0;
  resetn = 1'b0;
  valid_in = 1'b1;    
  #(k*3/2) resetn = 1'b1;
end

always #k clk = ~clk;

max_pooling ins(clk,
    //enable,
    //ack,
    resetn,
    valid_in,
    //enable_count,
    data_in,
    data_out,
    valid_out,
    done,
    counter_1, counter_2, enable_count, w1, w2, w3, w4, valid_max, counter_h, counter_v
    );

endmodule