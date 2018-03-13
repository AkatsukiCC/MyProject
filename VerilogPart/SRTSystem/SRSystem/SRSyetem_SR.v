//Serial Reception System
//Shift Register
//Serial Reception , Parallel Transmission

module SRSystem_SR(rxclk,rx,clr,QST,OPn,QSP,RXO,Q);
input wire rx,clr,rxclk;//rx == din
output wire RXO;
output reg QST,OPn,QSP;
output reg [7:0] Q;

always@(posedge rxclk or negedge clr)
begin
	if(clr == 0)
	{QSP,OPn,Q,QST}<=0;
	else
	{QSP,OPn,Q[0],Q[1],Q[2],Q[3],Q[4],Q[5],Q[6],Q[7],QST}<={rx,QSP,OPn,Q[0],Q[1],Q[2],Q[3],Q[4],Q[5],Q[6],Q[7]};
end

endmodule