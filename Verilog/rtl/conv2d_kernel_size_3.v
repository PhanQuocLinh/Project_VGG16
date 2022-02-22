`ifndef LINEBUFFER_INCLUDED
    `include "line_buffer.v"
    `define LINEBUFFER_INCLUDED
`endif
`ifndef FPMULT_INCLUDED
    // `include "FP_multiplier.v"
    `include "FP_Top_Mult.v"
    `define FPMULT_INCLUDED
`endif
`ifndef FPADD_INCLUDED
    // `include "fpadd.v"
    `include "FP_Top_AddSub.v"
    `define FPADD_INCLUDED
`endif
`ifndef DELAY_CLOCK_INCLUDED
    `include "delay_clock.v"
    `define DELAY_CLOCK_INCLUDED
`endif
`ifndef DELAY_VALID_INCLUDED
    `include "delay_valid.v"
    `define DELAY_VALID_INCLUDED
`endif

module conv2d_kernel_size_3 #(
    parameter DATA_WIDTH = 32,
    parameter IMG_WIDTH = 56,
    parameter IMG_HEIGHT = 56,
    parameter SIZE = 3,

    parameter kernelR0 = 32'h0, kernelR1 = 32'h0, kernelR2 = 32'h0, kernelR3 = 32'h0, kernelR4 = 32'h0, kernelR5 = 32'h0, kernelR6 = 32'h0, kernelR7 = 32'h0, kernelR8 = 32'h0
    )
    (
    input     wire            clk,
    input     wire            resetn,
    input     wire            data_valid_in,
    input     wire   [DATA_WIDTH-1:0]    data_in,

    output    wire   [31:0]    data_out,
    output     valid_out_pixel, // bi tat sau W*H - (W-2)*(H-2)
    output done
    );
    localparam NUM_OPERANDs = SIZE*SIZE;
    localparam NUM_DELAY = 3;
    wire [31:0] w       [0:SIZE*SIZE-1];
    wire [31:0] D       [0:SIZE*SIZE-1];

    wire [31:0] x       [0:SIZE*SIZE-1];
    wire [SIZE*SIZE-1:0] valid_out_mult;
    
    reg [31:0] counter;

    wire enable_mult;
    // delay num_padding*IMG_WIDTH + num_padding
    delay_valid #(.N_CLOCKs(1*IMG_WIDTH+1)) valid_ins(clk,resetn,data_valid_in,enable_mult);


    reg [31:0] counter_w5_col, counter_w5_row;
    always @(posedge clk or negedge resetn) 
    begin
        if (resetn == 1'b0) 
            counter_w5_col <= 0;
        else 
            if(enable_mult == 1'b1)
            begin
                counter_w5_col <= (counter_w5_col==IMG_WIDTH-1)?0:counter_w5_col + 1; 
            end 
            else 
                counter_w5_col <= counter_w5_col;
    end
    always @(posedge clk or negedge resetn) 
    begin
        if (resetn == 1'b0) 
        counter_w5_row <= 0;
        else 
            if(enable_mult == 1'b1)
            begin
                if(counter_w5_row != IMG_WIDTH -1)
                    counter_w5_row <= (counter_w5_col==IMG_WIDTH-1)?counter_w5_row + 1:counter_w5_row; 
                else 
                    counter_w5_row <= (counter_w5_col==IMG_WIDTH-1)?0:counter_w5_row;
            end 
            else 
                counter_w5_row <= counter_w5_row;
    end
  
    assign w[SIZE*SIZE-1] = data_in;
    nbit_dff #(.DATA_WIDTH(DATA_WIDTH)) 
                        dff_w7(
    clk,
    resetn,
    data_valid_in,
    w[8],
    w[7]);
    nbit_dff #(.DATA_WIDTH(DATA_WIDTH)) 
                        dff_w6(
    clk,
    resetn,
    data_valid_in,
    w[7],
    w[6]);
    line_buffer #(.DATA_WIDTH(DATA_WIDTH),.IMG_WIDTH(IMG_WIDTH)) 
                    lb_0(
    clk,
    resetn,
    data_valid_in,
    w[8],
    w[5]);
    nbit_dff #(.DATA_WIDTH(DATA_WIDTH)) 
                        dff_w4(
    clk,
    resetn,
    data_valid_in,
    w[5],
    w[4]);
    nbit_dff #(.DATA_WIDTH(DATA_WIDTH)) 
                        dff_w3(
    clk,
    resetn,
    data_valid_in,
    w[4],
    w[3]);
    line_buffer #(.DATA_WIDTH(DATA_WIDTH),.IMG_WIDTH(IMG_WIDTH)) 
                    lb_1(
    clk,
    resetn,
    data_valid_in,
    w[5],
    w[2]);
    nbit_dff #(.DATA_WIDTH(DATA_WIDTH)) 
                        dff_w1(
    clk,
    resetn,
    data_valid_in,
    w[2],
    w[1]);
    nbit_dff #(.DATA_WIDTH(DATA_WIDTH)) 
                        dff_w0(
    clk,
    resetn,
    data_valid_in,
    w[1],
    w[0]);

    assign D[0] = (counter_w5_row < 1 | counter_w5_col < 1 ) ? 0:  w[0];
    assign D[1] = (counter_w5_row < 1 ) ? 0:  w[1];
    assign D[2] = (counter_w5_row < 1 | counter_w5_col > IMG_WIDTH - 2 ) ? 0:  w[2];
    assign D[3] = (counter_w5_col < 1 ) ? 0:  w[3];
    assign D[4] = w[4];
    assign D[5] = (counter_w5_col > IMG_WIDTH - 2 ) ? 0:  w[5];
    assign D[6] = (counter_w5_row > IMG_WIDTH - 2 | counter_w5_col < 1 ) ? 0:  w[6];
    assign D[7] = (counter_w5_row > IMG_WIDTH - 2 ) ? 0:  w[7];
    assign D[8] = (counter_w5_row > IMG_WIDTH - 2 | counter_w5_col > IMG_WIDTH - 2 ) ? 0:  w[8];


    // ----------- thay the doan generate mach nhan ----------
    FP_Top_Mult kernel_0(
                        clk,
                        resetn,
                        //enable,
                        enable_mult,
                        kernelR0,
                        D[0],
                        x[0],
                        valid_out_mult[0]
                        );
                            
    FP_Top_Mult kernel_1(
                        clk,
                        resetn,
                        //enable,
                        enable_mult,
                        kernelR1,
                        D[1],
                        x[1],
                        valid_out_mult[1]
                        );
    FP_Top_Mult kernel_2(
                        clk,
                        resetn,
                        //enable,
                        enable_mult,
                        kernelR2,
                        D[2],
                        x[2],
                        valid_out_mult[2]
                        );
    FP_Top_Mult kernel_3(
                        clk,
                        resetn,
                        //enable,
                        enable_mult,
                        kernelR3,
                        D[3],
                        x[3],
                        valid_out_mult[3]
                        );
    FP_Top_Mult kernel_4(
                        clk,
                        resetn,
                        //enable,
                        enable_mult,
                        kernelR4,
                        D[4],
                        x[4],
                        valid_out_mult[4]
                        );
    FP_Top_Mult kernel_5(
                        clk,
                        resetn,
                        //enable,
                        enable_mult,
                        kernelR5,
                        D[5],
                        x[5],
                        valid_out_mult[5]
                        );
    FP_Top_Mult kernel_6(
                        clk,
                        resetn,
                        //enable,
                        enable_mult,
                        kernelR6,
                        D[6],
                        x[6],
                        valid_out_mult[6]
                        );
    FP_Top_Mult kernel_7(
                        clk,
                        resetn,
                        //enable,
                        enable_mult,
                        kernelR7,
                        D[7],
                        x[7],
                        valid_out_mult[7]
                        );
    FP_Top_Mult kernel_8(
                        clk,
                        resetn,
                        //enable,
                        enable_mult,
                        kernelR8,
                        D[8],
                        x[8],
                        valid_out_mult[8]
                        );
    // -------------------------------------------------------

    wire [SIZE*SIZE-2:0] valid_in_add;
    wire [SIZE*SIZE-2:0] valid_out_add;
    wire [31:0] output_add [0:SIZE*SIZE-2];
    wire [31:0] op_1 [0:SIZE*SIZE-2];
    wire [31:0] op_2 [0:SIZE*SIZE-2];

    genvar i;
    generate
    for (i = 0; i < NUM_OPERANDs-1; i=i+1) 
    begin :initial_adders // needs (NUM_OPERANDs - 1) adders
        FP_Top_AddSub fp_adders(clk,resetn,valid_in_add[i],op_1[i],op_2[i],output_add[i],valid_out_add[i]);
    end
    endgenerate

    wire [31:0] in_delay [0:NUM_DELAY-1];
    wire [31:0] out_delay [0:NUM_DELAY-1];
    generate 
    for (i = 0; i < NUM_DELAY; i=i+1) 
    begin :delay_clocksssss
        // ------------ Thay doi do delay theo mach cong ------------
        delay_clock #(.DATA_WIDTH(32),.N_CLOCKs(1)) delay_xxx(clk,resetn,1'b1,in_delay[i],out_delay[i]);
    end
	endgenerate

    assign op_1[0] = x[0];
    assign op_2[0] = x[1];
    assign valid_in_add[0] = valid_out_mult[0];
    assign op_1[1] = x[2];
    assign op_2[1] = x[3];
    assign valid_in_add[1] = valid_out_mult[0];
    assign op_1[2] = x[4];
    assign op_2[2] = x[5];
    assign valid_in_add[2] = valid_out_mult[0];
    assign op_1[3] = x[6];
    assign op_2[3] = x[7];
    assign valid_in_add[3] = valid_out_mult[0];
    assign in_delay[0] = x[8];
    assign op_1[4] = output_add[0];
    assign op_2[4] = output_add[1];
    assign valid_in_add[4] = valid_out_add[1];
    assign op_1[5] = output_add[2];
    assign op_2[5] = output_add[3];
    assign valid_in_add[5] = valid_out_add[3];
    assign in_delay[1] = out_delay[0];
    assign op_1[6] = output_add[4];
    assign op_2[6] = output_add[5];
    assign valid_in_add[6] = valid_out_add[5];
    assign in_delay[2] = out_delay[1];
    assign op_1[7] = output_add[6];
    assign op_2[7] = out_delay[2];
    assign valid_in_add[7] = valid_out_add[6];

    wire valid_temp;
    assign valid_temp = valid_out_add[NUM_OPERANDs-2];
    assign data_out = output_add[NUM_OPERANDs-2];
    assign valid_out_pixel = valid_temp;

    always @ (posedge clk or negedge resetn) 
    begin
        if(resetn == 1'b0) 
        begin
        counter <= 0;
        end
        else 
            if (done == 1'b1) 
            begin
            counter <= 0;
            end
            else 
                if(valid_out_pixel == 1'b1) 
                begin
                    if(counter == (IMG_WIDTH)*(IMG_HEIGHT) -1 ) 
                    begin
                        counter <= 0;
                    end 
                    else 
                    begin
                        counter <= counter + 1;
                    end
                end
                else 
                begin
                counter <= counter;
                end
    end
    
    assign done = (counter == (IMG_WIDTH)*(IMG_HEIGHT) -1 ) & valid_out_pixel;
endmodule
