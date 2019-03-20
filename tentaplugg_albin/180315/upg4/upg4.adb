with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Upg4 is
   type Ints is
     array(1..10) of Integer;
   type Arrs is
     array(1..20) of Ints;
   
   procedure Extract(Data: out Arrs) is 
      File : File_Type;
   begin
      Open(File, In_File, "NUMMER.TXT");
      for X in Data'Range loop	 
	 for I in Ints'Range loop
	    Get(File, Data(X)(I));
	 end loop;	 
      end loop;
      Close(File);
   end;
   procedure Sort(Arr: in out Ints) is
      procedure Swap(A,B: in out Integer) is
	 C: Integer := A;
      begin
	 A := B;
	 
	 B := C;
	 
	   
      end; 
   begin
      for J in 2..Arr'Last loop
	 for I in reverse J..Arr'Last loop
	    if Arr(I) < Arr(I-1) then
	       Swap(Arr(I), Arr(I-1));
	    end if;
	 end loop;
      end loop;
      
   end;
   
   
   procedure Put(Data: in Arrs) is
      
   begin
      for X in Data'Range loop
	 for I in reverse Ints'Range loop
	    Put(Data(X)(I), 2); Put(' ');
	 end loop;
	 New_Line;
      end loop;
   end;
   
   Data: Arrs;
begin
  
   Extract(Data);
   for I in Data'Range loop
      Sort(Data(I));
   end loop;
   Put(Data);
   
   
end;
