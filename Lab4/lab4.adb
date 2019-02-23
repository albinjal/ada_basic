with Date_Package; use Date_Package;
with Ada.Text_IO; use Ada.Text_IO;

procedure Lab4 is
	 
	Date: Date_Type;
   
begin
	Get(Date);
	Put(Date); New_Line;

	-- Date := Previous_Date(Date);
	-- Put(Date); New_Line;

	-- Date := Next_Date(Date);
	-- Put(Date); New_Line;

	for I in 1..368 loop
		Date := Previous_Date(Date);
		Put(Date); New_Line;
	end loop;

  --Test_Leap_Years; 

   
end Lab4;
