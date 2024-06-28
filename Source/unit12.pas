unit Unit12;
// Project: SmatterPlot
// unit12 = close datasets form
{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
    ExtCtrls, Buttons, TATransformations, TASeries, TAGraph, TATypes;

type

  { TForm12 }

  TForm12 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form12: TForm12;

implementation
uses
  unit1;


{$R *.lfm}

{ TForm12 }

procedure TForm12.Button1Click(Sender: TObject);
var
  snum: integer;
  datasetnum: integer;
  rownum: integer;
  i: integer;
  j: integer;
  k: longint;
  thedataset: String;

begin
  // Close Selected Datasets
  datasetnum:= Form12.ListBox1.Items.Count;


  for i:= 0 to datasetnum-1 do
  begin
    if Form12.ListBox1.Selected[i] = true then
    thedataset:= Form12.ListBox1.Items[i];
    begin
      if datasetnum < 2 then //close all
      begin
        snum := Form1.Chart1.Series.Count;
        for j := 0 to snum-1 do
        begin
           TLineSeries(Form1.Chart1.Series[0]).Destroy;
        end;
        Form1.StringGrid1.Clear;
      end
      else   // two or more datasets are open --> check which ones to close
      begin
        snum := Form1.Chart1.Series.Count;
        rownum := Form1.StringGrid1.RowCount;
        j:=0;
        while j < snum do
        begin
           if TLineSeries(Form1.Chart1.Series[j]).Title = thedataset then
           begin
              TLineSeries(Form1.Chart1.Series[j]).Destroy;
              snum:= snum-1;
              j:=j-1;
           end;
           j:=j+1;
        end;
        for k:= rownum-1 downto 1 do
        begin
           if Form1.StringGrid1.Cells[2,k] = thedataset then
              Form1.StringGrid1.DeleteRow(k);
        end;

      end;


    end;
  end;
  if Form1.StringGrid1.RowCount < 2 then
     mydatasets:=0;
  Form12.Hide;

end;

procedure TForm12.Button2Click(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Close All
  snum := Form1.Chart1.Series.Count;
  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[0]).Destroy;
  end;
  Form1.StringGrid1.Clear;
  Form12.Hide;

end;

end.

