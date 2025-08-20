program poi;
const
    MaxCheckPoint = 75;
type 
    CheckPoint = record
        n: integer;
        latitude, longitude: real;
        hidden: boolean;
        penalty: integer;
    end;
    CheckPointArray = array [1..MaxCheckPoint] of CheckPoint;
var
    track := CheckPointArray;
begin 
    cp.n := 70;
    cp.latitude := 54.83132;
    cp.longitude := 37.58855;
    cp.hidden := false;
    cp.penalty := 30;
    writeln(cp.hidden);
end.

