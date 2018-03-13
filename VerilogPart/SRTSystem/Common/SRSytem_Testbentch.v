//Serial Reception System
//Testbentch


module SRSyetem_Testbench();

reg clk,ack,en,rst,rx,st;
wire DRY,ERR;
wire [7:0] Q;


SRSystem_TD TopDesign(clk,ack,en,rst,rx,st,DRY,ERR,Q);


initial 
begin
	clk=0;
	en=0;
	ack=0;
	rst=1;
	rx=0;
	st=1;
	#100
	rst=0;
	#10
	rst=1;
	#100
	en=1;
	st=0;
	rx=1;
	#75
	rx=0;
	st=1;
	#3
	rx=1;
	#2
	ack=1;
end

always #1 clk<=~clk;

endmodule