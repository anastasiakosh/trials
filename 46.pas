program FortySix;

procedure GetText(var f: text);
begin
    writeln(f, 'Humpty Dumpty sat on a wall,');
    writeln(f, 'Humpty Dumpty had a great fall;');
    writeln(f, 'All the king''s horses and all the king''s men');
    writeln(f, 'Couldn''t put Humpty together again');
end;

var
    f: text;
begin
    if (ParamCount < 1) or (ParamCount > 1) then
    begin
        writeln('you did not specify a file name argument or too many arguments');
        halt(1);
    end;
    
    assign(f, ParamStr(1));
    rewrite(f);
    GetText(f);
    {$I-}
    if IOResult <> 0 then
    begin
        writeln('failed to write to file :(');
        halt(1);
    end;
    close(f);
end.
