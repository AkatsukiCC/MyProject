//Serial Reception System
//Parity


module SRSystem_Parity(qst,q,opn,qsp,P);
input wire qst,opn,qsp;
input wire [7:0] q;
output wire P;


assign P=~(qst^opn^q[0]^q[1]^q[2]^q[3]^q[4]^q[5]^q[6]^q[7]^qsp);


endmodule
