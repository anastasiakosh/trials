program FortyTwo;

type
    plist = ^listChar;
    listChar = record
        ch: char;
        next: plist;
    end;
type
    que = record
        f, l: plist;
    end;
type
    pwords = ^words;
    words = record 
        wor: plist;{chain of charactets}
        next: pwords;
    end;

procedure QueInit(var q: que);
begin
    q.f := nil;
    q.l := nil;
end;

procedure QueAddChr(var q: que; c: char);
begin
    if q.f <> nil then
    begin
        new(q.l^.next);
        q.l := q.l^.next;
        q.l^.ch := c;
        q.l^.next := nil;
    end
    else
    begin
        new(q.f);
        q.f^.ch := c;
        q.f^.next := nil;
        q.l := q.f;
    end;
end;

procedure QuePopChr(var q: que; var c: char);
var
    tmp: plist;
begin
    c := q.f^.ch;
    tmp := q.f;
    q.f := q.f^.next;
    dispose(tmp);
end;

procedure WordAdd(var w: pwords; var q: que);    
var 
    tmp: pwords;
begin
    new(tmp);
    tmp^.wor := q.f;
    q.f := nil;
    tmp^.next := w;
    w := tmp;
end;

procedure wordPop(var w: pwords);
var 
    tmp: pwords;
begin
    tmp := w;
    w := w^.next;
    dispose(tmp);
end;

{
procedure endlik(w: pwords; q: que);
begin
    while w^.next <> nil do
        w := w^.next;
    while w^.wor^.next <> nil do
        w^.wor := w^.wor^.next;
    q.l := w^.wor;
    q.l^.ch := #10;
end;
}

var 
    q: que;
    fw: pwords;
    c: char;
    
begin
    QueInit(q);
    fw := nil;
    while not Eof do
    begin
        read(c);
        if c = #10 then
            c := ' ';
        QueAddChr(q, c);
        if c = ' ' then
        begin
            WordAdd(fw, q);    
        end;
    end;
    WordAdd(fw, q);    
    while fw <> nil do
    begin
        q.f := fw^.wor;
        while q.f <> nil do 
        begin 
            QuePopChr(q, c); write(c);
        end;
        wordPop(fw)
    end;
    writeln;
end.
