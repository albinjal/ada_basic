with Data_Package; use Date_Package;



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
	    
   
   
   
end Person_Handling;

   
   
   
   
   
