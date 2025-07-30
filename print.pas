program prom;

procedure Printchars (ch: char; count: integer);
begin
	if count > 0 then
	begin
		write(ch);
		write(' ');
		count := count - 1;
		Printchars (ch, count);
	end;
end;

begin 
	Printchars('*',4);
	writeln;
end.
