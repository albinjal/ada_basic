
package Date_Package is
   type Date_Type is private;
   procedure Get(Date: out Date_Type);
   procedure Put(Date: in Date_Type);
private
   type Date_Type is
      record
	 Year: Integer;
	 Month: Integer;
	 Day: Integer;
      end record;
   
end Date_Package;

