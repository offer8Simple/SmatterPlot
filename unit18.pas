unit Unit18;
// Project: SmatterPlot
// unit18 = split datasets form
{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm18 }

  TForm18 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form18: TForm18;

implementation
uses
  Unit1;


{$R *.lfm}

{ TForm18 }

procedure TForm18.Button1Click(Sender: TObject);
var
  i: longint;
  ii: longint;
  startrow: longint;
  endrow: longint;
  j: integer;
  k: integer;
  rnum: longint;
  cnum: integer;
  datasetname: String;
  varname: String;
  setnummax: longint;
  varcol: integer;
  theval: double;
  newname: String;
  catname: String;
  newcatname: String;
  catnum: longint;


begin
  // Click Split

  // Get table features
  rnum:= Form1.StringGrid1.RowCount;
  cnum:= Form1.StringGrid1.ColCount;
  datasetname:= Form18.ComboBox1.Caption;
  varname:= Form18.ComboBox2.Caption;

  setnummax:= 0;
  for i:=1 to rnum-1 do
  begin
      if StrtoInt(Form1.StringGrid1.Cells[1,i]) > setnummax then
         setnummax:= StrtoInt(Form1.StringGrid1.Cells[1,i])
  end;
  for j:=0 to cnum-1 do
  begin
      If varname = Form1.StringGrid1.Cells[j,0] then
         varcol:= j;
  end;

  Case Form18.ComboBox3.Caption Of
       'Less than / greater than value':
       begin
             theval:= StrtoFloat(Form18.Edit1.Caption);
             newname:= datasetname + '(>' + Form18.Edit1.Caption +')';
             for i:= 1 to rnum-1 do
             begin
                  if Form1.StringGrid1.Cells[2,i] = datasetname then
                  begin
                     if StrtoFloat(Form1.StringGrid1.Cells[varcol,i]) > theval then
                     begin
                         Form1.StringGrid1.Cells[1,i]:= InttoStr(setnummax+1);
                         Form1.StringGrid1.Cells[2,i]:= newname;
                     end;
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


       end;
       'Category Column':
       begin
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

          // Now sort within the dataset in order of Category variable
          Form1.StringGrid1.RowCount:= rnum +1;
          startrow:=1;
          endrow:=1;
          ii:=1;
          while (Form1.StringGrid1.Cells[2,ii] <> datasetname) and (ii<rnum) do
          begin
               ii:=ii+1;
          end;
          startrow:= ii;
          while (Form1.StringGrid1.Cells[2,ii] = datasetname) and (ii<rnum) do
          begin
               ii:=ii+1;
          end;
          endrow:=ii-1;


          For i:= startrow to endrow do
          begin
              For j:= startrow to endrow - i do
              begin
                if Form1.StringGrid1.Cells[varcol,j] > Form1.StringGrid1.Cells[varcol,j+1] then
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

          //now split by categories in varcol column
          catname:= Form1.StringGrid1.Cells[varcol,i];

          catnum:=0;
          for i:= startrow to endrow do
          begin
             newcatname:= Form1.StringGrid1.Cells[varcol,i];

             if newcatname <> catname then
             begin
                  catnum:=catnum+1;
                  catname:= newcatname;
             end;
             newname:= datasetname + '(' + catname +')';
             Form1.StringGrid1.Cells[1,i]:= InttoStr(setnummax+1+catnum);
             Form1.StringGrid1.Cells[2,i]:= newname;
          end;

          // BubbleSort Rows by dataset number AGAIN
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



       end;


  end;
  Form1.Button4.Click;

end;


end.

