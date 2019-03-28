with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Characters.Handling;

procedure Upg3 is
   
   Syl_Arr : constant array(1..100) of String(1..4) := (
    "ach ",    "tun ",    "ep  ",    "tur ",    "tash",
    "ine ",    "me  ",    "arr ",    "et  ",    "ze  ",
    "cre ",    "uss ",    "dar ",    "ien ",    "her ",
    "cant",    "jol ",    "nar ",    "kam ",    "dorn",
    "li  ",    "sis ",    "maal",    "uk  ",    "mec ",
    "at  ",    "ol  ",    "mi  ",    "ra  ",    "ge  ",
    "mor ",    "dai ",    "nest",    "phar",    "rag ",
    "ret ",    "ill ",    "on  ",    "dru ",    "ah  ",
    "quin",    "sha ",    "loq ",    "tre ",    "lak ",
    "sum ",    "eri ",    "an  ",    "tsi ",    "win ",
    "ter ",    "arch",    "on  ",    "ren ",    "i   ",
    "pri ",    "tau ",    "cu  ",    "ry  ",    "ven ",
    "us  ",    "mar ",    "jup ",    "it  ",    "er  ",
    "sat ",    "uh  ",    "un  ",    "plu ",    "gol ",
    "kar ",    "lam ",    "wel ",    "pik ",    "chu ",
    "cha ",    "man ",    "der ",    "za  ",    "bla ",
    "sto ",    "id  ",    "sau ",    "tan ",    "sin ",
    "cos ",    "chut",    "stri",    "stra",    "stru",
    "skro",    "skre",    "cet ",    "nya ",    "nyu ",
    "ple ",    "pra ",    "ble ",    "glu ",    "geo ");
   
   Num, I: Integer;
   Index: Integer := 1;
   Ut: String(1..200);
   Stav: String(1..4);
   Ver: Boolean := True;
begin
   Put("Mata in antal stavelser: "); Get(Num);
   Put("Mata in stavelseindex: ");
   for X in 1..Num loop
      Get(I);
      if I < 0 then
	 Stav := Syl_Arr(-I);
	 Ut(Index) := '-';
	 Ver := True;
	 Index := Index + 1;
      else
	 Stav := Syl_Arr(I);
      end if;
      
      for Z in 1..4 loop
	 if Stav(Z) /= ' ' then
	    if Ver = True then
	       Ut(Index) := Ada.Characters.Handling.To_Upper(Stav(Z));
	    else
	       Ut(Index) := Stav(Z);
	    end if;
	    Ver := False;
	    Index := Index + 1;
	   end if;
      end loop;
   end loop;
   Put("Genererat planetnamn: ");
   Put(Ut(1..Index));
end;
