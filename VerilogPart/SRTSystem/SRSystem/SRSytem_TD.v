//Serial Reception System
//Top Design


module SRSystem_TD(clk,ack,en,rst,rx,st,DRY,ERR,Q);
input wire clk,ack,en,rst,rx,st;
output wire DRY,ERR;
output wire [7:0] Q;

wire p,qsp,rxo,rxf,clr,pd,rxclk,qst,opn;
wire [7:0] d;
SRSystem_FSM FSM(.clk(clk), .st(st), .ack(ack), .en(en), .rst(rst), .p(p), .sp(qsp), .rxo(rxo), .rxf(rxf), .CDC(clr), .PD(pd), .RXCK(rxclk), .DRY(DRY), .ERR(ERR));
SRSystem_SR Shift_Register(.rxclk(rxclk), .rx(rx), .clr(clr), .QST(qst), .OPn(opn), .QSP(qsp), .RXO(rxo), .Q(d));
SRSystem_Parity Parity(.qst(qst), .q(q), .opn(opn), .qsp(qsp), .P(p));
SRSystem_Counter Counter(.clr(clr), .rxclk(rxclk), .RXF(rxf));
SRSystem_DL Data_Latch(.pd(pd), .d(d), .Q(Q));



endmodule