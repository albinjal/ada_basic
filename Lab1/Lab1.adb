with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
procedure Lab1 is
   FP, LP, Steps, Momsproc, Moms: Float;
begin
   loop
      Put("Första pris: "); Get(FP);
      exit when FP >= 0.0;
   end loop;
   
   loop
      Put("Sista pris: "); Get(LP);
      exit when LP >= FP;
   end loop;
   
   loop
      Put("Steg: "); Get(Steps);
      exit when Steps > 0.0;
   end loop;
   
   loop
      Put("Momsprocent: "); Get(Momsproc);
      exit when Momsproc >= 0.0 and Momsproc <= 100;
   end loop;
   
   Put("=== Momstabell ==="); New_Line(1);
   Put("Pris utan moms  Moms   Pris med moms");
   New_Line(1);
   while FP <= LP loop --- for
      Moms := FP * Momsproc / 100.0; 
      Put(FP,6,2,0); Put(Moms,8,2,0); Put(FP + Moms,8,2,0);
      New_Line(1);
      FP := FP + Steps;
   end loop;
   
     
end Lab1;


