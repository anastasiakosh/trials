program co;
type
    listPtr = ^list;
    list = record 
        data: integer;
        next: listPtr;
    end;

function Coun(l: listPtr) : integer;
begin
    if l <> nil then
    begin
        Coun := Coun(l^.next) + 1;
    end
    else
        Coun := 0;
end;


var
    l, tmp: listPtr;
    n, res: integer;
begin
    l := nil;
    tmp := nil;
    while not seekEof do
    begin
        read(n);
        new(tmp);
        tmp^.data := n;
        tmp^.next := l;
        l := tmp;
    end;
    res := Coun(l);
    writeln(res);
end.
