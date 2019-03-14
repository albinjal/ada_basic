with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;
with Text_IO.Unbounded_IO; use Text_IO.Unbounded_IO;

-- Temporär, ta bort när den inte behövs längre
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Lab6 is

	Input, Output : File_Type;
	I: Integer;
	WasLastTab: Integer;
	WasLastSpace: Integer;
	TmpStr: Unbounded_String;

	begin

		Open (File => Input, Mode => In_File, Name => "REG.BIN");
		
		Create (File => Output, Mode => Out_File, Name => "output.txt");


			-- Denna loop loopar igenom filen rad för rad
			loop
				declare
					-- Deklarera en variabel som håller varje rad i minnet varje gång loopen körs
					InputLine : String := Get_Line (Input);

				begin
					I := 0;
					WasLastTab := 0;
					WasLastSpace := 0;
					TmpStr := To_Unbounded_String("");

					-- Loopa igenom varje tecken på raden och hämta ut varje element när flera mellanrum kommer i följd

					Put("---------------------------------------------"); New_Line;

					for I in 1..InputLine'Last loop
						-- Kolla om tecknet är mellanslag
						--Put(InputLine(I));
						--Put(" > ");
						--Put( Character'Pos(InputLine(I)) );
						--New_Line;

						if(Character'Pos(InputLine(I)) = 32) then
							-- Tecknet var mellanrum!

							-- Kolla om nästa tecknen också är mellanrum
							if(Character'Pos(InputLine(I+1)) = 32) then
								-- Vi ska avsluta elementet!
								WasLastTab := 1;
							else
							-- Nästa tecken var inte ett mellanrum
								-- Kolla så att föregående tecknen inte var ett mellanrum
								if(Character'Pos(InputLine(I-1)) /= 32) then
									-- Endast ett mellanrum, del av elementet!
									Append(TmpStr, " ");
									--Put("SPACE"); New_Line;
								else 
								-- Föregående tecken var ett mellanrum, avsluta elementet!
									New_Line;
									Put("|");
									Put(TmpStr);
									Put("|");
									New_Line;New_Line;
									--Put("_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_");
									-- Töm elementet
									TmpStr := To_Unbounded_String("");
									----New_Line;
								end if;
							end if;
						else
							WasLastTab := 0;
							-- Put( String(I) );
							
							

							case Character'Pos(InputLine(I)) is
								when 0..32 => null; Put("->"); Put( Character'Pos(InputLine(I)) ); New_Line;
								when 196 => 
									Append(TmpStr, "Ä"); Put( "Ä" ); Put(" === "); Put( Character'Pos( InputLine(I) ) ); New_Line;
								when 197 => 
									Append(TmpStr, "Å"); Put( "Å" ); Put(" === "); Put( Character'Pos( InputLine(I) ) ); New_Line;
								when 214 => 
									Append(TmpStr, "Ö"); Put( "Ö" ); Put(" === "); Put( Character'Pos( InputLine(I) ) ); New_Line;
								when 228 => 
									Append(TmpStr, "ä"); Put( "ä" ); Put(" === "); Put( Character'Pos( InputLine(I) ) ); New_Line;
								when 229 => 
									Append(TmpStr, "å"); Put( "å" ); Put(" === "); Put( Character'Pos( InputLine(I) ) ); New_Line;
								when 246 => 
									Append(TmpStr, "å"); Put( "å" ); Put(" === "); Put( Character'Pos( InputLine(I) ) ); New_Line;
								when others =>		
									Append(TmpStr, InputLine(I));					
									--Put( InputLine(I) );
									--Put(" === ");
									--Put( Character'Pos( InputLine(I) ) );
									--New_Line;
								end case;
						end if;
					end loop;

					-- Put_Line (Output, Line);
					

					--Put(Line);
					--Skip_Line;
				end;
			end loop;

			-- Close(Input);
			-- Close(Output);
		exception
		   when End_Error =>
			if Is_Open(Input) then 
				Close (Input);
			end if;
			if Is_Open(Output) then 
				Close (Output);
			end if;
end Lab6;