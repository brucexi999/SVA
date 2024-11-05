// Create a Single thread that will verify user must first write the data to RAM before reading. 
// 'There must be at least single write request (wr) before the arrival of the read request (rd)'.Evaluate on positive edge of the clock.
initial assert property (@(posedge clk) $rose(wr) |-> s_eventually $rose(rd))