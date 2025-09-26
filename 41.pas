program FortyOne;

type 
    plist = ^list;
    list = record 
        data: longint;
        entr: integer;
        next: plist;
    end;

function check(var f: plist; n: longint) : boolean;
begin
    check := false;
    while f <> nil do
    begin
        if f^.data = n then
        begin
            check := true;
            exit;
        end
        else
        begin
            f := f^.next;
        end;
    end;
end;

procedure CheckAndAnd(f: plist; var l: plist; n: longint);
begin
    if check(f, n) then
    begin
        f^.entr := f^.entr + 1;
    end
    else
    begin
        new(l^.next);
        l := l^.next;
        l^.next := nil;
        l^.data := n;
        l^.entr := 1;
    end;
end;
    
function Largest(f: plist) : integer;
begin
    Largest := 0;
    while f <> nil do
    begin
        if Largest < f^.entr then
            Largest := f^.entr;
        f := f^.next;
    end;
end;

procedure PopLarg(var f: plist; var b: integer);
var
    tmp: plist;
begin
    while f <> nil do
    begin
        if f^.entr = b then
            writeln(f^.data);
        tmp := f;
        f := f^.next;
        dispose(tmp);
    end;
end;

var
    first, last: plist;
    n: longint;
    big: integer;
begin
    first := nil;
    last := nil;
    while not seekeof do
    begin
        read(n);
        if first <> nil then
        begin
            CheckAndAnd(first, last, n);
        end
        else
        begin
            new(first);
            first^.data := n;
            first^.next := nil;
            first^.entr := 1;
            last := first;
        end;
    end;
    big := Largest(first);
    if big > 0 then
    begin
        PopLarg(first, big);
        last := nil;
    end;
end.
