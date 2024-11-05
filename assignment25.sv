// CE must assert after sixth clock tick. Evaluate on positive edge of the clock.
initial assert property (@(posedge clk) nexttime[6] $rose(CE))
