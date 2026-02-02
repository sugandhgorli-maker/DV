module array_sort;

  int arr[5] = '{5, 3, 1, 4, 2};
  int i, j, temp;

  initial begin
    // Display original array
    $display("Original array:");
    for (i = 0; i < 5; i++) begin
      $write("%0d ", arr[i]);
    end
    $display("");

    // Bubble sort (ascending order)
    for (i = 0; i < 5; i++) begin
      for (j = i + 1; j < 5; j++) begin
        if (arr[i] > arr[j]) begin
          temp = arr[i];
          arr[i] = arr[j];
          arr[j] = temp;
        end
      end
    end

    // Display sorted array
    $display("Sorted array (Ascending):");
    for (i = 0; i < 5; i++) begin
      $write("%0d ", arr[i]);
    end
    $display("");

    $finish;
  end

endmodule
