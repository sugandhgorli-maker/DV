module GRG_associative_array;
				   
  // Create an array of integer, indexed by string
  integer CountWords [string];
  
  initial begin
    CountWords["one"]++;
    $display("There are %0d different words", CountWords.num); // Displays 1
    CountWords.delete("one");     // Deletes the "one" entry
    $display("There are %0d different words", CountWords.num); // Displays 0
    CountWords.delete;            // Clears the entire array
    $display("There are %0d different words", CountWords.num); // Displays 0
  end
  
  
  // Create an array of string, indexed by integers
  string Table [*];
  
  initial begin
    Table = '{0:"Zero", 1:"One", 2:"Two", default:"None"};
    $display("%s %s", Table[0], Table[3]); // Displays “Zero None”
  end

endmodule
