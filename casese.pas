program SymbolType;
var 
    c: char;
begin
    read(c);
    write('The symbol is:');
    case c of 
        'a'..'z', 'A'..'Z':
            writeln('a latin latter.');
        '0'..'9':
            writeln('a digit');
        '+', '-', '/', '*':
            writeln('a comparison sign');
    else
        writeln('something strange');
    end
end.
