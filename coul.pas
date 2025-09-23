program coul;
type 
    listPtr = ^list;
    list = record 
        data: integer;
        next: listPtr;
    end;

function findMAX(var l: listPtr) : integer;
var
    t, m: integer;
begin
    if l <> nil then
    begin
        t := l^.data;
        l := l^.next;
        FindMax := FindMAX(l);
        if FindMAX < t then
            Findmax := t;
    end
    else
        exit;
end;

var
    l, tmp: listPtr;
    n, res: integer;
begin
    tmp := nil;
    l := nil;
    while not seekeof do
    begin
        new(tmp);
        read(n);
        tmp^.data := n;
        tmp^.next := l;
        l := tmp;
    end;
    res := findMAX(l);
    writeln(res);
end.
