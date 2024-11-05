// RST must become low after 4 clock tick. Evaluate on positive edge of the clock. 
initial assert property (@(posedge clk) nexttime[4] $fell(RST))