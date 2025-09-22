program isert;
type 
    arr = array[1..10] of integer;

function findbig(var a: arr) : integer;
var
    big, index, i: integer;
begin
    big := -32000;
    for i := 1 to length(a) do
    begin
        if a[i] > big then
        begin
            big := a[i];
            index := i;
        end;
    end;
    a[index] := -32000;
    findbig := big;
end;
    
function findsmall(var a: arr) : integer;
var
    small, index, i: integer;
begin
    small := 32000;
    for i := 1 to length(a) do
    begin
        if a[i] < small then
        begin
            small := a[i];
            index := i;
        end;
    end;
    a[index] := 32000;
    findsmall := small;
end;
function givearr(var ar: arr; isBig: boolean) : arr;
var
    tmp: arr;
    el, i: integer;
begin
    for i := 1 to length(ar) do
    begin
        if isBig then
            el := findbig(ar)
        else
            el := findsmall(ar);
        tmp[i] := el;
    end;
    givearr := tmp;
end;

var
    a: arr;
    i: integer;
begin
    for i := 1 to 10 do
        a[i] := i;
    for i := 1 to 10 do
    begin
        writeln(a[i]);
    end;
    writeln;
    a := givearr(a, true);
    for i := 1 to 10 do
        writeln(a[i]);
    writeln;
    a := givearr(a, false);
    for i := 1 to 10 do
        writeln(a[i]);
end.
