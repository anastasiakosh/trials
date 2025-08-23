program twenty_third;
var
    stroka: string;
    i, word_count: integer;
    is_word: boolean;
begin
    if ParamCount >= 2 then
    begin
        writeln('you type too math parametrs :(');
        halt(22);
    end;
    if ParamCount = 0 then
    begin
        writeln('you don`t type argument`s!!!');
        halt(33);
    end; 
    is_word := false;
    word_count := 0;
    stroka := ParamStr(1);
    for i := 1 to Length(stroka) do 
    begin
        if ((stroka[i] <> ' ') and (stroka[i] <> #10) and (stroka[i] <> #9))
             and not is_word then
        begin
             word_count := word_count + 1;
                is_word := true;
        end;
        if ((stroka[i] = ' ') or (stroka[i] = #10) or (stroka[i] = #9))
           and is_word then
              is_word := false; 
    end;
    writeln('total words: ', word_count);
end. 
