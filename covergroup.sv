module GRG_covergroup;

  bit[3:0] A;
  bit clk, Running;

//  Covergroup containing options
covergroup CG (ref bit[3:0] w, input string Comment) @(posedge clk);
  option.per_instance = 1;    // show bins in GUI & each instance coverage is collected separately
  option.comment = Comment;   // Comment for each instance of CG
  type_option.strobe = 1;     // Sample at the end of the time slot
  CP1 : coverpoint w {
    option.auto_bin_max = 8;  // Create 8 automatic bins for 
  }                           // coverpoint CP1 for each instance
endgroup

CG cg_inst = new(A, "Test Covergroup");

initial begin
  for (int j = 0; j < 16; j++)
  begin
    A = j;
	#10;
  end
  $display ("Coverage = %.2f%%", cg_inst.get_coverage());
  Running = 0;
end

initial begin
  clk = 0;
  Running = 1;
  while (Running) begin
    #5 clk = ~clk;
  end
  $display ("Finished!!");
end
  
final
  begin
    $display("overall coverage = %0f", $get_coverage());
    $display("coverage of covergroup cg_inst = %0f", cg_inst.get_coverage());
    $display("coverage of coverpoint CP1 = %0f", cg_inst.CP1.get_coverage());
  end
  
endmodule
