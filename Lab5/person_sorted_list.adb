with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Unchecked_Deallocation; 

package body Sorted_List is
   
   procedure Free is
      
      new Ada.Unchecked_Deallocation(Post, List_Type);
   
   
   function Empty(List: List_Type)
		 return Boolean is 
   begin
      return List = null;
   end Empty;
   
   
   procedure Insert_First(List: in out List_Type; Int: in Integer) is
      Temp: List_Type;
   begin
       Temp := List;
	   List := new Post;
	   List.Data := Int;
	   List.Point := Temp;
   end Insert_First;
   
      
   procedure Insert(List: in out List_Type; Int: in Integer) is
      
   begin
      if Empty(List) then
	 Insert_First(List, Int);
      elsif Int < List.Data then
	  Insert_First(List, Int);
      else
	 Insert(List.Point, Int);
      end if;
      
   
   end Insert;
   
   
   procedure Put(List: List_Type) is
      
   begin
      if not Empty(List) then
	 Put(List.all.Data);
	 New_Line;
	 Put(List.all.Point);
     end if;
   end Put;
   
   function Member(List: List_Type; Search: Integer)
		  return Boolean is
      
   begin
      if Empty(List) then
	 return False;
	 end if;
      if List.Data = Search then
	 return True;
      else
	 return Member(List.all.Point, Search);
      end if;
      
   end Member;
   
   procedure RemoveCurrent(List: in out List_Type) is
	 Temp: List_Type;
      begin
	 Temp := List;
	 List := List.Point;
	 Free(Temp);
      end RemoveCurrent;
      
   procedure Remove(List: in out List_Type; Search: in Integer) is
      
      
      
      
   begin
      if Empty(List) then
	 raise CANTFIND_ERROR;
      end if;
      if List.Data = Search then
	 RemoveCurrent(List);
      else
	 if List.Point = null then
	    raise CANTFIND_ERROR;
	 end if;
	 Remove(List.Point, Search);
      end if;
	 
   end Remove;
   
   procedure Delete(List: in out List_Type) is
      
      
   begin
      if List.Point = null then
	 Free(List);
	 List := null;
      else
	 
      RemoveCurrent(List);
      Delete(List);
      end if;
      
   end Delete;
   
   function Find(List: List_Type; Search: Integer)
		return Integer is
      
      
      
   begin
      if Empty(List) then
	 raise CANTFIND_ERROR;
      end if;
      
      if List.Data = Search then
	 return List.Data;
      end if;
      if List.Point = null then
	 raise CANTFIND_ERROR;
      end if;
      return Find(List.Point, Search);
      
   end Find;
   procedure Find(List: in List_Type; Search: in Integer; Data: out Integer) is
   begin
      
      Data := Find(List, Search);
   end Find;
   
   function Length(List: List_Type)
		  return Integer is
      
   begin
      if List.Point /= null then
	 return 1 + Length(List.Point);
      end if;
      return 1;
   end Length;
   
   

     
   
end Sorted_List;
