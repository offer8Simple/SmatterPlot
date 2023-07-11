unit Unit2;
// Project: SmatterPlot
// unit2 = formatter form

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ColorBox,
  ExtCtrls, Buttons, TATransformations, TASeries, TAGraph, TATypes;

type

  { TForm2 }

  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button6: TButton;
    ChartAxisTransformations1: TChartAxisTransformations;
    ChartAxisTransformations2: TChartAxisTransformations;
    ChartAxisTransformations1LinearAxisTransform1: TLinearAxisTransform;
    ChartAxisTransformations1LogarithmAxisTransform1: TLogarithmAxisTransform;
    ColorBox1: TColorBox;
    ColorBox2: TColorBox;
    ColorBox3: TColorBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    RadioButton1: TRadioButton;
    RadioButton10: TRadioButton;
    RadioButton11: TRadioButton;
    RadioButton12: TRadioButton;
    RadioButton13: TRadioButton;
    RadioButton14: TRadioButton;
    RadioButton15: TRadioButton;
    RadioButton16: TRadioButton;
    RadioButton17: TRadioButton;
    RadioButton18: TRadioButton;
    RadioButton19: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton20: TRadioButton;
    RadioButton21: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    ToggleBox1: TToggleBox;
    ToggleBox2: TToggleBox;
    ToggleBox3: TToggleBox;
    ToggleBox4: TToggleBox;
    ToggleBox5: TToggleBox;
    ToggleBox6: TToggleBox;
    ToggleBox7: TToggleBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure ColorBox1Click(Sender: TObject);
    procedure ColorBox1Select(Sender: TObject);
    procedure ColorBox2Select(Sender: TObject);
    procedure ColorBox3Change(Sender: TObject);
    procedure ColorBox3Select(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton10Change(Sender: TObject);
    procedure RadioButton11Change(Sender: TObject);
    procedure RadioButton12Change(Sender: TObject);
    procedure RadioButton13Change(Sender: TObject);
    procedure RadioButton14Change(Sender: TObject);
    procedure RadioButton15Change(Sender: TObject);
    procedure RadioButton16Change(Sender: TObject);
    procedure RadioButton17Change(Sender: TObject);
    procedure RadioButton18Change(Sender: TObject);
    procedure RadioButton19Change(Sender: TObject);
    procedure RadioButton1Change(Sender: TObject);
    procedure RadioButton20Change(Sender: TObject);
    procedure RadioButton21Change(Sender: TObject);
    procedure RadioButton2Change(Sender: TObject);
    procedure RadioButton3Change(Sender: TObject);
    procedure RadioButton4Change(Sender: TObject);
    procedure RadioButton5Change(Sender: TObject);
    procedure RadioButton6Change(Sender: TObject);
    procedure RadioButton7Change(Sender: TObject);
    procedure RadioButton8Change(Sender: TObject);
    procedure RadioButton9Change(Sender: TObject);
    procedure ToggleBox1Change(Sender: TObject);
    procedure ToggleBox2Change(Sender: TObject);
    procedure ToggleBox2Click(Sender: TObject);
    procedure ToggleBox3Change(Sender: TObject);
    procedure ToggleBox4Change(Sender: TObject);
    procedure ToggleBox5Change(Sender: TObject);
    procedure ToggleBox6Change(Sender: TObject);
    procedure ToggleBox7Click(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation
uses
    unit1, Unit3, Unit4, Unit5, Unit6, Unit7;

{$R *.lfm}

{ TForm2 }



procedure TForm2.RadioButton10Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group symbols by 4
  mysymbolsint:= [0,0,0,0,1,1,1,1,2,2];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Style:=mysymbols[mysymbolsint[j]];

  end;

end;

procedure TForm2.RadioButton11Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group symbols by 5
  mysymbolsint:= [0,0,0,0,0,1,1,1,1,1];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Style:=mysymbols[mysymbolsint[j]];

  end;

end;

procedure TForm2.RadioButton12Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group symbols -- no symbols
  mysymbolsint:= [9,9,9,9,9,9,9,9,9,9];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Style:=mysymbols[mysymbolsint[j]];

  end;

end;

procedure TForm2.RadioButton13Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group Lines -- no grouping
  mylinesint:= [1,1,1,1,1,1,1,1,1,1];
  mylinestylesint:= [0,1,2,3,4,0,1,2,3,4];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).LineType:=mylines[mylinesint[j]];
     TLineSeries(Form1.Chart1.Series[j]).LinePen.Style:=mylinestyles[mylinestylesint[j]];

  end;

end;

procedure TForm2.RadioButton14Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group Lines by 2
  mylinesint:= [1,1,1,1,1,1,1,1,1,1];
  mylinestylesint:= [0,0,1,1,2,2,3,3,4,4];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).LineType:=mylines[mylinesint[j]];
     TLineSeries(Form1.Chart1.Series[j]).LinePen.Style:=mylinestyles[mylinestylesint[j]];

  end;

end;

procedure TForm2.RadioButton15Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group Lines by 3
  mylinesint:= [1,1,1,1,1,1,1,1,1,1];
  mylinestylesint:= [0,0,0,1,1,1,2,2,2,3];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).LineType:=mylines[mylinesint[j]];
     TLineSeries(Form1.Chart1.Series[j]).LinePen.Style:=mylinestyles[mylinestylesint[j]];

  end;

end;

procedure TForm2.RadioButton16Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group Lines by 4
  mylinesint:= [1,1,1,1,1,1,1,1,1,1];
  mylinestylesint:= [0,0,0,0,1,1,1,1,2,2];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).LineType:=mylines[mylinesint[j]];
     TLineSeries(Form1.Chart1.Series[j]).LinePen.Style:=mylinestyles[mylinestylesint[j]];

  end;


end;

procedure TForm2.RadioButton17Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group Lines by 5
  mylinesint:= [1,1,1,1,1,1,1,1,1,1];
  mylinestylesint:= [0,0,0,0,0,1,1,1,1,1];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).LineType:=mylines[mylinesint[j]];
     TLineSeries(Form1.Chart1.Series[j]).LinePen.Style:=mylinestyles[mylinestylesint[j]];

  end;

end;

procedure TForm2.RadioButton18Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group Lines -- no lines
  mylinesint:= [0,0,0,0,0,0,0,0,0,0];
  mylinestylesint:= [0,0,0,0,0,0,0,0,0,0];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).LineType:=mylines[mylinesint[j]];
     TLineSeries(Form1.Chart1.Series[j]).LinePen.Style:=mylinestyles[mylinestylesint[j]];

  end;

end;

procedure TForm2.RadioButton19Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group colors all the same
  mycolorsint:= [0,0,0,0,0,0,0,0,0,0];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).SeriesColor:=mycolors[mycolorsint[j]];
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Brush.Color:=mycolors[mycolorsint[j]];
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Pen.Color:=mycolors[mycolorsint[j]];
     //TLineSeries(Form1.Chart1.Series[j]).Pointer.Style:=mysymbols[j];

  end;

end;

procedure TForm2.RadioButton1Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // No Color grouping
  mycolorsint:= [0,1,2,3,4,5,6,7,8,9];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).SeriesColor:=mycolors[mycolorsint[j]];
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Brush.Color:=mycolors[mycolorsint[j]];
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Pen.Color:=mycolors[mycolorsint[j]];
     //TLineSeries(Form1.Chart1.Series[j]).Pointer.Style:=mysymbols[j];

  end;

end;

procedure TForm2.RadioButton20Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group symbols - all the same
  mysymbolsint:= [0,0,0,0,0,0,0,0,0,0];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Style:=mysymbols[mysymbolsint[j]];

  end;

end;

procedure TForm2.RadioButton21Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group Lines -- all the same
  mylinesint:= [1,1,1,1,1,1,1,1,1,1];
  mylinestylesint:= [0,0,0,0,0,0,0,0,0,0];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).LineType:=mylines[mylinesint[j]];
     TLineSeries(Form1.Chart1.Series[j]).LinePen.Style:=mylinestyles[mylinestylesint[j]];

  end;

end;

procedure TForm2.RadioButton2Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group colors by 2
  mycolorsint:= [0,0,1,1,2,2,3,3,4,4,5,5];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).SeriesColor:=mycolors[mycolorsint[j]];
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Brush.Color:=mycolors[mycolorsint[j]];
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Pen.Color:=mycolors[mycolorsint[j]];
     //TLineSeries(Form1.Chart1.Series[j]).Pointer.Style:=mysymbols[j];

  end;


end;

procedure TForm2.RadioButton3Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group colors by 3
  mycolorsint:= [0,0,0,1,1,1,2,2,2,3];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).SeriesColor:=mycolors[mycolorsint[j]];
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Brush.Color:=mycolors[mycolorsint[j]];
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Pen.Color:=mycolors[mycolorsint[j]];
     //TLineSeries(Form1.Chart1.Series[j]).Pointer.Style:=mysymbols[j];

  end;

end;

procedure TForm2.RadioButton4Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group colors by 4
  mycolorsint:= [0,0,0,0,1,1,1,1,2,2];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).SeriesColor:=mycolors[mycolorsint[j]];
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Brush.Color:=mycolors[mycolorsint[j]];
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Pen.Color:=mycolors[mycolorsint[j]];
     //TLineSeries(Form1.Chart1.Series[j]).Pointer.Style:=mysymbols[j];

  end;

end;

procedure TForm2.RadioButton5Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group colors by 5
  mycolorsint:= [0,0,0,0,0,1,1,1,1,1];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).SeriesColor:=mycolors[mycolorsint[j]];
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Brush.Color:=mycolors[mycolorsint[j]];
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Pen.Color:=mycolors[mycolorsint[j]];
     //TLineSeries(Form1.Chart1.Series[j]).Pointer.Style:=mysymbols[j];

  end;

end;

procedure TForm2.RadioButton6Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group colors by 6
  mycolorsint:= [0,0,0,0,0,0,2,2,2,2];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).SeriesColor:=mycolors[mycolorsint[j]];
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Brush.Color:=mycolors[mycolorsint[j]];
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Pen.Color:=mycolors[mycolorsint[j]];
     //TLineSeries(Form1.Chart1.Series[j]).Pointer.Style:=mysymbols[j];

  end;

end;

procedure TForm2.RadioButton7Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group symbols -- no grouping
  mysymbolsint:= [0,1,2,3,4,5,6,7,8,9];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Style:=mysymbols[mysymbolsint[j]];

  end;

end;

procedure TForm2.RadioButton8Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group symbols by 2
  mysymbolsint:= [0,0,1,1,2,2,3,3,4,4,5,5];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Style:=mysymbols[mysymbolsint[j]];

  end;

end;

procedure TForm2.RadioButton9Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group symbols by 3
  mysymbolsint:= [0,0,0,1,1,1,2,2,2,3];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Style:=mysymbols[mysymbolsint[j]];

  end;

end;

procedure TForm2.ToggleBox1Change(Sender: TObject);
begin
   // Toggle X axis scale between log and linear
  if Form1.Chart1.BottomAxis.Transformations=Form1.ChartAxisTransformations2 then
     Form1.Chart1.BottomAxis.Transformations:=Form1.ChartAxisTransformations1
  else
     Form1.Chart1.BottomAxis.Transformations:=Form1.ChartAxisTransformations2;

  Form1.Chart1.BottomAxis.Range.UseMax:= false;
  Form1.Chart1.BottomAxis.Range.UseMin:= false;
end;

procedure TForm2.ToggleBox2Change(Sender: TObject);
begin
  // Toggle Y axis scale between log and linear
  if Form1.Chart1.LeftAxis.Transformations=Form1.ChartAxisTransformations2 then
     Form1.Chart1.LeftAxis.Transformations:=Form1.ChartAxisTransformations1
  else
     Form1.Chart1.LeftAxis.Transformations:=Form1.ChartAxisTransformations2;

  Form1.Chart1.LeftAxis.Range.UseMax:= false;
  Form1.Chart1.LeftAxis.Range.UseMin:= false;
end;



procedure TForm2.ToggleBox2Click(Sender: TObject);
begin

end;

procedure TForm2.Button1Click(Sender: TObject);
begin   // Show Titles form
  Form3.Show;

end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  // go to "Sizes" Form
  Form5.show;

end;

procedure TForm2.Button6Click(Sender: TObject);
begin
  // Go to Scaling form


  Form7.Edit1.Caption:= FloattoStr(Form1.Chart1.CurrentExtent.b.y);
  Form7.Edit2.Caption:= FloattoStr(Form1.Chart1.CurrentExtent.a.y);
  Form7.Edit3.Caption:= FloattoStr(Form1.Chart1.CurrentExtent.b.x);
  Form7.Edit4.Caption:= FloattoStr(Form1.Chart1.CurrentExtent.a.x);
  Form7.CheckBox1.Checked:= true;
  Form7.CheckBox2.Checked:= true;
  Form7.CheckBox3.Checked:= true;
  Form7.CheckBox4.Checked:= true;
  Form7.show;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  // go to "Change Color Sequence form"
  Form4.show;

end;

procedure TForm2.ColorBox1Click(Sender: TObject);
begin
  Form1.Chart1.BackColor:=ColorBox1.Selected;
end;

procedure TForm2.ColorBox1Select(Sender: TObject);
begin    // Change Plot Area BackColor with Colorbox1
  Form1.Chart1.BackColor:=ColorBox1.Selected;
end;

procedure TForm2.ColorBox2Select(Sender: TObject);
begin  // Change Chart Backcolor with Colorbox2
  Form1.Chart1.Color:=ColorBox2.Selected;
end;

procedure TForm2.ColorBox3Change(Sender: TObject);
begin

end;

procedure TForm2.ColorBox3Select(Sender: TObject);
begin
     // Change Chart Legend BackColor
    Form1.Chart1.Legend.BackgroundBrush.Color:=ColorBox3.Selected;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin

end;

procedure TForm2.ToggleBox3Change(Sender: TObject);


begin // Toggle Grid on/off X-Axis
  If Form1.Chart1.BottomAxis.Grid.Visible = true then

       Form1.Chart1.BottomAxis.Grid.Visible:=false
  else
       Form1.Chart1.BottomAxis.Grid.Visible:=true;
       Form1.Chart1.BottomAxis.Grid.Style := psSolid;
       Form1.Chart1.BottomAxis.Grid.Color := cl3Dlight;



end;

procedure TForm2.ToggleBox4Change(Sender: TObject);
begin      // Toggle Grid on/off Y-Axis
  If Form1.Chart1.LeftAxis.Grid.Visible = true then

       Form1.Chart1.LeftAxis.Grid.Visible:=false
  else
       Form1.Chart1.LeftAxis.Grid.Visible:=true;
       Form1.Chart1.LeftAxis.Grid.Style := psSolid;
       Form1.Chart1.LeftAxis.Grid.Color := cl3Dlight;
end;

procedure TForm2.ToggleBox5Change(Sender: TObject);
begin
  // Toggle Minor Ticks on/off Y-Axis
      If Form1.Chart1.BottomAxis.Minors[0].Visible = true then

           Form1.Chart1.BottomAxis.Minors[0].Visible:=false
      else
           Form1.Chart1.BottomAxis.Minors[0].Visible:=true;
end;

procedure TForm2.ToggleBox6Change(Sender: TObject);
begin
  // Toggle Minor Ticks on/off Y-Axis
    If Form1.Chart1.LeftAxis.Minors[0].Visible = true then

         Form1.Chart1.LeftAxis.Minors[0].Visible:=false
    else
         Form1.Chart1.LeftAxis.Minors[0].Visible:=true;
end;

procedure TForm2.ToggleBox7Click(Sender: TObject);
begin
  // Open Number Formats Form
  Form6.ComboBox1.Clear;
  Form6.ComboBox1.Items.Add('General');
  Form6.ComboBox1.Items.Add('Scientific');
  Form6.ComboBox1.AutoSelect:=true;
  Form6.ComboBox2.Clear;
  Form6.ComboBox2.Items.Add('General');
  Form6.ComboBox2.Items.Add('Scientific');
  Form6.ComboBox2.AutoSelect:=true;
  Case Form1.Chart1.LeftAxis.Marks.Format of
       '%:.0f%': Form6.Edit1.Caption:=InttoStr(0);
       '%:.1f%': Form6.Edit1.Caption:=InttoStr(1);
       '%:.2f%': Form6.Edit1.Caption:=InttoStr(2);
       '%:.3f%': Form6.Edit1.Caption:=InttoStr(3);
       '%:.4f%': Form6.Edit1.Caption:=InttoStr(4);
  else
       Form6.Edit1.Caption:=InttoStr(6);
  end;
  Case Form1.Chart1.BottomAxis.Marks.Format of
       '%:.0f%': Form6.Edit2.Caption:=InttoStr(0);
       '%:.1f%': Form6.Edit2.Caption:=InttoStr(1);
       '%:.2f%': Form6.Edit2.Caption:=InttoStr(2);
       '%:.3f%': Form6.Edit2.Caption:=InttoStr(3);
       '%:.4f%': Form6.Edit2.Caption:=InttoStr(4);
  else
       Form6.Edit1.Caption:=InttoStr(6);
  end;
  Form6.Edit3.Caption:= InttoStr(Form1.Chart1.LeftAxis.Intervals.MaxLength);
  Form6.Edit4.Caption:= InttoStr(Form1.Chart1.BottomAxis.Intervals.MaxLength);
  Form6.Show;

end;

end.

