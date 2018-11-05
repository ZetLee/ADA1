
With ada.numerics.discrete_random, ada.text_io;
Use ada.text_io;


package body map_package is
	
	procedure Init(M: in out Map) is
		package rand is new ada.numerics.discrete_random(Field);
		use rand;
		G : generator;
	begin
		reset(G);
		for I in 1..M.N loop
			for J in 1..M.N loop
				M.Fields(I,J) := random(G);
			end loop;
		end loop;
		M.Fields(1,1) := Empty;
		M.Position.X := 1;
		M.Position.Y := 1;
    end Init;

    procedure Put(M: in out Map) is
    begin
		for I in 1..M.N loop
			for J in 1..M.N loop
				if ( M.Position.X = I and M.Position.Y = J) then
					Put ("PLAYER |");
				else
					Put (Field'Image(M.Fields(I,J)));
					Put (" | ");
				end if;
			end loop;
			Put_Line("");

		end loop;
		Put ("Position");
		Put (Natural'Image(M.Position.X));
		Put (Natural'Image(M.Position.Y));
    end Put;

    procedure Move(M: in out Map; W: in out Warrior) is
		Subtype Irany is Integer Range 1..4; -- 1: down, 2: left, 3: up, 4: right
		package rand is new ada.numerics.discrete_random(Irany);
		use rand;
		G : generator;
		T : Irany;
    begin
   		reset(G);		
		T := random(G);
		Put("Direction:");
		Put (Irany'Image(T));
		Put_Line ("");
		Case T is
			when 1 => 
				if M.Position.X = M.N then
					M.Position.X := 1;
				else
					M.Position.X := M.Position.X + 1;
				end if;
			when 2 => 
				if M.Position.Y = 1 then
					M.Position.Y := M.N;
				else
					M.Position.Y := M.Position.Y - 1;
				end if;
			when 3 => 
				if M.Position.X = 1 then
					M.Position.X := M.N;
				else
					M.Position.X := M.Position.X - 1;
				end if;
			when 4 => 
				if M.Position.Y = M.N then
					M.Position.Y := 1;
				else
					M.Position.Y := M.Position.Y + 1;
				end if;
			when others => null;
		end Case;
		
		Field_Action(M.Fields(M.Position.X,M.Position.Y),W);
		M.Fields(M.Position.X,M.Position.Y) := Empty;
			
			
    end Move;

    function Is_Empty(M: in out Map) return Boolean is
		B: Boolean;
    begin
		B := True;
		for I in 1..M.N loop
			for J in 1..M.N loop
				if M.Fields(I,J) /= Empty then
					B := False;
				end if;
			end loop;
		end loop;
		return B;
    end Is_Empty;
    
    
    
    
end map_Package;
