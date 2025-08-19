program arrays;
type
    from1to100 = 1..100;{это называется диапазонный тип, мы его снабдили именем фром1ту100, и 
    потом используем его имя для описания массива)}
    real100 = array [from1to100] of real;
    {real100 = array [1..100] of real;
    можно и так, в таком случаем мы задаём диапазон анонимным диапозонным типом}
var
    i: integer;
    a, b: real100;
begin
    a[1] := 1;
    for i := 2 to 100 do
        a[i] := a[i-1] / 2;
    for i := 1 to 100 do
        b[i] := sin(a[i]);
    for i := 1 to 100 do
        writeln(b[i],' ',a[i]);
end.
