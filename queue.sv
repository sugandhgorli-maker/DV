module GRG_queue1;

  typedef struct {
    string        txt    ;
    byte unsigned b      ;
    int           array[];
  } T;

  T q[$];

  initial begin
    q.push_back('{"abc", 123, '{4, 5, 6}});
    q.push_back('{"def", 156, '{9, 8, 7}});
    $display("%p", q);
  end

endmodule
