generic
	type Field is (<>);
	type warrior is private;
	with procedure Field_Action(F: in out Field; W: in out Warrior);
	Empty: Field;
package map_package is
	
	type Map(N: Positive) is private;
	
	procedure Init(M: in out Map);
	procedure Put(M: in out Map);
	procedure Move(M: in out Map; W: in out Warrior);
	function Is_Empty(M: in out Map) return Boolean;
		
	
	
	
	private
	
		type Fields_type is array(Positive Range<>,Positive Range<>) of Field;
		
		Type Pos is Record
			X: Positive;
			Y: Positive;
		end Record;
		
		type Map(N: Positive) is Record
			Fields: Fields_type(1..N,1..N);
			Position: Pos;
			
		end Record;
	
end map_package;
