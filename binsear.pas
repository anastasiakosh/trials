program BinSearh;
type
    arr = array[0..100] of integer;

function BinarSear(var a: arr; target: integer): integer;
var
   beg, en, med: integer;
begin
    beg := 0;
    en := integer(length(a) - 1);
    med :=  trunc(en / 2);
    while beg <= en do
    begin
        if target = a[med] then
        begin
            BinarSear := med;
            exit;
        end;
        if target > a[med] then
        begin
            beg := med;
            med := med + trunc((en - beg) / 2);
            continue;
        end;
        if target < a[med] then
        begin
            en := med ;
            med := med - trunc((en - beg) / 2);
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
