`include "conv3d_kernel_{{n_channel}}_channel_size_3.v"

module conv3d_{{n_kernel}}_kernel_{{n_channel}}_channel_size_3 #(
	parameter DATA_WIDTH = 32,
    parameter IMG_WIDTH = 56,
    parameter IMG_HEIGHT = 56,
    parameter CHANNEL = {{n_channel}},
    parameter NUM_KERNEL = {{n_kernel}},

    // Kx_Cy_Wz = KERNELx_CHANNELy_WEIGHTz
    {{param_weight_bias}}
    )
    (
    {{port}}
    );

    wire [NUM_KERNEL-1:0] valid_out_conv;
	wire [NUM_KERNEL-1:0] done_conv; 

    {{instances}}

endmodule