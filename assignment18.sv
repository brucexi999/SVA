// Write an assertion checks to verify follwoinf scenarions : 
// 1) If rst deassert and CE assert then read must stay high for two clock ticks when user recieve rd request.
// 2) If rd assert then addr must remain stable for two consecutive clock ticks. 
// 3) Evaluate the property on positive edge of the clock.
module tb;
  
  reg clk = 0, rd = 0, rst = 0, ce = 0;
  always #5 clk = ~clk;
  
  reg [7:0] addr;
  integer i = 0;
  
    
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    $assertvacuousoff(0);
    #100;
    $finish();
  end
  
initial begin
  rst = 1;
  #10;
  ce = 1;
  rst = 0;
  #30;
  rd =1;
  #20;
  rd = 0;
end
  
  initial begin
    for( i = 0 ; i < 5; i++) begin
      addr = $urandom();
      @(posedge clk);
      @(posedge clk);
    end
    
      for( i = 0 ; i < 5; i++) begin
      addr = $urandom();
      @(posedge clk);
    end
    
  end
  
//// add your code  here for property 1 and property 2
    a1: assert property (@(posedge clk) $fell(rst) && $rose(ce) ## [1:$] $rose(rd) |-> rd[*2]) else $error("Assertion failed at %0t", $time);
    a2: assert property (@(posedge clk) $rose(rd) |=> $stable(addr) [*1]) else $error("Assertion failed at %0t", $time);
endmodule