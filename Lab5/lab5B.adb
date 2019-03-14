with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Person_Sorted_List; use Person_Sorted_List;
with Person_Handling; use Person_Handling;
procedure Lab5B is
	Test_List: List_Type;
	Test_Person1: Person;
	Test_Person2: Person;
	Test_Person3: Person;
begin
	Get(Test_Person1);
	Insert(Test_List, Test_Person1);

	Get(Test_Person2);
	Insert(Test_List, Test_Person2);

	Get(Test_Person3);
	Insert(Test_List, Test_Person3);

	New_Line; New_Line;

	Put(Test_List);

	New_Line; New_Line;

	Remove(Test_List, Test_Person3);
	
	Put("Tog bort sista personen:"); New_Line; New_Line;

	Put(Test_List);	
	
	New_Line; New_Line; Put("Find - person inmatad som nr 2:"); New_Line;

	Put(Find(Test_List, Test_Person2));

	New_Line; New_Line; Put("Längd av listan: "); New_Line;

	Put(Length(Test_List));

end Lab5B;