program fibo_abort;
function Fibo(n: integer):integer;
var
	f, s, r, i:integer;
begin
	if n <= 0 then
	begin
		Fibo := 0;	
		exit
	end;
	r := 1;
	s := 0;
	for i:= 2 to n do
	begin
		f := s;
		s := r;
		r := f + s;		
	end;
	Fibo := r;
end;
var 
	i: integer;
begin
	for i := 1 to 10 do
	writeln(i,') ',Fibo(i))
end.
