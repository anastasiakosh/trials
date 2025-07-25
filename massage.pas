program massage;
const
	message = 'Hello world!'; {what we want to print}
	count = 20; {how many times}
var
	i: integer;
begin
	for i := 1 to count do
		writeln(i,' ',message);
end.
		

