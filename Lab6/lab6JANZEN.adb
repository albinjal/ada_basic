with Ada.Sequential_IO; 
with Ada.Text_IO;       use Ada.Text_IO;
with Sorted_List;       use Sorted_List;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

procedure Lab6 is
   
   type Array_Type is
    Array(1..10) of Integer;
   
   type Person_Type is
      record
	 S_Name : String(1..20);
	 
	 F_Name : String(1..20);
	 
	 G_Adress : String(1..20);
	 
	 P_Adress : String(1..20);
	 
	 Number : Integer;
	 Interest : Array_Type;
	 
      end record;
   
   
   package My_IO is
      new Ada.Sequential_IO(Person_Type);
   use My_IO;
   
--------------------------------------------------------   
   procedure Get(L1 : out List_Type) is
      
      X : Integer := 5;
   begin
      while X<=15 and X>0 loop
	 Get(X);
	 if X<=15 and X>0 then
	    Insert(X,L1);
	 end if;
      end loop;
   end Get;
   ---------------------------------------------------
   procedure Compare(L1 : in List_Type; P1 : in Person_Type; L2 : out List_Type) is
          
   begin
      Delete(L2);
      for I in 1..P1.Number loop
	 
         if Member(P1.Interest(I), L1) then
	    Insert(P1.Interest(I), L2);
	 end if;
      end loop;
      
   end Compare;	   
   ---------------------------------------------------
   procedure Put_S(File : in Ada.Text_IO.File_Type; S : in String) is
      
      
   begin
      for I in 1..19 loop
	 
	 if S(I)=' ' and S(I+1)=' ' then
	    exit;
	    end if;
         Put(File, S(I));
      end loop;
      Put(File," ");
      
   end Put_S;

   -------------------------------------------------
   procedure Put(F2 : in Ada.Text_IO.File_Type; P1 : in Person_Type; L2 : in out List_Type) is
      
   begin
      if not Empty(L2) then
	 Put(F2,"-------------------------------------------------------------------");
	 New_Line(F2);
	 Put_S(F2,P1.S_Name(1..20));
	 Put_S(F2,P1.F_Name(1..20));
	 Put_S(F2,P1.G_Adress(1..20));
	 Put_S(F2,P1.P_Adress(1..20));
	 Put(F2," *** ");
	 Put(F2,"Intressen: ");
	 Put(F2,L2);
	 New_Line(F2);
      end if;
      
      
      
   end Put;
   ---------------------------------------------------
   
   procedure Interest(F1 : in My_IO.File_Type; L1 : in List_Type) is
      
      F2 : Ada.Text_IO.File_Type;
      P1 : Person_Type;
      L2 : List_Type;
      
   begin
      Create(F2,Out_File,"RESULT.TXT");
      
      while not End_Of_File(F1) loop
         Read(F1,P1);
	 Compare(L1,P1,L2);
	 Put(F2,P1,L2); 
      end loop;
      
   
      Reset(F2,In_File);
      
   end Interest;
   -------------------------------------------------
   
   L1 : List_Type;
   F1 : My_IO.File_Type;
begin
   
   Put("Ange en följd av intressen 1 till 15, max 10 st. Avsluta med 0: ");
   New_Line;
   Get(L1);
   Open(F1,In_File,"REG.BIN");
   Interest(F1,L1);
   Put("KLART! Resultatet på filen RESULT.TXT");
  
   
  
   
   
end Lab6;
