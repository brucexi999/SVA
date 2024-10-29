//Write assertion to verify following behavior 'read and write request must not occur at same time'.
//Evaluate the property on positive edge of the clock.
a1: assert property (@(posedge clk) write |-> !read) $info(" Success @ %0t", $time); else $error("Failure @ %0t", $time);
a2: assert property (@(posedge clk) read |-> !write) $info(" Success @ %0t", $time); else $error("Failure @ %0t", $time);