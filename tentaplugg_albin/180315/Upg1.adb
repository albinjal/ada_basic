with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Upg1 is
   procedure Print(A, B: in Integer) is
      
      Spaces: Integer;
   begin
      if A < B then
	 Spaces :=  (B - A) * 4;
	 for I in 1..Spaces loop
	    Put(' ');
	 end loop;
      end if;
      for X in 1..A loop
	 Put(B,1); Put(' ');
	 if A = X then
	    Put("= "); Put(A * B, 1);
	 else
	    Put("+ ");
	 end if;
	
      end loop;
      New_Line;
      
   end;
   
   
   
   A, B : Integer;
   
begin
   Put("Mata in två positiva siffror: "); Get(A); Get(B);
   Skip_Line;
   New_Line;
   Print(A, B);
   Print(B, A);
   Put("Tryck ENTER för at fortsätta...");
   Skip_Line;
   Put("Multiplikation är KUL!");
   
  
	 

   
end;
