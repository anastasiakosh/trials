program FourtyFour;
type
    plist = ^ListOfChr; 
    ListOfChr = record
        data: char;
        next: plist;
    end;
    QueOfChr = record 
        f, l: plist;
    end;
    pwlist = ^ListOfWords; 
    ListOfWords = record
        wor: plist; {the first element of chr list}
        next: pwlist;
    end;
    QueOfWords = record
        f, l: pwlist;
    end;

procedure QueOfChrInit(var q: QueOfChr);
begin
    q.f := nil;
    q.l := nil;
end;

procedure QueOfChrPush(var q: QueOfChr; c: char);
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

procedure QueOfChrErase(var q: QueOfChr);
var
    tmp: plist;
begin
    tmp := q.f;
    q.f := q.f^.next;
    dispose(tmp);
    if q.f = nil then
        q.l := nil;
end;

procedure QueOfChrPop(var q: QueOfChr; var c: char);
begin
    c := q.f^.data;
    QueOfChrErase(q);
end;

function QueOfChrIsEmpty(var q: QueOfChr) : boolean;
begin
    QueOfChrIsEmpty := q.f = nil;
end;

procedure QueOfWordsInit(var q: QueOfWords);
begin
    q.f := nil;
    q.l := nil;
end;

procedure QueOfWordsPush(var q: QueOfWords; var qc: QueOfChr);
begin
    if q.f <> nil then
    begin
        new(q.l^.next);
        q.l := q.l^.next;
        q.l^.wor := qc.f;
        q.l^.next := nil;
    end
    else
    begin
        new(q.f);
        q.f^.wor := qc.f;
        q.f^.next := nil;
        q.l := q.f;
    end;
end;

procedure QueOfWordsErase(var q: QueOfWords);
var
    tmp: pwlist;
begin
    tmp := q.f;
    q.f := q.f^.next;
    dispose(tmp);
end;

procedure QueOfWordsPop(var q: QueOfWords; var qc: QueOfChr);
begin
    qc.f := q.f^.wor;
    QueOfWordsErase(q);
end;

function QueOfWordsIsEmpty(var q: QueOfWords) : boolean;
begin
    QueOfWordsIsEmpty := q.f = nil;
end;

procedure AddingInCicle(var qw: QueOfWords; var qc: QueOfChr; var b: boolean);
begin
    b := false;
    QueOfWordsPush(qw, qc);
    QueOfChrInit(qc);
end;

function CalcMaxLength(f: plist) : integer;
begin
    CalcMaxLength := 0;
    while f <> nil do
    begin
        CalcMaxLength := CalcMaxLength + 1;
        f := f^.next;
    end;
end;
        
function FindMax(q: QueOfWords) : integer;
var 
    max: integer;
begin
    FindMax := 0;
    while q.f <> nil do
    begin
        max := CalcMaxLength(q.f^.wor);
        if FindMax < max then
            Findmax := max;
        q.f := q.f^.next;
    end;
end;

var
    qc: QueOfChr;
    qw: QueOfWords;
    c: char;
    IsNum: boolean;
    max: integer;
begin
    IsNum := false;
    QueOfChrInit(qc);
    QueOfWordsInit(qw);
    while not seekEOF do
    begin
        while not eoln do
        begin
            read(c);
            if (c < '0') or (c > '9') then
            begin
                if IsNum then
                begin
                    AddingInCicle(qw, qc, IsNum);
                end;
                continue;
            end
            else
            begin
                IsNum := true;
                QueOfChrPush(qc, c);
            end;
        end;
        if IsNum then
            AddingInCicle(qw, qc, IsNum);
        max := FindMax(qw);
        while not QueOfWordsIsEmpty(qw) do
        begin
            if CalcMaxLength(qw.f^.wor) <> max then
            begin
                QueOfWordsPop(qw, qc);
                while not QueOfChrIsEmpty(qc) do
                    QueOfChrErase(qc);
            end
            else
            begin
                QueOfWordsPop(qw, qc);
                while not QueOfChrIsEmpty(qc) do
                begin
                    QueOfChrPop(qc, c);
                    write(c);
                end;
            end;
        end;
        writeln;
    end;
end.
