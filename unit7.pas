unit Unit7;
// Project: SmatterPlot
// unit7 = scaling form
{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  math;

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
    Edit5: TEdit;
    Edit6: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
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

  YTickNum:= StrtoInt(Form7.Edit5.Caption);
  XTickNum:= StrtoInt(Form7.Edit6.Caption);

  if Form7.CheckBox1.Checked = false then
  begin
       Form1.Chart1.LeftAxis.Range.UseMax:= true;
       ymaxglob:= StrtoFloat(Form7.Edit1.Caption);
       if Form1.Chart1.LeftAxis.Transformations=Form1.ChartAxisTransformations1 then // Log scale
          Form1.Chart1.LeftAxis.Range.Max:= Log10(StrtoFloat(Form7.Edit1.Caption))
       else
          Form1.Chart1.LeftAxis.Range.Max:= StrtoFloat(Form7.Edit1.Caption);
       ymaxauto:= false;
  end;
  if Form7.CheckBox1.Checked = true then
  begin
    Form1.Chart1.LeftAxis.Range.UseMax:= false;
    //Form7.Edit1.Caption:=FloattoStr(Form1.Chart1.CurrentExtent.b.y);
    ymaxauto:= true;
  end;
  if Form7.CheckBox2.Checked = false then
  begin
       Form1.Chart1.LeftAxis.Range.UseMin:= true;
       yminglob:= StrtoFloat(Form7.Edit2.Caption);
       if Form1.Chart1.LeftAxis.Transformations=Form1.ChartAxisTransformations1 then // Log scale
          Form1.Chart1.LeftAxis.Range.Min:= Log10(StrtoFloat(Form7.Edit2.Caption))
       else
          Form1.Chart1.LeftAxis.Range.Min:= StrtoFloat(Form7.Edit2.Caption);;
       yminauto:= false;
       //showmessage(FloattoStr(Form1.Chart1.LeftAxis.Range.Min));
  end;
  if Form7.CheckBox2.Checked = true then
  begin
    Form1.Chart1.LeftAxis.Range.UseMin:= false;
    //Form7.Edit2.Caption:=FloattoStr(Form1.Chart1.CurrentExtent.a.y);
    yminauto:= true;
  end;
  if Form7.CheckBox3.Checked = false then
  begin
       Form1.Chart1.BottomAxis.Range.UseMax:= true;
       xmaxglob:= StrtoFloat(Form7.Edit3.Caption);
       if Form1.Chart1.BottomAxis.Transformations=Form1.ChartAxisTransformations1 then // Log scale
          Form1.Chart1.BottomAxis.Range.Max:= Log10(StrtoFloat(Form7.Edit3.Caption))
       else
          Form1.Chart1.BottomAxis.Range.Max:= StrtoFloat(Form7.Edit3.Caption);
       xmaxauto:= false;
  end;
  if Form7.CheckBox3.Checked = true then
  begin
    Form1.Chart1.BottomAxis.Range.UseMax:= false;
    //Form7.Edit3.Caption:=FloattoStr(Form1.Chart1.CurrentExtent.b.x);
    xmaxauto:= true;
  end;
  if Form7.CheckBox4.Checked = false then
  begin
       Form1.Chart1.BottomAxis.Range.UseMin:= true;
       xminglob:= StrtoFloat(Form7.Edit4.Caption);
       if Form1.Chart1.BottomAxis.Transformations=Form1.ChartAxisTransformations1 then // Log scale
          Form1.Chart1.BottomAxis.Range.Min:= Log10(StrtoFloat(Form7.Edit4.Caption))
       else
          Form1.Chart1.BottomAxis.Range.Min:= StrtoFloat(Form7.Edit4.Caption);
       xminauto:= false;
  end;
  if Form7.CheckBox4.Checked = true then
  begin
    Form1.Chart1.BottomAxis.Range.UseMin:= false;
    //Form7.Edit4.Caption:=FloattoStr(Form1.Chart1.CurrentExtent.a.x);
    xminauto:= true;
  end;
  Form1.Button4.Click;

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

