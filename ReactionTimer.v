`timescale 1s / 1ms
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:04:54 10/19/2017 
// Design Name: 
// Module Name:    ReactionTimer 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ReactionTimer(
    input clk, rst, B,
    output len, rtime, slow
    );
reg [11:0] rtime;
reg len;
reg slow;
reg reset;
wire [11:0] rtime1;
initial
begin
  rtime=12'b000000000000;
  reset=1'b0;
  len=1'b0;
  slow=1'b0;
end
 
ripple_counter rpp0(rtime1, clk, reset);
always @(posedge rst)
begin
   #10 len=1'b1;
   reset=1'b1;
	if(B)
	begin
		if(rtime1>12'b011111010000)
		begin	 
			 rtime=12'b011111010000;
			 slow=1'b1;
			 len=1'b0;
		end
	   else
		begin
		    rtime=rtime1;
		    slow=1'b0;
			 len=1'b0;
		end
	end
	else
	begin
	    rtime=rtime1;
   end
end      	
endmodule
