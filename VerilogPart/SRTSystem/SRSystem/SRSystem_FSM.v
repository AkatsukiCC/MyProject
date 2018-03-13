//Serial Reception System
//FSM
module SRSystem_FSM(clk,st,ack,en,rst,p,sp,rxo,rxf,CDC,PD,RXCK,DRY,ERR);
input wire clk,st,ack,en,rst,p,sp,rxo,rxf;
output wire CDC,PD,RXCK,DRY,ERR;


reg A,B,C,D;      //status register

always@(posedge clk or negedge rst)
begin
	if(rst == 0)
	{A,B,C,D}<=0;
	else
	begin
	A<= ~A&~B&~C&~D&en&~st | A&~B&~C&~D | A&B&~C&~D | A&B&C&~D | A&B&C&D | ~A&B&C&D | A&B&~C&D&sp;
	B<= A&~B&~C&~D | A&B&~C&~D | A&B&C&~D | A&B&C&D&rxf | ~A&~B&C&D | ~A&B&C&D | A&B&~C&D&~sp | ~A&B&~C&D | A&~B&~C&D | ~A&B&C&~D&~ack;
	C<= A&B&~C&~D | A&B&C&~D | A&B&C&D&~rxf | A&~B&C&D | ~A&~B&C&D | ~A&B&C&D | A&~B&~C&D&p | ~A&B&C&~D | ~A&~B&C&~D&ack;
	D<= A&B&C&~D | A&B&C&D | A&~B&C&D | ~A&~B&C&D | ~A&B&C&D | A&B&~C&D | ~A&B&~C&D | A&~B&~C&D&~p;
	end
end

assign
	ERR = ~A&B&~C&D,
	PD = ~A&B&C&~D,
	RXCK =  A&B&C&D,
	CDC = (A|B|C|D), //CLR
	DRY = ~A&B&C&~D;


endmodule
