with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO; 
procedure Lab0 is 
   I: Integer;
   F: Float;
   C: Character;
   S: String(1..5);
   
begin
   Put("Skriv in ett heltal: "); Get(I);
   Put("Du skrev in talet: "); Put(I,2);
   New_Line(1);
   Skip_Line;
   
   Put("Skriv in fem heltal: "); Get(I); Get(C);
   
   Put("Du skrev in talen: ");  Put(I,2); Put(C); Get(I); Put(I,2); Put(C); 
   Get(I); Put(I,2); Put(C); Get(I); Put(I,2); Put(C); Get(I); Put(I,2);
   New_Line(1);
   Skip_Line;
   
   Put("Skriv in ett flyttal: "); Get(F);
   Put("Du skrev in flyttalet: "); Put(F,2,3,0);
   New_Line(1);
   Skip_Line;
   
   Put("Skriv in ett heltal och ett flyttal: "); Get(I);
   Put("Du skrev in heltalet: "); Put(I,9);
   New_Line(1);
   Put("Du skrev in flyttalet: "); Get(F); Put(F,3,4,0);
   New_Line(1);
   Skip_Line;
   
   Put("Skriv in ett tecken: "); Get(C);
   Put("Du skrev in tecknet: "); Put(C);
   New_Line(1);
   Skip_Line;
   
   Put("Skriv in en sträng med 5 tecken: "); Get(S);
   Put("Du skrev in strängen: "); Put(S);
   New_Line(1);
   Skip_Line;
   
   Put("Skriv in en sträng med 3 tecken: ");
   Get_Line(S,I);
   Put("Du skrev in strängen: "); Put(S(1..3));
   New_Line(1);
   
   Put("Skriv in ett heltal och en sträng med 5 tecken: ");
   Get(I);
   Put("Du skrev in talet |"); Put(I,1); Put("| och strängen |");
   Get(C);
   Get_Line(S, I);
   Put(S(1..5));
   Put("|.");
   New_Line(1);
   Skip_Line;
     
   Put("Skriv in en sträng med 3 tecken och ett flyttal: ");
   Get(S(1..3));
   Get(F);
   Put("Du skrev in """); Put(F, 2, 3, 0); Put(""" och """); Put(S(1..3)); Put("""");
   Skip_Line;
     
   New_Line;
   Put("Skriv in en sträng som är maximalt 5 tecken: "); Get_Line(S,I);
   Put("Du skrev in strängen: ");
   if I = 5 then
      Put(S(1..5));
      Skip_Line;
   else	
     Put(S(1..I));
     
   end if;
   
   New_Line;
   Put("Skriv in en sträng som är maximalt 5 tecken: "); Get_Line(S,I);
   Put("Du skrev in strängen: ");
   if I > 5 then
     Put(S(1..5));
   else
     Put(S(1..I));
   end if;
   New_Line(1);
end Lab0;
