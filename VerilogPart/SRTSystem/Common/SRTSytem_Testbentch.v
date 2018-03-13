//Serial Reception System **
//Serial Transmission System ** 
//Testbench




module SRTSystem_testbench();

reg clk,send,rst;
reg [0:7] d;
wire ERR;
wire [0:7]Q;
SRTSystem_TD SRTS_testbench(.clk(clk), .send(send), .rst(rst), .d(d), .en(1), .ERR(ERR), .Q(Q));


initial
begin
clk=0;
send=0;
rst=0;
d=0;
#100
rst=1;
#10
d=8'd10;
#5
send =1;
#5
send=0;
end

always #1 clk<=~clk;

endmodule 