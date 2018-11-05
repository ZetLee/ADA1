with ada.text_io;
use ada.text_io;

package body warrior_package is

	procedure Init(W: in out Warrior) is
	begin
		Empty(W.Inventory);
		for I in Resource'Range loop
			Add(W.Inventory,I);
		end loop;
	end Init;
	
	procedure Fight(W: in out Warrior; O: Obstacle) is
	begin
		if Has_Any(W.Inventory, Tool(O)) then
			Remove(W.Inventory, Tool(O));
			Put("The hero overcame ");
			Put_Line(Obstacle'Image(O));
		else
			W.Status := False;
		end if;
	end Fight;
	
	procedure Collect(W: in out Warrior; R: Resource) is
	begin
		Add(W.Inventory, R);
		Put("The hero collected ");
		Put_Line(Resource'Image(R));
	end Collect;
	
	function Is_Alive(W: Warrior) return Boolean is
	begin
		return W.Status;
	end Is_Alive;
	
	procedure Put(W: Warrior) is
	begin
		Put("Inventory:");
		Put(W.Inventory);
	end Put;
	
end warrior_package;
