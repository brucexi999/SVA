//If signal 'rst' deassert and signal 'mode' assert then value of signal 'dout' in the next clock tick must be 
//one greater than its the previous value. Evaluate the property on positive edge of the clock.

a1: assert property (@(posedge clk) $fell(rst) && $rose(mode) |-> dout == $past(dout) + 1);