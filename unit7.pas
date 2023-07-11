unit Unit7;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm7 }

  TForm7 = class(TForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
  private

  public

  end;

var
  Form7: TForm7;

implementation
uses
    unit1;
{$R *.lfm}

{ TForm7 }

procedure TForm7.Edit1Change(Sender: TObject);
begin
   // Change Y-Axis Max
  //Form1.Chart1.LeftAxis.Range.UseMax:= true;
  //Form1.Chart1.LeftAxis.Range.Max:= StrtoFloat(Form7.Edit1.Caption);
end;

procedure TForm7.Button1Click(Sender: TObject);
begin
  // click Update
  if Form7.CheckBox1.Checked = false then
  begin
       Form1.Chart1.LeftAxis.Range.UseMax:= true;
       Form1.Chart1.LeftAxis.Range.Max:= StrtoFloat(Form7.Edit1.Caption);
  end;
  if Form7.CheckBox1.Checked = true then
  begin
    Form1.Chart1.LeftAxis.Range.UseMax:= false;
    Form7.Edit1.Caption:=FloattoStr(Form1.Chart1.CurrentExtent.b.y);
  end;
  if Form7.CheckBox2.Checked = false then
  begin
       Form1.Chart1.LeftAxis.Range.UseMin:= true;
       Form1.Chart1.LeftAxis.Range.Min:= StrtoFloat(Form7.Edit2.Caption);
  end;
  if Form7.CheckBox2.Checked = true then
  begin
    Form1.Chart1.LeftAxis.Range.UseMin:= false;
    Form7.Edit2.Caption:=FloattoStr(Form1.Chart1.CurrentExtent.a.y);
  end;
  if Form7.CheckBox3.Checked = false then
  begin
       Form1.Chart1.BottomAxis.Range.UseMax:= true;
       Form1.Chart1.BottomAxis.Range.Max:= StrtoFloat(Form7.Edit3.Caption);
  end;
  if Form7.CheckBox3.Checked = true then
  begin
    Form1.Chart1.BottomAxis.Range.UseMax:= false;
    Form7.Edit3.Caption:=FloattoStr(Form1.Chart1.CurrentExtent.b.x);
  end;
  if Form7.CheckBox4.Checked = false then
  begin
       Form1.Chart1.BottomAxis.Range.UseMin:= true;
       Form1.Chart1.BottomAxis.Range.Min:= StrtoFloat(Form7.Edit4.Caption);
  end;
  if Form7.CheckBox4.Checked = true then
  begin
    Form1.Chart1.BottomAxis.Range.UseMin:= false;
    Form7.Edit4.Caption:=FloattoStr(Form1.Chart1.CurrentExtent.a.x);
  end;
end;

procedure TForm7.CheckBox1Change(Sender: TObject);
begin
  // Y-axis Max auto checkbox clicked.


end;

procedure TForm7.CheckBox2Change(Sender: TObject);
begin

end;

procedure TForm7.Edit2Change(Sender: TObject);
begin
  // Change Y-Axis Min
  //Form1.Chart1.LeftAxis.Range.UseMin:= true;
  //Form1.Chart1.LeftAxis.Range.Min:= StrtoFloat(Form7.Edit2.Caption);
end;

procedure TForm7.Edit3Change(Sender: TObject);
begin
    // Change X-Axis Max
  //Form1.Chart1.BottomAxis.Range.UseMax:= true;
  //Form1.Chart1.BottomAxis.Range.Max:= StrtoFloat(Form7.Edit3.Caption);
end;

procedure TForm7.Edit4Change(Sender: TObject);
begin
  // Change X-Axis Min
  //Form1.Chart1.BottomAxis.Range.UseMin:= true;
  //Form1.Chart1.BottomAxis.Range.Min:= StrtoFloat(Form7.Edit4.Caption);
end;

end.

