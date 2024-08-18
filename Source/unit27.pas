unit Unit27;
// Series Colors Form

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ComCtrls, TASeries;

type

  { TForm27 }

  TForm27 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    UpDown3: TUpDown;
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private

  public

  end;

var
  Form27: TForm27;

implementation
uses
  Unit1;

{$R *.lfm}

{ TForm27 }

procedure TForm27.FormActivate(Sender: TObject);
var
  i: integer;

begin
   // Populate form
  Form27.ComboBox1.clear;
  Form27.Edit1.Caption:= '50';
  Form27.Edit2.Caption:= '100';
  Form27.Edit3.Caption:= '150';
  Form27.Shape1.Brush.Color:= RGBtoColor(50, 100, 150);
  Form27.Shape2.Brush.Color:= RGBtoColor(255, 255, 255);

  For i:= 0 to Form1.Chart1.Series.Count-1 do
  begin
      Form27.Combobox1.Items.Add(TLineSeries(Form1.Chart1.Series[i]).Title);
  end;




end;

procedure TForm27.Edit1Change(Sender: TObject);
begin
    // change Edit1
  Form27.Shape1.Brush.Color:= RGBtoColor(
                              StrtoInt(Form27.Edit1.Caption),
                              StrtoInt(Form27.Edit2.Caption),
                              StrtoInt(Form27.Edit3.Caption)
                              );
end;

procedure TForm27.ComboBox1Change(Sender: TObject);
var
  i: integer;
begin
  // combobox1 change
  For i:= 0 to Form1.Chart1.Series.Count-1 do
  begin
      If Form27.Combobox1.Caption = TLineSeries(Form1.Chart1.Series[i]).Title then
         Form27.Shape2.Brush.Color:= mycolors[mycolorsint[i]];
  end;

end;

procedure TForm27.Button1Click(Sender: TObject);
var
  i: integer;

begin
  // click update
  For i:= 0 to Form1.Chart1.Series.Count-1 do
  begin
      If Form27.Combobox1.Caption = TLineSeries(Form1.Chart1.Series[i]).Title then
         begin
           mycolors[i+10]:= RGBtoColor(
                                StrtoInt(Form27.Edit1.Caption),
                                StrtoInt(Form27.Edit2.Caption),
                                StrtoInt(Form27.Edit3.Caption)
                                );
           mycolorsint[i]:= i+10;
         end;
  end;
  Form1.RebuildChart();


end;

procedure TForm27.Edit2Change(Sender: TObject);
begin
    // change Edit2
  Form27.Shape1.Brush.Color:= RGBtoColor(
                              StrtoInt(Form27.Edit1.Caption),
                              StrtoInt(Form27.Edit2.Caption),
                              StrtoInt(Form27.Edit3.Caption)
                              );
end;

procedure TForm27.Edit3Change(Sender: TObject);
begin
    // change Edit3
  Form27.Shape1.Brush.Color:= RGBtoColor(
                              StrtoInt(Form27.Edit1.Caption),
                              StrtoInt(Form27.Edit2.Caption),
                              StrtoInt(Form27.Edit3.Caption)
                              );
end;

end.

