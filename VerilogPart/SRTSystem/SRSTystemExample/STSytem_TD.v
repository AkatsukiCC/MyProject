//Serial Transmission System **
//Top Design

module STSystem_TD(clk,send,rst,ack,d,RTS,TX,PD);
input wire [0:7] d;
input wire clk,send,rst,ack;
output wire RTS,TX,PD;

wire txe,ld,clkout,opn;
wire [0:7] q;


wire [3:0] extra_counter;  //extra
wire [0:10] extra_loaddata; //extra
STSystem_FSM FSM(.clk(clk), .send(send), .txe(txe), .rst(rst), .ack(ack), .PD(PD), .LD(ld), .CLKOUT(clkout), .RTS(RTS));



STSystem_Counter Counter(.clr(ld), .txclk(clkout), .TXE(txe), .extra_counter(extra_counter));//[3:0]extra_counter
STSystem_SR Shift_Register(.txclk(clkout), .ld(ld), .st(1'b0), .opn(opn), .sp(1'b1), .d(q), .TX(TX), .extra_loaddata(extra_loaddata));//[0:10]extra_loaddata, TX
STSystem_Parity Parity(.st(1'b0), .d(q), .sp(1'b1), .OPn(opn));//none
STSystem_DL DataLatch(.pd(PD), .d(d), .Q(q));//[0:7] q


reg [23:0]  w_file;

initial
w_file = $fopen("data/STStd_Device_data24.bin");  


always @(posedge clk)
begin
    $fdisplay(w_file,"%b",{extra_loaddata,TX,extra_counter,q});
end





endmodule
