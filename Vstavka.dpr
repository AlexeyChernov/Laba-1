program Project11;

{$APPTYPE CONSOLE}

uses
  SysUtils;
const
  P = 1000000;

type
  a = array [1..P] of Integer;

 procedure vstavit(m:integer; var mas:a; c:boolean);
 var i, j, w, x: integer;
 begin
 for i:=2 to m do
      begin
      c:= false;
        x:=mas[i];
        j:=i;
        while (j>1) and (x<mas[j-1]) do
          begin
            mas[j]:=mas[j-1];
            j:=j-1;
            c:=true;
            end;
        mas[j]:=x;
        if c=true then
        begin
        for w:= 1 to m do
        write(mas[w], ' ');
        writeln;
        end;
        end;
        end;

procedure vstav(m:integer; var mas:a);
var i, j ,x: integer;
begin
for i:=2 to m do
      begin
        x:=mas[i];
        j:=i;
        while (j>1) and (x<mas[j-1]) do
          begin
            mas[j]:=mas[j-1];
            j:=j-1;
            end;
              mas[j]:=x;
            end;
            end;
var
  mas: a;
  h: boolean;
  m, i: Integer;
  f1, f2: TextFile;
  Time: TDateTime;
  TimeHour, TimeMin, TimeSec, TimeMil: word;
  TimeSum: double;
  name1, name2: string[100];
  ans: char;

begin
begin
write('Enter a path to first file: ');
readln(Name1);
assignfile(f1, name1);
{$I-}
reset(f1);
{$I+}
if ioresult=2 then
begin
writeln('Try again');
readln;
end
else
begin
writeln('You are lucky.');
write('Enter a path to second file: ');
readln(name2);
assignfile(f2, name2);
{$I-}
reset(f1);
{$I+}
if ioresult=2 then
begin
writeln('Try again.');
readln;
end
else
begin
writeln('Lucky again.');
rewrite(f2);
  read(f1, m);
  for i:= 1 to m do
  read(f1, mas[i]);
  write('Need to take a look? So: ');
 readln(ans);
 writeln;
 end;
 if ans='y' then
 begin
 writeln('Array....: ');
 writeln;
 Time:= Now;
 vstavit(m, mas, h);
 time:=Now-Time;
 writeln('Ended already.');
 end;
 DecodeTime(Time, TimeHour, TimeMin, TimeSec, TimeMil);
      TimeSum:= TimeMil/1000 + TimeSec + 60*TimeMin + 3600*TimeHour;
 if ans='n' then
      begin
      writeln('It is your call....');
      time:=now;
      vstav(m, mas);
      time:=Now-Time;
      writeln('Ended already.');
      end;
      DecodeTime(Time, TimeHour, TimeMin, TimeSec, TimeMil);
      TimeSum:= TimeMil/1000 + TimeSec + 60*TimeMin + 3600*TimeHour;
    writeln(f2, m);
      for i:= 1 to m-1 do
      write(f2, mas[i], ' ');
      writeln(f2, mas[m]);
    Write(f2, 'Vstavka.');
    writeln(f2);
    Writeln(f2, floattostr(TimeSum));
    writeln;
    CloseFile(f1);
    closefile(f2);
    readln;
    end;
end;
end.
