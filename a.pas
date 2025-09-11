program ptra;
var
    p, q: ^string;
begin
    new(p);
    p^ := 'lolop';
    q := p;
    p := nil;
    dispose(p);
    writeln(q^);
    dispose(q);
    q := nil;
end.
