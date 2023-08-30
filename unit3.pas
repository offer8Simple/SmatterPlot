unit Unit3;
// Project: SmatterPlot
// unit3 = titles form

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons, TATransformations, TASeries, TAGraph, TATypes;
type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    Edit1: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
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
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
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
    procedure CheckBox10Change(Sender: TObject);
    procedure CheckBox11Change(Sender: TObject);
    procedure CheckBox12Change(Sender: TObject);
    procedure CheckBox13Change(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure CheckBox3Change(Sender: TObject);
    procedure CheckBox4Change(Sender: TObject);
    procedure CheckBox5Change(Sender: TObject);
    procedure CheckBox6Change(Sender: TObject);
    procedure CheckBox7Change(Sender: TObject);
    procedure CheckBox8Change(Sender: TObject);
    procedure CheckBox9Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form3: TForm3;

implementation

{$R *.lfm}
uses
    unit1;

{ TForm3 }

procedure TForm3.Button1Click(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Gets text from form and renames titles in the chart
  Form1.Chart1.Title.Text.Strings[0]:= Form3.Edit1.Caption;
  Form1.Chart1.LeftAxis.Title.Caption:= Form3.Edit2.Caption;
  Form1.Chart1.BottomAxis.Title.Caption:= Form3.Edit3.Caption;
  myChartTitle:= Form3.Edit1.Caption;
  myYAxisTitle:= Form3.Edit2.Caption;
  myXAxisTitle:= Form3.Edit3.Caption;

  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     if j=0 then TLineSeries(Form1.Chart1.Series[j]).Title := Form3.Edit4.Caption;
     if j=1 then TLineSeries(Form1.Chart1.Series[j]).Title := Form3.Edit5.Caption;
     if j=2 then TLineSeries(Form1.Chart1.Series[j]).Title := Form3.Edit6.Caption;
     if j=3 then TLineSeries(Form1.Chart1.Series[j]).Title := Form3.Edit7.Caption;
     if j=4 then TLineSeries(Form1.Chart1.Series[j]).Title := Form3.Edit8.Caption;
     if j=5 then TLineSeries(Form1.Chart1.Series[j]).Title := Form3.Edit9.Caption;
     if j=6 then TLineSeries(Form1.Chart1.Series[j]).Title := Form3.Edit10.Caption;
     if j=7 then TLineSeries(Form1.Chart1.Series[j]).Title := Form3.Edit11.Caption;
     if j=8 then TLineSeries(Form1.Chart1.Series[j]).Title := Form3.Edit12.Caption;
     if j=9 then TLineSeries(Form1.Chart1.Series[j]).Title := Form3.Edit13.Caption;

  end;

  Form3.Hide;

end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  Form3.Hide;

end;

procedure TForm3.CheckBox10Change(Sender: TObject);
begin
    // Changed Series7 checkbox
  if Form3.CheckBox10.Checked = true then
     TLineSeries(Form1.Chart1.Series[6]).ShowInLegend:= true;
  if Form3.CheckBox10.Checked = false then
     TLineSeries(Form1.Chart1.Series[6]).ShowInLegend:= false;
end;

procedure TForm3.CheckBox11Change(Sender: TObject);
begin
    // Changed Series8 checkbox
  if Form3.CheckBox11.Checked = true then
     TLineSeries(Form1.Chart1.Series[7]).ShowInLegend:= true;
  if Form3.CheckBox11.Checked = false then
     TLineSeries(Form1.Chart1.Series[7]).ShowInLegend:= false;
end;

procedure TForm3.CheckBox12Change(Sender: TObject);
begin
    // Changed Series9 checkbox
  if Form3.CheckBox12.Checked = true then
     TLineSeries(Form1.Chart1.Series[8]).ShowInLegend:= true;
  if Form3.CheckBox12.Checked = false then
     TLineSeries(Form1.Chart1.Series[8]).ShowInLegend:= false;
end;

procedure TForm3.CheckBox13Change(Sender: TObject);
begin
    // Changed Series10 checkbox
  if Form3.CheckBox13.Checked = true then
     TLineSeries(Form1.Chart1.Series[9]).ShowInLegend:= true;
  if Form3.CheckBox13.Checked = false then
     TLineSeries(Form1.Chart1.Series[9]).ShowInLegend:= false;
end;

procedure TForm3.CheckBox1Change(Sender: TObject);
begin
  // Changed Chart Title checkbox
  if Form3.CheckBox1.Checked = true then
     Form1.Chart1.Title.Visible:= true;
  if Form3.CheckBox1.Checked = false then
     Form1.Chart1.Title.Visible:= false;
end;

procedure TForm3.CheckBox2Change(Sender: TObject);
begin
  // Changed Y-Axis Title checkbox
  if Form3.CheckBox2.Checked = true then
     Form1.Chart1.LeftAxis.Title.Visible:= true;
  if Form3.CheckBox2.Checked = false then
     Form1.Chart1.LeftAxis.Title.Visible:= false;
end;

procedure TForm3.CheckBox3Change(Sender: TObject);
begin
  // Changed X-Axis Title checkbox
  if Form3.CheckBox3.Checked = true then
     Form1.Chart1.BottomAxis.Title.Visible:= true;
  if Form3.CheckBox3.Checked = false then
     Form1.Chart1.BottomAxis.Title.Visible:= false;
end;

procedure TForm3.CheckBox4Change(Sender: TObject);
begin
  // Changed Series1 checkbox
  if Form3.CheckBox4.Checked = true then
     TLineSeries(Form1.Chart1.Series[0]).ShowInLegend:= true;
  if Form3.CheckBox4.Checked = false then
     TLineSeries(Form1.Chart1.Series[0]).ShowInLegend:= false;
end;

procedure TForm3.CheckBox5Change(Sender: TObject);
begin
  // Changed Series2 checkbox
  if Form3.CheckBox5.Checked = true then
     TLineSeries(Form1.Chart1.Series[1]).ShowInLegend:= true;
  if Form3.CheckBox5.Checked = false then
     TLineSeries(Form1.Chart1.Series[1]).ShowInLegend:= false;
end;

procedure TForm3.CheckBox6Change(Sender: TObject);
begin
  // Changed Series3 checkbox
  if Form3.CheckBox6.Checked = true then
     TLineSeries(Form1.Chart1.Series[2]).ShowInLegend:= true;
  if Form3.CheckBox6.Checked = false then
     TLineSeries(Form1.Chart1.Series[2]).ShowInLegend:= false;
end;

procedure TForm3.CheckBox7Change(Sender: TObject);
begin
    // Changed Series4 checkbox
  if Form3.CheckBox7.Checked = true then
     TLineSeries(Form1.Chart1.Series[3]).ShowInLegend:= true;
  if Form3.CheckBox7.Checked = false then
     TLineSeries(Form1.Chart1.Series[3]).ShowInLegend:= false;
end;

procedure TForm3.CheckBox8Change(Sender: TObject);
begin
    // Changed Series5 checkbox
  if Form3.CheckBox8.Checked = true then
     TLineSeries(Form1.Chart1.Series[4]).ShowInLegend:= true;
  if Form3.CheckBox8.Checked = false then
     TLineSeries(Form1.Chart1.Series[4]).ShowInLegend:= false;
end;

procedure TForm3.CheckBox9Change(Sender: TObject);
begin
    // Changed Series6 checkbox
  if Form3.CheckBox9.Checked = true then
     TLineSeries(Form1.Chart1.Series[5]).ShowInLegend:= true;
  if Form3.CheckBox9.Checked = false then
     TLineSeries(Form1.Chart1.Series[5]).ShowInLegend:= false;
end;

procedure TForm3.FormActivate(Sender: TObject);

var
  snum: integer;
  j: integer;

begin
  // Gets titles from the chart and adds them to the form on activation
  Form3.Edit1.Caption:= Form1.Chart1.Title.Text.Strings[0];
  Form3.Edit2.Caption:= Form1.Chart1.LeftAxis.Title.Caption;
  Form3.Edit3.Caption:= Form1.Chart1.BottomAxis.Title.Caption;
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     if j=0 then Form3.Edit4.Caption:= TLineSeries(Form1.Chart1.Series[j]).Title;
     if j=1 then Form3.Edit5.Caption:= TLineSeries(Form1.Chart1.Series[j]).Title;
     if j=2 then Form3.Edit6.Caption:= TLineSeries(Form1.Chart1.Series[j]).Title;
     if j=3 then Form3.Edit7.Caption:= TLineSeries(Form1.Chart1.Series[j]).Title;
     if j=4 then Form3.Edit8.Caption:= TLineSeries(Form1.Chart1.Series[j]).Title;
     if j=5 then Form3.Edit9.Caption:= TLineSeries(Form1.Chart1.Series[j]).Title;
     if j=6 then Form3.Edit10.Caption:= TLineSeries(Form1.Chart1.Series[j]).Title;
     if j=7 then Form3.Edit11.Caption:= TLineSeries(Form1.Chart1.Series[j]).Title;
     if j=8 then Form3.Edit12.Caption:= TLineSeries(Form1.Chart1.Series[j]).Title;
     if j=9 then Form3.Edit13.Caption:= TLineSeries(Form1.Chart1.Series[j]).Title;
  end;
  for j := snum to 9 do
  begin
     if j=0 then Form3.Edit4.Caption:= '[None]';
     if j=1 then Form3.Edit5.Caption:= '[None]';
     if j=2 then Form3.Edit6.Caption:= '[None]';
     if j=3 then Form3.Edit7.Caption:= '[None]';
     if j=4 then Form3.Edit8.Caption:= '[None]';
     if j=5 then Form3.Edit9.Caption:= '[None]';
     if j=6 then Form3.Edit10.Caption:= '[None]';
     if j=7 then Form3.Edit11.Caption:= '[None]';
     if j=8 then Form3.Edit12.Caption:= '[None]';
     if j=9 then Form3.Edit13.Caption:= '[None]';

  end;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin

end;

end.

