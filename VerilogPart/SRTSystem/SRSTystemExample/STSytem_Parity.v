//Serial Transmission System
//Parity


module STSystem_Parity(st,d,sp,OPn);
input wire st,sp;
input wire [7:0] d;
output wire OPn;


assign OPn=st^d[0]^d[1]^d[2]^d[3]^d[4]^d[5]^d[6]^d[7]^sp;


endmodule