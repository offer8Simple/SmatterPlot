unit Unit17;
// Project: SmatterPlot
// unit17 = combine datasets form
{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm17 }

  TForm17 = class(TForm)
    Label1: TLabel;
    ListBox1: TListBox;
    ToggleBox3: TToggleBox;
    procedure ToggleBox3Change(Sender: TObject);
  private

  public

  end;

var
  Form17: TForm17;

implementation
uses
  unit1;


{$R *.lfm}

{ TForm17 }

procedure TForm17.ToggleBox3Change(Sender: TObject);
var
  i: longint;
  j: longint;
  k: longint;
  rownum: longint;
  rnum: longint;
  cnum: integer;

  datasetnum: integer;
  firstselected: integer;
  newname: String;
  olddataset: integer;

begin
  // Click Combine
  datasetnum:= Form17.ListBox1.Items.Count;
  firstselected:=0;
  rownum := Form1.StringGrid1.RowCount;

  for i:= 0 to datasetnum-1 do
  begin
    if Form17.ListBox1.Selected[i] = true then
    begin
      if firstselected = 0 then
      begin
        firstselected:= i+1;
        newname:=  Form17.ListBox1.Items[i] + '(Combined)';
      end;

      for k:= 1 to rownum-1 do
      begin
           if Form1.StringGrid1.Cells[2,k] = Form17.ListBox1.Items[i] then
           begin
              Form1.StringGrid1.Cells[1,k]:= InttoStr(firstselected);
              Form1.StringGrid1.Cells[2,k]:= newname;
           end;
      end;
    end;
  end;


    // BubbleSort Rows by dataset number
  rnum:= Form1.StringGrid1.RowCount;
  cnum:= Form1.StringGrid1.ColCount;

  Form1.StringGrid1.RowCount:= rnum +1;
  For i:= 2 to rnum -1 do
  begin
      For j:= 1 to rnum - i do
      begin
        if Form1.StringGrid1.Cells[1,j] > Form1.StringGrid1.Cells[1,j+1] then
        begin
          for k:= 0 to cnum-1 do
          begin
               Form1.StringGrid1.Cells[k,rnum]:= Form1.StringGrid1.Cells[k,j];
               Form1.StringGrid1.Cells[k,j]:= Form1.StringGrid1.Cells[k,j+1];
               Form1.StringGrid1.Cells[k,j+1]:= Form1.StringGrid1.Cells[k,rnum];
          end;
        end;
      end;
  end;
  Form1.StringGrid1.DeleteColRow(False, rnum);

  //--------------------------


   //ShowMessage('pause here');
  // Repopulate the listbox
  olddataset:= StrtoInt(Form1.StringGrid1.Cells[1,1]);
  Form17.ListBox1.Clear;
  Form17.ListBox1.Items.Add(Form1.StringGrid1.Cells[2,1]);
  for i:= 1 to Form1.StringGrid1.RowCount-1 do
  begin
    if StrtoInt(Form1.StringGrid1.Cells[1,i]) <> olddataset then
    begin
       Form17.ListBox1.Items.Add(Form1.StringGrid1.Cells[2,i]);
       olddataset:= StrtoInt(Form1.StringGrid1.Cells[1,i]);
    end;
  end;


  Form1.Button4.Click; // Update Chart

  //Form17.Hide;


end;

end.

