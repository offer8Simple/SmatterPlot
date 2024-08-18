unit Unit11;
// Project: SmatterPlot
// unit11 = sort datasets form
{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm11 }

  TForm11 = class(TForm)
    Label1: TLabel;
    ListBox1: TListBox;
    Shape1: TShape;
    Shape2: TShape;
    ToggleBox1: TToggleBox;
    ToggleBox2: TToggleBox;
    ToggleBox3: TToggleBox;
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Shape2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    procedure ToggleBox1Click(Sender: TObject);


    procedure ToggleBox3Click(Sender: TObject);
  private

  public

  end;

var
  Form11: TForm11;

implementation
uses
  Unit1;

{$R *.lfm}

{ TForm11 }

procedure TForm11.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  i: integer;
  myswap: String;

begin
  // Click Up Button
  If Form11.ListBox1.SelCount > 0 then
  begin
    For i:= 1 to ListBox1.Items.Count -1 do
    begin
      if Form11.ListBox1.Selected[i] = true then
      begin
          myswap:= Form11.ListBox1.Items[i];
          Form11.ListBox1.Items[i]:= Form11.ListBox1.Items[i-1];
          Form11.ListBox1.Items[i-1]:= myswap;
          Form11.ListBox1.Selected[i-1]:= true;
          Form11.ListBox1.Selected[i]:= false;
      end;
    end;


  end;

end;

procedure TForm11.Shape2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  i: integer;
  myswap: String;

begin
  // Click Down Button
  If Form11.ListBox1.SelCount > 0 then
  begin
    For i:= ListBox1.Items.Count -2 downto 0 do
    begin
      if Form11.ListBox1.Selected[i] = true then
      begin
          myswap:= Form11.ListBox1.Items[i];
          Form11.ListBox1.Items[i]:= Form11.ListBox1.Items[i+1];
          Form11.ListBox1.Items[i+1]:= myswap;
          Form11.ListBox1.Selected[i+1]:= true;
          Form11.ListBox1.Selected[i]:= false;
      end;
    end;


  end;
end;



procedure TForm11.ToggleBox1Click(Sender: TObject);
var
  n: integer;
  newn: integer;
  i: integer;
  j: integer;
  myswap: String;

begin
  // Click Sort Alphabetical Button with Bubble Sort

    For i:= 1 to ListBox1.Items.Count -2 do
    begin
      For j:= 0 to ListBox1.Items.Count - i-1 do
      begin
        if ListBox1.Items[j] > ListBox1.Items[j+1] then
        begin
          myswap:= ListBox1.Items[j];
          ListBox1.Items[j]:= ListBox1.Items[j+1];
          ListBox1.Items[j+1]:= myswap;
        end;
      end;
    end;
end;







procedure TForm11.ToggleBox3Click(Sender: TObject);
var
  rnum: longint;
  i: longint;
  j: longint;
  k: integer;
  dnum: longint;
  cnum: integer;
  olddataset: integer;

begin
  // Click Update Chart

  //--------------------------
  rnum:= Form1.StringGrid1.RowCount;
  dnum:= Form11.ListBox1.Items.Count;
  cnum:= Form1.StringGrid1.ColCount;


  // Renumber datasets
  for i:=1 to rnum-1 do
  begin
      for j:=0 to dnum-1 do
      begin
           If Form1.StringGrid1.Cells[2,i] = Form11.ListBox1.Items[j] then
              Form1.StringGrid1.Cells[1,i]:= InttoStr(j+1);
      end;
  end;


  // BubbleSort Rows by dataset number
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



  // Repopulate the listbox
  olddataset:= StrtoInt(Form1.StringGrid1.Cells[1,1]);
  Form11.ListBox1.Clear;
  Form11.ListBox1.Items.Add(Form1.StringGrid1.Cells[2,1]);
  for i:= 1 to Form1.StringGrid1.RowCount-1 do
  begin
    if StrtoInt(Form1.StringGrid1.Cells[1,i]) <> olddataset then
    begin
       Form11.ListBox1.Items.Add(Form1.StringGrid1.Cells[2,i]);
       olddataset:= StrtoInt(Form1.StringGrid1.Cells[1,i]);
    end;
  end;


  Form1.RebuildChart(); // Update Chart
end;

end.

