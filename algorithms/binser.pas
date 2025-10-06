program bins;
type 
    arr = array[0..5] of integer;

function binsearch(var a: arr; targ: integer) : integer;
var
    left, right, med: integer;
begin
    left := 0;
    right := length(a) - 1;
    while left <= right do
    begin
        med := (left + right) div 2;
        if targ = a[med] then
        begin
            binsearch := med;
            exit;
        end;
        if targ > a[med] then
            right := med - 1
        else
            left := med + 1;
    end;
    binsearch := -999;
end;

var
    a: arr;
    i, x: integer;
    f: text;
begin
    assign(f, 'y.txt');
    reset(f);
    for i := 0 to 5 do
        read(f, a[i]);
    close(f);
    for i := 0 to 5 do
        writeln(a[i]);
    write('enter the value for searh: ');
    readln(x);
    writeln('element x in pos:', binsearch(a, x));
end.
