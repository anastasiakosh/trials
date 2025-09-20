program calculator;

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
    n, res, tmp: longint;
    c: char;
    i: byte;
begin
    LongDequeInit(d);
    while not seekEof do
    begin
        c := '!';{erase c for while}
        tmp := 0;
        res := 0;
        while not (c = ' ') do {convert char to int}
        begin
            read(c);
            if (c >= '0') and (c <= '9') then
                res := res * 10 + ord(c) - ord('0')
            else 
                break; {we catch arithmetic operator}
        end;
        if c = ' ' then
        begin
            LongDequePushBack(d, res);
            continue;
        end;
        {expected that c is equel operator}
        i := 1;
        case c of
        ' ': continue;
        '+': begin
            while (not LongDequeIsEmpty(d)) and (i <= 2) do
            begin
                LongDequePopBack(d, tmp);
                res := res + tmp; 
                i := i + 1;
            end;
            LongDequePushBack(d, res);
        end;
        '-': begin
            if  not LongDequeIsEmpty(d) then
            begin
                LongDequePopBack(d, tmp);
                LongDequePopBack(d, n);
                res := n - tmp; 
            end;
            LongDequePushBack(d, res);
        end;
        '*': begin
            res := 1;
            while (not LongDequeIsEmpty(d)) and (i <= 2) do
            begin
                LongDequePopBack(d, tmp);
                res := res * tmp; 
                i := i + 1;
            end;
            LongDequePushBack(d, res);
        end;
        '/': begin
            res := 1;
            if not LongDequeIsEmpty(d) then
            begin
                LongDequePopBack(d, tmp);
                LongDequePopBack(d, n);
                res := round (n / tmp); 
            end;
            LongDequePushBack(d, res);
        end;
        else
        begin
            writeln(ErrOutput, 'WTF?! need a arithmetic operator dumb');
            halt(77);
        end;
        end;
        read(c);
    end;
    if not LongDequeIsEmpty(d) then
    begin
        LongDequePopFront(d, tmp);
        writeln('res = ', tmp);
    end;
end.
