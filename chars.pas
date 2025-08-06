program chars;
var
    a,b,c: char;
    n: integer;

begin
    a := #10;
    b := #55;
    c := #77;
    write(c);
    write(a);
    write(b);
    write(a);
    write('hello,world!',#10);
    write('hello,world!',^j);
    write('hello,world!'#10);
    write('hello,world!'^j);
    write('That''s fine)))'^j);
    write('''');
    n := ord(c);
    write(n,a);
    c := chr(68);
    write(c,a);
end.
