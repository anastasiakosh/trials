program perechisl;
type 
    RainbowColorc =
        (red, orange, yellow, green, blue, indigo, violet);{RcRed, RcOrange...... так будет удобнее, ибо есои в каком-то типе понадобится такое же слово будет ошибка. а так мы делаем мнемонические приёмы}
    Signals =
        (SigRed, SigYellow, SigGreen);
var 
    rc : RainbowColorc;
begin
    rc := red;
    writeln(rc);
    rc := orange;
    writeln(rc);
    writeln(pred(rc));
    writeln(succ(rc));
    writeln(pred(yellow));
    writeln(ord(rc));
    writeln(ord(violet));
    writeln(ord(indigo));
end.
