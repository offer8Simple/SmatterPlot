unit Unit20;
// Project: SmatterPlot
// unit20 = reduce datasets form
{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm20 }

  TForm20 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form20: TForm20;

implementation
uses
  Unit1;

{$R *.lfm}

{ TForm20 }

procedure TForm20.Button1Click(Sender: TObject);
var
  rnum: longint;
  cnum: integer;
  i: longint;
  j: integer;
  olddataset: String;
  newdataset: String;
  dnummax: longint;
  dnum: longint;
  pnummax: longint;

  mycount: longint;
  k: longint;
  pnew: longint;
  theval: double;
  oldval: double;


begin
     // click reduce
  rnum:= Form1.StringGrid1.RowCount;
  cnum:= Form1.StringGrid1.ColCount;
  dnummax:=0;
  olddataset:= Form20.ComboBox1.Caption;
  mycount:= StrtoInt(Form20.Edit1.Caption);
  k:=0;
  pnew:=0;
  pnummax:=0;

  for i:=1 to rnum-1 do
  begin
     if StrtoInt(Form1.StringGrid1.Cells[0,i]) > pnummax then
       pnummax:= StrtoInt(Form1.StringGrid1.Cells[0,i]);
     if StrtoInt(Form1.StringGrid1.Cells[1,i]) > dnummax then
       dnummax:= StrtoInt(Form1.StringGrid1.Cells[1,i]);
     if Form1.StringGrid1.Cells[2,i] = olddataset then
        dnum:= StrtoInt(Form1.StringGrid1.Cells[1,i]);
  end;

  // sort here ----------------------------
  // to be coded later --------------------

  Case Form20.ComboBox2.Caption Of
  'Single Point':
  begin

     newdataset:= olddataset + '(Reduced SP)';
     for i:=1 to rnum-1 do
     begin
        if Form1.StringGrid1.Cells[2,i] = olddataset then
        begin
           k:=k+1;
           if k>=mycount then
           begin
              k:=0;
              pnew:=pnew+1;

              Form1.StringGrid1.RowCount:= Form1.StringGrid1.RowCount+1;
              Form1.StringGrid1.Cells[0,Form1.StringGrid1.RowCount-1]:= InttoStr(pnummax + pnew);
              Form1.StringGrid1.Cells[1,Form1.StringGrid1.RowCount-1]:= InttoStr(dnummax + 1);
              Form1.StringGrid1.Cells[2,Form1.StringGrid1.RowCount-1]:= newdataset;
              for j:= 3 to cnum -1 do
              begin
                 Form1.StringGrid1.Cells[j, Form1.StringGrid1.RowCount-1]:=
                   Form1.StringGrid1.Cells[j,i];
              end;
           end;
        end;
     end;
  end;


  'Average (Mean)':
  begin
     newdataset:= olddataset + '(Reduced to Mean)';
     for i:=1 to rnum-1 do
     begin
        if Form1.StringGrid1.Cells[2,i] = olddataset then
        begin
           k:=k+1;
           if k = 1 then
           begin
              pnew:=pnew+1;
              Form1.StringGrid1.RowCount:= Form1.StringGrid1.RowCount+1;
              Form1.StringGrid1.Cells[0,Form1.StringGrid1.RowCount-1]:= InttoStr(pnummax + pnew);
              Form1.StringGrid1.Cells[1,Form1.StringGrid1.RowCount-1]:= InttoStr(dnummax + 1);
              Form1.StringGrid1.Cells[2,Form1.StringGrid1.RowCount-1]:= newdataset;
              for j:=3 to cnum -1 do
                  Form1.StringGrid1.Cells[j, Form1.StringGrid1.RowCount-1]:='0';
           end;
           for j:= 3 to cnum -1 do
           begin
                 If TryStrtoFloat(Form1.StringGrid1.Cells[j,i],theval) = True then
                 begin
                    oldval:=StrtoFloat(Form1.StringGrid1.Cells[j, Form1.StringGrid1.RowCount-1]);
                    Form1.StringGrid1.Cells[j, Form1.StringGrid1.RowCount-1]:= FloattoStr(oldval+theval);
                 end
                 else
                 begin
                 Form1.StringGrid1.Cells[j, Form1.StringGrid1.RowCount-1]:=
                   Form1.StringGrid1.Cells[j,i];
                 end;
           end;
           if k>=mycount then
           begin
              k:=0;
              for j:= 3 to cnum -1 do
              begin
                    If TryStrtoFloat(Form1.StringGrid1.Cells[j,i],theval) = True then
                    begin
                       oldval:=StrtoFloat(Form1.StringGrid1.Cells[j, Form1.StringGrid1.RowCount-1]);
                       Form1.StringGrid1.Cells[j, Form1.StringGrid1.RowCount-1]:= FloattoStr(oldval/mycount);
                    end;
              end;
           end;
        end;
     end;

  end;
  end;

  Form1.RebuildChart();

end;

end.

