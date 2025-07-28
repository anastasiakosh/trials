program cubefunc;
var 
	a, b: real;

function Cube(x: real): real;
begin
	Cube := x*x*x
end;

begin 
	b := 0;
	a := Cube(b+1.3);
	writeln(a);

end.
