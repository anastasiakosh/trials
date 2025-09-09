program FiftyFive;
const
    add = 'add';
    query = 'query';
    list = 'list';
    SizeAr = 59;

type 
    stringa = string[59];
    item = record
        name: stringa;
        count: longint;
    end;
    Fitem = file of item;

procedure ad(var f: Fitem; name: stringa);
var
    i: item;
    size: integer;
begin
    size := 0;
    while not EOF(f) do
    begin
        read(f, i);
        if i.name = name then
        begin
            i.count := i.count + 1;
            seek(f, size);
            write(f, i);
            exit;
        end;
        size := size + 1;
    end;
    writeln('WARNING: NAME ' + name + ' DON''T FOUND!!!');
    writeln('create a new record . . .');
    i.name := name;
    i.count := 1;{хотел написать append но он только для текста. 
    по факту курсор всё равно в конце. так что придётся без "страховки"))}
    write(f, i);
end;

function que(var f: Fitem; name: stringa): longint;
var
    i: item;
begin
    while not EOF(f) do
    begin
        read(f, i);
        if i.name = name then
        begin
            que := i.count;
            exit;
        end;
    end;
    que := 0;
end;

procedure ls(var f: Fitem);
var
    i: item;
begin
    while not EOF(f) do
    begin
        read(f, i);
        writeln(i.name,' + ', i.count);
    end;
end;

var
    f: Fitem;
begin
    if (ParamCount < 2) and not (ParamStr(2) = list) then 
    begin
        writeln(ErrOutput, 'At least two arguments are needed');
        halt(1);
    end;
    if (ParamCount < 3) and (ParamStr(2) <> list) then  
    begin
        writeln(ErrOutput, 'At least three arguments are needed');
        halt(1);
    end;
    if (ParamCount = 3) and  (Length(ParamStr(3)) > 59) then
    begin
        writeln(ErrOutput, 'Too long name');
        halt(2);
    end;
    assign(f, ParamStr(1));
    reset(f);
    case ParamStr(2) of 
    add: ad(f, stringa(ParamStr(3)));
    query: writeln(que(f, ParamStr(3)));
    list: (ls(f));
    else
        writeln('command ', ParamStr(2), ' not found'); 
    end;
    close(f);
end.
