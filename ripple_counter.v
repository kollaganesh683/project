`timescale 1ns / 1ps
module ripple_counter(q, clk, reset);
output [11:0] q;
input clk, reset;

T_FF tff0(q[0], clk, reset);
T_FF tff1(q[1], q[0], reset);
T_FF tff2(q[2], q[1], reset);
T_FF tff3(q[3], q[2], reset);
T_FF tff4(q[4], q[3], reset);
T_FF tff5(q[5], q[4], reset);
T_FF tff6(q[6], q[5], reset);
T_FF tff7(q[7], q[6], reset);
T_FF tff8(q[8], q[7], reset);
T_FF tff9(q[9], q[8], reset);
T_FF tff10(q[10], q[9], reset);
T_FF tff11(q[11], q[10], reset);

endmodule
