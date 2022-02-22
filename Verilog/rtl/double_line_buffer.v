`include "line_buffer.v"
//

module double_line_buffer #(parameter DATA_WIDTH = 32,
                parameter IMG_WIDTH = 30
                )
        (clk,resetn/*,enable*/,data_valid_in,data_in,w1,w2,w3,w4,w5,w6,w7,w8,w9,valid_out);
    input clk;
    input resetn;
    //input enable;
    input data_valid_in;
    
    //input valid_in;
    input [DATA_WIDTH-1:0] data_in;

    output [DATA_WIDTH-1:0] w1;
    output [DATA_WIDTH-1:0] w2;
    output [DATA_WIDTH-1:0] w3;
    output [DATA_WIDTH-1:0] w4;
    output [DATA_WIDTH-1:0] w5;
    output [DATA_WIDTH-1:0] w6;
    output [DATA_WIDTH-1:0] w7; 
    output [DATA_WIDTH-1:0] w8;
    output [DATA_WIDTH-1:0] w9;
    output valid_out;
    
    //wire [8:0] valid_out_cvt2float;
    wire enable;
    // reg [31:0] counter;
    // reg [31:0] counter_done;
    //reg [DATA_WIDTH-1:0] data;
    
  /*
    always @(posedge clk or negedge resetn) begin
		if(resetn == 1'b0) data <= 8'b0;
		else if(data_valid_in== 1'b1) data <= data_in;
		else if(data_valid_in== 1'b0) data <= data;
	end
    */
    //reg enable_cvt;
    //assign a9 = data;
    /*
    always @ (posedge clk or negedge resetn) begin
        if (resetn == 1'b0) begin
            counter <= 0;
            //enable_cvt = 1'b0;
            //valid_out = 1'b0;
        end
        else if (data_valid_in == 1'b1) begin
          if(counter == IMG_WIDTH) counter <= counter;
          else counter <= counter + 1;
        end
        else if (data_valid_in == 1'b0) begin
          counter <= counter;
        end
    end 
    */
    
    // always @ (posedge clk or negedge resetn) begin
    //     if (resetn == 1'b0) begin
    //         valid_outR = 1'b0; 
    //     end
    //     else if(counter == IMG_WIDTH) begin //8 // + 5
    //       if(data_valid_in == 1'b1) valid_outR = 1'b1;
    //       else valid_outR = 1'b0;
    //     end
    //     else begin
    //         valid_outR = 1'b0;
    //     end
    // end 
    // delay_clock #(.DATA_WIDTH(1),.N_CLOCKs(1)) en_ins(clk,resetn,1'b1,data_valid_in,enable);
    // wire out_valid;

    // delay_clock #(.DATA_WIDTH(1),.N_CLOCKs(WIDTH_TOP+1)) valid_ins(clk,resetn,1'b1,data_valid_in,valid_out);

    // assign valid_out = out_valid & enable;

    // always @ (posedge clk or negedge resetn) begin
    //     if (resetn == 1'b0) begin
    //         counter <= 0;
    //         //enable_cvt = 1'b0;
    //         //valid_out = 1'b0;
    //     end
    //     else if (data_valid_in == 1'b1) begin
    //       if(counter == IMG_WIDTH) counter <= counter;
    //       else counter <= counter + 1;
    //     end
    //     else if (data_valid_in == 1'b0) begin
    //       counter <= counter;
    //     end
    // end 
    // reg out_valid;
    // always @ (posedge clk or negedge resetn) begin
    //     if (resetn == 1'b0) begin
    //         out_valid = 1'b0; 
    //     end
    //     else if(counter == IMG_WIDTH) begin //8 // + 5
    //       if(data_valid_in == 1'b1) out_valid = 1'b1;
    //       else out_valid = 1'b0;
    //     end
    //     else begin
    //         out_valid = 1'b0;
    //     end
    // end 
    // assign valid_out = out_valid;
    // #TODO
    delay_valid #(.N_CLOCKs(IMG_WIDTH+1)) valid_ins(clk,resetn,data_valid_in,valid_out);

    //delay_clock #(.N_CLOCKs(WIDTH_TOP+1)) valid_ins(clk,resetn,data_valid_in,valid_out);
    // assign valid_out = valid_outR;//(counter == IMG_WIDTH+1 && data_valid_in == 1'b1)?1'b1:1'b0;// valid_outR;
    

    //2 line bf
    assign w9 = data_in;
    line_buffer #(.DATA_WIDTH(DATA_WIDTH),.IMG_WIDTH(IMG_WIDTH)) 
                  lb_1(
                    clk,
                    resetn,
                    data_valid_in,
                    w9,
                    w6
                    );
                    
    line_buffer #(.DATA_WIDTH(DATA_WIDTH),.IMG_WIDTH(IMG_WIDTH)) 
                  lb_2(
                    clk,
                    resetn,
                    data_valid_in,
                    w6,
                    w3
                    );


    /* dung 3 line bf
    line_buffer #(.DATA_WIDTH(DATA_WIDTH),.IMG_WIDTH(IMG_WIDTH)) 
                  lb_1(
                    clk,
                    resetn,
                    enable,
                    data,
                    a9
                    );
                    
    line_buffer #(.DATA_WIDTH(DATA_WIDTH),.IMG_WIDTH(IMG_WIDTH)) 
                  lb_2(
                    clk,
                    resetn,
                    enable,
                    a9,
                    a6
                    );
    
    line_buffer #(.DATA_WIDTH(DATA_WIDTH),.IMG_WIDTH(IMG_WIDTH)) 
                  lb_3(
                    clk,
                    resetn,
                    enable,
                    a6,
                    a3
                    );
    */
    //windows scan
    // nbit_dff #(.DATA_WIDTH(DATA_WIDTH)) 
    //           dff_a9(
    //             clk,
    //             resetn,
    //             data_valid_in,
    //             data_in,
    //             w9
    //             );
    nbit_dff #(.DATA_WIDTH(DATA_WIDTH)) 
              dff_a8(
                clk,
                resetn,
                data_valid_in,
                w9,
                w8
                );
    nbit_dff #(.DATA_WIDTH(DATA_WIDTH)) 
              dff_a7(
                clk,
                resetn,
                data_valid_in,
                w8,
                w7
                );
    nbit_dff #(.DATA_WIDTH(DATA_WIDTH)) 
              dff_a5(
                clk,
                resetn,
                data_valid_in,
                w6,
                w5
                );
    nbit_dff #(.DATA_WIDTH(DATA_WIDTH)) 
              dff_a4(
                clk,
                resetn,
                data_valid_in,
                w5,
                w4
                );
    nbit_dff #(.DATA_WIDTH(DATA_WIDTH)) 
              dff_a2(
                clk,
                resetn,
                data_valid_in,
                w3,
                w2
                );
    nbit_dff #(.DATA_WIDTH(DATA_WIDTH)) 
              dff_a1(
                clk,
                resetn,
                data_valid_in,
                w2,
                w1
                );
  /*
    int2float w1_inst(
                      clk,
                      resetn,
                      data_valid_in,
                      a1,
                      enable_cvt,
                      w1,
                      valid_out_cvt2float[0]
                      );
    int2float w2_inst(
                      clk,
                      resetn,
                      data_valid_in,
                      a2,
                      enable_cvt,
                      w2,
                      valid_out_cvt2float[1]
                      );
    int2float w3_inst(
                      clk,
                      resetn,
                      data_valid_in,
                      a3,
                      enable_cvt,
                      w3,
                      valid_out_cvt2float[2]
                      );
    int2float w4_inst(
		                  clk,
                      resetn,
                      data_valid_in,
                      a4,
                      enable_cvt,
                      w4,
                      valid_out_cvt2float[3]
                      );
    int2float w5_inst(
                      clk,
                      resetn,
                      data_valid_in,
                      a5,
                      enable_cvt,
                      w5,
                      valid_out_cvt2float[4]
                      );
    int2float w6_inst(
                      clk,
                      resetn,
                      data_valid_in,
                      a6,
                      enable_cvt,
                      w6,
                      valid_out_cvt2float[5]
                      );
    int2float w7_inst(
                      clk,
                      resetn,
                      data_valid_in,
                      a7,
                      enable_cvt,
                      w7,
                      valid_out_cvt2float[6]
                      );
    int2float w8_inst(
                      clk,
                      resetn,
                      data_valid_in,
                      a8,
                      enable_cvt,
                      w8,
                      valid_out_cvt2float[7]
                      );
    int2float w9_inst(
                      clk,
                      resetn,
                      data_valid_in,
                      a9,
                      enable_cvt,
                      w9,
                      valid_out_cvt2float[8]
                      );

    and and_9(valid_out,
            valid_out_cvt2float[0],
            valid_out_cvt2float[1],
            valid_out_cvt2float[2],
            valid_out_cvt2float[3],
            valid_out_cvt2float[4],
            valid_out_cvt2float[5],
            valid_out_cvt2float[6],
            valid_out_cvt2float[7],
            valid_out_cvt2float[8]);
  */

endmodule