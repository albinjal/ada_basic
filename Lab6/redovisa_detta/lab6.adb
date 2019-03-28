with Ada.Text_IO; use Ada.Text_IO;
with Sorted_List; use Sorted_List;
with Ada.Sequential_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure lab6 is

	type Array_Of_Integers is Array(1..10) of Integer;

	type Person is
	record
		Last_Name: String(1..20);
		First_Name: String(1..20);
		Street_Address: String(1..20);
		Postal_Address: String(1..20);
		Number_Of_Interests: Integer;
		Interests: Array_Of_Integers;
	end record;

	package My_IO is new Ada.Sequential_IO(Person); use My_IO;

	--  --  --  --  --  --  --  --  --  --  --  --  --  --  --

	procedure Get(output: out List_Type) is
		temp: Integer;
		begin

			loop
				Get(temp);
				exit when temp = 0;
				Insert(output, temp);
			end loop;
	end Get;

	procedure Select_From_Interests(Input: in My_IO.File_Type; Selected_Interests: in List_Type) is 

		Person_Input: Person;
		Found_Interests: List_Type;
		Outfile: Ada.Text_IO.File_Type;

		type boolean_1_15 is Array(1..15) of Boolean;
		check: boolean_1_15;

		begin

		Create(Outfile,Out_File,"RESULT.TXT");

		while not End_Of_File(Input) loop

			-- Återställ check, inga intressen valda på den nya personen
			for a in boolean_1_15'Range loop
				check(a) := false;
			end loop;

			Read(Input,Person_Input);

			-- Put("-- NEW PERSON -- -- -- -- -- -- -- -- -- -- -- ");New_Line;


			for i in Person_Input.Interests'Range loop
				if Person_Input.Interests(i) <= 15 AND Person_Input.Interests(i) > 0 then
					if Member(Selected_Interests, Person_Input.Interests(i)) then
						
						-- Kolla om intresset redan fyllts i på denna personen
						if check(Person_Input.Interests(i)) /= true then
							
							-- Spara att detta intresset har fyllts i
							check(Person_Input.Interests(i)) := true;

							Insert(Found_Interests, Person_Input.Interests(i));

						end if;
					end if;
				end if;
			end loop;

			if not Empty(Found_Interests) then
			Put(Outfile, Person_Input.First_Name);
			Put(Outfile, " ");
			Put(Outfile, Person_Input.Last_Name);
			Put(Outfile, " ");
			Put(Outfile, Person_Input.Street_Address);
			Put(Outfile, " ");
			Put(Outfile, Person_Input.Postal_Address);
			Put(Outfile, " *** Intressen: ");

			Put(Outfile, Found_Interests);

			New_Line(Outfile);
			Put(Outfile, "----------------------------------------------------------------------------------------------------");
			New_Line(Outfile);

			Delete(Found_Interests);
			end if;
			


			--Compare(L1,P1,L2);
			--Put(F2,P1,L2); 


		end loop;

		Reset(Outfile,In_File);

		--Put(S''elected_Interests);

	end Select_From_Interests;


	--  --  --  --  --  --  --  --  --  --  --  --  --  --  --


	Input: My_IO.File_Type;
	Selected_Interests: List_Type;

begin

	Put("Ange en följd av intressen 1 till 15, max 10 st. Avsluta med 0: ");
	New_Line;
	
	Get(Selected_Interests);
	-- Put(Selected_Interests);
	
	Open(File => Input, Mode => In_File, Name => "REG.BIN");

	Select_From_Interests(Input, Selected_Interests);

	Put("KLART! Resultat på filen RESULT.TXT");

end lab6;
