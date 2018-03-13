//Serial Transmission System **
//Top Design

module STSystem_TD(clk,send,rst,ack,d,RTS,TX,PD);
input wire [0:7] d;
input wire clk,send,rst,ack;
output wire RTS,TX,PD;

wire txe,ld,clkout,opn;
wire [0:7] q;

STSystem_FSM FSM(.clk(clk), .send(send), .txe(txe), .rst(rst), .ack(ack), .PD(PD), .LD(ld), .CLKOUT(clkout), .RTS(RTS));
STSystem_Counter Counter(.clr(ld), .txclk(clkout), .TXE(txe));
STSystem_SR Shift_Register(.txclk(clkout), .ld(ld), .st(0), .opn(opn), .sp(1), .d(q), .TX(TX));
STSystem_Parity Parity(.st(0), .d(d), .sp(1), .OPn(opn));
STSystem_DL DataLatch(.pd(PD), .d(d), .Q(q));



endmodule