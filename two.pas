program two;
type
    listptr = ^list;
    list = record
        data: longint;
        next: listptr;
    end;

procedure Eras(var first, cur: listptr);
begin
    while first^.next <> nil do
    begin
        cur := first^.next;
        dispose(first);
        first := cur;
    end;
    dispose(first);
    writeln('clean');
end;

procedure Print(first: listptr);
begin
    while first^.next <> nil do
    begin
        write(first^.data, ' ');
        first := first^.next;
    end;
    writeln(first^.data);
end;

var
    first, cur, endik: listptr;
    beg: boolean;
begin
    endik := nil;
    cur := nil;
    first := nil;
    beg := true;
    while not seekEOF do
    begin
        new(cur);
        read(cur^.data);
        if not beg then
        begin
            endik^.next := cur;
            endik := cur;
            endik^.next := nil;
        end
        else
        begin
            first := cur;
            first^.next := nil;
            endik := first;
            beg := false
        end;
    end;
    if not beg then
    begin
        Print(first);
        Print(first);
        Eras(first, cur);
    end;
end.
