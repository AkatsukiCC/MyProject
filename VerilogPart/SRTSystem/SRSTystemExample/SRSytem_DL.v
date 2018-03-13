//Serial Reception System
//Data Latch



module SRSystem_DL(pd,d,Q);
input wire pd;
input wire [7:0] d;
output reg [7:0] Q;

always@(posedge pd)
Q<=d;


endmodule