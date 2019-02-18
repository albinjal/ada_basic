-- Ett givet huvudprogram för laboration 2.
-- Du skall inte ändra på den del som är given, endast lägga till.
with Ada.Text_IO;		use Ada.Text_IO;
with Ada.Integer_Text_IO;	use Ada.Integer_Text_IO;
--with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Lab2 is
   procedure Create_Vector_Data(Xa,Ya,Za,Xb,Yb,Zb: in Integer; L,Vy,Vz: out Integer) is
      procedure MakeDeg(Rad: in Float; Deg: out Float) is
	 begin
	    Deg := Rad *(180.0/3.1415);
	 end MakeDeg;
      
      procedure GetL(Cx,Cy,Cz: in Integer; Lflt: out Float) is
	 -- Tar in koordinater och returnerar längden mellan dem
      begin
        
	 Lflt:=Float((Cx)**2+(Cy)**2+(Cz)**2);
	 Lflt:=Sqrt(Lflt);
	 
		 
      end GetL;
      
      
      procedure GetVy(Lz:in Integer; L: in Float; Vy: out Integer) is
	 --Tar in 2D komponenter och matar ut Vinkeln i grader
	 
	 Vrad: Float;
	 Vdeg: Float;
      begin
	 Vrad := Arccos(Float(Lz)/L);
	 MakeDeg(Vrad, Vdeg);
	 Vy := Integer(Vdeg);
      end GetVy;
      
      Cx,Cy,Cz: Integer;
      Lflt: Float;
   begin
      Cx:=Xa-Xb;
      Cy:=Ya-Yb;
      Cz:=Za-Zb;
      GetL(Cx,Cy,Cz, Lflt);
      GetVy(Cz,Lflt, Vy);
    
      L := Integer(Lflt)/100;
      
   end Create_Vector_Data;
   
   

   -- Lägg till dina underprogram...
   Xa, Ya, Za, Xb, Yb, Zb : Integer;
   L, Vy, Vz : Integer;
begin
   Put("Mata in punkten A i cm (X, Y, Z):  ");
   Get(Xa);
   Get(Ya);
   Get(Za);
   Put("Mata in punkten B i cm (X, Y, Z): ");
   Get(Xb);
   Get(Yb);
   Get(Zb);
   -- På denna rad du lägga till (exakt) ett anrop till Create_Vector_Data
   Create_Vector_Data(Xa, Ya, Za, Xb, Yb, Zb, L, Vy, Vz);
  
   Put_Line("Längd (i m)     Vy     Vz");
   Put(L,  Width => 11);
   Put(Vy, Width => 7);
   Put(Vz, Width => 7);
   New_Line;
end Lab2;
