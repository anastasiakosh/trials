program suss;
type 
    arr = array[1..10] of integer;

function sum(var a: arr; i: integer) : integer;
begin
    if i <> 0 then
    begin
        sum := sum + a[i];
        i := i - 1;
        sum := sum + sum(a, i);
    end
    else
        exit;
end;

var
    a: arr;
    i, res: integer;
begin
    for i := 1 to 10 do
        a[i] := i;
    i := 10;
    res := sum(a, i);
    writeln(res);
end.
