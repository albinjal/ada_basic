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
      Put(Pers.Name(1..Pers.Name_Length)); Put(" ");
      Put(Pers.Address(1..Pers.Address_Length)); Put(" ");
      Put(Pers.Birth); Put(" ");
   end Put;

   procedure Get(Pers: out Person) is

      Name: String(1..20);
      Address: String(1..20);
      Birth: Date_Type;

      begin
         Put("Namn: ");
         Get_Line(Pers.Name, Pers.Name_Length);
         if Pers.Name_Length >= 20 then Skip_Line; end if;

         Put("Adress: ");
         Get_Line(Pers.Address, Pers.Address_Length);
         if Pers.Address_Length >= 20 then Skip_Line; end if;

         Put("Födelsedatum: ");
         Get(Pers.Birth);
         Skip_Line;
   end Get;
   
   
end Person_Handling;