// RST remain asserted until CE become active high. Submit your assertion code. Evaluate on positive edge of the clock. 

initial assert property (@(posedge clk) RST until CE)