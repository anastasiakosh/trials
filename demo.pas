program demo;
var
    i: integer;
begin
    for i := 0 to ParamCount do
        writeln('[',i,']:', Paramstr(i))
end.
