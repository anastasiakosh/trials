program Queue;
type
    LongItemPtr = ^LongItem;
    LongItem = record
        data: longint;
        next: LongItemPtr;
    end;
    QueueOfLongints = record
        first, last: LongItemPtr;
    end;

procedure QOLInit(var queue: QueueOfLongints);
begin
    queue.first := nil;
    queue.last := nil;
end;

procedure QOLPut(var queue: QueueOfLongints; n: longint);
begin
    if queue.first = nil then
    begin
        new(queue.first);
        queue.last := queue.first;
    end
    else
    begin
        new(queue.last^.next);
        queue.last := queue.last^.next;
    end;
    queue.last^.data := n;
    queue.last^.next := nil;
end;

procedure QOLGet(var queue: QueueOfLongints; var n: longint);
var
    tmp: LongItemPtr;
begin
    n := queue.first^.data;
    tmp := queue.first;
    queue.first := queue.first^.next;
    if queue.first = nil then
        queue.last := nil;
    dispose(tmp);
end;

function QOLIsEmpty(var queue: QueueOfLongints) : boolean;
begin
    QOLIsEmpty := queue.first = nil;
end;

var
    q: QueueOfLongints;
    n: longint;
begin
    QOLInit(q);
    while not SeekEOF do
    begin
        read(n);
        QOLPut(q, n);
    end;
    while not QOLIsEmpty(q) do
    begin
        QOLGet(q, n);
        writeln(n);
    end;
end.
