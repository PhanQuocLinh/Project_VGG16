`ifndef ACTIVATE_INCLUDED
    `include "activate.v"
    `define ACTIVATE_INCLUDED
`endif
`ifndef MAX_POOLING_INCLUDED
    `include "max_pooling.v"
    `define MAX_POOLING_INCLUDED
`endif

module {{module_name}} #(
    parameter DATA_WIDTH = 32,
    parameter WIDTH = 56,
    parameter HEIGHT = 56,
    parameter CHANNEL_OUT = {{n_kernel}}
    ) 
    (
    {{port}}
    );
    // testbench cho mach conv3d_8kernel_3channel
    wire [DATA_WIDTH-1:0] conv_out  [0: CHANNEL_OUT -1];    
    wire conv_valid_out;
    wire done_conv;

    assign valid_out = conv_valid_out;
    assign done = done_conv;

    // gan output cho block1_conv1-relu-maxpool
    // wire [DATA_WIDTH-1:0] relu_out  [0: CHANNEL_OUT -1];
    // wire [DATA_WIDTH-1:0] data_out_pool [0: CHANNEL_OUT -1];
    // wire [CHANNEL_OUT -1 : 0] valid_out_pool;
    // wire [CHANNEL_OUT -1 : 0] done_pool;


    // assign data_out_0 = data_out_pool[0];
    // assign data_out_1 = data_out_pool[1];
    // assign data_out_2 = data_out_pool[2];
    // assign data_out_3 = data_out_pool[3];
    // assign data_out_4 = data_out_pool[4];
    // assign data_out_5 = data_out_pool[5];
    // assign data_out_6 = data_out_pool[6];
    // assign data_out_7 = data_out_pool[7];

    // assign valid_out = valid_out_pool[CHANNEL_OUT -1];
    // assign done = done_pool[CHANNEL_OUT -1];


    // gan output cho block1_conv1

    {{instances}}

    // genvar i;

    // generate
    // for (i = 0; i < CHANNEL_OUT; i=i+1) 
    // begin :initial_relu_and_max_pool // needs CHANNEL_OUT relu
    //     // FP_Top_AddSub fp_adders(clk,resetn,valid_in_add[i],op_1[i],op_2[i],output_add[i],valid_out_add[i]);

    //     activate #(
    //         .DATA_WIDTH(32)
    //     )
    //     relu (
    //         .in(conv_out[i]),
    //         .out(relu_out[i])
    //     );

    //     max_pooling #(
    //         .DATA_WIDTH(32),
    //         .WIDTH(WIDTH),
    //         .HEIGHT(HEIGHT)
    //     )
    //     max_pool(
    //         .clk(clk),
    //         .resetn(resetn),
    //         .valid_in(conv_valid_out),
    //         .data_in(relu_out[i]),
    //         .data_out(data_out_pool[i]),
    //         .valid_out(valid_out_pool[i]),
    //         .done(done_pool[i])
    //     );
    // end
    // endgenerate

endmodule