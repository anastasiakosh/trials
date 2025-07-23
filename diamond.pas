program diamond.pas;
var
	n, k, h, i :integer;
begin
	repeat
		writeln('enter the diamond*s height: ');
		readln(h);
	until (h > 0) and (h mod 2 = 1);
	n := h div 2;
	{печать верхней строки}
	for k := 1 to n + 1 do
	begin
		for i := 1 to n + 1 - k do
		write(' ');
		write('*');
		if k > 1 then
		begin
			for i := 1 to 2*k -3 do
				write(' ');
				write('*');
		end;
		writeln;
	end;
	{печать нижней строки}
	for k := n downto 1 do
	begin 
		for i := 1 to n + 1 - k do
			write(' ');
		write('*');
		if k > 1 then
		begin
			for i := 1 to 2*k - 3 do
				write(' ');
			write('*');
		end;
		writeln;
	end;
end.
