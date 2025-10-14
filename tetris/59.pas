program TetrisGame;
uses crt, getarow;

const
    LeftIndent = 1;
    FieldWidth = 10 + LeftIndent;
    FieldHeight = 15;
    SizeFigure = 4;
    VertBordCh = '|';
    HorBordCh = 'I';
    TetrCh = '#';
    EmptyCh = '.';
    DelayDurationGame = 300;
    KeyExit = 32;
    BlockWidth = 3;
    BlockHeight = 2;
type
    Field = array[LeftIndent + 1..FieldWidth,
                  1..FieldHeight] of integer;
    Forms = (I, L, S, K, square);
    area = array[1..SizeFigure, 1..SizeFigure] of integer;
    Figure = record 
        x, y, endX, endY: integer;
        form: Forms;
        a: area;
    end;

procedure FieldInit(var F: Field);
var 
    i, j: integer;
    SaveTextAttr: integer;
begin
    for i := 1 + LeftIndent to FieldWidth do
        for j := 1 to FieldHeight do
            F[i, j] := 0;
    SaveTextAttr :=  TextAttr;
    TextColor(red);
    for j := 1 to (FieldHeight-1) * BlockHeight + 2 do
    begin
        GoToXY(BLockWidth, j);
        write(VertBordCh);
        GoToXY((FieldWidth )* BlockWidth+1, j);
        write(VertBordCh);
    end;
    for i := BLockWidth to (FieldWidth )* BlockWidth+1 do
    begin
        GoToXY(i, (FieldHeight-1) * BlockHeight + 3);
        write(HorBordCh);
    end;
    TextAttr := SaveTextAttr;
    GoToXY(FieldWidth + 1 + LeftIndent, 1); 
end;


procedure DrawBlock(x, y: integer; ch: char);
begin
    GoToXY(x, y);
    write(ch);
    GoToXY(FieldWidth + 1 + LeftIndent, 1); 
end;

procedure CalcBlock(x, y: integer; ch: char);
var 
    i, j: integer;
begin
    x := (x - 1) * BlockWidth + 1;
    y := (y - 1) * BlockHeight + 1;
    for i := x to BlockWidth + x - 1 do
        for j := y to BlockHeight + y - 1 do
            DrawBlock(i, j, ch);
end;
procedure FieldDraw(var f: Field);
var 
    i, j: integer;
begin
    for i := 1 + LeftIndent to FieldWidth do
        for j := 1 to FieldHeight do
            if F[i, j] = 0 then
                CalcBlock(i, j, EmptyCh)
            else
                CalcBlock(i, j, TetrCh)
end;

procedure FigureInit(var fig: Figure);
var 
    i, j: integer;
begin
    for i := 1 to SizeFigure do
        for j := 1 to SizeFigure do
            fig.a[i, j] := 0;
end;

procedure FigureCalcMaxXY(var fig: Figure);
var 
    maxX, maxY, i, j: integer;
begin
    maxX := 0;
    maxY := 0;
    for i := 1 to SizeFigure do
        for j := 1 to SizeFigure do
            if fig.a[i, j] <> 0 then
            begin
                if i > maxX then
                    maxX := i;
                if j > MaxY then
                    MaxY := j;
            end;
    fig.endX := maxX;
    fig.endY := maxY;
end;

procedure FigureFormGen(var fig: Figure);
begin
    case fig.form of
    I: 
        begin
            fig.a[1, 1] := 1;
            fig.a[1, 2] := 1;
            fig.a[1, 3] := 1;
            fig.a[1, 4] := 1;
        end;
    L:
        begin
            fig.a[1, 1] := 1;
            fig.a[1, 2] := 1;
            fig.a[1, 3] := 1; fig.a[2, 3] := 1;
        end;
    S:
        begin
            fig.a[1, 1] := 0; fig.a[2, 1] := 1;
            fig.a[1, 2] := 1; fig.a[2, 2] := 1;
            fig.a[1, 3] := 1;

        end;
    K:
        begin
            fig.a[1, 1] := 1;
            fig.a[1, 2] := 1; fig.a[2, 2] := 1;
            fig.a[1, 3] := 1;
        end;
    square:
        begin
            fig.a[1, 1] := 1; fig.a[2, 1] := 1;
            fig.a[1, 2] := 1; fig.a[2, 2] := 1;
        end;
    end;
end;

procedure FigureNew(var fig: Figure);
begin
    fig.form := Forms(random(5));
    FigureInit(fig);
    FigureFormGen(fig);
    FigureCalcMaxXY(fig);
    fig.x := FieldWidth div 2 + 1;
    fig.y := 1;
end;

procedure FigureDraw(var fig: Figure; ch: char);
var
    i, j: integer;
begin
    for i := 1 to fig.endX  do
        for j := 1 to fig.endY do
            if fig.a[i, j] <> 0 then
                CalcBlock(fig.x + i - 1, fig.y + j - 1, ch)
end;

procedure FigureUpdateView(var fig: Figure; ShiftX, ShiftY: integer);
begin
    FigureDraw(fig, EmptyCh);
    fig.x  := fig.x + ShiftX;
    fig.y  := fig.y + ShiftY;
    FigureDraw(fig,  TetrCh);
end;

function CheckIsCollision(var F: Field; var fig: Figure; NewX, NewY: integer) : boolean;
var
    i, j, CurX, CurY: integer;
begin
    CheckIsCollision := false;
    for i := 1 to SizeFigure do
        for j := SizeFigure downto 1 do
        begin
            if fig.a[i, j] <> 0 then
            begin
                CurX := fig.x + i - 1 + NewX;
                CurY := fig.Y + j - 1 + NewY;
                if (CurX <= LeftIndent) or (CurX >= FieldWidth + 1) then
                begin
                    CheckIsCollision := true;
                    exit;
                end;
                if (CurY >= FieldHeight + 1) or (F[CurX, CurY] <> 0)  then
                begin
                    CheckIsCollision := true;
                    exit;
                end;
            end;
        end;
end;

procedure Cemention(var F: Field; var fig: Figure);
var
    i, j: integer;
begin
    for i := 1 to SizeFigure do
        for j := SizeFigure downto 1 do
            if fig.a[i, j] <> 0 then
                F[fig.x + i - 1, fig.Y + j - 1] := 1;
end;

function CheckIsLine(var F: Field; var DestroyLine: integer) : boolean;
var 
    i, j: integer;
    was: boolean;
begin
    CheckIsLine := false;
    for j := FieldHeight downto 2 do
    begin
        was := true;
        for i := LeftIndent+1 to FieldWidth do
        begin
            if (F[i, j] <> 0) and was then
            begin
                continue;
            end
            else
            begin
                was := false;
                break;
            end;
        end;
        if was then
        begin
            CheckIsLine := true;
            DestroyLine := j;
            exit;
        end;
    end;
end;

procedure PushAllDown(var F: Field; var DestroyLine: integer);
var 
    i, j: integer;
begin
    for j := DestroyLine downto 2 do
        for i := LeftIndent + 1 to FieldWidth do
            F[i, j] := F[i, j - 1];
    for i := LeftIndent + 1 to FieldWidth do
        F[i, 1] := 0;
end;

procedure FigureRotate(var fig: Figure);
var
    i, j: integer;
    tmp: Figure;
begin
    FigureInit(tmp);
    for i := 1 to SizeFigure do
        for j := 1 to SizeFigure do
            tmp.a[i, j] := fig.a[j, SizeFigure - i + 1];
    fig.a := tmp.a;
    FigureCalcMaxXY(fig);
end;

var
    F: Field;
    obj, tmp: Figure;
    key, DestroyLine: integer;
begin
    clrscr;
    if ScreenWidth < FieldWidth + 1 then
    begin
        write(ErrOutput, 'ScreenWidth a small');
        halt(2);
    end;
    if ScreenHeight < FieldHeight then
    begin
        write(ErrOutput, 'ScreenHeight a small');
        halt(3);
    end;
    randomize;
    FieldInit(F);
    FieldDraw(F);
    FigureNew(obj);
    key := 0;
    while key <> KeyDown do
    begin
        if not CheckIsCollision(F, obj, 0, 1) then
        begin
            if KeyPressed then
            begin
                key := GetKey;
                case key of 
                KeyLeft:
                    if not CheckIsCollision(F, obj, -1, 0) then
                        FigureUpdateView(obj, -1, 0);
                keyRight:
                    if not CheckIsCollision(F, obj, 1, 0) then
                        FigureUpdateView(obj, 1, 0);
                KeyUp:
                    begin
                        tmp := obj;
                        FigureRotate(obj);
                        if CheckIsCollision(F, obj, 0, 0) then
                        begin
                            obj := tmp;
                        end;
                        FigureUpdateView(obj, 0, -2);
                        FieldDraw(F);
                        continue;
                    end;
                end;
                key := 0;
            end;
        Delay(DelayDurationGame);
            FigureUpdateView(obj, 0, 1);
        end
        else
        begin
            Cemention(F, obj);
            while CheckIsLine(F, DestroyLine) do
            begin
                PushAllDown(F, DestroyLine);
            end;
            FieldDraw(F);
            FigureNew(obj);
            if KeyPressed then
                key := GetKey;
        end;
    end;
end.
