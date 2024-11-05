// if start assert then there should be single request from a between two b requests. 
module tb;
  reg a = 0, b = 0, start=0;
  reg clk = 0;
  
  always #5 clk = ~clk;
  
  //always #2 en = ~en;
  
  initial begin
    a = 0;
    #40;
    a = 1;
  end

  initial begin
    start = 1;
  end
  
  initial begin
    b = 0;
    #14;
    b = 1;
    #20;
    b = 0;
    #20;
    b = 1;

  end
  
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    $assertvacuousoff(0);
    #200;
    $finish();
  end

// Sequence to check a single pulse of `a` between two rising edges of `b`
sequence single_a_between_b;
  ##[1:$] $rose(b) ##[1:$] $rose(a) ##[1:$] $rose(b);
endsequence

// Assertion to check the requirement on `start`
  assert property (@(posedge clk) $rose(start) |-> single_a_between_b)
    else $error("Assertion failed at %0t", $time);
 
endmodule