with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
package body Date_Package is

	function "="(Date1, Date2: Date_Type)
		return Boolean is
	begin
		if Date1.Year = Date2.Year and Date1.Month = Date2.Month and Date1.Day = Date2.Day then
			return True;
		else
			return False;
		end if;
	end;

	function "<"(Date2, Date1: Date_Type)
		return Boolean is
	begin
		if Date1.Year >= Date2.Year then
			if Date1.Year > Date2.Year then
				return True;
			else
				if Date1.Month >= Date2.Month then
					if Date1.Month > Date2.Month then
						return True;
					else
						if Date1.Day > Date2.Day then
							return True;
						else
							return False;
						end if;
					end if;
				else
					return False;
				end if;
			end if;
		else
			return False;
		end if;
	end;

	function ">"(Date1, Date2: Date_Type)
		return Boolean is
	begin
		if Date1.Year >= Date2.Year then
			if Date1.Year > Date2.Year then
				return True;
			else
				if Date1.Month >= Date2.Month then
					if Date1.Month > Date2.Month then
						return True;
					else
						if Date1.Day > Date2.Day then
							return True;
						else
							return False;
						end if;
					end if;
				else
					return False;
				end if;
			end if;
		else
			return False;
		end if;
	end;

	function Is_Leap_Year(Year: in Integer)
		return Boolean is
	begin
		if Year mod 4 = 0 and Year mod 100 /= 0 then
			return True;
		elsif Year mod 400 = 0 then
			return True;
		else
			return False;
		end if;
	end Is_Leap_Year;


	procedure Test_Leap_Years is
	begin
		for I in 1800..2400 loop
			Put(I); Put(" ");
			if Is_Leap_Year(I) then
				Put("SKOTT");
			end if;
			New_Line;
		end loop;
	end Test_Leap_Years;

	function Last_Day_Of_Month(Month, Year: in Integer)
		return Integer is

		febleap: Integer;
	begin

		if Is_Leap_Year(Year) then
			febleap := 29;
		else
			febleap := 28;
		end if;

		case Month is
			when 1 => return 31;
			when 2 => return febleap;
			when 3 => return 31;
			when 4 => return 30;
			when 5 => return 31;
			when 6 => return 30;
			when 7 => return 31;
			when 8 => return 31;
			when 9 => return 30;
			when 10 => return 31;
			when 11 => return 30;
			when 12 => return 31;

			when others => -- Errorhantering
				return 0;
		end case;
	end Last_Day_Of_Month;


	-- Tar in ett datum från terminalen
	procedure Get(Date: out Date_Type) is
		Ins: String(1..10);
	begin
		Get(Ins);
		Date.Year := Integer'Value(Ins(1..4));
		Date.Month := Integer'Value(Ins(6..7));
		Date.Day := Integer'Value(Ins(9..10));
	end Get; 
   
	-- Skriver ut datum
	procedure Put(Date: in Date_Type) is
	begin
		Put(Date.Year, 4);
		Put("-");
		if Date.Month < 10 then
			Put("0");
		end if;
		Put(Date.Month,1);
		Put("-");

		if Date.Day < 10 then
			Put("0");
		end if;
		Put(Date.Day,1);
	end Put;

	-- Returnerar nästkommande datum
	function Next_Date(Date: in Date_Type)
		return Date_Type is
		Temp_Date: Date_Type;
	begin
		Temp_Date := Date;
		if Temp_Date.Day = Last_Day_Of_Month(Temp_Date.Month, Temp_Date.Year) then
			if Temp_Date.Month = 12 then
				Temp_Date.Year := Temp_Date.Year + 1; Temp_Date.Month := 1; Temp_Date.Day := 1;
			else
				Temp_Date.Month := Temp_Date.Month + 1; Temp_Date.Day := 1;
			end if;
		else
			Temp_Date.Day := Temp_Date.Day + 1;
		end if;
		return Temp_Date;
	end Next_Date;

	-- Returnerar föregående datum
	function Previous_Date(Date: in Date_Type)
		return Date_Type is
		Temp_Date: Date_Type;
	begin

		Temp_Date := Date;

		-- Om dagen inte är 1, ta bara bort en dag
		if Temp_Date.Day /= 1 then
			Temp_Date.Day := Temp_Date.Day - 1;
		else
			-- Beroende på vilken månad vi är i ska nya dagen bli olika.
			if Temp_Date.Month = 1 then
				Temp_Date.Year := Temp_Date.Year - 1; Temp_Date.Month := 12; Temp_Date.Day := 31;
			else
				Temp_Date.Month := Temp_Date.Month - 1;
				Temp_Date.Day := Last_Day_Of_Month(Temp_Date.Month, Temp_Date.Year); -- Tar in månad och år så att funktionen kan ta hänsyn till skottår
			end if;
		end if;

		--Temp_Date.Year := Temp_Date.Year - 1;
		return Temp_Date;

	end Previous_Date;
	 
end Date_Package;
