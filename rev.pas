program one;
type
    listptr = ^list;
    list = record 
        data: longint;
        next: listptr;
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

procedure Rever(var first, tmp: listptr);
var 
    cur: listptr;
begin 
    cur := first^.next;
    first^.next := nil;
    while cur <> nil do
    begin
        tmp := cur;
        cur := cur^.next;
        tmp^.next := first;
        first := tmp;
    end;
end;

    

procedure Eras(var first, temp: listptr);
begin
    while first <> nil do
    begin
        temp := first^.next;
        dispose(first);
        first := temp
    end;
    dispose(first);
    writeln('clean');
end;

var
    temp, first: listptr;
begin
    first := nil;
    temp := nil;
    while not seekEOF do
    begin
        new(temp);
        read(temp^.data);
            temp^.next := first;
            first := temp;
    end;
    if first <> nil  then
    begin
        Print(first);
        Rever(first, temp);
        Print(first);
        Eras(first, temp);
    end;
end.
