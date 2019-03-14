with Date_Package; use Date_Package;
with Ada.Text_IO; use Ada.Text_IO;

package body Person_Handling is
   
   function "="(Person1, Person2: in Person) return Boolean is   
   begin   
      return Person1.Birth = Person2.Birth;  
   end;
   
   function ">"(Person1, Person2: in Person) return Boolean is 
   begin 
      return Person1.Birth > Person2.Birth; 
   end;
  
   function "<"(Person1, Person2: in Person) return Boolean is
   begin  
      return Person1.Birth < Person2.Birth;   
   end;
	    
   procedure Put(Pers: in Person) is
      begin
      Put(Pers.Name(1..20)); Put(" ");
      Put(Pers.Address(1..20)); Put(" ");
      Put(Pers.Birth); Put(" ");
   end Put;

   procedure Get(Pers: out Person) is

      Name: String(1..20);
      Address: String(1..20);
      Birth: Date_Type;
      I: Integer;

      begin
         Get_Line(Pers.Name, I);
         if I = 20 then Skip_Line; end if;
         Get_Line(Pers.Address, I);
         if I = 20 then Skip_Line; end if;
         Get(Pers.Birth);
   end Get;
   
   
end Person_Handling;