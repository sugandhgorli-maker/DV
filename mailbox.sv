module GRG_mailbox;

timeunit      1ns;
timeprecision 100ps;

class transaction;
  rand bit[7:0] address;
  rand bit[7:0] data;

  function string convert2string();
    return $sformatf("address = %x data = %x", address, data);
  endfunction
endclass

mailbox #(transaction) channel = new;

task automatic wait_delay();
  time d;
  void'(std::randomize(d) with {d inside {[10:100]};});
  #d;
endtask

task producer();
  transaction t;
  repeat (10) begin
    t = new();
    void'(t.randomize());
    $display("producer: %s", t.convert2string());
    channel.put(t);
    wait_delay();
  end
endtask

task consumer();
  transaction t;
  forever begin
    channel.get(t);
    $display("consumer: %s", t.convert2string);
    wait_delay();
  end
endtask

initial begin
  fork
    producer();
    consumer();
  join_any
end

endmodule
