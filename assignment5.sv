/*
Write an assertion to verify a and b must be equal to 0 on all the positive edge of clock'. Only Boolean Operators are allowed. 
*/

module tb;
  reg a = 0, b = 1;
  reg clk = 0;
  
  always #5 clk = ~clk;
  
  //always #2 en = ~en;
  
  initial begin
    a = 1;
    #10;
    a = 0;
    #10;
    a = 1; 
    #10;
    a = 0;
    #10;
    a = 1;
  end
  
  initial begin
    b = 0;
    #30;
    b = 1;
    #10;
    b = 0;
  end
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    $assertvacuousoff(0);
    #100;
    $finish();
  end
 
    
 ////add your code here
    A1: assert property (@(posedge clk) (a == 0 && b == 0)) else $error("A1 fail @ %0t", $time);

endmodule