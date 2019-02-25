with Date_Package; use Date_Package;
with Ada.Text_IO; use Ada.Text_IO;

procedure Lab4 is

	type Dates is array (1..10) of Date_Type;

	procedure Sort(Arrayen_Med_Talen: in out Dates) is
		procedure Swap(Tal_1,Tal_2: in out Date_Type) is 
      Tal_B : Date_Type; -- Temporary buffer
   begin
      Tal_B := Tal_1;
      Tal_1 := Tal_2;
      Tal_2 := Tal_B;
      
      -- DEBUG New_Line; Put("SWAP IS RUNNING! INDEXES INPUT: "); Put(Tal_1); Put("+"); Put(Tal_2); New_Line;
   end Swap;
      Minsta_Talet: Date_Type;
      Minsta_Talet_Index: Integer;
  begin
     --Minsta_Talet.Year := 0;
		 --Minsta_Talet.Month := 0;
		 --Minsta_Talet.Day := 0;
     
--    -- Loopa antalet gånger som arrayens längd
    for IOuter in Arrayen_Med_Talen'Range loop
-- 	 -- DEBUG Put("> "); Put(IOuter); Put(" <"); New_Line;
--	 -- Loopa arrayen med start från yttra loopens värde varje gång. 1..20, 2..20, ... , 20..20
      for I in IOuter..Arrayen_Med_Talen'Last loop
--	    --DEBUG Put(">>>"); Put(I); New_Line;
	    if I = IOuter or Arrayen_Med_Talen(I) < Minsta_Talet then
	       Minsta_Talet := Arrayen_Med_Talen(I);
	       Minsta_Talet_Index := I;
	    end if;
         end loop;
--	 
	 Swap(Arrayen_Med_Talen(IOuter), Arrayen_Med_Talen(Minsta_Talet_Index));
--	 --DEBUG New_Line; Put("Vi swappar "); Put(Iouter); Put(" och "); Put(Minsta_Talet_Index); New_Line;
    end loop;
	end Sort;

	procedure Test_Get(Date: out Date_Type) is
		begin
			loop
				begin
					Get(Date);
					exit;
				exception
					when YEAR_ERROR => Put_Line("FEL: YEAR_ERROR");
					when MONTH_ERROR => Put_Line("FEL: MONTH_ERROR");
					when DAY_ERROR => Put_Line("FEL: DAY_ERROR");
					when FORMAT_ERROR => Put_Line("FEL: FORMAT_ERROR");
				end;
			end loop;
		end Test_Get;
	 
	Date: Date_Type;
	Date2: Date_Type;

	Dates_Array: Dates;

begin

	

	Test_Get(Date);
	Test_Get(Date2);

	Put(Date); New_Line;
	Put(Date2); New_Line;


	for I in Dates'Range loop
		Get(Dates_Array(I));
	end loop;

	for I in Dates'Range loop
		Put(Dates_Array(I));
		New_Line;
	end loop;
	
	Sort(Dates_Array);
	New_Line;

	for I in Dates'Range loop
		Put(Dates_Array(I));
		New_Line;
	end loop;

	Get(Date);
	Get(Date2);
	Put(Date); New_Line;
	Put(Date2); New_Line;

	if Date = Date2 then
		Put("Lika"); New_Line;
	else
		Put("Olika"); New_Line;
	end if;

	if Date > Date2 then
		Put(Date); Put(" > "); Put(Date2); New_Line;
	else
		Put(Date); Put(" !!> "); Put(Date2); New_Line;
	end if;

	if Date < Date2 then
		Put(Date); Put(" < "); Put(Date2); New_Line;
	else
		Put(Date); Put(" !!< "); Put(Date2); New_Line;
	end if;



	-- Date := Previous_Date(Date);
	-- Put(Date); New_Line;

	-- Date := Next_Date(Date);
	-- Put(Date); New_Line;

	--for I in 1..368 loop
	--	Date := Previous_Date(Date);
	--	Put(Date); New_Line;
	--end loop;

  --Test_Leap_Years; 

   
end Lab4;
