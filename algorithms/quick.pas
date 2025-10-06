program q;
type 
    arr = array[0..5] of integer;

procedure QuickSort(var a: arr; first, last: integer);
var
    left, right, pivot, tmp: integer;
begin
    left := first;
    right := last;
    pivot := a[(first + last) div 2];
    while left <= right do
    begin
        while a[left] > pivot do
            left := left + 1;
        while a[right] < pivot do
            right := right - 1;
        if left <= right then
        begin
            tmp := a[left];
            a[left] := a[right];
            a[right] := tmp;
            left := left + 1;
            right := right - 1;
        end;
    end;
    if right > first then
        QuickSort(a, first, right);
    if left < last then
        QuickSort(a, left, last);
end;

var
    a: arr;
    i: integer;
    f: text;
begin
    assign(f, 'y.txt');
    rewrite(f);
    for i := 0 to 5 do
        read(a[i]);
    for i := 0 to 5 do
        writeln(a[i]);
    writeln;
    writeln;
    writeln;
    QuickSort(a, 0, length(a)-1);
    for i := 0 to 5 do
        write(f, a[i], ' ');
    close(f);
end.
