// If b deasserts, b must remain low for three consecutive ticks. Evaluate the property on the positive edge of the clock.
a1: assert property(@(posedge clk) $fell(b) |-> !b[*3])