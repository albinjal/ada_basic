with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
procedure lab1 is
   FP, LP, Steps, Moms: Float;
begin
   FP := 10.0;
   LP := 15.0;
   Steps := 0.5;
   Moms := 10.0;
   
   Put("=== Momstabell ==="); New_Line(1);
   Put("Pris utan moms  Moms   Pris med moms");
   while FP < LP loop
      Put(FP,2,2,0);
      FP := FP + Steps;
   end loop;
   
     
end Lab1;


