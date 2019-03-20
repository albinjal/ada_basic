with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;




procedure Upg3 is
   function Count
     return Integer is
      S : String(1..3);
      C : Character;
      A, B : Integer;
   begin
      Get(S);
      Get(A);
      Get(C); Get(C);
      Get(B);
      return (B - A + 1);
   end;
   
   function Read
     return Integer is
     
      C : Character;
      Temp: Integer;
   begin
      Get(C);
      if C = 's' then
	 return Count;
      else
	 Temp := Read;
	 Get(C); Get(C);
	 return Temp + Read;
      end if;
      
     
     
     
   end;
   

   Temp: Integer;
   
begin
   Put("Mata in sidhänvisningar: ");
   Temp := Read;
   Put("Totalt antal sidor: "); Put(Temp,1);
   
end;
