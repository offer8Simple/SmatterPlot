unit Unit5;
// Project: SmatterPlot
// unit5 = sizes form
{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  ExtCtrls, Buttons, TATransformations, TASeries, TAGraph, TATypes;
type

  { TForm5 }

  TForm5 = class(TForm)
    Edit1: TEdit;
    Edit10: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
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
    UpDown1: TUpDown;
    UpDown10: TUpDown;
    UpDown2: TUpDown;
    UpDown3: TUpDown;
    UpDown4: TUpDown;
    UpDown5: TUpDown;
    UpDown6: TUpDown;
    UpDown7: TUpDown;
    UpDown8: TUpDown;
    UpDown9: TUpDown;
    procedure Edit10Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure Edit9Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private

  public

  end;

var
  Form5: TForm5;

implementation
uses
    unit1;

{$R *.lfm}

{ TForm5 }

procedure TForm5.Label1Click(Sender: TObject);
begin

end;

procedure TForm5.FormActivate(Sender: TObject);
var
  snum: integer;

begin
  // Get sizes and populate form
  Form5.Edit1.Caption := InttoStr(Form1.Chart1.Title.Font.Size);
  Form5.Edit2.Caption := InttoStr(Form1.Chart1.LeftAxis.Title.LabelFont.Size);
  Form5.Edit3.Caption := InttoStr(Form1.Chart1.BottomAxis.Title.LabelFont.Size);
  Form5.Edit6.Caption := InttoStr(Form1.Chart1.Height);
  Form5.Edit7.Caption := InttoStr(Form1.Chart1.Width);
  Form5.Edit8.Caption := InttoStr(Form1.Chart1.LeftAxis.Marks.LabelFont.Size);
  Form5.Edit9.Caption := InttoStr(Form1.Chart1.BottomAxis.Marks.LabelFont.Size);
  Form5.Edit10.Caption := InttoStr(Form1.Chart1.Legend.Font.Size);

  snum := Form1.Chart1.Series.Count;
  if snum > 0 then
  begin
    Form5.Edit4.Caption := InttoStr(TLineSeries(Form1.Chart1.Series[0]).Pointer.HorizSize);
    Form5.Edit5.Caption := InttoStr(TLineSeries(Form1.Chart1.Series[0]).LinePen.Width);
  end;



end;

procedure TForm5.Edit1Change(Sender: TObject);
begin
  // change Chart Title Font Size
  myChartTitleFontSize:= StrtoInt(Form5.Edit1.Caption);
  Form1.chart1.title.font.size:= myChartTitleFontSize;

end;

procedure TForm5.Edit10Change(Sender: TObject);
begin
  // change Legend Font Size
  myLegendFontSize:= StrtoInt(Form5.Edit10.Caption);
  Form1.chart1.Legend.Font.Size:= myLegendFontSize;

end;

procedure TForm5.Edit2Change(Sender: TObject);
begin
  // change Y-Axis Title Font Size
  myYAxisTitleFontSize:= StrtoInt(Form5.Edit2.Caption);
  Form1.Chart1.LeftAxis.Title.LabelFont.Size:= myYAxisTitleFontSize;

end;

procedure TForm5.Edit3Change(Sender: TObject);
begin
  // change X-Axis Title Font Size
  myXAxisTitleFontSize:= StrtoInt(Form5.Edit3.Caption);
  Form1.Chart1.BottomAxis.Title.LabelFont.Size:= myXAxisTitleFontSize;

end;

procedure TForm5.Edit4Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Change symbol sizes for all series
  snum := Form1.Chart1.Series.Count;
  for j:= 0 to snum -1 do
  begin
    TLineSeries(Form1.Chart1.Series[j]).Pointer.HorizSize:=StrtoInt(Form5.Edit4.Caption);
    TLineSeries(Form1.Chart1.Series[j]).Pointer.VertSize:=StrtoInt(Form5.Edit4.Caption);
  end;

end;

procedure TForm5.Edit5Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Change line widths for all series
  snum := Form1.Chart1.Series.Count;
  for j:= 0 to snum -1 do
  begin
    TLineSeries(Form1.Chart1.Series[j]).LinePen.Width:=StrtoInt(Form5.Edit5.Caption);
  end;
end;

procedure TForm5.Edit6Change(Sender: TObject);
begin
  // change Chart Height
  myChartHeight:= StrtoInt(Form5.Edit6.Caption);
  Form1.Chart1.Height:= myChartHeight;
end;

procedure TForm5.Edit7Change(Sender: TObject);
begin
  // change Chart Width
  myChartWidth:= StrtoInt(Form5.Edit7.Caption);
  Form1.Chart1.Width:= myChartWidth;
end;

procedure TForm5.Edit8Change(Sender: TObject);
begin
  // change Y-Axis Mark Font Size
  myYMarkFontSize:= StrtoInt(Form5.Edit8.Caption);
  Form1.Chart1.LeftAxis.Marks.LabelFont.Size:=myYMarkFontSize;

end;

procedure TForm5.Edit9Change(Sender: TObject);
begin
  // change Y-Axis Mark Font Size
  myXMarkFontSize:= StrtoInt(Form5.Edit9.Caption);
  Form1.Chart1.BottomAxis.Marks.LabelFont.Size:=myXMarkFontSize;
end;

end.

