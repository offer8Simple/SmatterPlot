unit Unit32;
// Project: SmatterPlot
// unit31 = descriptive statistics form

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Math;

type

  { TForm32 }

  TForm32 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);

  private

  public

  end;

var
  Form32: TForm32;

implementation
uses
  unit1;

{$R *.lfm}

{ TForm32 }

procedure Swap(var a, b: double);
var
  temp: double;
begin
  temp := a;
  a := b;
  b := temp;
end;

procedure BubbleSort(var a: array of double);
var
  n, newn, i: integer;
begin
  n := high(a);
  repeat
    newn := 0;
    for i := 1 to n do
    begin
      if a[i - 1] > a[i] then
      begin
        Swap(a[i - 1], a[i]);
        newn := i;
      end;
    end;
    n := newn;
  until n = 0;
end;


procedure TForm32.Button1Click(Sender: TObject);
var
  i: integer;
  j: longint;
  myval: double;
  mycount: longint;
  mycount2: longint;
  mysum: double;
  mymean: double;
  mymedian: double;
  myvar: double;
  mystdev: double;
  mymin: double;
  mymax: double;
  myq1: double;
  myq3: double;
  myCI: double;
  mycol: integer;
  lastrow: longint;
  mystring: String;
  myarray: array of double;



begin
  // Click Calculate button
  lastrow:= form1.StringGrid1.RowCount;

  if form32.ComboBox1.Caption = '[All]' then
  begin
     if form32.ComboBox2.Caption = '[All]' then
     begin
        //compute statistics for all datasets and variables
           ;
     end
     else
     begin
        //compute statistics for all datasets for one variable
           ;
     end;

  end
  else
  begin
    if form32.ComboBox2.Caption = '[All]' then
    begin
       //compute statistics for one dataset for all variables
          ;
    end
    else
    begin
       //compute statistics for only one dataset and one variable
          mysum:= 0;
          mymean:= 0;
          mycount:=0;
          mycount2:=0;
          mymedian:= 0;
          myvar:= 0;
          mystdev:= 0;
          mymin:= 0;
          mymax:= 0;
          myq1:=0;
          myq3:=0;

          for i:= 3 to Form1.StringGrid1.ColCount-1 do    //get column
          begin
             if Form32.ComboBox2.Caption = Form1.StringGrid1.Cells[i,0] then
                mycol:= i;
          end;
          for j:= 1 to lastrow -1 do    //get sum and mean
          begin
             if Form32.ComboBox1.Caption = Form1.StringGrid1.Cells[2,j] then
             begin
               myval:= strtofloat(Form1.StringGrid1.Cells[mycol,j]);
               mysum:= mysum+myval;
               if mycount=0 then
               begin
                   mymin:= myval;
                   mymax:= myval;
               end;

               mycount:= mycount+1;
               if myval<mymin then
                  mymin:= myval;
               if myval>mymax then
                  mymax:= myval;
             end;
          end;
          mymean:= mysum/mycount;
          SetLength(myarray, mycount+1);

          for j:= 1 to lastrow -1 do    //get stdev and send to array
          begin
            if Form32.ComboBox1.Caption = Form1.StringGrid1.Cells[2,j] then
            begin
               myval:= strtofloat(Form1.StringGrid1.Cells[mycol,j]);
               myvar:= myvar + (myval-mymean)**2;
               myarray[mycount2]:= myval;
               mycount2:=mycount2+1;
            end;
          end;
          myvar:= myvar/mycount;
          mystdev:= Sqrt(myvar);
          BubbleSort(myarray);
          mymedian:=myarray[Length(myarray) div 2];
          myq1:=myarray[Length(myarray) div 4];
          myq3:=myarray[(Length(myarray)*3) div 4];
          myCI:=1.96*mystdev/sqrt(mycount);


          //send results to Memo
          Form32.Memo1.Lines.Add('<Smatterplot - Descriptive Statistics>');
          Form32.Memo1.Lines.Add('dataset: ' + Form32.ComboBox1.Caption);
          Form32.Memo1.Lines.Add('variable: ' + Form32.ComboBox2.Caption);
          Form32.Memo1.Lines.Add('Datapoints: ' + inttostr(mycount));
          Form32.Memo1.Lines.Add('Mean: ' + floattostr(mymean));
          Form32.Memo1.Lines.Add('Std. Dev.: ' + floattostr(mystdev));
          Form32.Memo1.Lines.Add('Minimum: ' + floattostr(mymin));
          Form32.Memo1.Lines.Add('Maximum: ' + floattostr(mymax));
          Form32.Memo1.Lines.Add('Median: ' + floattostr(mymedian));
          Form32.Memo1.Lines.Add('First Quartile: ' + floattostr(myq1));
          Form32.Memo1.Lines.Add('Third Quartile: ' + floattostr(myq3));
          Form32.Memo1.Lines.Add('Confidence Interval 95% for mean: ');
          Form32.Memo1.Lines.Add('  ('+ floattostr(mymean-myCI)+ ' to ' +floattostr(mymean+myCI)+ ')');
          Form32.Memo1.Lines.Add('<\>');


    end;
  end;






  //ShowMessage('Descriptive Statistics Were Calculated');

end;





end.

