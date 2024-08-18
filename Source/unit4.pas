unit Unit4;
// Project: SmatterPlot
// unit4 = color sequence form
{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ColorBox,
  ExtCtrls, Buttons, TATransformations, TASeries, TAGraph, TATypes;


type

  { TForm4 }

  TForm4 = class(TForm)
    Button1: TButton;
    ColorBox1: TColorBox;
    ColorBox10: TColorBox;
    ColorBox2: TColorBox;
    ColorBox3: TColorBox;
    ColorBox4: TColorBox;
    ColorBox5: TColorBox;
    ColorBox6: TColorBox;
    ColorBox7: TColorBox;
    ColorBox8: TColorBox;
    ColorBox9: TColorBox;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ColorBox10Change(Sender: TObject);
    procedure ColorBox1Change(Sender: TObject);
    procedure ColorBox2Change(Sender: TObject);
    procedure ColorBox3Change(Sender: TObject);
    procedure ColorBox4Change(Sender: TObject);
    procedure ColorBox5Change(Sender: TObject);
    procedure ColorBox6Change(Sender: TObject);
    procedure ColorBox7Change(Sender: TObject);
    procedure ColorBox8Change(Sender: TObject);
    procedure ColorBox9Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private

  public

  end;

var
  Form4: TForm4;

implementation
{$R *.lfm}
uses
  unit1, unit2;

{ TForm4 }

procedure TForm4.FormActivate(Sender: TObject);
begin
  ColorBox1.Selected:=mycolors[mycolorsint[0]];
  ColorBox2.Selected:=mycolors[mycolorsint[1]];
  ColorBox3.Selected:=mycolors[mycolorsint[2]];
  ColorBox4.Selected:=mycolors[mycolorsint[3]];
  ColorBox5.Selected:=mycolors[mycolorsint[4]];
  ColorBox6.Selected:=mycolors[mycolorsint[5]];
  ColorBox7.Selected:=mycolors[mycolorsint[6]];
  ColorBox8.Selected:=mycolors[mycolorsint[7]];
  ColorBox9.Selected:=mycolors[mycolorsint[8]];
  ColorBox10.Selected:=mycolors[mycolorsint[9]];



end;

procedure TForm4.ColorBox1Change(Sender: TObject);
var
  snum: integer;
  j: integer;
  thecolor: TColor;

begin
  // Change Series1 color
  snum := Form1.Chart1.Series.Count;
  thecolor:= ColorBox1.selected;

  for j := 0 to snum-1 do
  begin
     if j=0 then
     begin
         TLineSeries(Form1.Chart1.Series[j]).SeriesColor:=thecolor;
         TLineSeries(Form1.Chart1.Series[j]).Pointer.Brush.Color:=thecolor;
         TLineSeries(Form1.Chart1.Series[j]).Pointer.Pen.Color:=thecolor;

     end;

  end;
  for j:= 0 to 9 do
  begin
     if thecolor = mycolors[j] then
        mycolorsint[9]:=j;
  end;
  Form1.RebuildChart();

end;

procedure TForm4.ColorBox10Change(Sender: TObject);
var
  snum: integer;
  j: integer;
  thecolor: TColor;

begin
  // Change Series1 color
  snum := Form1.Chart1.Series.Count;
  thecolor:= ColorBox10.selected;

  for j := 0 to snum-1 do
  begin
     if j=9 then
     begin
         TLineSeries(Form1.Chart1.Series[j]).SeriesColor:=thecolor;
         TLineSeries(Form1.Chart1.Series[j]).Pointer.Brush.Color:=thecolor;
         TLineSeries(Form1.Chart1.Series[j]).Pointer.Pen.Color:=thecolor;
     end;

  end;
  for j:= 0 to 9 do
  begin
     if thecolor = mycolors[j] then
        mycolorsint[9]:=j;
  end;
  Form1.RebuildChart();

end;

procedure TForm4.Button1Click(Sender: TObject);
begin
  // Reset
  mycolorsint:=mycolorsintdef;
  ColorBox1.Selected:=mycolors[mycolorsint[0]];
  ColorBox2.Selected:=mycolors[mycolorsint[1]];
  ColorBox3.Selected:=mycolors[mycolorsint[2]];
  ColorBox4.Selected:=mycolors[mycolorsint[3]];
  ColorBox5.Selected:=mycolors[mycolorsint[4]];
  ColorBox6.Selected:=mycolors[mycolorsint[5]];
  ColorBox7.Selected:=mycolors[mycolorsint[6]];
  ColorBox8.Selected:=mycolors[mycolorsint[7]];
  ColorBox9.Selected:=mycolors[mycolorsint[8]];
  ColorBox10.Selected:=mycolors[mycolorsint[9]];
  Form2.RadioButton1.Checked;
  Form1.RebuildChart();

end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  Form4.Hide;

end;

procedure TForm4.ColorBox2Change(Sender: TObject);
var
  snum: integer;
  j: integer;
  thecolor: TColor;

begin
  // Change Series2 color
  snum := Form1.Chart1.Series.Count;
  thecolor:= ColorBox2.selected;


  for j:= 0 to 9 do
  begin
     if thecolor = mycolors[j] then
        mycolorsint[1]:=j;
  end;
  Form1.RebuildChart();
end;

procedure TForm4.ColorBox3Change(Sender: TObject);
var
  snum: integer;
  j: integer;
  thecolor: TColor;

begin
  // Change Series1 color
  snum := Form1.Chart1.Series.Count;
  thecolor:= ColorBox3.selected;


  for j:= 0 to 9 do
  begin
     if thecolor = mycolors[j] then
        mycolorsint[2]:=j;
  end;
  Form1.RebuildChart();
end;

procedure TForm4.ColorBox4Change(Sender: TObject);
var
  snum: integer;
  j: integer;
  thecolor: TColor;

begin
  // Change Series1 color
  snum := Form1.Chart1.Series.Count;
  thecolor:= ColorBox4.selected;


  for j:= 0 to 9 do
  begin
     if thecolor = mycolors[j] then
        mycolorsint[3]:=j;
  end;
  Form1.RebuildChart();
end;

procedure TForm4.ColorBox5Change(Sender: TObject);
var
  snum: integer;
  j: integer;
  thecolor: TColor;

begin
  // Change Series1 color
  snum := Form1.Chart1.Series.Count;
  thecolor:= ColorBox5.selected;


  for j:= 0 to 9 do
  begin
     if thecolor = mycolors[j] then
        mycolorsint[4]:=j;
  end;
  Form1.RebuildChart();
end;

procedure TForm4.ColorBox6Change(Sender: TObject);
var
  snum: integer;
  j: integer;
  thecolor: TColor;

begin
  // Change Series1 color
  snum := Form1.Chart1.Series.Count;
  thecolor:= ColorBox6.selected;

  for j:= 0 to 9 do
  begin
     if thecolor = mycolors[j] then
        mycolorsint[5]:=j;
  end;
  Form1.RebuildChart();
end;

procedure TForm4.ColorBox7Change(Sender: TObject);
var
  snum: integer;
  j: integer;
  thecolor: TColor;

begin
  // Change Series1 color
  snum := Form1.Chart1.Series.Count;
  thecolor:= ColorBox7.selected;

  for j:= 0 to 9 do
  begin
     if thecolor = mycolors[j] then
        mycolorsint[6]:=j;
  end;
  Form1.RebuildChart();
end;

procedure TForm4.ColorBox8Change(Sender: TObject);
var
  snum: integer;
  j: integer;
  thecolor: TColor;

begin
  // Change Series1 color
  snum := Form1.Chart1.Series.Count;
  thecolor:= ColorBox8.selected;

  for j:= 0 to 9 do
  begin
     if thecolor = mycolors[j] then
        mycolorsint[7]:=j;
  end;
  Form1.RebuildChart();
end;

procedure TForm4.ColorBox9Change(Sender: TObject);
var
  snum: integer;
  j: integer;
  thecolor: TColor;

begin
  // Change Series1 color
  snum := Form1.Chart1.Series.Count;
  thecolor:= ColorBox9.selected;

  for j:= 0 to 9 do
  begin
     if thecolor = mycolors[j] then
        mycolorsint[8]:=j;
  end;
  Form1.RebuildChart();
end;

end.

