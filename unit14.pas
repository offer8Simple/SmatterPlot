unit Unit14;
// Project: SmatterPlot
// unit14 = Error bars form
{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons, TATransformations, TASeries, TAGraph, TATypes;

type

  { TForm14 }

  TForm14 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form14: TForm14;

implementation
uses
  Unit1;

{$R *.lfm}

{ TForm14 }

procedure TForm14.Button1Click(Sender: TObject);
var
  i: integer;
  j: integer;
  theseriesname: String;

begin
  //Click Update
  for i:= 0 to Form14.ListBox1.Items.Count-1 do
  begin
      for j:= 0 to Form1.Chart1.Series.Count-1 do
      begin
           theseriesname:= TLineSeries(Form1.Chart1.Series[j]).Title;
           if Form14.ListBox1.Items[i] = theseriesname then
           begin
                if Form14.ListBox1.Selected[i] = true then
                   TLineSeries(Form1.Chart1.Series[j]).YErrorBars.Visible:= true;
                   TLineSeries(Form1.Chart1.Series[j]).YErrorBars.Width:= -1;
                   TLineSeries(Form1.Chart1.Series[j]).YErrorBars.Pen.Color:=clBlack;
                   ShowMessage('Error Bars Visible');
           end;
      end;
  end;

  Form14.Hide;

end;

end.

