program BinSearh;
type
    arr = array[0..100] of integer;

function BinarSear(var a: arr; target: integer): integer;
var
   beg, en, med: integer;
begin
    beg := 0;
    en := integer(length(a) - 1);
    while beg <= en do
    begin
        med := round((beg + en)/2);
        if target = a[med] then
        begin
            BinarSear := med;
            exit;
        end;
        if target > a[med] then
        begin
            beg := med + 1;
            continue;
        end
        else
        begin
            en := med - 1;
            continue;
        end;
    end;
    BinarSear := -9999;
end;

var
    a: arr;
    i, res: integer;
begin
    for i := 1 to Length(a) do
        a[i] := i * 10;
    res := BinarSear(a, 90);
    writeln('index of 90', ' = ', res);
end.
