// When b becomes high, b should remain stable for two consecutive ticks and then deassert. a should remain low throughout the sequence. 
module tb;
  reg a = 0, b = 0;
  reg clk = 0;
  
  always #5 clk = ~clk;
  
  //always #2 en = ~en;
  
  initial begin
    a = 0;
    #40;
    a = 1;
  end
  
  initial begin
    b = 0;
    #14;
    b = 1;
    #20;
    b = 0;
  end
  
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    $assertvacuousoff(0);
    #120;
    $finish();
  end
 
////Add your code here
    sequence seq_b;
        b[*2] ##1 !b;
    endsequence

    assert property (@(posedge clk) $rose(b) |-> !a throughout seq_b) else $error("Assertion failed at %0t", $time);
 
endmodule