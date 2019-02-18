with Ada.Text_IO;			use Ada.Text_IO;
with Ada.Integer_Text_IO;		use Ada.Integer_Text_IO;

with Create_Vector_Data;

procedure Test_Create_Vector_Data is
  
  type Test_Data_Rec is
    record
      Xa, Ya, Za, Xb, Yb, Zb            : Integer;
      L, Vy_Min, Vy_Max, Vz_Min, Vz_Max : Integer;
    end record;
  
  type Test_Data_Type is
    array (1 .. 17) of Test_Data_Rec;
  
  T : Test_Data_Type :=
    ((   0,    0,    0,  1000,     0,     0,  10,  90,  90,   0,   0),
     (   0,    0,    0,     0,  1000,     0,  10,  90,  90,  90,  90),
     (   0,    0,    0,     0,     0,  1000,  10,   0,   0,   0,   0),
     (   0,    0,    0, -1000,     0,     0,  10,  90,  90, 180, 180),
     (   0,    0,    0,     0, -1000,     0,  10,  90,  90, 270, 270),
     (   0,    0,    0,     0,     0, -1000,  10, 180, 180,   0,   0),
     (   0,    0,    0,  1000,  1000,  1000,  17,  54,  55,  45,  45),
     (   0,    0,    0, -1000, -1000,  1000,  17,  54,  55, 225, 225),
     (   0,    0,    0, -1000, -1000, -1000,  17, 125, 126, 225, 225),
     (1000, 1000, 1000, -1000, -1000, -1000,  35, 125, 125, 225, 225),
     (   0,    0,    0,     0,     0,     0,   0,
      Integer'First, Integer'Last, Integer'First, Integer'Last),
     ( 500,    0,  500,     0,   500,     0,   9, 124, 125, 135, 135),
     (-500,  500, -500,   500,  -500,   500,  17,  54,  55, 315, 315),
     (   0,    0,    0,  1000, -1000, -1000,  17, 125, 126, 315, 315),
     ( 123,  234,  345,   456,   567,   678,   6,  55,  56,  45,  45),
     ( 500,  500,  500,  1500,     0,  1200,  13,  57,  58, 333, 333),
     ( 127,  345,  789,  -123,  1234,  -543,  16, 145, 146, 106, 106));
  
  L, Vy, Vz : Integer;
  Ok        : Boolean;
  
begin
  for I in Test_Data_Type'Range loop
    Put("(");
    Put(T(I).Xa, Width => 4);
    Put(", ");
    Put(T(I).Ya, Width => 4);
    Put(", ");
    Put(T(I).Za, Width => 4);
    Put(", ");
    Put(T(I).Xb, Width => 5);
    Put(", ");
    Put(T(I).Yb, Width => 5);
    Put(", ");
    Put(T(I).Zb, Width => 5);
    Put(") =>");
    
    Create_Vector_Data(T(I).Xa, T(I).Ya, T(I).Za, T(I).Xb, T(I).Yb, T(I).Zb, L, Vy, Vz);
    
    Ok := True;
    
    if L /= T(I).L then
      Put("  Fel?: L  =");
      Put(L, Width => 3);
      Ok := False;
    end if;
    
    if ((Vy not in T(I).Vy_Min .. T(I).Vy_Max) and then
	(Vy + 360 not in T(I).Vy_Min .. T(I).Vy_Max) and then
	(Vy - 360 not in T(I).Vy_Min .. T(I).Vy_Max)) then
      Put("  Fel?: Vy =");
      Put(Vy, Width => 4);
      Ok := False;
    end if;
      
    if ((Vz not in T(I).Vz_Min .. T(I).Vz_Max) and then
	(Vz + 360 not in T(I).Vz_Min .. T(I).Vz_Max) and then
	(Vz - 360 not in T(I).Vz_Min .. T(I).Vz_Max)) then
      Put("  Fel?: Vz =");
      Put(Vz, Width => 4);
      Ok := False;
    end if;

    if Ok then
      Put("  OK");
    end if;
    New_Line;
  end loop;
end Test_Create_Vector_Data;
