
package Sorted_List is
   CANTFIND_ERROR: exception;
   type List_Type is private;
   
   function Empty(List: List_Type)
		 return Boolean;
   function Member(List: List_Type; Search: Integer)
		  return Boolean;
   function Find(List: List_Type; Search: Integer)
		return Integer;
   function Length(List: List_Type)
		  return Integer;
   
   procedure Insert(List: in out List_Type; Int: in Integer);
   procedure Put(List: in List_Type);
   procedure Remove(List: in out List_Type; Search: in Integer);
   procedure Delete(List: in out List_Type);
   procedure Find(List: in List_Type; Search: in Integer; Data: out Integer);
   
   
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
