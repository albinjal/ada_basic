with Data_Package; use Date_Package;
package Person_Handling is
   
   
   
   
   type Person is private;
   
   
   function "="(Person1, Person2: in Person) return Boolean;
   function ">"(Person1, Person2: in Person) return Boolean;
   function "<"(Person1, Person2: in Person) return Boolean;
   
   
   
   
private
   
   
   type Person is
      record
	 Name: String(1..20);
	 Address: String(1..20);
	 Birth: Date_Type;
      end record;
