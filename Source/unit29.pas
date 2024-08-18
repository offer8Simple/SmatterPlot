unit Unit29;
// Project: SmatterPlot
// unit29 = Separate Columns into different datasets.
{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm29 }

  TForm29 = class(TForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private

  public

  end;

var
  Form29: TForm29;

implementation
uses
  unit1;

{$R *.lfm}

{ TForm29 }

procedure TForm29.FormActivate(Sender: TObject);
var
  j: integer;

begin
  // On Activate
  Form29.ComboBox1.Clear;
  Form29.ListBox1.Clear;
  Form29.Edit1.Clear;

  for j:= 0 to Form1.StringGrid1.ColCount -1 do
  begin
    Form29.Combobox1.Items.Add(Form1.StringGrid1.Cells[j,0]);
    Form29.Listbox1.Items.Add(Form1.StringGrid1.Cells[j,0]);
    if j= ycol then
       Form29.ListBox1.Selected[j]:= True;

  end;
  Form29.ComboBox1.Caption:= Form1.StringGrid1.Cells[xcol,0];
  Form29.Edit1.Caption:= Form1.StringGrid1.Cells[ycol,0];

end;

procedure TForm29.Button1Click(Sender: TObject);
var
  i: LongInt;
  j: integer;
  k: integer;
  m: integer;
  n: integer;
  yselectnum: integer;
  rowcountinit: LongInt;
  rnow: LongInt;
  thedatasetname: String;
  thecolname: String;
  thecolnum: integer;
  newname: String;
  oldXcol: integer;


begin
  // Clicked Separate Button

  // get number of selected Y columns
  yselectnum:= 0;
  for j:= 0 to Form29.ListBox1.Items.Count-1 do
  begin
    if Form29.ListBox1.Selected[j] = True then
       yselectnum:=yselectnum+1;
  end;
  oldXcol:=3;
  for n:= 3 to Form1.StringGrid1.ColCount-1 do
  begin
    if Form29.ComboBox1.Caption = Form1.StringGrid1.Cells[n,0] then
       oldXcol:= n;
  end;

  rowcountinit:= Form1.StringGrid1.RowCount;
  rnow:= rowcountinit;
  if yselectnum > 1 then
  begin

      for k:= 0 to mydatasets-1 do
      begin
          thedatasetname:= myDSnames[k];
          ShowMessage(myDSnames[k]);
          for j:= 0 to Form29.ListBox1.Items.Count-1 do
          begin
              if Form29.ListBox1.Selected[j] = True then
              begin
                   // ---------------------- ADD FUNCTIONALITY HERE
                  newname:= '';
                  mydatasets:= mydatasets+1;
                  thecolname:= Form29.ListBox1.Items[j];
                  for m:= 0 to Form1.StringGrid1.ColCount -1 do
                  begin
                      if thecolname = Form1.StringGrid1.Cells[m,0] then
                         thecolnum:= m;
                  end;
                  if Form29.CheckBox1.Checked = True then
                     newname:= thedatasetname;
                  if Form29.CheckBox2.Checked = True then
                     newname:= newname + ' ' + thecolname;
                  for i:= 1 to rowcountinit -1 do
                  begin
                      if Form1.StringGrid1.Cells[2,i] = thedatasetname then
                      begin
                          rnow:= rnow+1;
                          Form1.StringGrid1.RowCount:= rnow;
                          Form1.StringGrid1.Cells[0,rnow-1]:=InttoStr(rnow);
                          Form1.StringGrid1.Cells[1,rnow-1]:=InttoStr(mydatasets);
                          Form1.StringGrid1.Cells[2,rnow-1]:=newname;
                          Form1.StringGrid1.Cells[3,rnow-1]:=Form1.StringGrid1.Cells[oldxcol,i];
                          Form1.StringGrid1.Cells[4,rnow-1]:=Form1.StringGrid1.Cells[thecolnum,i];
                      end;
                  end;
              end;
          end;
      end;
      for i:= 1 to rowcountinit -1 do
      begin
          Form1.StringGrid1.DeleteColRow(false,1);
      end;
      xcol:= 3;
      ycol:= 4;
      Form1.StringGrid1.Cells[3,0]:= Form1.StringGrid1.Cells[oldxcol,0];
      Form1.StringGrid1.Cells[4,0]:= Form29.Edit1.Caption;
      myYAxisTitle:= Form29.Edit1.Caption;
      myXAxisTitle:=Form1.StringGrid1.Cells[3,0];
      Form1.RebuildChart();
  end
  else
  begin
      ShowMessage('Select more that one Y-Axis Column');
  end;

end;

end.

