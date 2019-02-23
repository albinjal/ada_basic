with Date_Package; use Date_Package;
with Ada.Text_IO; use Ada.Text_IO;

procedure Lab4 is
	 
	Date: Date_Type;
	Date2: Date_Type;
begin
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
