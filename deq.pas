program dequeue;

type 
    LongItem2Ptr = ^LongItem2;
    LongItem2 = record
        data: longint;
        prev, next: LongItem2Ptr;
    end;
    LongDeque = record
        first, last: LongItem2Ptr;
    end;

procedure LongDequeInit(var ldeq: LongDeque);
begin
    ldeq.first := nil;
    ldeq.last := ldeq.first 
end;

procedure LongDequePushFront(var ldeq: LongDeque; n: longint);
var
    tmp: LongItem2Ptr;
begin
    new(tmp);
    tmp^.data := n;
    tmp^.next := ldeq.first;
    tmp^.prev := nil;
    ldeq.first := tmp;
    if ldeq.first^.next <> nil then
        ldeq.first^.next^.prev := ldeq.first
    else
        ldeq.last := ldeq.first;
end;

procedure LongDequePushBack(var ldeq: LongDeque; n: longint);
var
    tmp: LongItem2Ptr;
begin
    new(tmp);
    tmp^.data := n;
    tmp^.prev := ldeq.last;
    tmp^.next := nil;
    ldeq.last := tmp;
    if ldeq.last^.prev <> nil then
        ldeq.last^.prev^.next := ldeq.last
    else
        ldeq.first := ldeq.last;
end;

procedure LongDequePopFront(var ldeq: LongDeque; var n: longint);
var
    tmp: LongItem2Ptr;
begin
    n := ldeq.first^.data;
    tmp := ldeq.first;
    ldeq.first := ldeq.first^.next;
    if ldeq.first <> nil then
        ldeq.first^.prev := nil
    else 
    ldeq.last := nil;
    dispose(tmp);
end;

procedure LongDequePopBack(var ldeq: LongDeque; var n: longint);
var
    tmp: LongItem2Ptr;
begin
    n := ldeq.last^.data;
    tmp := ldeq.last;
    ldeq.last := ldeq.last^.prev;
    if ldeq.last <> nil then
        ldeq.last^.next := nil
    else 
        ldeq.first := nil;
    dispose(tmp);
end;

function LongDequeIsEmpty(var ldeq: LongDeque) : boolean;
begin
    LongDequeIsEmpty := ldeq.first = nil;
end;

var
    d: LongDeque;
    n: longint;
begin
    LongDequeInit(d);
    while not seekEof do
    begin
        read(n);
        {
        LongDequePushFront(d, n);
        }
        LongDequePushBack(d, n);

    end;
    while not LongDequeIsEmpty(d) do
    begin
        {
        LongDequePopFront(d, n);
        }
        LongDequePopBack(d, n);
        writeln(n);
    end;
end.
