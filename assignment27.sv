// CE must become high immediately if reset deassert. Property must failed if rst never become low. Evaluate on positive edge of the clock. 
initial assert property (@(posedge clk)  $fell(rst) #-# $rose(CE))