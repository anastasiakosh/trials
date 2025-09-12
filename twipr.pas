program twoipr;
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
    first, last: listptr;
begin
    last := nil;
    first := nil;
    while not seekEOF do
    begin
        if first <> nil then
        begin
            new(last^.next);
            last := last^.next;
            read(last^.data);
            last^.next := nil;
        end
        else
        begin
            new(last);
            read(last^.data);
            first := last;
            first^.next := nil;
            last := first;
        end;
    end;
    if first <> nil then
    begin
        Print(first);
        Print(first);
        Eras(first, last);
    end;
end.
