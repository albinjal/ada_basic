with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
package body Date_Package is
   
   
   procedure Get(Date: out Date_Type) is
      Ins: String(1..10);
   begin
      Get(Ins);
      Date.Year := Integer'Value(Ins(1..4));
      Date.Month := Integer'Value(Ins(6..7));
      Date.Day := Integer'Value(Ins(9..10));
   end Get; 
   
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
   
end Date_Package;
