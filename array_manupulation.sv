module GRG_array_manipulation;

  byte b[] = '{1, 3, 2};
  byte s, r[$];
  
  initial begin
    #5 r = b.find(x) with (x > 2);          // r = {3}
    $display("r = %p", r);
    #5 r = b.find with (item == item.index);// find all items equal to their index, i.e. {2}
    $display("r = %p", r);
    #5 r = b.min;                           // r = 1
    $display("r = %p", r);
    #5 b.reverse;                           // b = '{2, 3, 1}
    $display("b = %p", b);
    #5 b.sort;                              // b = '{1, 2, 3}
    $display("b = %p", b);
    #5 s = b.sum with (item + 4);           // s = 18 (i.e. 5 + 7 + 6)
    $display("s = %0d", s);
    #5 s = b.xor;                           // s =  0 (i.e. 1 ^ 3 ^ 2)
    $display("s = %0d", s);
  end
  
  // Dump waves
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1, GRG_array_manipulation);
  end
endmodule

endmodule
