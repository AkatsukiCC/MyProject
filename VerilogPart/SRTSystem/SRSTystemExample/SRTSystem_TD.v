//Serial Reception System **
//Serial Transmission System **
//TOP Design

module SRTSystem_TD(clk,send,rst,d,en,ERR,Q,extra_ack);//extra_ack
input wire clk,send,rst,en;
input wire [0:7] d;
output wire ERR;
output wire[0:7] Q;

output wire [0:1] extra_ack; //extra

wire stsack,srsack,dry,rts,tx,pd;

STSystem_TD STSystem(.clk(clk), .send(send), .rst(rst), .ack(stsack), .d(d), .RTS(rts), .TX(tx),.PD(pd));
SRTSystem_ACK STSACK(.ready(rts), .clk(clk), .ACK(stsack));

SRSystem_TD SRSystem(.clk(clk), .ack(srsack), .en(en), .rst(rst), .rx(tx), .st(~pd), .DRY(dry), .ERR(ERR), .Q(Q));
SRTSystem_ACK SRSACK(.ready(dry), .clk(clk), .ACK(srsack));

assign extra_ack = {stsack,srsack}; //extra

endmodule
