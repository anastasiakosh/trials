program TwoPtr;
type
    tlistPtr = ^tlist;
    tlist = record
        data: integer;
        prev, next: tlistPtr;
    end;

var
    first, last, cur, tmp: tlistPtr;
    n: integer;
begin
    first := nil;
    cur := first;
    while not seekEof do {add into rigth}
    begin
        new(tmp);
        read(n);
        tmp^.data := n;
        tmp^.prev := cur;
        tmp^.next := nil;
        cur := tmp;
        if cur^.prev <> nil then
        begin
            cur^.prev^.next := cur;
            continue;
        end;
        if first = nil then
            first := cur;
    end;
    writeln('rsrr');

    { 
    while not SeekEOf do //this is insert into left
    begin
        new(tmp);
        read(n);
        tmp^.prev := cur^.prev;
        tmp^.next := cur;
        tmp^.data := n;
        if cur^.prev = nil then
            first := tmp
        else
            cur^.prev^.next := tmp;
        cur^.prev := tmp;
    end;
    }
    tmp := first;
    while first <> nil do
    begin
        n := first^.data;
        writeln(n);
        if first^.next = nil then
            last := first;
        first := first^.next;
    end;
    writeln;
    {now we delete 3 number}
    
    first := tmp;
    while first <> nil do
    begin
        if (first <> nil) and (first^.data = 3) then
        begin
            if (first^.prev <> nil) and (first^.next <> nil) then
            begin
                cur := first^.prev;
                cur^.next := first^.next;
                first^.next^.prev := cur;
                dispose(first);
                first := cur;
                break;
            end;
        end
        else
            first := first^.next;
    end;
    first := tmp;
    
    while first <> nil do
    begin
        n := first^.data;
        writeln(n);
        if first^.next = nil then
            last := first;
        first := first^.next;
    end;
    writeln;
    while last <> nil do
    begin
        n := last^.data;
        writeln(n);
        last := last^.prev;
    end;
end.
