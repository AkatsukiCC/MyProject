//Serial Reception System ack
//Serial Transmission System ack


module SRTSystem_ACK(ready,clk,ACK);
input wire ready,clk;
output reg ACK;

always@(posedge clk)
begin
	if(ready)
	ACK<=1;
	else
	ACK<=0;
end








endmodule
