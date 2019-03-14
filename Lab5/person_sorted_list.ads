with Person_Handling; use Person_Handling;

package Person_Sorted_List is
   CANTFIND_ERROR: exception;
   type List_Type is private;
   
   function Empty(List: List_Type)
		 return Boolean;
   function Member(List: List_Type; Search: Person)
		  return Boolean;
   function Find(List: List_Type; Search: Person)
		return Person;
   function Length(List: List_Type)
		  return Integer;
   
   procedure Insert(List: in out List_Type; Data: in Person);
   procedure Put(List: in List_Type);
   procedure Remove(List: in out List_Type; Search: in Person);
   procedure Delete(List: in out List_Type);
   procedure Find(List: in List_Type; Search: in Person; Data: out Person);
   
private
   type Post;
   
  type List_Type is
    access Post;
  
   type Post is
      record
	 Data: Person;
	 Point: List_Type;
      end record;
   
	 
   
   
   
end Person_Sorted_List;
