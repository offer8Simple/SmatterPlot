unit Unit10;
// Project: SmatterPlot
// unit10 = Legend form
{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  TALegend;

type

  { TForm10 }

  TForm10 = class(TForm)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    Shape1: TShape;
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure RadioButton1Change(Sender: TObject);
    procedure RadioButton2Change(Sender: TObject);
    procedure RadioButton3Change(Sender: TObject);
    procedure RadioButton4Change(Sender: TObject);
    procedure RadioButton5Change(Sender: TObject);
    procedure RadioButton6Change(Sender: TObject);
    procedure RadioButton7Change(Sender: TObject);
    procedure RadioButton8Change(Sender: TObject);

  private

  public

  end;

var
  Form10: TForm10;

implementation
uses
  unit1;

{$R *.lfm}

{ TForm10 }

procedure TForm10.CheckBox1Change(Sender: TObject);
begin
    // Show Legend check box changed
  if Form10.CheckBox1.Checked = true then
     Form1.Chart1.Legend.Visible:= true;
  if Form10.CheckBox1.Checked = false then
     Form1.Chart1.Legend.Visible:= false;
end;

procedure TForm10.CheckBox2Change(Sender: TObject);
begin
  // Use Sidebar checkbox
  if Form10.CheckBox2.Checked = true then
    Form1.Chart1.Legend.UseSidebar:= true
  else
    Form1.Chart1.Legend.UseSidebar:= false;
end;

procedure TForm10.RadioButton1Change(Sender: TObject);
begin
    // Radio button change
  if Form10.RadioButton1.Checked= true then
     Form1.chart1.legend.Alignment:=laTopRight;
  if Form10.RadioButton2.Checked= true then
     Form1.chart1.legend.Alignment:=laCenterRight;
  if Form10.RadioButton3.Checked= true then
     Form1.chart1.legend.Alignment:=laBottomRight;
  if Form10.RadioButton4.Checked= true then
     Form1.chart1.legend.Alignment:=laBottomCenter;
  if Form10.RadioButton5.Checked= true then
     Form1.chart1.legend.Alignment:=laBottomLeft;
  if Form10.RadioButton6.Checked= true then
     Form1.chart1.legend.Alignment:=laCenterLeft;
  if Form10.RadioButton7.Checked= true then
     Form1.chart1.legend.Alignment:=laTopLeft;
  if Form10.RadioButton8.Checked= true then
     Form1.chart1.legend.Alignment:=laTopCenter;

end;

procedure TForm10.RadioButton2Change(Sender: TObject);
begin
    // Radio button change
  if Form10.RadioButton1.Checked= true then
     Form1.chart1.legend.Alignment:=laTopRight;
  if Form10.RadioButton2.Checked= true then
     Form1.chart1.legend.Alignment:=laCenterRight;
  if Form10.RadioButton3.Checked= true then
     Form1.chart1.legend.Alignment:=laBottomRight;
  if Form10.RadioButton4.Checked= true then
     Form1.chart1.legend.Alignment:=laBottomCenter;
  if Form10.RadioButton5.Checked= true then
     Form1.chart1.legend.Alignment:=laBottomLeft;
  if Form10.RadioButton6.Checked= true then
     Form1.chart1.legend.Alignment:=laCenterLeft;
  if Form10.RadioButton7.Checked= true then
     Form1.chart1.legend.Alignment:=laTopLeft;
  if Form10.RadioButton8.Checked= true then
     Form1.chart1.legend.Alignment:=laTopCenter;
end;

procedure TForm10.RadioButton3Change(Sender: TObject);
begin
  // Radio button change
  if Form10.RadioButton1.Checked= true then
     Form1.chart1.legend.Alignment:=laTopRight;
  if Form10.RadioButton2.Checked= true then
     Form1.chart1.legend.Alignment:=laCenterRight;
  if Form10.RadioButton3.Checked= true then
     Form1.chart1.legend.Alignment:=laBottomRight;
  if Form10.RadioButton4.Checked= true then
     Form1.chart1.legend.Alignment:=laBottomCenter;
  if Form10.RadioButton5.Checked= true then
     Form1.chart1.legend.Alignment:=laBottomLeft;
  if Form10.RadioButton6.Checked= true then
     Form1.chart1.legend.Alignment:=laCenterLeft;
  if Form10.RadioButton7.Checked= true then
     Form1.chart1.legend.Alignment:=laTopLeft;
  if Form10.RadioButton8.Checked= true then
     Form1.chart1.legend.Alignment:=laTopCenter;

end;

procedure TForm10.RadioButton4Change(Sender: TObject);
begin
    // Radio button change
  if Form10.RadioButton1.Checked= true then
     Form1.chart1.legend.Alignment:=laTopRight;
  if Form10.RadioButton2.Checked= true then
     Form1.chart1.legend.Alignment:=laCenterRight;
  if Form10.RadioButton3.Checked= true then
     Form1.chart1.legend.Alignment:=laBottomRight;
  if Form10.RadioButton4.Checked= true then
     Form1.chart1.legend.Alignment:=laBottomCenter;
  if Form10.RadioButton5.Checked= true then
     Form1.chart1.legend.Alignment:=laBottomLeft;
  if Form10.RadioButton6.Checked= true then
     Form1.chart1.legend.Alignment:=laCenterLeft;
  if Form10.RadioButton7.Checked= true then
     Form1.chart1.legend.Alignment:=laTopLeft;
  if Form10.RadioButton8.Checked= true then
     Form1.chart1.legend.Alignment:=laTopCenter;
end;

procedure TForm10.RadioButton5Change(Sender: TObject);
begin
    // Radio button change
  if Form10.RadioButton1.Checked= true then
     Form1.chart1.legend.Alignment:=laTopRight;
  if Form10.RadioButton2.Checked= true then
     Form1.chart1.legend.Alignment:=laCenterRight;
  if Form10.RadioButton3.Checked= true then
     Form1.chart1.legend.Alignment:=laBottomRight;
  if Form10.RadioButton4.Checked= true then
     Form1.chart1.legend.Alignment:=laBottomCenter;
  if Form10.RadioButton5.Checked= true then
     Form1.chart1.legend.Alignment:=laBottomLeft;
  if Form10.RadioButton6.Checked= true then
     Form1.chart1.legend.Alignment:=laCenterLeft;
  if Form10.RadioButton7.Checked= true then
     Form1.chart1.legend.Alignment:=laTopLeft;
  if Form10.RadioButton8.Checked= true then
     Form1.chart1.legend.Alignment:=laTopCenter;
end;

procedure TForm10.RadioButton6Change(Sender: TObject);
begin
    // Radio button change
  if Form10.RadioButton1.Checked= true then
     Form1.chart1.legend.Alignment:=laTopRight;
  if Form10.RadioButton2.Checked= true then
     Form1.chart1.legend.Alignment:=laCenterRight;
  if Form10.RadioButton3.Checked= true then
     Form1.chart1.legend.Alignment:=laBottomRight;
  if Form10.RadioButton4.Checked= true then
     Form1.chart1.legend.Alignment:=laBottomCenter;
  if Form10.RadioButton5.Checked= true then
     Form1.chart1.legend.Alignment:=laBottomLeft;
  if Form10.RadioButton6.Checked= true then
     Form1.chart1.legend.Alignment:=laCenterLeft;
  if Form10.RadioButton7.Checked= true then
     Form1.chart1.legend.Alignment:=laTopLeft;
  if Form10.RadioButton8.Checked= true then
     Form1.chart1.legend.Alignment:=laTopCenter;
end;

procedure TForm10.RadioButton7Change(Sender: TObject);
begin
    // Radio button change
  if Form10.RadioButton1.Checked= true then
     Form1.chart1.legend.Alignment:=laTopRight;
  if Form10.RadioButton2.Checked= true then
     Form1.chart1.legend.Alignment:=laCenterRight;
  if Form10.RadioButton3.Checked= true then
     Form1.chart1.legend.Alignment:=laBottomRight;
  if Form10.RadioButton4.Checked= true then
     Form1.chart1.legend.Alignment:=laBottomCenter;
  if Form10.RadioButton5.Checked= true then
     Form1.chart1.legend.Alignment:=laBottomLeft;
  if Form10.RadioButton6.Checked= true then
     Form1.chart1.legend.Alignment:=laCenterLeft;
  if Form10.RadioButton7.Checked= true then
     Form1.chart1.legend.Alignment:=laTopLeft;
  if Form10.RadioButton8.Checked= true then
     Form1.chart1.legend.Alignment:=laTopCenter;
end;

procedure TForm10.RadioButton8Change(Sender: TObject);
begin
  // Radio button change
  if Form10.RadioButton1.Checked= true then
     Form1.chart1.legend.Alignment:=laTopRight;
  if Form10.RadioButton2.Checked= true then
     Form1.chart1.legend.Alignment:=laCenterRight;
  if Form10.RadioButton3.Checked= true then
     Form1.chart1.legend.Alignment:=laBottomRight;
  if Form10.RadioButton4.Checked= true then
     Form1.chart1.legend.Alignment:=laBottomCenter;
  if Form10.RadioButton5.Checked= true then
     Form1.chart1.legend.Alignment:=laBottomLeft;
  if Form10.RadioButton6.Checked= true then
     Form1.chart1.legend.Alignment:=laCenterLeft;
  if Form10.RadioButton7.Checked= true then
     Form1.chart1.legend.Alignment:=laTopLeft;
  if Form10.RadioButton8.Checked= true then
     Form1.chart1.legend.Alignment:=laTopCenter;
end;



end.

