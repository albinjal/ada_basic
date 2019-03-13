with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Text_IO.Unbounded_IO; use Text_IO.Unbounded_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Sequential_IO;

procedure ftest is

	--type Lines is array (1..10000) of Unbounded_String;

	package Integer_IO is new Ada.Sequential_IO(Integer);
	use Integer_IO;

	Input: Integer_IO.File_Type;
	I: Integer;
	CNUM: Integer;
	tstr: String(1..16);
	tstr2: Unbounded_String;
	tstr3: Unbounded_String;

	--Lines_Arr: Lines;

	begin
		
		Open(Input, In_File, "REG.BIN");
		
		--Lines_Arr(1):= To_Unbounded_String(Get_Line(Input));

		while not End_Of_File(Input) loop
			--while not End_Of_Line(Input) loop

			Read(Input, I);
			


			Put(I);
			Put(" >> ");
			Put(To => tstr, Item => I, Base => 16);
			
			--CNUM:= Integer'Value( tstr );
			
			Put(tstr);

			tstr3:= To_Unbounded_String(tstr);

			Put(" >> ");

			Put(tstr3);

			New_Line;
			--Ada.Integer_Text_IO.Put(String, 16, I);
			
			New_Line;
			--end loop;
			--Skip_Line(Input);
			--New_Line(Copy);

		end loop;

		New_Line;
		New_Line;

		-- Put(CNUM);

		-- Read(File => Input, Item => Item, Last => I);

		-- Item:= Input;

		-- Close(Input);
		
		-- Put("FFS!");

		-- Put(Lines_Arr(1));

end ftest;