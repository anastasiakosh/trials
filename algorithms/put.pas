program puts;

type 
    arr = array[0..5] of integer;

procedure EntersSort(var a: arr);
var
    i, j, biger, tmp: integer;
begin
    for i := 0 to length(a)-1 do
    begin
        biger := i;
        for j := i+1 to length(a)-1 do
            if a[biger] < a[j] then
                biger := j;
        tmp := a[i];
        a[i] := a[biger];
        a[biger] := tmp;
    end;
end;

var
    a: arr;
    i: integer;
begin
    for i := 0 to 5 do
        read(a[i]);
    for i := 0 to 5 do
        writeln(a[i]);
    writeln;
    writeln;
    writeln;
    EntersSort(a);
    for i := 0 to 5 do
        writeln(a[i]);
end.
