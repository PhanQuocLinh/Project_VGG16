`timescale 1ns/1ps

`include "../Verilog/rtl/dimension.v"

module tb_floating_point;
    parameter Infile    = "../Data/data_decimal_image_channel_000.txt";
    parameter Outfile   = "../Data/modelsim_float_channel_000.txt";

    parameter k = 10;

    parameter DATA_WIDTH = 32;
    // parameter WIDTH = 6;
    // parameter HEIGHT = 6;
    parameter Total_Pixel = `IMG_WIDTH * `IMG_HEIGHT;

    reg clk;
    reg resetn;
    reg valid_in;
    reg [31:0] in1;
    reg [31:0] in2;
    wire [31:0] product;
    wire valid_out;

    reg [32-1:0] In_Memory [0:Total_Pixel-1];

    initial 
    begin
        $readmemh(Infile, In_Memory);
    end

    initial 
    begin
        clk = 1'b0;
        resetn = 1'b0;
        valid_in = 1'b1;    
        #(k*3/2) resetn = 1'b1;
    end

    integer i;
    initial 
    begin 
        //#(k*2) data_in = In_Memory[i];
        #(k*3/2);
        for (i = 0; i < Total_Pixel; i = i + 2) 
        begin
            
            if (i == 4)
            valid_in = 1'b0; 
            if (i == 6)
            valid_in = 1'b1; 

            if (i == 10)
            valid_in = 1'b0; 
            if (i == 14)
            valid_in = 1'b1; 

            
            in1 = In_Memory[i];
            in2 = In_Memory[i + 1];
            #(k*2);            
        end
        
        // #(k*4) $stop;
    end

    integer j;
    reg [32-1:0] Out_Memory [0:Total_Pixel/2-1];
    initial 
    begin
        j = 0;
        #(k*3/2);

        while (valid_out == 1'b0)
        begin
             #(k*2);
        end

        for (j = 0; j < Total_Pixel/2; j = j + 1)
        begin
            if (valid_out == 1'b1)
                Out_Memory[j] = product;
            else
                Out_Memory[j] = 32'hx;
            #(k*2);
        end

        #(k*2) $writememh(Outfile, Out_Memory);
        #k $stop;
    end
    
    always #k clk = ~clk;

    // testbench cho mach Nhan fp
    // FP_multiplier ins_mult(
	// 		clk,
	// 		resetn,
	// 		valid_in,
	// 		in1,
	// 		in2,
	// 		product,
	// 		valid_out
    // );

    // testbench cho mach Cong fp
    fpadd ins_add(clk, resetn, valid_in, in1, in2, product, valid_out);

endmodule