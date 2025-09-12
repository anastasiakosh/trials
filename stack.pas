program stack;
type
    LongItemPtr = ^LongItem;
    LongItem = record
        data: longint;
        next: LongItemPtr;
    end;
    StackOfLongints = LongItemPtr;

procedure SOLInit(var stack: StackOfLongInts);
begin
    stack := nil;
end;

procedure SOLPush(var stack: StackOfLongInts; n: longint);
var
    tmp: LongItemPtr;
begin
    new(tmp);
    tmp^.data := n;
    tmp^.next := stack;
    stack := tmp;
end;

procedure SOLPop(var stack: StackOfLongints; var n: longint);
var
    tmp: LongItemPtr;
begin
    n := stack^.data;
    tmp := stack;
    stack := stack^.next;
    dispose(tmp);
end;

function SOLIsEmpty(var stack: StackOfLongints): boolean;
begin
    SOLIsEmpty := stack = nil;
end;

var
    s: StackOfLongints;
    n: longint;
begin
    SOLInit(s);
    while not seekEOF do
    begin
        read(n);
        SOLPush(s, n);
    end;
    while not SOLIsEmpty(s) do
    begin
        SOLPop(s, n);
        writeln(n);
    end;
end.
