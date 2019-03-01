
package Sorted_List is
   
   type List_Type is private;
   type Post is private;
   procedure Insert();
private
   type Post;
   
  type List_Type is
    access Post;
  
   type Post is
      record
	 Data: Integer;
	 Point: List_Type;
      end record;
   
	 
   
   
   
end Sorted_List;
