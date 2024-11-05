// If a assert then a must remain true as long as en remains true.
module tb;
  reg a = 0, en = 0;
  reg clk = 0;
  
  always #5 clk = ~clk;

  
  initial begin
    en = 1;
    a = 1;
    #30;
    a = 0;
    en = 0;
    #20;
  end
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    $assertvacuousoff(0);
    #100;
    $finish();
  end

  sequence seq_en;
    en[*1:$];
  endsequence

  /// Add your code here
  assert property (@(posedge clk) $rose(a) |-> (a throughout seq_en)) else $error("Assertion failed at %0t", $time);
endmodule