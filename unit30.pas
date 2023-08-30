unit Unit30;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Math;

type

  { TForm30 }

  TForm30 = class(TForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    ComboBox1: TComboBox;
    ComboBox3: TComboBox;
    Edit1: TEdit;
    Edit10: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);


  private

  public

  end;

var
  Form30: TForm30;

implementation
uses
  Unit1;

{$R *.lfm}

{ TForm30 }





procedure TForm30.Button1Click(Sender: TObject);
var
  i: integer;
  j: longint;
  k: longint;
  m: longint;
  maxints: longint;
  lastrow: longint;
  lastdataset: longint;
  pointtot: longint;
  Xpointstart: double;
  Xpointend: double;
  pointspacing: String;
  Xval: double;
  Yval: double;
  YvalFit: double;
  a1: double;
  a2: double;
  a3: double;
  a4: double;
  a5: double;
  newRMS: double;
  bestRMS: double;


begin
  // Click Fit Model Button
  lastrow:= Form1.StringGrid1.RowCount;
  lastdataset:= 0;
  if lastrow <= 2 then
  begin
     If Form1.StringGrid1.RowCount = 0 then
     begin
        Form1.StringGrid1.RowCount:=1;
        lastrow:=1;
     end;
     Form1.StringGrid1.Cells[0,0]:= '0';
     Form1.StringGrid1.Cells[1,0]:= '1';
     Form1.StringGrid1.Cells[2,0]:= ComboBox1.Caption;
     Form1.StringGrid1.Cells[xcol, 0]:= 'x';
     Form1.StringGrid1.Cells[ycol, 0]:= 'y';

  end;
  if lastrow > 2 then
  begin
     for j:= 1 to lastrow-1 do
     begin
        if Strtoint(Form1.StringGrid1.Cells[1,j]) > lastdataset then
           lastdataset:= Strtoint(Form1.StringGrid1.Cells[1,j]);
     end;
  end;


  pointtot:= StrtoInt(Form30.Edit9.Caption);
  Xpointstart:= StrtoFloat(Form30.Edit7.Caption);
  Xpointend:= StrtoFloat(Form30.Edit8.Caption);

  a1:= StrtoFloat(Form30.Edit2.Caption);
  a2:= StrtoFloat(Form30.Edit3.Caption);
  a3:= StrtoFloat(Form30.Edit4.Caption);
  a4:= StrtoFloat(Form30.Edit5.Caption);
  a5:= StrtoFloat(Form30.Edit6.Caption);


  Case ComboBox1.Caption of
       'Linear':
         begin
           //calculate RMS and iterate to minimize
           m:=0;
           newRMS:=1;
           bestRMS:=1;
           maxints:= StrtoInt(Form30.Edit10.Caption);
           while (bestRMS > 0) and (m < maxints) do
           begin
             if Form30.CheckBox1.Checked = True then
                a1:= a1 + (Random-0.5)*a1*0.5;
             if Form30.CheckBox2.Checked = True then
                a2:= a2 + (Random-0.5)*a2*0.5;
             for i:=1 to lastrow-1 do
             begin
               if Form30.Combobox3.Caption = Form1.StringGrid1.Cells[2,i] then
               begin
                  Xval:= StrtoFloat(Form1.StringGrid1.Cells[xcol,i]);
                  Yval:= StrtoFloat(Form1.StringGrid1.Cells[ycol,i]);
                  YvalFit:= a1+a2*Xval;
                  newRMS:= newRMS+sqrt(YvalFit**2-Yval**2);
               end;
             end;
             m:=m+1;
           end;




           Form1.StringGrid1.RowCount:= Form1.StringGrid1.RowCount+pointtot;
           for i:= 0 to pointtot-1 do
           begin

                 Xval:= Xpointstart + (Xpointend-Xpointstart)*i/pointtot;
                 Yval:= a1+a2*Xval;
                 Form1.StringGrid1.Cells[xcol, lastrow+i]:= FloattoStr(Xval);
                 Form1.StringGrid1.Cells[ycol, lastrow+i]:= FloattoStr(Yval);
                 Form1.StringGrid1.Cells[0, lastrow+i]:= InttoStr(i+1);
                 Form1.StringGrid1.Cells[1, lastrow+i]:= InttoStr(lastdataset+1);
                 Form1.StringGrid1.Cells[2, lastrow+i]:= 'Linear'+InttoStr(lastdataset+1);

           end;
         end;
       'Quadratic':
         begin

           Form1.StringGrid1.RowCount:= Form1.StringGrid1.RowCount+pointtot;
           for i:= 0 to pointtot-1 do
           begin

                 Xval:= Xpointstart + (Xpointend-Xpointstart)*i/pointtot;
                 Yval:= a1+a2*Xval+a3*IntPower(Xval,2);
                 Form1.StringGrid1.Cells[xcol, lastrow+i]:= FloattoStr(Xval);
                 Form1.StringGrid1.Cells[ycol, lastrow+i]:= FloattoStr(Yval);
                 Form1.StringGrid1.Cells[0, lastrow+i]:= InttoStr(i+1);
                 Form1.StringGrid1.Cells[1, lastrow+i]:= InttoStr(lastdataset+1);
                 Form1.StringGrid1.Cells[2, lastrow+i]:= 'Quadratic'+InttoStr(lastdataset+1);


           end;
         end;

       'Cubic':
         begin

           Form1.StringGrid1.RowCount:= Form1.StringGrid1.RowCount+pointtot;
           for i:= 0 to pointtot-1 do
           begin

                 Xval:= Xpointstart + (Xpointend-Xpointstart)*i/pointtot;
                 Yval:= a1+a2*Xval+a3*IntPower(Xval,2) +a4*IntPower(Xval,3);
                 Form1.StringGrid1.Cells[xcol, lastrow+i]:= FloattoStr(Xval);
                 Form1.StringGrid1.Cells[ycol, lastrow+i]:= FloattoStr(Yval);
                 Form1.StringGrid1.Cells[0, lastrow+i]:= InttoStr(i+1);
                 Form1.StringGrid1.Cells[1, lastrow+i]:= InttoStr(lastdataset+1);
                 Form1.StringGrid1.Cells[2, lastrow+i]:= 'Cubic'+InttoStr(lastdataset+1);


           end;
         end;
       'Polynomial (4th power)':
         begin

           Form1.StringGrid1.RowCount:= Form1.StringGrid1.RowCount+pointtot;
           for i:= 0 to pointtot-1 do
           begin

                 Xval:= Xpointstart + (Xpointend-Xpointstart)*i/pointtot;
                 Yval:= a1+a2*Xval+a3*IntPower(Xval,2) +a4*IntPower(Xval,3)+a5*IntPower(Xval,4);
                 Form1.StringGrid1.Cells[xcol, lastrow+i]:= FloattoStr(Xval);
                 Form1.StringGrid1.Cells[ycol, lastrow+i]:= FloattoStr(Yval);
                 Form1.StringGrid1.Cells[0, lastrow+i]:= InttoStr(i+1);
                 Form1.StringGrid1.Cells[1, lastrow+i]:= InttoStr(lastdataset+1);
                 Form1.StringGrid1.Cells[2, lastrow+i]:= 'Polynomial (4th power)'+InttoStr(lastdataset+1);


           end;
         end;
       'Exponential':
         begin

           Form1.StringGrid1.RowCount:= Form1.StringGrid1.RowCount+pointtot;
           for i:= 0 to pointtot-1 do
           begin

                 Xval:= Xpointstart + (Xpointend-Xpointstart)*i/pointtot;
                 Yval:= a1*Exp(a2*Xval);
                 Form1.StringGrid1.Cells[xcol, lastrow+i]:= FloattoStr(Xval);
                 Form1.StringGrid1.Cells[ycol, lastrow+i]:= FloattoStr(Yval);
                 Form1.StringGrid1.Cells[0, lastrow+i]:= InttoStr(i+1);
                 Form1.StringGrid1.Cells[1, lastrow+i]:= InttoStr(lastdataset+1);
                 Form1.StringGrid1.Cells[2, lastrow+i]:= 'Exponential'+InttoStr(lastdataset+1);

           end;
         end;
       'Logarhithmic':
         begin

           Form1.StringGrid1.RowCount:= Form1.StringGrid1.RowCount+pointtot;
           for i:= 0 to pointtot-1 do
           begin

                 Xval:= Xpointstart + (Xpointend-Xpointstart)*i/pointtot;
                 Yval:= a1*Log10(a2*Xval);
                 Form1.StringGrid1.Cells[xcol, lastrow+i]:= FloattoStr(Xval);
                 Form1.StringGrid1.Cells[ycol, lastrow+i]:= FloattoStr(Yval);
                 Form1.StringGrid1.Cells[0, lastrow+i]:= InttoStr(i+1);
                 Form1.StringGrid1.Cells[1, lastrow+i]:= InttoStr(lastdataset+1);
                 Form1.StringGrid1.Cells[2, lastrow+i]:= 'Logarhithmic'+InttoStr(lastdataset+1);


           end;
         end;
       'Power Law':
         begin

           Form1.StringGrid1.RowCount:= Form1.StringGrid1.RowCount+pointtot;
           for i:= 0 to pointtot-1 do
           begin

                 Xval:= Xpointstart + (Xpointend-Xpointstart)*i/pointtot;
                 Yval:= a1*Power(Xval, a2);
                 Form1.StringGrid1.Cells[xcol, lastrow+i]:= FloattoStr(Xval);
                 Form1.StringGrid1.Cells[ycol, lastrow+i]:= FloattoStr(Yval);
                 Form1.StringGrid1.Cells[0, lastrow+i]:= InttoStr(i+1);
                 Form1.StringGrid1.Cells[1, lastrow+i]:= InttoStr(lastdataset+1);
                 Form1.StringGrid1.Cells[2, lastrow+i]:= 'Power Law'+InttoStr(lastdataset+1);

           end;
         end;
  end;

  Form1.Button4.Click;

end;

procedure TForm30.ComboBox1Change(Sender: TObject);
begin
      // changed ComboBox1 for type of equation
    Case ComboBox1.Caption of
       'Linear':
         begin

             Form30.Edit1.Caption:='y=a1+a2*x';
             Form30.Edit2.Caption:='1';
             Form30.Edit3.Caption:='1';
             Form30.Edit4.Caption:='0';
             Form30.Edit5.Caption:='0';
             Form30.Edit6.Caption:='0';
         end;
       'Quadratic':
         begin

           Form30.Edit1.Caption:='y=a1+a2*x+a3*x^2';
           Form30.Edit2.Caption:='1';
           Form30.Edit3.Caption:='1';
           Form30.Edit4.Caption:='1';
           Form30.Edit5.Caption:='0';
           Form30.Edit6.Caption:='0';
         end;
       'Cubic':
         begin

           Form30.Edit1.Caption:='y=a1+a2*x+a3*x^2+a4*x^3';
           Form30.Edit2.Caption:='1';
           Form30.Edit3.Caption:='1';
           Form30.Edit4.Caption:='1';
           Form30.Edit5.Caption:='1';
           Form30.Edit6.Caption:='0';
         end;
       'Polynomial (4th power)':
         begin

           Form30.Edit1.Caption:='y=a1+a2*x+a3*x^2+a4*x^3+a5*x^4';
           Form30.Edit2.Caption:='1';
           Form30.Edit3.Caption:='1';
           Form30.Edit4.Caption:='1';
           Form30.Edit5.Caption:='1';
           Form30.Edit6.Caption:='1';
         end;
       'Exponential':
         begin

           Form30.Edit1.Caption:='y=a1*exp(a2*x)';
           Form30.Edit2.Caption:='1';
           Form30.Edit3.Caption:='1';
           Form30.Edit4.Caption:='0';
           Form30.Edit5.Caption:='0';
           Form30.Edit6.Caption:='0';
         end;
       'Logarhithmic':
         begin

           Form30.Edit1.Caption:='y=a1*Log10(a2*x)';
           Form30.Edit2.Caption:='1';
           Form30.Edit3.Caption:='1';
           Form30.Edit4.Caption:='0';
           Form30.Edit5.Caption:='0';
           Form30.Edit6.Caption:='0';
         end;
       'Power Law':
         begin

           Form30.Edit1.Caption:='y=a1*x^a2';
           Form30.Edit2.Caption:='1';
           Form30.Edit3.Caption:='1';
           Form30.Edit4.Caption:='0';
           Form30.Edit5.Caption:='0';
           Form30.Edit6.Caption:='0';
         end;
    end;
end;

end.

