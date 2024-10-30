// When CE becomes high, it must remain high for 7 consecutive cycles. Evaluation of the property at positive edge of the clock signal.
module tb;
  
  reg ce = 0, clk = 0;
  always #5 clk = ~clk;
  
  
    
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    $assertvacuousoff(0);
    #100;
    $finish();
  end
  
initial begin
  ce = 0;
  #10;
  ce = 1;
  #20;
  ce = 1;
  #50;
  ce = 0;

end
  
a1: assert property(@(posedge clk) $rose(ce) |-> ce[*7]) else $error("Assertion failed at %0t", $time);
    
endmodule