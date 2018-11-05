generic
	type Index is(<>);
	type Counter is(<>);
	
	
	
package bag_package is

	Type Bag is private;
	
	

	procedure Empty(B: in out Bag);
	procedure Add(B: in out Bag; I: in Index);
	procedure Remove(B: in out Bag; I: in Index);
	function Has_Any(B: Bag; I: Index) return Boolean;
	procedure Put(B: in Bag);
	function Has_Empty(B: in Bag) return boolean;
	function Get_Empty(B: in Bag) return Index;
	
	
	private




		Type Tomb_type is Array (Index) of Counter;
		
		
		Type Bag is Record
			T: Tomb_type;

		end Record;


end bag_package;
