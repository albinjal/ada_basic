with Date_Package; use Date_Package;
with Ada.Text_IO; use Ada.Text_IO;

procedure Lab4a is

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

begin

	Put("Ange ett datum: ");
	Test_Get(Date);

	Put("Ett datum: ");
	Put(Date); New_Line;
   
end Lab4a;
