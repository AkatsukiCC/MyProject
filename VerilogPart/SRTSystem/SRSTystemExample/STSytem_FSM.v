//Serial Reception System
//Serial Transmission System **
//FSM

module STSystem_FSM(clk,send,txe,rst,ack,PD,LD,CLKOUT,RTS);
input wire clk,send,txe,rst,ack;
output wire PD,LD,CLKOUT,RTS;
reg A,B,C,D;



always@(posedge clk or negedge rst)
begin
	if(rst == 0)
	{A,B,C,D}<=0;
	else
	begin
	A <= ~B&~C&~D&send | A&~B&~D | A&C&~D | A&B&~D | B&~C&~D&~txe;
	B <= A&C&~D | B&~C | ~A&B&~D&~ack;
	C <= A&~B&~D | ~A&B&~C&~D&txe | ~A&B&C&~D | ~A&~B&C&~D&ack;
	D <= A&B&~C;
	end
end

assign
	PD = A&~B&~C&~D,
	CLKOUT = A&B&~C&~D,
	LD = ~(A&~B&C&~D),
	RTS = ~A&B&C&~D;


reg [3:0]  w_file;

initial
w_file = $fopen("data/STSFSM_State_data4.bin");  


always @(posedge clk)
begin
    $fdisplay(w_file,"%b",{A,B,C,D});
end




endmodule
