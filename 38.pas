program ThirtiEight;
type
    arptr = array [1..3] of ^integer;
var
    a: arptr;
    p: ^arptr;
    x, y, z: integer;
    i: integer;
begin
    x := 11;
    y := 22;
    z := 33;
    a[1] := @x;
    a[2] := @y;
    a[3] := @z;
    p := @a;
    writeln(p^[1]^);{указываем на "а", следовательно выбираем елемент массива
    затем мы на указаную "а" говорим что бы она указывала на то что она указывала
    ну то есть всё просто по сути}
    {or we can go step by step:}
    for i := 1 to 3 do
        writeln(p^[i]^);
end.
