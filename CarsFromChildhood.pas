program CarsFromChildhood;
uses crt, getarow;

const
    CarSize = 3;
    FieldWidth = 3 * CarSize;
    OwnWheel = 'o';
    OwnBody = '|';
    OwnBamper = '-';
    EnemyWheel = '0';
    EnemyBody = 'I';
    EnemyBamper = '=';
    RoadSolidLine = '^';
    RoadBorder = '#';
    EmptyCh = ' ';
type
    Gabarite = array [1..CarSize, 1..CarSize] of char;
    OwnCar = record
        G: Gabarite;
        LeftX, UpY: integer;
    end;
    strip = (left, centre, right);
    EnemyCar = record
        G: Gabarite;
        LeftX, UpY: integer;
    end;
    Enemys = array [1..4] of EnemyCar;

procedure FieldInit;
var
    y, i, j: integer;
begin
    i := (ScreenWidth div 2) - 5;
    j := (ScreenWidth div 2) + 5;
    for y := 1 to ScreenHeight do
    begin
        GoToXY(i, y);
        write(RoadBorder);
        GoToXY(j, y);
        write(RoadBorder);
    end;
end;

procedure CarBuild(var frame: Gabarite; Wheel, Body, Bamper: char);
begin
    frame[1, 1] := Wheel; frame[2, 1] := Bamper; frame[3, 1] := Wheel;
    frame[1, 2] := EmptyCh; frame[2, 2] := Body; frame[3, 2] := EmptyCh;
    frame[1, 3] := Wheel; frame[2, 3] := Bamper; frame[3, 3] := Wheel;
end;

procedure EnemyCarSpawn(var Killer1, Killer2: EnemyCar);
var
	f, s: strip;
begin
	f := centre;
	s := centre;
	while f = s do 
	begin
		f := strip(random(3));
		s := strip(random(3));
	end;
	case f of 
		left: Killer1.leftX := (ScreenWidth div 2) - 4;
		centre: Killer1.leftX := (ScreenWidth div 2) - 1;
		right: Killer1.leftX := (ScreenWidth div 2) + 2;
	end;
	case s of 
		left: Killer2.leftX := (ScreenWidth div 2) - 4;
		Centre: Killer2.leftX := (ScreenWidth div 2) - 1;
		right: Killer2.leftX := (ScreenWidth div 2) + 2;
	end;
end;

procedure EnemyCarInit(var KillersCar: Enemys);
var
	i: integer;
begin
	KillersCar[1].UpY := 0;
	KillersCar[2].UpY := 0;
	KillersCar[3].UpY := (ScreenHeight div 2) - 1 + 3;
	KillersCar[4].UpY := (ScreenHeight div 2) - 1 + 3;
	for i := 1 to 4 do
		CarBuild(KillersCar[i].G, EnemyWheel, EnemyBody, EnemyBamper);
	EnemyCarSpawn(KillersCar[1], KillersCar[2]);
	EnemyCarSpawn(KillersCar[3], KillersCar[4]);
end;

procedure OwnCarInit(var MyCar: OwnCar);
begin
    CarBuild(MyCar.G, OwnWheel, OwnBody, OwnBamper);
    MyCar.LeftX := (ScreenWidth div 2) - 1;
    MyCar.UpY   := (ScreenHeight div 2) - 1;
end;

procedure GameInit(var MyCar: OwnCar; var KillersCar: Enemys;
				   var TimeSpeed: Integer);
begin
    clrscr;
    FieldInit;
    OwnCarInit(MyCar);
    EnemyCarInit(KillersCar);
    TimeSpeed := 700;
end;

procedure FieldDraw(even: boolean; var car: OwnCar);
var
    y: integer;
begin
    if even then
    begin
        y := 1;
        GoToXY(ScreenWidth div 2, 1);
        write(EmptyCh);
        GoToXY(ScreenWidth div 2, ScreenHeight - 2);
        write(EmptyCh);
        while y < ScreenHeight + 1 do
        begin
            GoToXY(ScreenWidth div 2, y - 1);
            write(EmptyCh);
            GoToXY(ScreenWidth div 2, y);
            write(RoadSolidLine);
            y := y + 2;
        end;
    end
    else
    begin
        y := 2;
        while y < ScreenHeight + 1 do
        begin
            GoToXY(ScreenWidth div 2, y - 1);
            write(EmptyCh);
            GoToXY(ScreenWidth div 2, y);
            write(RoadSolidLine);
            y := y + 2;
        end;
        GoToXy(ScreenWidth div 2, ScreenHeight);
        write(EmptyCh);
    end;
end;

procedure CarDraw(var frame: Gabarite; LeftX, UpY: integer; draw: boolean);
var
    i, j: integer;
begin
    for j := UpY to UpY + CarSize - 1 do
        for i := LeftX to LeftX + CarSize - 1 do
        begin
            GoToXY(i, j);
            if draw then
                write(frame[i - LeftX + 1, j - UpY + 1])
            else
                write(EmptyCh);
        end;
	GoToXY(1, 4);
end;

procedure OwnCarSteer(var car: OwnCar; var key: integer);
begin
    case key of
        keyLeft:
            begin
                if (car.LeftX <> (ScreenWidth div 2) - 4) then
                begin
                    CarDraw(Car.G, Car.LeftX, Car.UpY, false);
                    Car.LeftX := Car.LeftX - 3;
                end;
            end;
        KeyRight:
            begin
                if (car.LeftX <> (ScreenWidth div 2) + 2) then
                begin
                    CarDraw(Car.G, Car.LeftX, Car.UpY, false);
                    Car.LeftX := Car.LeftX + 3;
                end;
            end;
    end;
    key := 0;
end;

procedure FieldUpdate(var even: boolean; MyCar: OwnCar);
begin
    if even then
    begin
        FieldDraw(even, MyCar);
        even := false;
    end
    else
    begin
        FieldDraw(even, MyCar);
        even := true;
    end;
	GoToXY(1, 4);
end;


procedure EnemyCarMove(var KillersCar: Enemys);
var
	i: integer;
begin
	for i := 1 to 4 do
	begin
		CarDraw(KillersCar[i].G, KillersCar[i].LeftX, KillersCar[i].UpY, false);
		KillersCar[i].UpY := KillersCar[i].UpY + 1;
		if KillersCar[i].UpY + 3 > ScreenHeight then
		begin
			CarDraw(KillersCar[i + 1].G, KillersCar[i + 1].LeftX,
					KillersCar[i + 1].UpY, false);
			EnemyCarSpawn(KillersCar[i], KillersCar[i + 1]);
			KillersCar[i].UpY := 1;
			KillersCar[i + 1].UpY := 0;
		end;
		CarDraw(KillersCar[i].G, KillersCar[i].LeftX, KillersCar[i].UpY, true);
	end;
end;

function OwnCarIsSmash(car: OwnCar; enemy: Enemys) : boolean; 
var 
	i: integer;
begin
	OwnCarIsSmash := false;
	for i := 1 to Length(enemy) do
	begin
		if (enemy[i].LeftX = car.LeftX) and ((enemy[i].UpY + 2 = car.Upy) or 
			(enemy[i].upY + 1 = car.UpY) or (enemy[i].upY = car.upY)) then
		begin
			OwnCarIsSmash := true;
			exit;
		end;
	end;
end;
procedure GameOver(var m: integer);
begin
	Delay(500);
    clrscr;
	GotoXY(ScreenWidth div 2, ScreenHeight div 2);
	write('Total metrs:', m);
	GoToXY(ScreenWidth div 2, (ScreenHeight div 2) + 1);
	write('Game Over :(');
	Delay(5000);
	ReadKey;
    clrscr;
end;

procedure GameLoop(var MyCar: OwnCar; var KillersCar: Enemys;
				   var TimeSpeed: integer);
var
    even: boolean;
    key, counter, m, transmission, speed: integer;
begin
    key := 0;
    m := 0;
    speed := 0;
    transmission := 1;
    counter := 0;
    even := true;
    while true do
    begin
        if KeyPressed then
        begin
            key := GetKey;
            if Key = KeyExit then
                break;
            OwnCarSteer(MyCar, key);
        end;
        FieldUpdate(even, MyCar); {first step we draw Field}
        EnemyCarMove(KillersCar);
        if OwnCarIsSmash(MyCar, Killerscar) then
        begin
			textcolor(4);
			CarDraw(MyCar.G, MyCar.LeftX, MyCar.UpY, true); {OWNCAR DRAW}
			GameOver(m);
			exit;
		end;
        CarDraw(MyCar.G, MyCar.LeftX, MyCar.UpY, true); {OWNCAR DRAW}
        Delay(TimeSpeed);
        if TimeSpeed >= 100 then
        begin
			if counter = 3 then
			begin
				TimeSpeed := TimeSpeed - 50;
				if TimeSpeed mod 3 = 0 then
					transmission := transmission + 1;
				counter := 0;
			end
			else
				counter := counter + 1;
				speed := speed + 2;
		end;
		m := m + 1;
		GotoXY(1, 1);
		write('Meters traveled:', m);
		GotoXY(1, 2);
		write('Gear Engaged:', transmission);
		GoToXY(1, 3);
		write('Speed:', speed, ' km/h');
		GotoXY(1, 4);
    end;
end;

var
    MyCar: OwnCar;
    KillersCar: Enemys;
    TimeSpeed: integer;
begin
	{if display size not correct then exit}
    if (ScreenWidth < FieldWidth + 20) then
    begin
        write(ErrOutput, 'Screen width must be ', FieldWidth + 2, '+.');
        halt(2);
    end;
    if (ScreenHeight < 9) then
    begin
        write(ErrOutput, 'Screen height must be ', 9, '+.');
        halt(2);
    end;
    Randomize;
    GameInit(MyCar, KillersCar, TimeSpeed);
    GameLoop(MyCar, KillersCar, TimeSpeed);
end.
