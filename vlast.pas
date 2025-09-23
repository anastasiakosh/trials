program vlast;
function findSq(a, b: integer) : integer;
var
    big, small: integer;
begin
    big := a;
    if big < b then
    begin
        big := b;
        small := a;
    end
    else
        small := b;
    if small = 0 then
    begin
        findSq := big;
        exit;
    end
    else
        findSq := findSq(big - small, small);
end;

var
    A, B, x: integer;
begin
    A := 1680;
    B := 640;
    x := findSq(A, B);
    writeln(x);
end.
