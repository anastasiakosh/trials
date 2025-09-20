program TwoPtr;
type
    tlistPtr = ^tlist;
    tlist = record
        data: integer;
        prev, next: tlistPtr;
    end;

var
    f, last, tmp: tlistPtr;
    n: integer;
begin
    f := nil;
    tmp := nil;
    while not SeekEOF do
    begin
        readln(n);
        new(tmp);
        {fot example we add elemnts in left)}
        tmp^.data := n;
        tmp^.next := f;
        tmp^.prev := nil;
        f := tmp;
        if f^.next <> nil then
            f^.next^.prev := f;
    end;
    {now we need to push valid value for prev ptr}
    while f <> nil do
    begin
        n := f^.data;
        writeln(n);
        if f^.next = nil then
            last := f;
        f := f^.next;
            
    end;
    while last <> nil do
    begin
        n := last^.data;
        writeln(n);
        last := last^.prev;
    end;
end.
