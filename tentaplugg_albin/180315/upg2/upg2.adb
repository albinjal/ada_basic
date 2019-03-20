with Ada.Numerics.Discrete_Random;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Upg2 is
   function Generate
     return Integer is
       subtype Nums is Integer range 0..99;
       package RN is
	  new Ada.Numerics.Discrete_Random(Nums);
       Gen : RN.Generator;
   begin
      RN.Reset(Gen);
      return RN.Random(Gen);
   end;
   
   type Data_Type is
      record
	 Name: String(1..20);
	 Len: Integer;
      end record;
      
   type StringArray_Type is
     array(1..5) of Data_Type;
   
   Revolvers : StringArray_Type;
begin
   Put("Mata in revolvrar:");
   New_Line;
   for I in StringArray_Type'Range loop
      Get_Line(Revolvers(I).Name,Revolvers(I).Len);
   end loop;
   New_Line;
   Put("Nya Priser:");
   New_Line;
   for X in reverse StringArray_Type'Range loop
      Put(Revolvers(X).Name(1..Revolvers(X).Len)); Put(" - $"); Put(Generate,1); Put(".99");
      New_Line;
   end loop;
   
end;
