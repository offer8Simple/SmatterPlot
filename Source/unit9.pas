unit Unit9;
// Project: SmatterPlot
// unit9 = select variables form
{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls,
  ComCtrls, Menus, ExtDlgs, TAGraph, TATypes, TASeries, LCLType,
  TATransformations, Clipbrd, Grids, TADrawUtils, TATools;

type

  { TForm9 }

  TForm9 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form9: TForm9;

implementation
uses
    unit1;

{$R *.lfm}

{ TForm9 }

procedure TForm9.Button1Click(Sender: TObject);
var
  i: integer;
  j: integer;
  snum: integer;
  datasetnum: integer;
  newseries: TLineSeries;
  x: double;
  y: double;

begin
  // Click Update Button

  //find variable columns
  for i:= 0 to Form1.StringGrid1.ColCount-1 do
  begin

     if Form9.ComboBox1.Caption = Form1.StringGrid1.Cells[i,0] then
     begin
        ycol:= i;
        myYAxisTitle:= Form9.ComboBox1.Caption

     end;
     if Form9.ComboBox2.Caption = Form1.StringGrid1.Cells[i,0] then
     begin
        xcol:= i;
        myXAxisTitle:= Form9.ComboBox2.Caption


     end;
  end;
  Form1.RebuildChart();


end;

end.

