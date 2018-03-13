//Serial Reception System **
//FSM
//Serial Transmission System

module SRSystem_FSM(clk,st,ack,en,rst,p,sp,rxo,rxf,CDC,PD,RXCK,DRY,ERR);
input wire clk,st,ack,en,rst,p,sp,rxo,rxf;
output wire CDC,PD,RXCK,DRY,ERR;


reg A,B,C,D;							//state register

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


	
reg [3:0]  w_file;  

initial 
w_file = $fopen("D:/study/notepad/modelsim/SRTsystem_REGISTER_data/data/SRSFSM_State_data4.bin");  


always @(posedge clk)  
begin  
    $fdisplay(w_file,"%b",{A,B,C,D});  
end 
	
	
	
endmodule