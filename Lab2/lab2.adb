-- Ett givet huvudprogram för laboration 2.
-- Du skall inte ändra på den del som är given, endast lägga till.
with Ada.Text_IO;		use Ada.Text_IO;
with Ada.Integer_Text_IO;	use Ada.Integer_Text_IO;
--with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Lab2 is
   procedure Create_Vector_Data(Xa,Ya,Za,Xb,Yb,Zb: in Integer; L,Vy,Vz: out Integer) is
      
      
      
      ----------------------------------------------------------------
      function  MakeDeg(Rad: in Float)
	return Float is
	 Deg: Float;
	 begin
	    Deg := Rad *(180.0/3.1415);
	    return Deg;
	 end MakeDeg;
      ----------------------------------------------------------------
      
	 
	 
	 
      ----------------------------------------------------------------
      procedure GetL(Cx,Cy,Cz: in Integer; L: out Integer) is
	 -- Tar in koordinater och returnerar längden mellan dem
	 Lflt: Float;
      begin
	 Lflt:=Float((Cx)**2+(Cy)**2+(Cz)**2);
	 Lflt:=Sqrt(Lflt);
	 L := Integer(Lflt);
      end GetL;
      ----------------------------------------------------------------
      
      
      
      
      ----------------------------------------------------------------
      procedure GetVz(Opp, Adj: in Integer;
		      V: out Integer) is
	 --Tar in 2D komponenter och matar ut Vinkeln i grader
	 Fa,Fda: Float;
       
      begin
	 if Adj = 0 then
	    -- Division med noll
	    if Opp = 0 then
	       V := 1337;
	    else
	       if Opp > 0 then
		  V := 90;
	       else
		  V := 270;
	       end if;
	       
	    end if;
	   
	    
	    
	    
	 
	 else
	    Fa := Arctan(Float(Opp) / Float(Adj));
	    if Adj < 0 then
	       Fa := Fa + 3.14;
	    end if;
	
	    Fda := MakeDeg(Fa);
	    V := Integer(Fda);
	 end if;	 
      end GetVz;
      ----------------------------------------------------------------
      
      
      ---------------------------------------------------------------
      procedure GetVy(Adj, Hyp: in Integer; Vy: out Integer) is
	 VyF, VyFa: Float;
      begin
	 -- REAL-ISH
	 -- VyF := Arccos(Float(Adj) / Float(Hyp));
	 
	 -- CRAP
	 if Hyp = 0 then
	    -- Division med noll
	    Vy := 1337;
	 else
	    VyF := Arccos(Float(Adj / 100) / Float(Hyp / 100));
	 
	    VyFa := MakeDeg(VyF);
	    Vy := Integer(VyFa);
	 end if;
      end GetVy;
      ---------------------------------------------------------------
 
      Cx,Cy,Cz: Integer;
   begin
      Cx:=Xb-Xa;
      Cy:=Yb-Ya;
      Cz:=Zb-Za;
      GetL(Cx,Cy,Cz, L);
      GetVz(Cy,Cx,Vz);
      GetVy(Cz,L, Vy);
    
      L := L / 100;
      
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
