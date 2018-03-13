//Serial Transmission System
//Counter

module STSystem_Counter(clr,txclk,TXE);
input wire clr,txclk;
output wire TXE;

parameter BITNUM =11;

reg [3:0] counter;

always@(posedge txclk or negedge clr)
begin
	if(clr == 0)
	counter<=0;
	else
	counter<=counter+1;
end

assign TXE = (counter == BITNUM)? 1:0;


endmodule