with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;
with Text_IO.Unbounded_IO; use Text_IO.Unbounded_IO;
--with Ada.Sequential_IO;

-- Temporär, ta bort när den inte behövs längre
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;


procedure Ntest is
	
	type MY_REC is
		record
			Age     : INTEGER;
			Sex     : CHARACTER;
			Initial : CHARACTER;
		end record;

		package Seq_IO is new Ada.Sequential_IO(MY_REC);
		use Seq_IO;

		Myself     : MY_REC;
		My_In_File : Seq_IO.FILE_TYPE;


	begin

	Open(My_In_File, In_File, "REG.BIN");

	for Index in 1..100 loop
	  Read(My_In_File, Myself);
	  if Myself.Age >= 82 then
	     Put("Record number");
	     Put(Myself.Age, 4);
	     Put(" ");
	     Put(Myself.Sex);
	     Put(" ");
	     Put(Myself.Initial);
	     New_Line;
	  end if;
	end loop;

	Close(My_In_File);

end Ntest;