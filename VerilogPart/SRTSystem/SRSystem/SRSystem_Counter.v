//Serial Reception System
//Counter

module SRSystem_Counter(clr,rxclk,RXF);
input wire clr,rxclk;
output wire RXF;

parameter BITNUM =11;

reg [3:0] counter;

always@(posedge rxclk or negedge clr)
begin
	if(clr == 0)
	counter<=0;
	else
	counter<=counter+1;
end

assign RXF = (counter == BITNUM)? 1:0;


endmodule