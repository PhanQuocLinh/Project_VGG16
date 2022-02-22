module core (
    clk,
    resetn,
    // FIFO READ
    ff_rdata,
    ff_rdreq,
    ff_empty,
    // FIFO WRITE
    ff_wdata,
    ff_wrreq,
    ff_full
    );
    //
    parameter DWIDTH = 32;
    parameter NUM_CHANNEL_IN = 8;       // Edit here 
    parameter WIDTH = 56;
    parameter HEIGHT = 56;
    //
    input   clk;
    input   resetn;
    // FIFO READ
    input [NUM_CHANNEL_IN*DWIDTH-1:0] ff_rdata;
    output reg   ff_rdreq;
    input ff_empty;
    // FIFO WRITE
    output [DWIDTH:0]   ff_wdata;         // Edit here 33bit
    output              ff_wrreq;
    input               ff_full;
    //
    wire start;
    assign start = (ff_empty == 0 && ff_full==0);

    reg data_valid_in;

    wire [DWIDTH-1:0]    data_out;          
    wire data_valid_out;
    wire done_ip;
    wire image_class;

    assign ff_wdata = {image_class, data_out};
    assign ff_wrreq = data_valid_out;


    always @(posedge clk or negedge resetn) begin
        if(resetn == 1'b0) begin
            ff_rdreq <= 1'b0;
        end
        else begin
            ff_rdreq <= start;
        end
    end

    always @(posedge clk or negedge resetn) begin
        if(resetn == 1'b0) begin
            data_valid_in <= 1'b0;     
        end
        else begin
            if (ff_rdreq==1) begin
                data_valid_in <= 1'b1;
            end
            else begin
                data_valid_in <= 1'b0;
            end

        end
    end
     
    wire [DWIDTH-1:0] data_in_0 = ff_rdata[DWIDTH-1   : 0];
    wire [DWIDTH-1:0] data_in_1 = ff_rdata[2*DWIDTH-1 : DWIDTH];
    wire [DWIDTH-1:0] data_in_2 = ff_rdata[3*DWIDTH-1 : 2*DWIDTH];
    wire [DWIDTH-1:0] data_in_3 = ff_rdata[4*DWIDTH-1 : 3*DWIDTH];
    wire [DWIDTH-1:0] data_in_4 = ff_rdata[5*DWIDTH-1 : 4*DWIDTH];
    wire [DWIDTH-1:0] data_in_5 = ff_rdata[6*DWIDTH-1 : 5*DWIDTH];
    wire [DWIDTH-1:0] data_in_6 = ff_rdata[7*DWIDTH-1 : 6*DWIDTH];
    wire [DWIDTH-1:0] data_in_7 = ff_rdata[8*DWIDTH-1 : 7*DWIDTH];

    
    vgg16_lite_2 #(
		.DATA_WIDTH(32),
        .WIDTH(WIDTH),
        .HEIGHT(HEIGHT)
    )
    vgg_lite (
		.clk(clk),
		.resetn(resetn),
		.valid_in(data_valid_in),
		.data_in_0(data_in_0),             
		.data_in_1(data_in_1),             
		.data_in_2(data_in_2), 
        // EXTEND
        .data_in_3(data_in_3),
        .data_in_4(data_in_4),
        .data_in_5(data_in_5),
        .data_in_6(data_in_6),
        .data_in_7(data_in_7),

        .data_out(data_out),
        .image_class(image_class),
		.valid_out(data_valid_out),
		.done(done_ip)
		);

endmodule