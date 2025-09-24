program fourty;

type 
    plist = ^list;
    list = record 
        data, entr: integer;
        next: plist;
    end;

function check(f: plist; var n: integer) : boolean;
begin
    while f <> nil do
    begin
        if f^.data = n then
        begin
            check := true;
            exit;
        end;
        f := f^.next;
    end;
    check := false;
end;

procedure addElem(f: plist; var n: integer);
begin
    while f <> nil do
    begin
        if f^.data = n then
        begin
            f^.entr := f^.entr + 1;
            exit;
        end;
        f := f^.next;
    end;
end;

var
    f, last: plist;
    n: integer;
begin
    f := nil;
    last := nil;
    while not seekeof do
    begin
        read(n);
        if f <> nil then
        begin
            if check(f, n) then
                addElem(f, n)
            else
            begin
                new(last^.next);
                last := last^.next;
                last^.data := n;
                last^.entr := 1;
                last^.next := nil;
            end;
        end
        else
        begin
            new(last);
            last^.data := n;
            last^.entr := 1;
            last^.next := f;
            f := last;
            last := f;
        end;
    end;
    while f <> nil do
    begin
        if f^.entr = 3 then
            writeln(f^.data);
        f := f^.next;
    end;
end.
