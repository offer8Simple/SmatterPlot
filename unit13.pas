unit Unit13;
// Project: SmatterPlot
// unit13 = Plot Equation form
{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Math;

type

  { TForm13 }

  TForm13 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit1: TEdit;
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
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private

  public

  end;

var
  Form13: TForm13;

implementation
uses
  Unit1;


{$R *.lfm}

{ TForm13 }

procedure TForm13.Button1Click(Sender: TObject);
var
  i: integer;
  j: longint;
  lastrow: longint;
  lastdataset: longint;
  pointtot: longint;
  Xpointstart: double;
  Xpointend: double;
  pointspacing: String;
  Xval: double;
  Yval: double;
  a1: double;
  a2: double;
  a3: double;
  a4: double;
  a5: double;


begin
  // click Plot Equation Button
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


  pointtot:= StrtoInt(Form13.Edit9.Caption);
  Xpointstart:= StrtoFloat(Form13.Edit7.Caption);
  Xpointend:= StrtoFloat(Form13.Edit8.Caption);
  pointspacing:= Form13.ComboBox2.Caption;
  a1:= StrtoFloat(Form13.Edit2.Caption);
  a2:= StrtoFloat(Form13.Edit3.Caption);
  a3:= StrtoFloat(Form13.Edit4.Caption);
  a4:= StrtoFloat(Form13.Edit5.Caption);
  a5:= StrtoFloat(Form13.Edit6.Caption);


  Case ComboBox1.Caption of
       'Linear':
         begin

           Form1.StringGrid1.RowCount:= Form1.StringGrid1.RowCount+pointtot;
           for i:= 0 to pointtot-1 do
           begin
              if pointspacing = 'Linear' then
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
         end;
       'Quadratic':
         begin

           Form1.StringGrid1.RowCount:= Form1.StringGrid1.RowCount+pointtot;
           for i:= 0 to pointtot-1 do
           begin
              if pointspacing = 'Linear' then
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
         end;

       'Cubic':
         begin

           Form1.StringGrid1.RowCount:= Form1.StringGrid1.RowCount+pointtot;
           for i:= 0 to pointtot-1 do
           begin
              if pointspacing = 'Linear' then
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
         end;
       'Polynomial (4th power)':
         begin

           Form1.StringGrid1.RowCount:= Form1.StringGrid1.RowCount+pointtot;
           for i:= 0 to pointtot-1 do
           begin
              if pointspacing = 'Linear' then
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
         end;
       'Exponential':
         begin

           Form1.StringGrid1.RowCount:= Form1.StringGrid1.RowCount+pointtot;
           for i:= 0 to pointtot-1 do
           begin
              if pointspacing = 'Linear' then
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
         end;
       'Logarhithmic':
         begin

           Form1.StringGrid1.RowCount:= Form1.StringGrid1.RowCount+pointtot;
           for i:= 0 to pointtot-1 do
           begin
              if pointspacing = 'Linear' then
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
         end;
       'Power Law':
         begin

           Form1.StringGrid1.RowCount:= Form1.StringGrid1.RowCount+pointtot;
           for i:= 0 to pointtot-1 do
           begin
              if pointspacing = 'Linear' then
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
  end;

  Form1.Button4.Click;

end;

procedure TForm13.ComboBox1Change(Sender: TObject);
begin
    // changed ComboBox1 for type of equation
    Case ComboBox1.Caption of
       'Linear':
         begin
             Form13.ComboBox2.Caption:= 'Linear';
             Form13.ComboBox2.AutoSelected:=true;

             Form13.Edit1.Caption:='y=a1+a2*x';
             Form13.Edit2.Caption:='1';
             Form13.Edit3.Caption:='1';
             Form13.Edit4.Caption:='0';
             Form13.Edit5.Caption:='0';
             Form13.Edit6.Caption:='0';
         end;
       'Quadratic':
         begin
           Form13.ComboBox2.Caption:= 'Linear';
           Form13.ComboBox2.AutoSelected:=true;

           Form13.Edit1.Caption:='y=a1+a2*x+a3*x^2';
           Form13.Edit2.Caption:='1';
           Form13.Edit3.Caption:='1';
           Form13.Edit4.Caption:='1';
           Form13.Edit5.Caption:='0';
           Form13.Edit6.Caption:='0';
         end;
       'Cubic':
         begin
           Form13.ComboBox2.Caption:= 'Linear';
           Form13.ComboBox2.AutoSelected:=true;

           Form13.Edit1.Caption:='y=a1+a2*x+a3*x^2+a4*x^3';
           Form13.Edit2.Caption:='1';
           Form13.Edit3.Caption:='1';
           Form13.Edit4.Caption:='1';
           Form13.Edit5.Caption:='1';
           Form13.Edit6.Caption:='0';
         end;
       'Polynomial (4th power)':
         begin
           Form13.ComboBox2.Caption:= 'Linear';
           Form13.ComboBox2.AutoSelected:=true;

           Form13.Edit1.Caption:='y=a1+a2*x+a3*x^2+a4*x^3+a5*x^4';
           Form13.Edit2.Caption:='1';
           Form13.Edit3.Caption:='1';
           Form13.Edit4.Caption:='1';
           Form13.Edit5.Caption:='1';
           Form13.Edit6.Caption:='1';
         end;
       'Exponential':
         begin
           Form13.ComboBox2.Caption:= 'Linear';
           Form13.ComboBox2.AutoSelected:=true;

           Form13.Edit1.Caption:='y=a1*exp(a2*x)';
           Form13.Edit2.Caption:='1';
           Form13.Edit3.Caption:='1';
           Form13.Edit4.Caption:='0';
           Form13.Edit5.Caption:='0';
           Form13.Edit6.Caption:='0';
         end;
       'Logarhithmic':
         begin
           Form13.ComboBox2.Caption:= 'Linear';
           Form13.ComboBox2.AutoSelected:=true;

           Form13.Edit1.Caption:='y=a1*Log10(a2*x)';
           Form13.Edit2.Caption:='1';
           Form13.Edit3.Caption:='1';
           Form13.Edit4.Caption:='0';
           Form13.Edit5.Caption:='0';
           Form13.Edit6.Caption:='0';
         end;
       'Power Law':
         begin
           Form13.ComboBox2.Caption:= 'Linear';
           Form13.ComboBox2.AutoSelected:=true;

           Form13.Edit1.Caption:='y=a1*x^a2';
           Form13.Edit2.Caption:='1';
           Form13.Edit3.Caption:='1';
           Form13.Edit4.Caption:='0';
           Form13.Edit5.Caption:='0';
           Form13.Edit6.Caption:='0';
         end;
    end;
end;

end.

