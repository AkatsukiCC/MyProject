//Serial Reception System **
//Serial Transmission System **
//Testbench




module SRTSystem_testbench();

reg clk,send,rst;
reg [0:7] d;
wire ERR;
wire [0:7]Q;
wire [0:1] extra_ack; //extra
SRTSystem_TD SRTS_testbench(.clk(clk), .send(send), .rst(rst), .d(d), .en(1'b1), .ERR(ERR), .Q(Q), .extra_ack(extra_ack));//extra

reg [0:7] Mem [0:29];
reg [7:0]counter;

initial
begin
clk=0;
send=0;
rst=0;
d=0;
counter=0;
#10
rst=1;
send=1;
d=Mem[0];
end


reg [11:0]  w_file;

initial
w_file = $fopen(data/SRTStb_Input_data12.bin");


always @(posedge clk)
begin
    $fdisplay(w_file,"%b",{d,send,rst,extra_ack});
end

always@(posedge extra_ack[0])
begin
	counter=counter+1;
	if(counter==30)
	$stop;
	else
	d=Mem[counter];
end

initial
$readmemb("data/randomdin.txt",Mem);                      
//r_file = $fopen("D:/study/notepad/matlab/MATLABSRTS/data/randomdin.txt");




always #1 clk<=~clk;

endmodule
