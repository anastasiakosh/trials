program demoTree;

type 
    pnode = ^node;
    node = record 
        data: integer;
        left, right: pnode;
    end;

procedure treeInit(var t: pnode);
begin
    t := nil;
end;

procedure CreateNode(var el: pnode; var n: integer);
begin
    new(el);
    el^.data := n;
    el^.left := nil;
    el^.right := nil;
end;

procedure treePush(var t: pnode; var n: integer);
begin
    if t = nil then
        CreateNode(t, n)
    else if n > t^.data then
        treePush(t^.right, n)
    else if n < t^.data then 
        treePush(t^.left, n);
end;

function FindNode(var t: pnode; n: integer) : pnode;
begin
    if t = nil then
        FindNode := nil
    else
    begin
        if t^.data = n then
        begin
            FindNode := t;
            exit;
        end;
        if (n < t^.data) and (t^.left <> nil) then
            FindNode := FindNode(t^.left, n)
        else if (n > t^.data) and (t^.right <> nil) then
            FindNode := FindNode(t^.right, n)
        else
            FindNode := nil;
    end;
end;

function treeSearch(t: pnode; var n: integer) : boolean;
var
    tmp : pnode;
begin
    tmp := FindNode(t, n);
    if tmp <> nil then 
        treeSearch := true
    else
        treeSearch := false;
end;

var
    t: pnode;
    n: integer;
    f: text;
BEGIN
    assign(f, 'x.txt');
    reset(f);
    treeInit(t);
    while not EOF(f) do
    begin
        read(f, n);
        treePush(t, n)
    end;
    close(f);
    n := 1;
    while n <> 0 do 
    begin
        read(n);
        if treeSearch(t, n) then
            writeln('FOUND!!! LOL')
        else
            writeln('really shit');
    end;
END.
