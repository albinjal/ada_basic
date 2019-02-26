with Date_Package; use Date_Package;
with Ada.Text_IO; use Ada.Text_IO;

procedure Lab4b is

	type Dates is array (1..10) of Date_Type;

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

begin

	Put("Ange ett datum: ");
	Test_Get(Date);

	Put("Ett datum: ");
	Put(Date); New_Line;

	Date := Next_Date(Date);
	Put("Nästkommande datum: ");
	Put(Date); New_Line;

	Date2 := Previous_Date(Date);
	Put("Tiigare datum: ");
	Put(Date); New_Line;

	-- Put(Date); New_Line;

	--for I in 1..368 loop
	--	Date := Previous_Date(Date);
	--	Put(Date); New_Line;
	--end loop;

  --Test_Leap_Years; 

   
end Lab4b;
