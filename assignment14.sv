// if signal a assert then it should deassert in next clock tick. 
a1: assert property (@(posedge clk) $rose(a) |=> $fell(a)) else $error("Assertion failed @ %0t", $time);