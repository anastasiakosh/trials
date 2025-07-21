program skobko;
var
	a,b,t:integer;
begin
	read(a,b);
	writeln(a,' ',b);
	if a>b then
	begin
		t:=a;
		a:=b;
		b:=t
	end
	else 
	begin
		writeln('lolka')
	end;

	writeln(a,' ',b);
end.
