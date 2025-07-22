program prosti;
var
	x, i: integer;
	proste: boolean;
begin
	x := 3;
	while x <=32750 do
	begin
	proste := true;
	i := 2;
	while i < x do
	begin
		if (x mod i )=0 then
		begin
			proste := false;
			break
		end
		else
			i := i+1
	end;
	if proste then
	begin
		writeln('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
		writeln('|',x,' is proste|');
	end;
	x := x + 1;
end;
end.

