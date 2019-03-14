with Date_Package; use Date_Package;
package Person_Handling is
   
   type Person is private;
   
   function "="(Person1, Person2: in Person) return Boolean;
   function ">"(Person1, Person2: in Person) return Boolean;
   function "<"(Person1, Person2: in Person) return Boolean;
   
   procedure Put(Pers: in Person);
   procedure Get(Pers: out Person);
   
private

   type Person is
      record
	 Name: String(1..20);
	 Address: String(1..20);
	 Birth: Date_Type;
      end record;
      
end Person_Handling;