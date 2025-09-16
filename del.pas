program lis; {demo of the delete elements in the list}
type
    listPtr = ^list;
    list = record
        data: integer;
        next: listPtr;
    end;

var
    first, tmp, tmp2, buf: listPtr;
    n: integer;
begin
    first := nil;
    while not seekEof do
    begin
        read(n);
        new(tmp);
        tmp^.data := n;
        tmp^.next := first;
        first := tmp;
    end;
    {next I delete the negative numbers}
    {for example release the bad algorithm which no have double pointer:}
    if first <> nil then {for situation when we have negative number in the FIRTS element}
    begin
        while first^.data < 0 do
        begin
            tmp := first;
            first := first^.next;
            dispose(tmp);
        end; {we move our first ptr to the positive element, we must find it}
    end;
    {now first element have the positive number}
    tmp2 := first;
    while first <> nil do
    begin
        if (first^.next <> nil) and (first^.next^.data < 0) then
        begin
            tmp := first^.next;
            buf := tmp^.next;
            dispose(tmp);
            first^.next := buf;
        end
        else
            first := first^.next;
    end;
    first := tmp2;
    while first <> nil do
    begin
        writeln(first^.data);
        first := first^.next;
    end;
end.
