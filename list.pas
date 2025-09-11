program SingleList;
type
    listptr = ^list;
    list = record
        data: integer;
        next: listptr;
    end;

procedure rec(var first: listptr);
begin
    if first^.next <> nil then
    begin
        write(first^.data);
        first := first^.next;
        rec(first);
    end
    else 
    write(first^.data);
end;

var
    first: listptr;
    temp: listptr;
    start: boolean;
begin {1 2 3 4}
    first := nil;
    start := false;
    while not seekEOF do
    begin
        new(temp);
        read(temp^.data);
        if start then
        begin
            temp^.next := first;
            first := temp;
        end
        else
        begin
            temp^.next := nil;
            first := temp;
            start := true;
        end;
    end;
    temp := nil;
    rec(first);
end.
