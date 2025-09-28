program FortyThree;
type
    plist = ^listchr;
    listchr = record 
        data: char;
        next: plist;
    end;
    ChrQue = record 
        f, l: plist;
    end;
type
    pwlist = ^listwor;
    listwor = record
        wor: plist;
        next: pwlist;
    end;
    WorQue = record
        f, l: pwlist;
    end;

procedure ChrQueInit(var q: ChrQue);
begin
    q.f := nil;
    q.l := nil;
end;

procedure ChrQueAdd(var q: ChrQue; c: char);
begin
    if q.f <> nil then
    begin
        new(q.l^.next);
        q.l := q.l^.next;
        q.l^.data := c;
        q.l^.next := nil;
    end
    else
    begin
        new(q.f);
        q.f^.data := c;
        q.f^.next := nil;
        q.l := q.f;
    end;
end;

procedure ChrQuePop(var q: ChrQue; var c: char);
var
    tmp: plist;
begin
    c := q.f^.data;
    tmp := q.f;
    q.f := q.f^.next;
    dispose(tmp);
    if q.f = nil then
        q.l := nil;
end;

function ChrQueIsEmpty(var q: ChrQue) : boolean;
begin
    ChrQueIsEmpty := q.f = nil;
end;

procedure WorQueInit(var qw: WorQue);
begin
    qw.f := nil;
    qw.l := nil;
end;

procedure WorQuePush(var qw: WorQue; var q: ChrQue);
begin
    if q.f = nil then
        exit;
    if qw.f <> nil then
    begin
        new(qw.l^.next);
        qw.l := qw.l^.next;
        qw.l^.wor := q.f;
        qw.l^.next := nil;
    end
    else
    begin
        new(qw.f);
        qw.f^.wor := q.f;
        qw.f^.next := nil;
        qw.l := qw.f;
    end;
end;


procedure EraseWor(var qw: WorQue);
var
    tmp: pwlist;
begin
    tmp := qw.f;
    qw.f := qw.f^.next;
    dispose(tmp);
end;

    
function WorQueIsEmpty(var qw: WorQue) : boolean;
begin
    WorQueIsEmpty := qw.f = nil;
end;


function CalcLength(qw: pwlist; q:ChrQue) : integer;
var
    i: integer;
begin
    i := 0;
    if qw = nil then
    begin
        CalcLength := 0;
        exit;
    end
    else
    begin
        q.f := qw^.wor;
        while q.f <> nil do
        begin
            i := i + 1;
            q.f := q.f^.next;
        end;
        CalcLength := i;
        if CalcLength < CalcLength(qw^.next, q) then
            CalcLength := CalcLength(qw^.next, q); 
    end;
end;
    
procedure IterWor(qw: WorQue; var q: ChrQue; var c: char);
begin
    while qw.f <> nil do
    begin
        q.f := qw.f^.wor;
        if q.f = nil then 
        begin
            write(' ');
            qw.f := qw.f^.next;
        end
        else
        begin
            ChrQuePop(q, c);
            qw.f^.wor := q.f;
            qw.f := qw.f^.next;
            write(c);
        end;
    end;
    
end;

var
    q: ChrQue;
    qw: WorQue;
    c: char;
    i: integer;
begin
    ChrQueInit(q);
    WorQueInit(qw);
    while not eof do
    begin
        read(c);
        if (c = ' ') or (c = #10) then
        begin
            WorQuePush(qw, q);
            ChrQueInit(q);
            continue;
        end;
        ChrQueAdd(q, c);
    end;
    for i := 1 to CalcLength(qw.f, q) do
    begin
        IterWor(qw, q, c);
        writeln;
    end;
    while qw.f <> nil do
        EraseWor(qw);
end.
