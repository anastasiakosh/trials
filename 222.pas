program twentytwo;
procedure FindLonger(var st: string; var res: integer; i: integer);
begin
        if length(st) < length(ParamStr(i)) then
        begin
            st := ParamStr(i);
            res := i;
        end;
end;

procedure NoRepeat(var stroka_with_no_repeat: string; n: integer);
var
    buffer: string;
    i, j: integer;
begin
    buffer := ParamStr(n);
    for i := 1 to Length(buffer) do
    begin
            for j := 1 to Length(buffer) do
             begin
                if j = i then
                    continue;
               if buffer[i] = buffer[j]  then
                   exit; 
            end;
    end;
    stroka_with_no_repeat := stroka_with_no_repeat + ' ' + buffer;
end;

procedure DogAndDot(var dog_dot_str: string; n: integer);
var
    i: integer;
    buffer: string;
    dog, dot: boolean;
begin
    buffer := ParamStr(n);
    dog := false;
    dot := false;
    for i := 1 to Length(buffer) do
    begin
        if buffer[i] = '@' then
        begin
            if dog then
                exit;
            dog := true;
        end;
        if buffer[i] ='.' then
            dot := true;
    end;
   if dog and dot then
        dog_dot_str := dog_dot_str + ' ' + buffer;
end;

procedure DigitalArgs(var digital_str: string; n: integer);
var
    i: integer;
    buffer: string;
begin
    buffer := ParamStr(n);
    for i := 1 to Length(buffer) do
    begin
        if (buffer[i] >= '0') and (buffer[i] <= '9') then
            continue
        else
          exit;  
    end;
    digital_str := digital_str + ' ' + buffer;
end;

procedure Repeats(var repeats_st: string; n: integer);
var
    i: integer;
    buffer: string;
begin
    buffer := ParamStr(n);
    for i := 2 to Length(buffer) do
        if buffer[i-1] = buffer[i] then
            continue
        else
            exit;
      repeats_st := repeats_st + ' ' + buffer;
end;

procedure  At_least(var once_latter_str: string; n: integer);
var
    i: integer;
    buffer: string;
    is_letter: boolean;
begin
    buffer := ParamStr(n);
    is_letter := false;
    for i := 1 to Length(buffer) do
        if ((buffer[i] >= 'a') and (buffer[i] <= 'z')) or
         ((buffer[i] >= 'A') and (buffer[i] <= 'Z')) then
        begin
             is_letter := true;
             break;
        end;
    if is_letter then     
    once_latter_str := once_latter_str + ' ' + buffer;
end;

procedure SimOfFirst(var simmiliar_str: string; n: integer);
var
    first, buffer: string;
    i, j: integer;
    is_sim: boolean;
begin
    if n = 1 then
        exit;
    is_sim := false;
    first := ParamStr(1);
    buffer := ParamStr(n);
    for i := 1 to Length(buffer) do
        for j := 1 to Length(first) do
        begin
        if is_sim then
        begin
            simmiliar_str := simmiliar_str + ' ' + buffer;
            exit;
        end;
            if buffer[i] = first[j] then
            begin
                is_sim := true;
                break;
            end;
        end;
end;

procedure OutputResult(var longer:integer; var stroka_with_no_repeat, dog_dot_str, digital_str, repeats_str, once_latter_str, simmiliar_str: string);
begin
    writeln('a) ', ParamStr(longer),'                 \\\\\\\\ have length:', Length(ParamStr(longer)));
    writeln('b)', stroka_with_no_repeat);
    writeln('c)', dog_dot_str);
    writeln('d)', digital_str);
    writeln('e)', repeats_str);
    writeln('f)', once_latter_str);
    writeln('g)', simmiliar_str);
end;

var
    longest, stroka_with_no_repeat, dog_dot_str, digital_str, repeats_str, once_latter_str, simmiliar_str: string;
    i, longer: integer;
begin
    longer := 0;
    longest := '';
    for i := 1 to ParamCount do
    begin
        FindLonger(longest, longer, i);
        NoRepeat(stroka_with_no_repeat, i);
        DogAndDot(dog_dot_str,i);
        DigitalArgs(digital_str, i);
        Repeats(repeats_str, i);
        At_least(once_latter_str, i);
        SimOfFirst(simmiliar_str, i);
    end;
    OutputResult(longer, stroka_with_no_repeat, dog_dot_str, digital_str, repeats_str, once_latter_str, simmiliar_str);
end.
