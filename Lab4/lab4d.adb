with Date_Package; use Date_Package;
with Ada.Text_IO; use Ada.Text_IO;

procedure Lab4d is

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

	Put("Ange ett till datum: ");
	Test_Get(Date2);

	Put("Ett datum: ");
	Put(Date); New_Line;	

	Put("Ett till datum: ");
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
   
end Lab4d;
