with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Stone is
   
   I: Integer;
   C: Character;
begin
   --kollar om 2 argument finns
   if Argument_Count = 2 then
      --Tar in tecknet
      C := Argument(1)(1);
      --Omvandlar tecknet till integer
      I := Character'Pos(C);
      -- Lägger till argument 2 till integern
      I := I + Integer'Value(Argument(2));
      
      Put(Character'Val(I));
   end if;
   null;
   
   
end;
