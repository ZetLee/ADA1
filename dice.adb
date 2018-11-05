
With ada.numerics.discrete_random, ada.integer_text_io, ada.text_io, bag_package;
use ada.integer_text_io, ada.text_io;


procedure Dice is


	Subtype Sides is Integer range 1..6;
	Subtype Count is Integer range 0..20;


	package rand is new ada.numerics.discrete_random(Sides);
	use rand;
	G : generator;
	t : Sides;

	package Dice_Bag is new bag_package(Sides,Count);
	use Dice_Bag;
		
	
	This_bag : Dice_Bag.Bag;
	
		
begin

	Dice_Bag.Empty(This_bag);
	
		reset(G);
	
	for I in 1..20 loop
		t := random(G);
		Dice_Bag.Add(This_bag, t);
	end loop;


	
		put (This_bag);
	
	
	while not Dice_bag.Has_Empty(This_bag) loop
		for I in Sides'Range loop
			Dice_bag.Remove(This_bag, I);
		end loop;
			Put_Line("");
			Put(This_bag);
		
	end loop;
	
	put (Dice_bag.Get_Empty(This_Bag));	
	
	
end Dice;
