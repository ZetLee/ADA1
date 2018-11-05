with warrior_package, map_package, bag_package, ada.text_io;
use ada.text_io;

procedure sim is

	
	Type Field is (Empty, Stone, Wood, Sword, Water, Trap, Enemy);
	Subtype Resource is Field range Stone..Sword;
	Subtype Obstacle is Field range Water..Enemy;
	package Inv_Bag is new bag_package(Resource,Natural);
	use Inv_Bag;
	
	
	function Tool(O: Obstacle) return Resource is
	begin
		Case O is
			when Water => return Stone;
			when Trap => return Wood;
			when Enemy => return Sword;
		end Case;
	end Tool;
	
	package My_Warrior is new warrior_package(Resource, Obstacle, Tool, Bag, Empty, Add, Remove, Put, Has_Any);
	use My_Warrior;
	
	
	procedure Field_Action(F: in out Field; W: in out Warrior) is
	begin
		Case F is
			when Stone | Wood | Sword =>
				Collect(W,Resource(F));
			when Water | Trap | Enemy =>
				Fight(W,F);
			when Empty => null;
		end Case;
	end Field_Action;

	package My_Map is new map_package(Field, My_Warrior.Warrior, Field_Action, Empty);
	use My_Map;
	
	War : Warrior;
	M : Map(5);

begin
	Init(M);
	Init(War);
	Put(M);
	Put_Line ("");
	Put(War);
	Put_Line ("");
	while not Is_Empty(M) and Is_Alive(War) loop
		My_Map.Move(M, War);
		My_Map.Put(M);
		Put_Line("");
		Put(War);
		Put_Line("");
		Put_Line("");
		
	end loop;
	if Is_Alive(War) then
		Put("The hero survived.");
	else
		Put("The hero died a horrible death.");
	end if;
		
		
end sim;
