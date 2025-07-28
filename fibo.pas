program fibonachi;
var
	i,x: longint;
	
function Fibonachi(x: integer): longint;
var
	i: integer;
	f, s, r: longint;
begin
	if x <= 0 then
		Fibonachi := 0
	else 
	begin
		s := 0;
		r := 1;
		for i := 2 to x do 
		begin
			f := s;
			s := r;
			r := f + s;
		end;
	Fibonachi := r;
	end;
end;

begin
	for i := 0 to 10 do
	begin
	x := Fibonachi(i);
	writeln('stroka ', i, ' = ', x);
 	end;
end.
