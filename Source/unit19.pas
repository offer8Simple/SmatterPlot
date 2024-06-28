unit Unit19;
// Project: SmatterPlot
// unit19 = Sort Points within Datasets form
{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm19 }

  TForm19 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form19: TForm19;

implementation
uses
  Unit1;


{$R *.lfm}

{ TForm19 }

procedure TForm19.Button1Click(Sender: TObject);
var
  i: longint;
  ii: longint;
  startrow: longint;
  endrow: longint;
  j: integer;
  k: integer;
  m: longint;
  rnum: longint;
  cnum: integer;
  datasetname: String;
  varname: String;
  setnummax: longint;
  oldsetnumstr: String;
  varcol: integer;
  //theval: double;
  //newname: String;
  //catname: String;
  //newcatname: String;
  //catnum: longint;
  thedouble: double;

begin
  // Click Sort Points

    // Get table features
  rnum:= Form1.StringGrid1.RowCount;
  cnum:= Form1.StringGrid1.ColCount;
  datasetname:= Form19.ComboBox1.Caption;
  varname:= Form19.ComboBox2.Caption;


  for j:=0 to cnum-1 do
  begin
      If varname = Form1.StringGrid1.Cells[j,0] then
         varcol:= j;
  end;
  if varname= '{Point Number}' then
     varcol:=0;


           // BubbleSort Rows by dataset number
          Form1.StringGrid1.RowCount:= rnum +1;
          For i:= 1 to rnum -1 do
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

          // renumber datasets
          rnum:= Form1.StringGrid1.RowCount;
          setnummax:= 1;
          oldsetnumstr:= Form1.StringGrid1.Cells[1,1];
          for i:=1 to rnum-1 do
          begin
              if Form1.StringGrid1.Cells[1,i] <> oldsetnumstr then
              begin
                 setnummax:= setnummax+1;
                 oldsetnumstr:= Form1.StringGrid1.Cells[1,i];
              end;
              Form1.StringGrid1.Cells[1,i]:= inttostr(setnummax);
          end;
          //ShowMessage('setnummax = ' + inttostr(setnummax));

  // Now sort within the dataset in order of Category variable
  rnum:= Form1.StringGrid1.RowCount;
  if datasetname = '{All}' then
  begin

    startrow:=1;
    endrow:=1;
    ii:=1;
    for m:= 1 to setnummax do
    begin
          datasetname:= Form1.StringGrid1.Cells[2,ii];
          rnum:= Form1.StringGrid1.RowCount;
          Form1.StringGrid1.RowCount:= rnum +1;

          while (Form1.StringGrid1.Cells[2,ii] <> datasetname) and (ii<rnum) do
          begin
               ii:=ii+1;
          end;
          if ii >1 then
             startrow:= ii-1;
          while (Form1.StringGrid1.Cells[2,ii] = datasetname) and (ii<rnum) do
          begin
               ii:=ii+1;
          end;
          endrow:=ii-1;
          //ShowMessage('Startrow ' + inttostr(startrow) + ' Endrow ' + inttostr(endrow));

          if TryStrtoFloat(Form1.StringGrid1.Cells[varcol,1], thedouble) = false then
          begin

            For i:= startrow to endrow do
            begin
                For j:= startrow to startrow+endrow - i-1 do
                begin
                  if j< rnum-1 then
                  begin

                    if Form19.RadioButton1.Checked= true then
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
                    end
                    else
                    begin
                      if Form1.StringGrid1.Cells[varcol,j] < Form1.StringGrid1.Cells[varcol,j+1] then
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

                end;
            end;
          end
          else
          begin

            For i:= startrow to endrow do
            begin
                For j:= startrow to startrow+endrow-i-1 do
                begin
                  if j< rnum-1 then
                  begin


                    if Form19.RadioButton1.Checked= true then
                    begin
                      if StrtoFloat(Form1.StringGrid1.Cells[varcol,j]) > StrtoFloat(Form1.StringGrid1.Cells[varcol,j+1]) then
                      begin
                        for k:= 0 to cnum-1 do
                        begin
                             Form1.StringGrid1.Cells[k,rnum]:= Form1.StringGrid1.Cells[k,j];
                             Form1.StringGrid1.Cells[k,j]:= Form1.StringGrid1.Cells[k,j+1];
                             Form1.StringGrid1.Cells[k,j+1]:= Form1.StringGrid1.Cells[k,rnum];
                        end;
                      end;
                    end
                    else
                    begin
                      if StrtoFloat(Form1.StringGrid1.Cells[varcol,j]) < StrtoFloat(Form1.StringGrid1.Cells[varcol,j+1]) then
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

                end;
            end;
          end;
          //ShowMessage('pause');
          Form1.StringGrid1.DeleteColRow(False, rnum);
          ii:=ii+1;
     end;

  end




  else      // ----------Sort only 1 dataset
  begin
    startrow:=1;
    endrow:=1;
    ii:=1;

          Form1.StringGrid1.RowCount:= rnum +1;

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
          //ShowMessage('Startrow ' + inttostr(startrow) + ' Endrow ' + inttostr(endrow));

          if TryStrtoFloat(Form1.StringGrid1.Cells[varcol,1], thedouble) = false then
          begin

            For i:= startrow to endrow do
            begin
                For j:= startrow to startrow+endrow - i-1 do
                begin
                  if Form19.RadioButton1.Checked= true then
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
                  end
                  else
                  begin
                    if Form1.StringGrid1.Cells[varcol,j] < Form1.StringGrid1.Cells[varcol,j+1] then
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
            end;
          end
          else
          begin


            For i:= startrow to endrow do
            begin
                For j:= startrow to startrow+endrow - i-1 do
                begin
                  if Form19.RadioButton1.Checked= true then
                  begin
                    if StrtoFloat(Form1.StringGrid1.Cells[varcol,j]) > StrtoFloat(Form1.StringGrid1.Cells[varcol,j+1]) then
                    begin
                      for k:= 0 to cnum-1 do
                      begin
                           Form1.StringGrid1.Cells[k,rnum]:= Form1.StringGrid1.Cells[k,j];
                           Form1.StringGrid1.Cells[k,j]:= Form1.StringGrid1.Cells[k,j+1];
                           Form1.StringGrid1.Cells[k,j+1]:= Form1.StringGrid1.Cells[k,rnum];
                      end;
                    end;
                  end
                  else
                  begin
                    if StrtoFloat(Form1.StringGrid1.Cells[varcol,j]) < StrtoFloat(Form1.StringGrid1.Cells[varcol,j+1]) then
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
            end;
          end;

          Form1.StringGrid1.DeleteColRow(False, rnum);

  end;


  Form1.Button4.Click;

end;

end.

