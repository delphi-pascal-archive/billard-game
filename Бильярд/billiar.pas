unit billiar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ImgList, MPlayer;

type


  TForm1 = class(TForm)
    MediaPlayer1: TMediaPlayer;
    MediaPlayer2: TMediaPlayer;
    MediaPlayer3: TMediaPlayer;
    MediaPlayer4: TMediaPlayer;
  procedure FormCreate(Sender: TObject);
  procedure bilpr00;
  procedure bilpr01;
  procedure bilpr02;
  procedure bilpr03;
  procedure bilpr04;
  procedure bilpr05;
  procedure bilpr06;
  procedure bilpr07;
  procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormPaint(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  bil00,bil05,flag1,flag2,mez,m1,i2 : byte;
  bil03,bil04,a1,num1,n1,sar,flag3,ni : byte;
  udar,udnom,igrok,over,n2,a2,mpaint,sa49 : byte;
  bil01,bil02,bt,bil07,px,py : integer;
  gran1,gran2,gran3,gran4,rad : integer;
  ostanov,ug,i3 : integer;
  rx,ry,rs,tg1,tg2,fi,alfa,f,a,b,kx,ky,jx,jy : real;
  f1,f2,mex,mey,mix,miy,predel,si,ur,bx,by : real;
  za1x,za1y,zn1x,zn1y,sz,wx,wy,sx,sy,znx,zny : shortint;
  key1,keym : word;
  ca13,cc13 : string;
  bitime : tdatetime;
  bilris00 : tbitmap;
  bilris01 : tbitmap;
  bilris02 : tbitmap;
  bilris03 : tbitmap;
  bilris04 : tbitmap;
  bilris05 : tbitmap;

  tw : array[1..8] of byte;
  tz : array[1..8] of byte;
  cx : array[1..7] of real;
  cy : array[1..7] of real;
  dx : array[1..7] of real;
  dy : array[1..7] of real;
  ex : array[1..8] of real;
  ey : array[1..8] of real;
  sa : array[1..101] of tcolor;

implementation

{$R *.DFM}


procedure TForm1.FormCreate(Sender: TObject);
begin

getdir(0,cc13);
sa49:=0;

bil00:=0;
flag1:=0;
flag2:=0;
num1:=7;

bilris00:=TBitMap.Create;
bilris00.LoadFromFile('bilris00.bmp');
bilris01:=TBitMap.Create;
bilris01.LoadFromFile('bilris01.bmp');
bilris02:=TBitMap.Create;
bilris02.LoadFromFile('bilris02.bmp');
bilris03:=TBitMap.Create;
bilris03.LoadFromFile('bilris03.bmp');
bilris04:=TBitMap.Create;
bilris04.LoadFromFile('bilris04.bmp');
bilris05:=TBitMap.Create;
bilris05.LoadFromFile('bilris05.bmp');

gran1:=20;
gran2:=430;
gran3:=20;
gran4:=730;
rad:=50;
predel:=0.06;
ostanov:=10000;
mpaint:=0;

with MediaPlayer1 do begin
Filename:=cc13+'\bsound1.wav';
open;
end;
with MediaPlayer2 do begin
Filename:=cc13+'\bsound2.wav';
open;
end;
{with MediaPlayer3 do begin
Filename:=cc13+'\bsound1.wav';
open;
end;}
with MediaPlayer4 do begin
Filename:=cc13+'\bsound6.wav';
open;
end;

end;



procedure TForm1.bilpr00;
begin

{bilris00.transparent:=true;
bilris00.transparentcolor:=clblack;
bilris00.transparentmode:=tmauto;}

if sa49=1 then begin
with MediaPlayer3 do begin
Filename:=cc13+'\bsound5.wav';
open;
play;
end;
end;

canvas.Font.size:=10;
canvas.Font.color:=clblack;
canvas.Brush.color:=clblack;

udar:=0;
udnom:=0;
bil01:=10;
bil02:=200;

while bil01<ostanov do begin
bil01:=bil01+1;

n1:=0;
while n1<num1 do begin
n1:=n1+1;

{if (dx[n1]=0) and (dy[n1]=0) then continue;}

a1:=0;
while a1<num1 do begin
a1:=a1+1;
{if (n1>=a1) and not((dx[n1]=0) and (dy[n1]=0))  then continue;}

rs:=sqrt((cx[n1]-cx[a1])*(cx[n1]-cx[a1])+
(cy[n1]-cy[a1])*(cy[n1]-cy[a1]));

if (n1>=a1) then continue;

if (rs<=rad) then begin

if rs<sqrt((cx[n1]+dx[n1]-(cx[a1]+dx[a1]))*(cx[n1]+dx[n1]-(cx[a1]+dx[a1]))+
(cy[n1]+dy[n1]-(cy[a1]+dy[a1]))*(cy[n1]+dy[n1]-(cy[a1]+dy[a1]))) then begin
continue;
end;

f1:=sqrt(dx[n1]*dx[n1]+dy[n1]*dy[n1]);
f2:=sqrt(dx[a1]*dx[a1]+dy[a1]*dy[a1]);

if false then begin
{if not((dx[n1]=0) and (dy[n1]=0)) and not((dx[a1]=0) and (dy[a1]=0)) then begin
{if f2<f1 then begin
dx[n1]:=dx[n1]-dx[a1];
dy[n1]:=dy[n1]-dy[a1];
dx[a1]:=0;
dy[a1]:=0;
end else begin
dx[a1]:=-dx[n1]+dx[a1];
dy[a1]:=-dy[n1]+dy[a1];
dx[n1]:=0;
dy[n1]:=0;
end;
{end;}

if dx[n1]/dx[a1]>0 then znx:=1 else znx:=-1;
if dy[n1]/dy[a1]>0 then zny:=1 else zny:=-1;

if znx=-1 then begin
dx[n1]:=dx[n1]+dx[a1];
dx[a1]:=0;
end else begin
dx[n1]:=dx[n1]-dx[a1];
dx[a1]:=0;
end;
if zny=-1 then begin
dy[n1]:=dy[n1]+dy[a1];
dy[a1]:=0;
end else begin
dy[n1]:=dy[n1]-dy[a1];
dy[a1]:=0;
end;

{if f2<f1 then begin
dx[a1]:=0;
dy[a1]:=0;
end else begin
dx[n1]:=0;
dy[n1]:=0;
end;}
end;

f1:=sqrt(dx[n1]*dx[n1]+dy[n1]*dy[n1]);
f2:=sqrt(dx[a1]*dx[a1]+dy[a1]*dy[a1]);

mez:=0;
if ((dx[n1]=0) and (dy[n1]=0)) or (f2>f1) then begin
mez:=1;
mex:=cx[n1];
mey:=cy[n1];
mix:=dx[n1];
miy:=dy[n1];
cx[n1]:=cx[a1];
cy[n1]:=cy[a1];
dx[n1]:=dx[a1];
dy[n1]:=dy[a1];
cx[a1]:=mex;
cy[a1]:=mey;
dx[a1]:=mix;
dy[a1]:=miy;
end;

if dx[n1]<>0 then
fi:=arctan(dy[n1]/dx[n1])
else fi:=pi/2;
if cx[n1]-cx[a1]<>0 then
alfa:=arctan((cy[n1]-cy[a1])/(cx[n1]-cx[a1]))
else alfa:=pi/2;
f:=sqrt(dx[n1]*dx[n1]+dy[n1]*dy[n1]);
a:=cos(alfa-fi)*f;
b:=sin(alfa-fi)*f;
if dx[n1]>=0 then zn1x:=1 else zn1x:=-1;
if dy[n1]>=0 then zn1y:=1 else zn1y:=-1;
if (dx[n1]>0) and (dy[n1]<0) then zn1y:=1;
if (dx[n1]<0) and (dy[n1]>=0) then zn1y:=-1;

dx[a1]:=zn1x*sin(pi/2-alfa)*a;
dy[a1]:=zn1y*cos(pi/2-alfa)*a;
dx[n1]:=zn1x*sin(pi-alfa)*b;
dy[n1]:=zn1y*cos(pi-alfa)*b;

if not(sqrt(dx[a1]*dx[a1]+dy[a1]*dy[a1])<=predel)
 and (udar<>3) then begin
udar:=1;
end;

if not(sqrt(dx[a1]*dx[a1]+dy[a1]*dy[a1])<=predel) then begin
if sa49=1 then begin
with MediaPlayer1 do begin
play;
end;
end;
end;

if mez=1 then begin
mex:=cx[n1];
mey:=cy[n1];
mix:=dx[n1];
miy:=dy[n1];
cx[n1]:=cx[a1];
cy[n1]:=cy[a1];
dx[n1]:=dx[a1];
dy[n1]:=dy[a1];
cx[a1]:=mex;
cy[a1]:=mey;
dx[a1]:=mix;
dy[a1]:=miy;
end;
mez:=0;

end;

end;
end;


canvas.draw(gran3-round(rad*1.00),gran1+round(rad*0.60),bilris01);
canvas.draw(gran3+round(rad*0.60),gran1-round(rad*1.00),bilris01);

canvas.draw(gran4-round(rad*0.00),gran1+round(rad*0.60),bilris01);
canvas.draw(gran4-round(rad*1.60),gran1-round(rad*1.00),bilris01);

canvas.draw(gran4+round(rad*0.00),gran2-round(rad*1.60),bilris01);
canvas.draw(gran4-round(rad*1.60),gran2+round(rad*0.00),bilris01);

canvas.draw(gran3-round(rad*1.00),gran2-round(rad*1.60),bilris01);
canvas.draw(gran3+round(rad*0.60),gran2+round(rad*0.00),bilris01);

a1:=0;
n1:=0;
while n1<num1 do begin
n1:=n1+1;

if cx[n1]<-20 then continue;

flag3:=0;
if (cx[n1]<=gran3+round(rad*0.60)-round(000/1)) and (cy[n1]<=gran1+round(rad*0.60)-round(000/1)) then flag3:=1;
if (cx[n1]>=gran4-round(rad*1.60)+round(000/1)) and (cy[n1]<=gran1+round(rad*0.60)-round(000/1)) then flag3:=2;
if (cx[n1]>=gran4-round(rad*1.60)+round(000/1)) and (cy[n1]>=gran2-round(rad*1.60)+round(000/1)) then flag3:=3;
if (cx[n1]<=gran3+round(rad*0.60)-round(000/1)) and (cy[n1]>=gran2-round(rad*1.60)+round(000/1)) then flag3:=4;

if (cx[n1]<=gran3-rad+30) or (cy[n1]<=gran1-rad+30) then flag3:=5;
if (cx[n1]>=gran4-rad+20) or (cy[n1]<=gran1-rad-20) then flag3:=5;
if (cx[n1]>=gran4-rad+20) and (cy[n1]>=gran2-rad+20) then flag3:=5;
if (cx[n1]<=gran3-rad-20) or (cy[n1]>=gran2-rad+20) then flag3:=5;


if flag3=5 then begin

dx[n1]:=0;
dy[n1]:=0;
px:=trunc(cx[n1]);
py:=trunc(cy[n1]);
bilris02.transparent:=true;
bilris02.transparentcolor:=clwhite;
canvas.draw(px,py,bilris02);
a1:=0;
ni:=0;
while a1<num1 do begin
a1:=a1+1;
if (cx[a1]>-40) and (n1<>a1) then begin
sar:=a1;
ni:=1;
break;
end;
end;
if udar=0 then begin
udar:=2;
udnom:=n1;
end else begin
udar:=3;
if sa49=1 then begin
with MediaPlayer4 do close;
with MediaPlayer1 do close;
with MediaPlayer2 do begin
play;
end;
with MediaPlayer4 do open;
with MediaPlayer1 do open;
end;
end;
canvas.Brush.color:=clyellow;
canvas.font.color:=clblack;
canvas.font.size:=26;
a1:=0;
while a1<7 do begin
a1:=a1+1;
str(a1,ca13);
canvas.textout(a1*47-50+120,450,' '+ca13+' ');
end;
str(sar,ca13);
canvas.Font.color:=clred;
canvas.textout(sar*47-50+120,450,' '+ca13+' ');
a1:=0;
while a1<num1 do begin
a1:=a1+1;
if tw[a1]=0 then begin
tw[a1]:=n1;
tz[a1]:=igrok;
break;
end;
end;
cx[n1]:=-50;
cy[n1]:=50;
bilpr05;
continue;
end;


if (flag3<>0) and (flag3<>5) then begin

m1:=0;
while m1<8 do begin
m1:=m1+1;

rs:=sqrt((cx[n1]-ex[m1])*(cx[n1]-ex[m1])+
(cy[n1]-ey[m1])*(cy[n1]-ey[m1]));

if rs<=rad then begin

if rs<sqrt((cx[n1]+dx[n1]-ex[m1])*(cx[n1]+dx[n1]-ex[m1])+
(cy[n1]+dy[n1]-ey[m1])*(cy[n1]+dy[n1]-ey[m1])) then continue;

f:=sqrt(dx[n1]*dx[n1]+dy[n1]*dy[n1]);
if ex[m1]-cx[n1]<>0 then
fi:=arctan(((ey[m1]-cy[n1])/(ex[m1]-cx[n1])))
else fi:=pi/2;
if dx[n1]<>0 then
si:=arctan((dy[n1]/dx[n1]))
else si:=pi/2;

alfa:=(2*fi-si);

zn1x:=1;  {-1}
zn1y:=1;  {-1}

if (dy[n1]<=0) and (dx[n1]>0) then zn1x:=-1;
if (dy[n1]<=0) and (dx[n1]>0) then zn1y:=-1;
if (dy[n1]<=0) and (dx[n1]<0) then zn1x:=1;
if (dy[n1]<=0) and (dx[n1]<0) then zn1y:=1;
if (dy[n1]>0) and (dx[n1]>=0) then zn1x:=-1;
if (dy[n1]>0) and (dx[n1]>0) then zn1y:=-1;
if (dx[n1]=0) and (dy[n1]<0) then zn1y:=1;
if (dx[n1]=0) and (dy[n1]>0) then zn1y:=-1;

dx[n1]:=zn1x*f*(sin(pi/2-alfa));
dy[n1]:=zn1y*f*(cos(pi/2-alfa));

if sa49=1 then begin
with MediaPlayer4 do begin
play;
end;
end;

end;
end;
continue;
end;

ca13:='0';
if (cy[n1]<=gran1) and (dy[n1]<0) then begin
dy[n1]:=-dy[n1];
ca13:='1';
end;
if (cy[n1]>=gran2-rad) and (dy[n1]>0) then begin
dy[n1]:=-dy[n1];
ca13:='1';
end;
if (cx[n1]<=gran3) and (dx[n1]<0) then begin
dx[n1]:=-dx[n1];
ca13:='1';
end;
if (cx[n1]>=gran4-rad) and (dx[n1]>0) then begin
dx[n1]:=-dx[n1];
ca13:='1';
end;

if (ca13='1') and (sa49=1) then begin
with MediaPlayer1 do begin
play;
end;
end;

end;

n1:=0;
a1:=0;
while a1<num1 do begin
a1:=a1+1;
rx:=dx[a1]/4000;
ry:=dy[a1]/4000;
if abs(dx[a1]-rx)>0 then dx[a1]:=dx[a1]-rx else dx[a1]:=0;
if abs(dy[a1]-ry)>0 then dy[a1]:=dy[a1]-ry else dy[a1]:=0;
if sqrt((dx[a1]-rx)*(dx[a1]-rx)+(dy[a1]-ry)*(dy[a1]-ry))<=predel then begin
dx[a1]:=0;
dy[a1]:=0;
end;
cx[a1]:=cx[a1]+dx[a1];
cy[a1]:=cy[a1]+dy[a1];
px:=trunc(cx[a1]);
py:=trunc(cy[a1]);
canvas.draw(px,py,bilris00);
if (dx[a1]=0) and (dy[a1]=0) or (cx[a1]<-20) then n1:=n1+1;
end;
if n1=num1 then break;

canvas.Font.size:=10;
canvas.Font.color:=clblack;
canvas.Brush.color:=clblack;

bil07:=0;
while (bil07<i3) or (bil07=0) do begin
bil07:=bil07+1;
canvas.TextOut(0,0,'*');
end;

if key1=27 then break;

end;


if (udar=2) and (i2>0) then begin
px:=130;
py:=22;

if sa49=1 then begin
with MediaPlayer3 do begin
Filename:=cc13+'\bsound4.wav';
open;
play;
end;
end;

while px<600 do begin
px:=px+25;
ca13:='0';
a1:=0;
while a1<num1 do begin
a1:=a1+1;
if cx[a1]<-20 then continue;
rs:=sqrt((px-cx[a1])*(px-cx[a1])+
(py-cy[a1])*(py-cy[a1]));
if rs<=rad+15 then begin
ca13:='1';
break;
end;
end;
if ca13='0' then begin
cx[udnom]:=px;
cy[udnom]:=py;
dx[udnom]:=0;
dy[udnom]:=0;

a1:=num1+1;
while a1>1 do begin
a1:=a1-1;
if tw[a1]<>udnom then continue;
ni:=tw[a1];
tz[a1]:=0;
tw[a1]:=0;
break;
end;

break;
end;
end;

ni:=1;
end;


if (udar=0) and (i2>0) and (over<>1) then begin
px:=130;
py:=377;

if sa49=1 then begin
with MediaPlayer3 do begin
Filename:=cc13+'\bsound3.wav';
open;
play;
end;
end;

while px<600 do begin
px:=px+25;
ca13:='0';
a1:=0;
while a1<num1 do begin
a1:=a1+1;
if cx[a1]<-20 then continue;
rs:=sqrt((px-cx[a1])*(px-cx[a1])+
(py-cy[a1])*(py-cy[a1]));
if rs<=rad+15 then begin
ca13:='1';
break;
end;
end;
if ca13='1' then continue;
ca13:='1';
a1:=num1+1;
while a1>1 do begin
a1:=a1-1;
if (tz[a1]<>igrok) or (tw[a1]=0) then continue;
ni:=tw[a1];
tz[a1]:=0;
tw[a1]:=0;
ca13:='0';
break;
end;
if ca13='0' then begin
cx[ni]:=px;
cy[ni]:=py;
dx[ni]:=0;
dy[ni]:=0;
break;
end;
break;
end;

ni:=1;
end;


bilris00.transparent:=true;
bilris00.transparentcolor:=clblack;
a1:=0;
while a1<num1 do begin
a1:=a1+1;
if cx[a1]<-20 then continue;
canvas.draw(round(cx[a1]),round(cy[a1]),bilris00);
end;
bilris00.transparent:=false;

canvas.Font.color:=clblack;
canvas.brush.color:=clyellow;
canvas.font.size:=23;

a1:=0;
while a1<num1 do begin
a1:=a1+1;
str(a1,ca13);
canvas.textout(round(cx[a1])+15,round(cy[a1])+6,ca13);
end;

a1:=0;
while a1<8 do begin
a1:=a1+1;
canvas.draw(round(ex[a1]),round(ey[a1]),bilris01);
end;

if (udar<>3) and (i2<>0) then begin
if igrok=2 then igrok:=1 else igrok:=2;
end;

if ni=1 then bilpr04;
bilpr05;

n1:=0;
a1:=0;
while a1<num1 do begin
a1:=a1+1;
if cx[a1]>-20 then n1:=n1+1;
end;
if n1<2 then begin
over:=1;
bilpr06;

with MediaPlayer1 do close;
with MediaPlayer2 do close;
with MediaPlayer3 do close;
with MediaPlayer4 do close;
with MediaPlayer3 do begin
close;
Filename:=cc13+'\bsound0.wav';
open;
play;
end;
with MediaPlayer1 do open;
with MediaPlayer2 do open;
with MediaPlayer4 do open;

end;

end;



procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

key1:=key;

if key=27 then begin
halt;
end;

if key=13 then begin
flag1:=0;
bilpr01;
bilpr07;
end;

if over=1 then exit;

if key=83 then begin
with canvas do begin
font.color:=clblue;
font.size:=10;
brush.color:=clyellow;
rectangle(80+148,0,220+100,16);
if sa49=1 then begin
sa49:=0;
textout(80+156,0,'<S>ound off ');
end else begin
sa49:=1;
textout(80+156,0,'<S>ound on  ');
end;
end;
end;

if (key=33) or (key=34) then begin
if key=33 then begin
if i3<999 then i3:=i3+10;
end;
if key=34 then begin
if i3>9 then i3:=i3-10;
end;
str(i3,ca13);
canvas.font.color:=clblue;
canvas.font.size:=23;
if i3>99 then begin
canvas.textout(590,450,ca13);
end else begin
if i3<10 then begin
canvas.textout(590,450,'    '+ca13);
end else begin
canvas.textout(590,450,'  '+ca13);
end;
end;
end;

if (key>48) and (key<56) then begin
if cx[key-48]<-20 then exit;
bx:=0;
by:=0;
n1:=0;
while n1<100 do begin
n1:=n1+1;
canvas.pixels[trunc(cx[sar]+rad/2+bx),trunc(cy[sar]+rad/2+by)]:=sa[n1];
bx:=bx+jx;
by:=by+jy;
end;
canvas.font.color:=clblack;
canvas.font.size:=26;
a1:=0;
while a1<7 do begin
a1:=a1+1;
str(a1,ca13);
canvas.textout(a1*47-50+120,450,' '+ca13+' ');
end;
sar:=key-48;
str(sar,ca13);
canvas.Font.color:=clred;
canvas.textout(sar*47-50+120,450,' '+ca13+' ');
{bilpr03;}
bilpr04;
exit
end;


if (key>36) and (key<41) then begin

if (key=38) or (key=40) then begin
if key=38 then begin
if i2<9 then i2:=i2+1;
end;
if key=40 then begin
if i2>0 then i2:=i2-1;
end;
str(i2,ca13);
canvas.font.color:=clblue;
canvas.font.size:=23;
canvas.textout(460,450,' '+ca13+' ');
end;

if (key=37) or (key=39) then begin
if key=37 then begin
if ug=359 then ug:=0 else ug:=ug+1;
end;
if key=39 then begin
if ug=0 then ug:=359 else ug:=ug-1;
end;
{str(ug,ca13);
canvas.TextOut(200,200,ca13);}

bilpr03;
end;

end;


if key=32 then begin

bx:=0;
by:=0;
n1:=0;
while n1<100 do begin
n1:=n1+1;
canvas.pixels[trunc(cx[sar]+rad/2+bx),trunc(cy[sar]+rad/2+by)]:=sa[n1];
bx:=bx+jx;
by:=by+jy;
end;

n1:=0;
while n1<num1 do begin
n1:=n1+1;
dx[n1]:=0;
dy[n1]:=0;
end;

canvas.Draw(round(cx[sar]),round(cy[sar]),bilris05);

dx[sar]:=kx*i2/13;
dy[sar]:=ky*i2/13;

bilpr00;

{if (sa49=1) and (over=1) then begin
end;}

end;

end;



procedure TForm1.bilpr01;
begin

{cy[4]:=160;
cx[4]:=450;
cy[3]:=240;
cx[3]:=450;
cy[2]:=160;
cx[2]:=200;
cy[1]:=240;
cx[1]:=200;}

{cx[4]:=270;
cy[4]:=350;
cx[3]:=330;
cy[3]:=350;
cx[2]:=270;
cy[2]:=100;
cx[1]:=330;
cy[1]:=100;}

{cx[4]:=450;
cy[4]:=230;
cx[3]:=250;
cy[3]:=100;
cx[2]:=200;
cy[2]:=230;
cx[1]:=380;
cy[1]:=320;}

cx[3]:=350-130;
cy[3]:=173;
cx[4]:=350-130;
cy[4]:=226;
cx[2]:=395-130;
cy[2]:=200;
cx[1]:=600;
cy[1]:=200;

cx[5]:=305-130;
cy[5]:=150;
cx[6]:=305-130;
cy[6]:=200;
cx[7]:=305-130;
cy[7]:=250;


{cx[1]:=50;
cy[1]:=50;
cx[4]:=550;
cy[4]:=50;
cx[3]:=550;
cy[3]:=350;
cx[2]:=600;
cy[2]:=350;
cx[2]:=100;
cy[2]:=30;}

{cx[4]:=gran3+5;
cy[4]:=250;
cx[3]:=500;
cy[3]:=gran2-rad-5;
cx[2]:=gran4-rad-5;
cy[2]:=250;
cx[1]:=250;
cy[1]:=gran1+5;}

n1:=0;
while n1<num1 do begin
n1:=n1+1;
dx[n1]:=0;
dy[n1]:=0;
end;

canvas.brush.color:=clyellow;
canvas.font.size:=23;
i2:=7;
str(i2,ca13);
canvas.font.color:=clblue;
canvas.textout(460,450,' '+ca13+' ');

i3:=250;
over:=0;
igrok:=1;
jx:=0;
jy:=0;
kx:=0;
ky:=0;
ni:=1;
ug:=270;

n1:=0;
while n1<100 do begin
n1:=n1+1;
sa[n1]:=clblack;
end;

bx:=0;
by:=0;
n1:=0;
while n1<100 do begin
n1:=n1+1;
canvas.pixels[trunc(cx[sar]+rad/2+bx),trunc(cy[sar]+rad/2+by)]:=sa[n1];
bx:=bx+jx;
by:=by+jy;
end;

n1:=0;
while n1<num1 do begin
n1:=n1+1;
tw[n1]:=0;
tz[n1]:=0;
end;

bilpr03;
{bilpr04;}

end;



procedure TForm1.bilpr02;
begin

canvas.brush.color:=clyellow;
canvas.Pen.color:=clYellow;

canvas.Font.size:=38;
canvas.textout(115,180,'  Billiard:  Please wait...  ');
canvas.Font.size:=10;

bt:=16;
bitime:=time;
ca13:=timetostr(bitime);
canvas.textout(200,300,ca13);
ca13:=ca13[7]+ca13[8];
val(ca13,bil03,bt);


bil05:=0;
while bil05<3 do begin
bil05:=bil05+1;

bil01:=580+110;
bil02:=10;
while bil01>10 do begin
bil01:=bil01-1;
canvas.draw(bil01,bil02,bilris00);
bil00:=0;
while bil00<30 do begin
bil00:=bil00+1;
canvas.TextOut(0,0,'*');
end;
end;

while bil02<420+20 do begin
bil02:=bil02+1;
canvas.draw(bil01,bil02,bilris00);
bil00:=0;
while bil00<30 do begin
bil00:=bil00+1;
canvas.TextOut(0,0,'*');
end;
end;

while bil01<580+110 do begin
bil01:=bil01+1;
canvas.draw(bil01,bil02,bilris00);
bil00:=0;
while bil00<30 do begin
bil00:=bil00+1;
canvas.TextOut(0,0,'*');
end;
end;

while bil02>10 do begin
bil02:=bil02-1;
canvas.draw(bil01,bil02,bilris00);
bil00:=0;
while bil00<30 do begin
bil00:=bil00+1;
canvas.TextOut(0,0,'*');
end;
end;

end;

bitime:=time;
ca13:=timetostr(bitime);
val(ca13[7]+ca13[8],bil04,bt);

if bil03>bil04 then bil04:=bil04+60;
str(bil04-bil03,ca13);
canvas.TextOut(300,300,ca13);
bil03:=bil04-bil03;

end;



procedure TForm1.bilpr03;
begin

ur:=ug*2*pi/360;
kx:=sin(ur);
ky:=cos(ur);

bx:=0;
by:=0;
n1:=0;
while n1<100 do begin
n1:=n1+1;
canvas.pixels[trunc(cx[sar]+rad/2+bx),trunc(cy[sar]+rad/2+by)]:=sa[n1];
bx:=bx+jx;
by:=by+jy;
end;

bilpr04;

end;



procedure TForm1.bilpr04;
begin

if (mpaint=0) or (flag1=0) then begin
jx:=kx;
jy:=ky;
bx:=0;
by:=0;
n1:=0;
while n1<100 do begin
n1:=n1+1;
sa[n1]:=canvas.pixels[trunc(cx[sar]+rad/2+bx),trunc(cy[sar]+rad/2+by)];
bx:=bx+kx;
by:=by+ky;
end;
end;

bx:=0;
by:=0;
n1:=0;
while n1<100 do begin
n1:=n1+1;
canvas.pixels[trunc(cx[sar]+rad/2+bx),trunc(cy[sar]+rad/2+by)]:=clred;
bx:=bx+kx;
by:=by+ky;
end;

end;



procedure TForm1.bilpr05;
begin

with canvas do begin
font.size:=19;
brush.color:=clblack;

if igrok=2 then font.color:=clsilver
else font.color:=clfuchsia;
textout(3,105,'1');

if igrok=2 then font.color:=clfuchsia
else font.color:=clsilver;
textout(735,105,'2');

brush.color:=clblack;
font.color:=clblue;
n2:=0;
while n2<num1 do begin
n2:=n2+1;
textout(0,110+n2*32,'   ');
end;
n2:=0;
while n2<num1 do begin
n2:=n2+1;
textout(734,110+n2*32,'   ');
end;

brush.color:=clyellow;
a2:=0;
n2:=0;
while n2<num1 do begin
n2:=n2+1;
if (tw[n2]<>0) and (tz[n2]=1) then begin
a2:=a2+1;
str(tw[n2],ca13);
textout(2,110+a2*32,ca13);
end;
end;
a2:=0;
n2:=0;
while n2<num1 do begin
n2:=n2+1;
if (tw[n2]<>0) and (tz[n2]=2) then begin
a2:=a2+1;
str(tw[n2],ca13);
textout(735,110+a2*32,ca13);
end;
end;

end;
end;



procedure TForm1.bilpr06;
begin

canvas.TextOut(305,150,' Game over ');
n2:=0;
a2:=0;
while n2<num1 do begin
n2:=n2+1;
if tz[n2]=1 then a2:=a2+1;
end;
str(a2,ca13);
canvas.TextOut(320,200,' '+ca13+' ');
n2:=0;
a2:=0;
while n2<num1 do begin
n2:=n2+1;
if tz[n2]=2 then a2:=a2+1;
end;
str(a2,ca13);
canvas.TextOut(395,200,' '+ca13+' ');

end;



procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

if (106<x) and (0<y) and (218>x) and (18>y) and (button=mbleft) then begin
flag1:=0;
bilpr01;
bilpr07;
end;

if over=1 then exit;

if (80+148<x) and (0<y) and (224+100>x) and (18>y) and (button=mbleft) then begin
with canvas do begin
font.color:=clblue;
font.size:=10;
brush.color:=clyellow;
rectangle(80+148,0,220+100,16);
if sa49=1 then begin
sa49:=0;
textout(80+156,0,'<S>ound off ');
end else begin
sa49:=1;
textout(80+156,0,'<S>ound on  ');
end;
end;
end;

if button=mbright then begin

bx:=0;
by:=0;
n1:=0;
while n1<100 do begin
n1:=n1+1;
canvas.pixels[trunc(cx[sar]+rad/2+bx),trunc(cy[sar]+rad/2+by)]:=sa[n1];
bx:=bx+jx;
by:=by+jy;
end;

n1:=0;
while n1<num1 do begin
n1:=n1+1;
dx[n1]:=0;
dy[n1]:=0;
end;

dx[sar]:=kx*i2/13;
dy[sar]:=ky*i2/13;

canvas.Draw(round(cx[sar]),round(cy[sar]),bilris05);

bilpr00;

{if (sa49=1) and (over=1) then begin
with MediaPlayer3 do begin
close;
Filename:=cc13+'\bsound0.wav';
open;
play;
end;
end;}

exit;

end;

{if over=1 then exit;}

alfa:=0;
a1:=0;
while a1<num1 do begin
a1:=a1+1;
if (67+a1*47<x) and (447<y) and (108+a1*47>x) and (489>y) then begin
if cx[a1]<-20 then exit;
bx:=0;
by:=0;
n1:=0;
while n1<100 do begin
n1:=n1+1;
canvas.pixels[trunc(cx[sar]+rad/2+bx),trunc(cy[sar]+rad/2+by)]:=sa[n1];
bx:=bx+jx;
by:=by+jy;
end;
alfa:=1;
sar:=a1;
break;
end;
end;

if alfa=1 then begin

canvas.font.color:=clblack;
canvas.font.size:=26;
a1:=0;
while a1<7 do begin
a1:=a1+1;
str(a1,ca13);
canvas.textout(a1*47-50+120,450,' '+ca13+' ');
end;
str(sar,ca13);
canvas.font.color:=clred;
canvas.textout(sar*47-50+120,450,' '+ca13+' ');
bilpr04;
{bilpr03;}
exit;
end;


keym:=0;
if (505<x) and (451<y) and (539>x) and (486-17>y) then begin
keym:=38;
end;

if (505<x) and (451+17<y) and (539>x) and (486>y) then begin
keym:=40;
end;

if (549<x) and (451<y) and (584-17>x) and (486>y) then begin
keym:=37;
end;

if (549+17<x) and (451<y) and (584>x) and (486>y) then begin
keym:=39;
end;

if keym<>0 then begin
if (keym=38) or (keym=40) then begin
if keym=38 then begin
if i2<9 then i2:=i2+1;
end;
if keym=40 then begin
if i2>0 then i2:=i2-1;
end;
str(i2,ca13);
canvas.font.color:=clblue;
canvas.font.size:=23;
canvas.textout(460,450,' '+ca13+' ');
end;

if (keym=37) or (keym=39) then begin
if keym=37 then begin
if ug=359 then ug:=0 else ug:=ug+1;
end;
if keym=39 then begin
if ug=0 then ug:=359 else ug:=ug-1;
end;
bilpr03;
exit;
end;
end;

if (x>0) and (y>0) and (x<750) and (y<500) then begin
if (x>cx[sar]+rad/2-100) and (x<cx[sar]+rad/2+100) and
 (y>cy[sar]+rad/2-100) and (y<cy[sar]+rad/2+100) then begin
if cx[sar]+rad/2-x=0 then
alfa:=pi/2 else
alfa:=arctan((cy[sar]+rad/2-y)/(cx[sar]+rad/2-x));

ug:=round(180-alfa*180/pi-90);

if not((cy[sar]+rad/2-y>0) and (cx[sar]+rad/2-x<0)) then begin

if (cy[sar]+rad/2-y<=0) and (cx[sar]+rad/2-x>0) then begin
ug:=round(180-alfa*180/pi-90+180);
end;

if (cy[sar]+rad/2-y>0) and (cx[sar]+rad/2-x>=0) then begin
ug:=round(180-alfa*180/pi-90+180);
end;

end;

{str(ug,ca13);
canvas.TextOut(200,200,ca13);}
{bx:=0;
by:=0;
n1:=0;
while n1<100 do begin
n1:=n1+1;
canvas.pixels[trunc(cx[sar]+rad/2+bx),trunc(cy[sar]+rad/2+by)]:=sa[n1];
bx:=bx+jx;
by:=by+jy;
end;}
bilpr03;

end;
end;

end;



procedure TForm1.bilpr07;
begin

if flag1=0 then begin
bil03:=21;
sar:=1;
sx:=0;
sy:=0;
bilpr01;
sar:=1;

bilpr05;

ex[1]:=gran3-round(rad*1.00);
ey[1]:=gran1+round(rad*0.60);
ex[2]:=gran3+round(rad*0.60);
ey[2]:=gran1-round(rad*1.00);
ex[3]:=gran4-round(rad*0.00);
ey[3]:=gran1+round(rad*0.60);
ex[4]:=gran4-round(rad*1.60);
ey[4]:=gran1-round(rad*1.00);
ex[5]:=gran4+round(rad*0.00);
ey[5]:=gran2-round(rad*1.60);
ex[6]:=gran4-round(rad*1.60);
ey[6]:=gran2+round(rad*0.00);
ex[7]:=gran3-round(rad*1.00);
ey[7]:=gran2-round(rad*1.60);
ex[8]:=gran3+round(rad*0.60);
ey[8]:=gran2+round(rad*0.00);

end;

with canvas do begin
pen.color:=clblack;
brush.color:=clblack;
rectangle(0,0,750,500);

pen.color:=clyellow;
font.color:=clblack;
brush.color:=clyellow;
font.size:=26;
{moveto(gran3-2,gran1-2);
lineto(gran4+1,gran1-2);
lineto(gran4+1,gran2+1);
lineto(gran3-2,gran2+1);
lineto(gran3-2,gran1-2);}
moveto(gran3-2+rad,gran1-2);
lineto(gran4+1-rad,gran1-2);
moveto(gran4+1,gran1-2+rad);
lineto(gran4+1,gran2+1-rad);
moveto(gran4+1-rad,gran2+1);
lineto(gran3-2+rad,gran2+1);
moveto(gran3-2,gran2+1-rad);
lineto(gran3-2,gran1-2+rad);

end;

with canvas do begin

a1:=0;
while a1<8 do begin
a1:=a1+1;
canvas.draw(round(ex[a1]),round(ey[a1]),bilris01);
end;

font.color:=clblack;
a1:=0;
while a1<7 do begin
a1:=a1+1;
str(a1,ca13);
textout(a1*47-50+120,450,' '+ca13+' ');
end;
str(sar,ca13);
font.color:=clred;
textout(sar*47-50+120,450,' '+ca13+' ');

font.color:=clblack;
bilris00.transparent:=true;
bilris00.transparentcolor:=clblack;
a1:=0;
while a1<num1 do begin
a1:=a1+1;
if cx[a1]<-20 then continue;
canvas.draw(round(cx[a1]),round(cy[a1]),bilris00);
end;
bilris00.transparent:=false;

a1:=0;
while a1<num1 do begin
a1:=a1+1;
str(a1,ca13);
textout(round(cx[a1])+15,round(cy[a1])+6,ca13);
end;
end;

canvas.font.color:=clblue;
canvas.font.size:=10;
canvas.brush.color:=clred;
canvas.Rectangle(106,0,218,18);
canvas.brush.color:=clyellow;

canvas.textout(106,0,' Enter - New game ');
canvas.textout(330,0,' Version 1.1    (C) Nefteyugansk 2002, phone: 3-16-59. ');

with canvas do begin
canvas.brush.color:=clyellow;
rectangle(80+148,0,220+100,16);
if sa49=0 then begin
canvas.textout(80+156,0,'<S>ound off ');
end else begin
canvas.textout(80+156,0,'<S>ound on  ');
end;
end;

str(i2,ca13);
canvas.font.size:=23;
canvas.textout(460,450,' '+ca13+' ');

bilpr05;
{if mpaint=0 then bilpr03 else bilpr04;}
{bilpr03;}
bilpr04;

if over=1 then bilpr06;

{canvas.pen.color:=clred;
canvas.rectangle(505,451,539,486-17);
canvas.rectangle(505,451+17,539,486);
canvas.pen.color:=clred;
canvas.rectangle(549,451,584-17,486);
canvas.rectangle(549+17,451,584,486);}

canvas.Draw(506,452,bilris03);
canvas.Draw(550,453,bilris04);

str(i3,ca13);
canvas.font.color:=clblue;
canvas.font.size:=23;
if i3>99 then begin
canvas.textout(590,450,ca13);
end else begin
if i3<10 then begin
canvas.textout(590,450,'    '+ca13);
end else begin
canvas.textout(590,450,'  '+ca13);
end;
end;

if flag1=0 then begin
canvas.font.size:=10;
canvas.TextOut(590,453,'Page Up');
canvas.TextOut(590,469,'Page Dn');
canvas.font.size:=23;
end;
flag1:=1;

end;



procedure TForm1.FormPaint(Sender: TObject);
begin
mpaint:=1;
bilpr07;
mpaint:=0;
end;


end.




