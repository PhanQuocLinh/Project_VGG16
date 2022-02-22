module vip_top (
    clock,
    resetn,
    //
    // fifo_in_data  ,

    // EXTEND
    fifo_in_data_0  ,
    fifo_in_data_1  ,
    fifo_in_data_2  ,
    fifo_in_data_3  ,
    fifo_in_data_4  ,
    fifo_in_data_5  ,
    fifo_in_data_6  ,
    fifo_in_data_7  ,

    fifo_in_wrreq , 
    fifo_in_full  ,  
    //
    fifo_out_data  ,     
    fifo_out_rdreq ,    
    fifo_out_empty 
    );
    parameter DWIDTH = 32;
    parameter NUM_CHANNEL_IN = 8;           // Edit here
    parameter WIDTH = 56;
    parameter HEIGHT = 56;
    
    //
    input    clock;
    input    resetn;
        //
    // input [DWIDTH-1:0]	fifo_in_data;
    // EXTEND
    input [DWIDTH-1:0]	fifo_in_data_0;
    input [DWIDTH-1:0]	fifo_in_data_1;
    input [DWIDTH-1:0]	fifo_in_data_2;
    input [DWIDTH-1:0]	fifo_in_data_3;
    input [DWIDTH-1:0]	fifo_in_data_4;
    input [DWIDTH-1:0]	fifo_in_data_5;
    input [DWIDTH-1:0]	fifo_in_data_6;
    input [DWIDTH-1:0]	fifo_in_data_7;


    input               fifo_in_wrreq;
    output              fifo_in_full;  
    //
    output [DWIDTH:0] fifo_out_data  ;                             // Edit here 33bit
    input    						fifo_out_rdreq ;  
    output    					fifo_out_empty;
    //------------------------------------------------------------------
    wire [NUM_CHANNEL_IN*DWIDTH-1:0] data_din;
    wire 							data_in_empty;
    wire 							data_rdreq;
    //------- write result to FIFO-----------------------------
    wire [DWIDTH:0] data_out;                                       // Edit here 33bit
    wire 							data_out_full;
    wire 							data_out_wrreq;
    //
    wire [NUM_CHANNEL_IN*DWIDTH-1:0] fifo_in_data;    

    assign fifo_in_data = {fifo_in_data_7, fifo_in_data_6, fifo_in_data_5, fifo_in_data_4, fifo_in_data_3, fifo_in_data_2, fifo_in_data_1, fifo_in_data_0};
    // assign fifo_in_data = {fifo_in_data_2, fifo_in_data_1, fifo_in_data_0};
     

    fifo_24b #(
        .DWIDTH(32),
        .NUM_CHANNEL_IN(NUM_CHANNEL_IN)
    ) fifo_in_inst(
        .clock(clock),
        .data(fifo_in_data),
        .wrreq(fifo_in_wrreq),
        .almost_full(fifo_in_full),	

        .rdreq(data_rdreq),
        .almost_empty(data_in_empty),
        .q(data_din)

        );
    //
    core  #(
        .NUM_CHANNEL_IN(NUM_CHANNEL_IN),
        .WIDTH(WIDTH),
        .HEIGHT(HEIGHT)
    )core_inst(
        .clk(clock),
        .resetn(resetn),
        // FIFO READ
        .ff_rdata(data_din),
        .ff_rdreq(data_rdreq),
        .ff_empty(data_in_empty),
        // FIFO WRITE
        .ff_wdata(data_out),
        .ff_wrreq(data_out_wrreq),
        .ff_full(data_out_full)
    );
    //
    fifo_24b #(
        .DWIDTH(33),
        .NUM_CHANNEL_IN(1)
    ) fifo_out_inst(
        .clock(clock),
        
        .data(data_out),
        .wrreq(data_out_wrreq),
        .almost_full(data_out_full),

        .rdreq(fifo_out_rdreq),	
        .almost_empty(fifo_out_empty),
        .q(fifo_out_data)
        );
endmodule
