//Serial Transmission System
//Shift Register
//Serial Transmission , Parallel Reception

module STSystem_SR(txclk,ld,st,opn,sp,d,TX,extra_loaddata); // extra

input wire txclk,ld,st,opn,sp;
input wire [7:0] d;
output reg TX;

reg [0:10] loaddata;

output wire [0:10] extra_loaddata;   //extra

always@(posedge txclk or negedge ld)
begin
	if(ld == 0)
	{loaddata}<={st,d,opn,sp};
	else
	{TX,loaddata}<={loaddata,1'b0};
end

assign extra_loaddata = loaddata;

endmodule