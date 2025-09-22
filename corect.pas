program isertPRO;
type 
    arr = array[1..10] of integer;

procedure Sort(var a: arr; IsBig: boolean);
var
    tmp, buf, i, j, ind: integer;
begin
    for i := 1 to length(a) do
    begin
        tmp := a[i];
        buf := tmp;
        ind := i;
        for j := i+1 to length(a) do
        begin
            if (tmp < a[j]) and IsBig then {3 5 1 2 4}
            begin
                tmp := a[j];
                ind := j;
            end;
            if (tmp > a[j]) and not IsBig then {3 5 1 2 4}
            begin
                tmp := a[j];
                ind := j;
            end;
        end;
        a[i] := tmp; 
        a[ind] := buf;
    end;
end;
var
    a: arr;
    i: integer;
begin
    for i := 1 to 10 do
        read(a[i]);
    for i := 1 to 10 do
    begin
        writeln(a[i]);
    end;
    writeln;
    Sort(a, true);
    for i := 1 to 10 do
        writeln(a[i]);
    writeln;
    Sort(a, false);
    for i := 1 to 10 do
        writeln(a[i]);
    {
    writeln;
    for i := 1 to 10 do
        writeln(a[i]);
    }
end.
