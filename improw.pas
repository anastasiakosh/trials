program lis; {demo of the delete elements in the list}
type
    listPtr = ^list;
    list = record
        data: integer;
        next: listPtr;
    end;

var
    first, tmp: listPtr;
    pp: ^listPtr;
    n: integer;
begin
    first := nil;
    pp := @first;
    while not seekEof do
    begin
        read(n);
        new(tmp);
	tmp^.data := n;
	tmp^.next := pp^;
	pp^ := tmp;
    end;
    {
    pp := @first;
    while pp^ <> nil do
    begin
        if pp^^.data < 0 then
        begin
            tmp := pp^;
            pp^ := pp^^.next;
            dispose(tmp);
        end
        else
            pp := @(pp^^.next);
    end;
    }
    while first <> nil do
    begin
        writeln(first^.data);
        first := first^.next;
    end;
end.
