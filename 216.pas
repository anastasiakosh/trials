program task;

procedure Handler(var st, was: string; n: integer);
var
    c: char;
    i: integer;
begin 
    c := st[n];
    for i := 1 to ord(st[0]) do
        if (c =  was[i]) then
            exit;
    for i := n + 1 to ord(st[0]) do
        if (c = st[i]) and ((c <> ' ') and (c <> #10)) then
        begin
            write(c);
            was := was + c;
            break;
        end;
end;

var
    stroka: string;
    was: string;
    i: integer;
begin
    readln(stroka);
    for i := 1 to ord(stroka[0]) do
    Handler(stroka, was, i);
    writeln;
end.
