with Ada.Text_IO; use Ada.Text_IO;
with Person_Sorted_List; use Person_Sorted_List;
with Person_Handling; use Person_Handling;
procedure Lab5B is
		
	Test_List: List_Type;
	Test_Person: Person;
	begin
	Get(Test_Person);
	Insert(Test_List, Test_Person);
	Insert(Test_List, Test_Person);
	Insert(Test_List, Test_Person);
	Insert(Test_List, Test_Person);
	Insert(Test_List, Test_Person);
	Put(Test_List);

end Lab5B;