with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;
with Ada.Command_Line; use Ada.Command_Line;

procedure Lab3 is
   
   type Integer_Array is array (1..20) of Integer;
   
   Array_20 : Integer_Array;
   
   -------------------------------------------------------
   procedure Generate(Array_20: in out Integer_Array) is
      
      subtype First_Ten_Numbers is Integer range 1..10;
      package Random_Number_One_To_Ten is
	 new Ada.Numerics.Discrete_Random(Result_Subtype => First_Ten_Numbers);
      
      G : Random_Number_One_To_Ten.Generator;
      
   begin
      Random_Number_One_To_Ten.Reset(G);
      for I in Array_20'Range loop
	 Array_20(I) := Random_Number_One_To_Ten.Random(G);
      end loop;
   end Generate;
   -------------------------------------------------------
   
   
   
   -------------------------------------------------------
   procedure Swap(Tal_1,Tal_2: in out Integer) is 
      Tal_B : Integer; -- Temporary buffer
   begin
      Tal_B := Tal_1;
      Tal_1 := Tal_2;
      Tal_2 := Tal_B;
      
      -- DEBUG New_Line; Put("SWAP IS RUNNING! INDEXES INPUT: "); Put(Tal_1); Put("+"); Put(Tal_2); New_Line;
   end Swap;
   -------------------------------------------------------
   
   
   
   ------------------------------------------------------
   procedure Sort(Arrayen_Med_Talen: in out Integer_Array) is
      Minsta_Talet, Minsta_Talet_Index : Integer;
   begin
      Minsta_Talet := 0;
      
      -- Loopa antalet gånger som arrayens längd
      for IOuter in Arrayen_Med_Talen'Range loop
	 -- DEBUG Put("> "); Put(IOuter); Put(" <"); New_Line;
	 -- Loopa arrayen med start från yttra loopens värde varje gång. 1..20, 2..20, ... , 20..20
         for I in IOuter..Arrayen_Med_Talen'Last loop
	    --DEBUG Put(">>>"); Put(I); New_Line;
	    if I = IOuter or Arrayen_Med_Talen(I) < Minsta_Talet then
	       Minsta_Talet := Arrayen_Med_Talen(I);
	       Minsta_Talet_Index := I;
	    end if;
         end loop;
	 
	 Swap(Arrayen_Med_Talen(IOuter), Arrayen_Med_Talen(Minsta_Talet_Index));
	 --DEBUG New_Line; Put("Vi swappar "); Put(Iouter); Put(" och "); Put(Minsta_Talet_Index); New_Line;
      end loop;
   end Sort;
   -----------------------------
   procedure Put(Arr: in Integer_Array) is
      
   begin
      -- Printar ut en array
   for I in Arr'Range loop
      Put(Arr(I));
      New_Line;
   end loop;
   end Put;
   
   
begin
   
   -- Fyller en array med random data
   Generate(Array_20);
   
   Put(Array_20);
   
   New_Line;
   
   -- Sorterar arrayen, stigande ordning
   Sort(Array_20);
   
   -- Printar ut en array
   Put(Array_20);
   
   
   
   
   
   
   ---------------------------
   -- KOD FÖR TERMINALARGUMENT
   ---------------------------
   
--   New_Line;
--   New_Line;
   
--   if Argument_Count = 0 then
       -- run A
--     Put("No arguments input");
--   else
--     if Argument_Count = 1 then
--       Put("Arg Input: "); Put(Argument(1));
--     elsif Argument_Count = 2 then
--       Put("Arg 1 Input: "); Put(Argument(1)); Put(" Arg 2 Input: "); Put(Argument(2));
--     end if;  
--   end if;
   
   
end Lab3;
