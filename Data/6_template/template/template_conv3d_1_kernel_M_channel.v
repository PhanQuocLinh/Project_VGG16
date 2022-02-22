`ifndef CONV_2D_KERNEL_SIZE_3_INCLUDED
    `include "conv2d_kernel_size_3.v"
    `define CONV_2D_KERNEL_SIZE_3_INCLUDED
`endif

module conv3d_kernel_{{n_channel}}_channel_size_3 #(
    parameter DATA_WIDTH = 32,
    parameter IMG_WIDTH = 56,
    parameter IMG_HEIGHT = 56,
    parameter CHANNEL = {{n_channel}},

    // Cx_Wy = CHANNELx_WEIGHTy
    {{param_weight_bias}}
    )
    (
    {{port}}
    );
    localparam NUM_OPERANDs = CHANNEL;
    localparam NUM_DELAY = {{n_delay}};           

    reg  [31:0] counter;
    wire [31:0] data_out_conv_kernel [0:CHANNEL-1];
    wire [CHANNEL-1:0] valid_out_conv_kernel;
    wire [CHANNEL-1:0] done_conv;

    wire [NUM_OPERANDs-2:0] valid_in_add;
    wire [NUM_OPERANDs-2:0] valid_out_add;
    wire [31:0] output_add [0:NUM_OPERANDs-2];
    wire [31:0] op_1 [0:NUM_OPERANDs-2];
    wire [31:0] op_2 [0:NUM_OPERANDs-2];

    wire [31:0] in_delay [0:NUM_DELAY-1];
    wire [31:0] out_delay [0:NUM_DELAY-1];

    {{instances}}


    {{content_assign_add}}


    // Tao ra (NUM_OPERANDs - 1) bo fp add
    genvar i;
    generate
        for (i = 0; i < NUM_OPERANDs-1; i=i+1) 
        begin :initial_adders // needs (NUM_OPERANDs - 1) adders
            FP_Top_AddSub fp_adders(clk,resetn,valid_in_add[i],op_1[i],op_2[i],output_add[i],valid_out_add[i]);
        end
    endgenerate

    // Delay input cho bo fp add
    generate 
        for (i = 0; i < NUM_DELAY; i=i+1) 
        begin :delay_clocksssss
            // ------------ Thay doi do delay theo mach cong ------------
            delay_clock #(.DATA_WIDTH(32),.N_CLOCKs(1)) delay_xxx(clk,resetn,1'b1,in_delay[i],out_delay[i]);
        end
    endgenerate

    
    wire valid_temp;
    wire [31:0] data_temp;
    assign valid_temp = valid_out_add[NUM_OPERANDs-2];
	assign data_temp = output_add[NUM_OPERANDs-2];

    wire temp_valid;
    FP_Top_AddSub add_bias(clk, resetn, valid_temp, data_temp, BIAS, data_out, temp_valid);

    assign valid_out_pixel = temp_valid;


    always @ (posedge clk or negedge resetn) 
    begin
        if(resetn == 1'b0)
            counter <= 0;
        else 
            if (done == 1'b1) 
                counter <= 0;
            else 
                if(valid_out_pixel == 1'b1)
                begin
                    if(counter == (IMG_WIDTH)*(IMG_HEIGHT) -1 )
                    counter <= 0;
                    else 
                    counter <= counter + 1;
                end
                else
                    counter <= counter;
    end
    
    assign done = (counter == (IMG_WIDTH)*(IMG_HEIGHT) -1) & valid_out_pixel;

  endmodule
