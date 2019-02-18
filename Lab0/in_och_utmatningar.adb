with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure In_Och_Utmatningar is
   
   I: Integer;
   F: Float;
   C: Character;
   S: String(1..6);
   
begin
   Put("Skriv in en sträng med 3 tecken: ");
   Get_Line(S, I);
   Put(S(1..3));
   New_Line(1);
   
   Put("Skriv in ett heltal och en sträng med 5 tecken: ");
     Get(I);
     Put("Du skrev in talet |"); Put(I,1); Put("| och strängen |");
     Get_Line(S, I);
     Put(S(2..6));
     Put("|.");
     New_Line(1);
     
     Put("Skriv in en sträng med 3 tecken och ett flyttal: ");
     --Skip_Line;
     Get_Line(S, I);
     --Get(F);
     Put_Line(S);
     --Put("Du skrev in """); Put(F, 3, 3, 0); Put(""" "); Put(S);
   
   
end In_Och_Utmatningar;
