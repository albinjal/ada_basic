package Date_Package is
	YEAR_ERROR: exception;
	MONTH_ERROR: exception;
	DAY_ERROR: exception;
	FORMAT_ERROR: exception;
	type Date_Type is private;
	procedure Get(Date: out Date_Type);
	procedure Put(Date: in Date_Type);
	procedure Test_Leap_Years;
	function "="(Date1, Date2: in Date_Type) return Boolean;
	function ">"(Date1, Date2: in Date_Type) return Boolean;
	function "<"(Date2, Date1: in Date_Type) return Boolean;
	function Next_Date(Date: in Date_Type) return Date_Type;
	function Previous_Date(Date: in Date_Type) return Date_Type;
private
	type Date_Type is
		record
		Year: Integer;
		Month: Integer;
		Day: Integer;
    end record;
end Date_Package;
