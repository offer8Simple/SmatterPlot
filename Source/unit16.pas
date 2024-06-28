unit Unit16;
// Project: SmatterPlot
// unit16 = rename one dataset form
{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm16 }

  TForm16 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form16: TForm16;

implementation
uses
  Unit1, Unit15;

{$R *.lfm}

{ TForm16 }

procedure TForm16.Button1Click(Sender: TObject);
var
  i: integer;
  olddataset: integer;

begin
  // click Rename Dataset
  Form16.Hide;

  for i:= 0 to Form1.StringGrid1.RowCount -1 do
  begin
    if Form1.StringGrid1.Cells[2,i] = Form16.Label2.Caption then
       Form1.StringGrid1.Cells[2,i]:= Form16.Edit1.Caption;
  end;
  Form1.Button4.Click;

  // update Form15
  olddataset:= StrtoInt(Form1.StringGrid1.Cells[1,1]);
  Form15.ListBox1.Clear;
  Form15.ListBox1.Items.Add(Form1.StringGrid1.Cells[2,1]);
  for i:= 1 to Form1.StringGrid1.RowCount-1 do
  begin
    if StrtoInt(Form1.StringGrid1.Cells[1,i]) <> olddataset then
    begin
       Form15.ListBox1.Items.Add(Form1.StringGrid1.Cells[2,i]);
       olddataset:= StrtoInt(Form1.StringGrid1.Cells[1,i]);
    end;
  end;

end;

end.

