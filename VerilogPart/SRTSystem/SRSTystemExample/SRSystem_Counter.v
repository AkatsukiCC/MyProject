//Serial Reception System
//Counter

module SRSystem_Counter(clr,rxclk,RXF,extra_counter);//extra
input wire clr,rxclk;
output wire RXF;

parameter BITNUM =11;

reg [3:0] counter;


output wire [3:0] extra_counter;//extra

always@(posedge rxclk or negedge clr)
begin
	if(clr == 0)
	counter<=0;
	else
	counter<=counter+1;
end

assign RXF = (counter == BITNUM)? 1:0,
		extra_counter = counter; //extra

endmodule