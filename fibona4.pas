program fibi;
var
	x: longint;

function Fiba(n: longint): longint;
var
	f,s,r: longint;
	i: integer;
begin
	if n <= 0 then
		Fiba := 1
	else
	begin
		s := 0;
		r := 1;
		for i := 2 to n do
		begin
			f := s;
			s := r;
			r := f + s;
		end;
		Fiba := r;
	end;
end;
begin 
	repeat
		write('enter value: ');
		readln(x);
		writeln('for x=',x,'fibonachi is equal= ',Fiba(x));
	until (x = 0);
end.
