with bag_package;

generic
	type Resource is (<>);
	type Obstacle is (<>);
	with function Tool(O: Obstacle) return Resource;
	Type Bag is private;
	with procedure Empty(B: in out Bag);
	with procedure Add(B: in out Bag; R: in Resource);
	with procedure Remove(B: in out Bag; R: in Resource);
	with procedure Put(B: Bag);
	with function Has_Any(B: Bag; R: Resource) return Boolean;
		
package warrior_package is

	Type Warrior is private;
		
	procedure Init(W: in out Warrior);
	procedure Fight(W: in out Warrior; O: Obstacle);
	procedure Collect(W: in out Warrior; R: Resource);
	function Is_Alive(W: Warrior) return Boolean;
	procedure Put(W: Warrior);
	
	private

		Type Warrior is Record
			Status: Boolean := True;
			Inventory: Bag;
		end Record;
			
end warrior_package;
