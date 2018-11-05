with ada.text_io;
package body bag_package is


	procedure Empty(B: in out Bag) is
	begin
		B.T := (others => Counter'First);
	end Empty;


	procedure Add(B: in out Bag; I: in Index) is
	begin
		B.T(I) := Counter'Succ(B.T(I));
	end Add;
		
	procedure Remove(B: in out Bag; I: in Index) is
	begin
		B.T(I) := Counter'Pred(B.T(I));
	end Remove;
	
	
	
	function Has_Any(B: Bag; I: Index) return Boolean is
	begin
		return B.T(I) /= Counter'First;
	end Has_Any;


	procedure Put(B: in Bag) is
	begin
		for I in Index'Range loop
			ada.text_io.Put (Counter'Image(B.T(I)));
		end loop;
	end Put;
	
	
	function Has_Empty(B: in Bag) return boolean is
		Has: Boolean := false;
	begin
		for I in Index'Range loop
			if not (Has_Any(B,I)) then
				Has := true;
			end if;
		end loop;
		return Has;
	end Has_Empty;
	
	
	function Get_Empty(B: in Bag) return Index is
	begin
		for I in Index'Range loop
			if not Has_Any(B,I) then
				Return I;
			end if;
		end loop;
		Return Index'First;
	end Get_Empty;








end bag_package;
