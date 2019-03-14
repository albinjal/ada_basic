with Ada.Text_IO; use Ada.Text_IO;
with Sorted_List; use Sorted_List;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;


procedure Lab5 is
   
   Test_List : List_Type;
   
begin
   
   Insert(Test_List, 7);
   Insert(Test_List, 5);
   Insert(Test_List, 69);
   Put(Test_List);
   New_Line;
   Remove(Test_List, 69);
   Put(Test_List);
   New_Line;
   Put(Find(Test_List, 7));
   Put(Length(Test_List));
end Lab5;

