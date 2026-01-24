module GRG_dynamic_array2;
  
  typedef struct {
    string txt;
    byte unsigned b;
    int arr [];
  } T;
   
  T da[];
   
  initial begin
    // construct a dynamic array with 5 non-initialised locations
    da = new[5];
	
    // assign a value to a location
    da[1] = '{"zzz", 255, '{1, 2, 3, 4}};
	
    // resize the array to have 2 locations and keep the current contents
    da = new[2](da);
    
    // add a further five elements to the dynamic array and initialise
    // the first 2 locations (the previous contents of da are lost)
    da = new[da.size()+5]('{'{"abc", 19, '{1, 3}}, '{"def", 20, '{6, 2}}} );

    // resize the dynamic array field of the first array element
    da[0].arr = new[da[0].arr.size()+2](da[0].arr);

    // assign values to the locations created.
    da[0].arr[2:3] = '{33, 44};

    // display the array contents using the aggregate formatter
    $display("%p", da);

	end

endmodule
