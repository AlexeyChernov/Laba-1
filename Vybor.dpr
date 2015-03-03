program Project22;

{$APPTYPE CONSOLE}

uses
  SysUtils;
const
  P = 1000000;

type
  a = array [1..P] of Integer;

 procedure vyborit(m:integer; var mas:a);
 var c, i, j, id, min: Integer;
 begin
 for i:=1 to m-1 do
      begin
      id:= i;
          for j:=i+1 to m do
          if mas[j]<min then
          begin
          min:= mas[j];
          id:= j;
          end;
          if id<>i then
          begin
            mas[id]:= mas[i];
            mas[i]:= min;
            begin
            for c:=1 to m do
            write(mas[c], ' ');
            end;
            writeln;
            end;
            end;
            end;

            procedure vybor(m:integer; var mas:a);
 var i, j, id, min: Integer;
 begin
 for i:=1 to m-1 do
      begin
      id:= i;
          for j:=i+1 to m do
          if mas[j]<min then
          begin
          min:= mas[j];
          id:= j;
          end;
          if id<>i then
          begin
            mas[id]:= mas[i];
            mas[i]:= min;
            end;
            end;
            end;

var
  mas: a;
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
writeln('Try again.');
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
 vyborit(m, mas);
 time:=Now-Time;
 writeln('Ended already.');
 end;
 DecodeTime(Time, TimeHour, TimeMin, TimeSec, TimeMil);
      TimeSum:= TimeMil/1000 + TimeSec + 60*TimeMin + 3600*TimeHour;
 if ans='n' then
      begin
      writeln('It is your call....');
      time:=now;
      vybor(m, mas);
      time:=Now-Time;
      writeln('Ended already.');
      end;
      DecodeTime(Time, TimeHour, TimeMin, TimeSec, TimeMil);
      TimeSum:= TimeMil/1000 + TimeSec + 60*TimeMin + 3600*TimeHour;
    writeln(f2, m);
      for i:= 1 to m-1 do
      write(f2, mas[i], ' ');
      writeln(f2, mas[m]);
    Write(f2, 'Vybor.');
    writeln(f2);
    Writeln(f2, floattostr(TimeSum));
    writeln;
    CloseFile(f1);
    closefile(f2);
    readln;
    end;
end;
end.
