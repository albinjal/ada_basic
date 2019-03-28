with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;


procedure Henge is
   
   function Read
     return Integer is
      C : Character;
   begin
      Get(C);
      if C = 'h' then
	 return 0;
      else
	 for I in 1..4 loop
	    Get(C);
	 end loop;
	 return Read + 12;
      end if;
   end;
   X: Integer;
begin
   Put("Mata in namn: ");
   X := Read;
   Put("Det var "); Put(X,1); Put(" stenar.");
   
end;

