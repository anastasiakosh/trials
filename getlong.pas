program GetLongInt;
var
    res: file of longint;
    buf: longint;

begin
    assign(res, ParamStr(1));
    rewrite(res);
    while not seekEOF do
    begin
        readln(buf);
        write(res, buf);
    end;
    close(res);
end.
