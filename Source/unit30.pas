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
    CheckBox10: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
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
    Label16: TLabel;
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
  YvalSum: double;
  YvalFitSum: double;
  rsum1: double;
  rsum2: double;
  rsum3: double;
  rsquared: double;
  npoints: longint;
  a1: double;
  a2: double;
  a3: double;
  a4: double;
  a5: double;
  a1r: double;
  a2r: double;
  a3r: double;
  a4r: double;
  a5r: double;
  newRMS: double;
  bestRMS: double;
  mystring: String;
  equationstring: String;


begin
  // Click Fit Model Button
  Randomize;
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
  equationstring:= Form30.Edit1.Caption;



           // Optimization
           m:=0;
           newRMS:=0.0;
           bestRMS:=0.0;
           maxints:= StrtoInt(Form30.Edit10.Caption);


           while (m < maxints) do
           begin
             if Form30.CheckBox1.Checked = True then
                a1r:= a1 + (Random-0.5)*a1*0.5;
             if Form30.CheckBox2.Checked = True then
                a2r:= a2 + (Random-0.5)*a2*0.5;
             if Form30.CheckBox3.Checked = True then
                a3r:= a3 + (Random-0.5)*a3*0.5;
             if Form30.CheckBox4.Checked = True then
                a4r:= a4 + (Random-0.5)*a4*0.5;
             if Form30.CheckBox5.Checked = True then
                a5r:= a5 + (Random-0.5)*a5*0.5;
             if Form30.CheckBox6.Checked = True then
                if Random < 0.2 then a1r := -1*a1r;
             if Form30.CheckBox7.Checked = True then
                if Random < 0.2 then a2r := -1*a2r;
             if Form30.CheckBox8.Checked = True then
                if Random < 0.2 then a3r := -1*a3r;
             if Form30.CheckBox9.Checked = True then
                if Random < 0.2 then a4r := -1*a4r;
             if Form30.CheckBox10.Checked = True then
                if Random < 0.2 then a5r := -1*a5r;

             newRMS:= 0.0;
             for i:=1 to lastrow-1 do
             begin
               if Form30.Combobox3.Caption = Form1.StringGrid1.Cells[2,i] then
               begin
                  Xval:= StrtoFloat(Form1.StringGrid1.Cells[xcol,i]);
                  if (Xval> Xpointstart) and (Xval < Xpointend) then
                  begin
                       Yval:= StrtoFloat(Form1.StringGrid1.Cells[ycol,i]);
                       Case ComboBox1.Caption of
                          'Average':
                              YvalFit:= a1r;
                          'Linear':
                              YvalFit:= a1r+a2r*Xval;
                          'Quadratic':
                              YvalFit:= a1r+a2r*Xval+a3r*IntPower(Xval,2);
                          'Cubic':
                              YvalFit:= a1r+a2r*Xval+a3r*IntPower(Xval,2) +a4r*IntPower(Xval,3);
                          'Polynomial (4th power)':
                              YvalFit:= a1r+a2r*Xval+a3r*IntPower(Xval,2) +a4r*IntPower(Xval,3)+a5r*IntPower(Xval,4);
                          'Exponential':
                              YvalFit:= a1r*Exp(a2r*Xval);
                          'Logarhithmic':
                              YvalFit:= a1r*Log10(a2r*Xval);
                          'Power Law':
                              YvalFit:= a1r*Power(Xval, a2r);
                       end;

                       newRMS:= newRMS+(YvalFit-Yval)**2;
                  end;
               end;
             end;


             if (m=0) then
             begin
                bestRMS:= newRMS;
             end
             else
             begin
                 if (newRMS < bestRMS) then
                 begin
                     bestRMS:= newRMS;
                     a1:= a1r;
                     a2:= a2r;
                     a3:= a3r;
                     a4:= a4r;
                     a5:= a5r;
                 end;
             end;

             m:=m+1;
           end;


           // now compute r-squared
           YvalSum:= 0;
           YvalFitSum:=0;
           npoints:=0;

           for i:=1 to lastrow-1 do
             begin
               if Form30.Combobox3.Caption = Form1.StringGrid1.Cells[2,i] then
               begin
                  Xval:= StrtoFloat(Form1.StringGrid1.Cells[xcol,i]);
                  if (Xval> Xpointstart) and (Xval < Xpointend) then
                  begin

                    Yval:= StrtoFloat(Form1.StringGrid1.Cells[ycol,i]);

                    Case ComboBox1.Caption of
                          'Average':
                              YvalFit:= a1;
                          'Linear':
                              YvalFit:= a1+a2*Xval;
                          'Quadratic':
                              YvalFit:= a1+a2*Xval+a3*IntPower(Xval,2);
                          'Cubic':
                              YvalFit:= a1+a2*Xval+a3*IntPower(Xval,2) +a4*IntPower(Xval,3);
                          'Polynomial (4th power)':
                              YvalFit:= a1+a2*Xval+a3*IntPower(Xval,2) +a4*IntPower(Xval,3)+a5*IntPower(Xval,4);
                          'Exponential':
                              YvalFit:= a1*Exp(a2*Xval);
                          'Logarhithmic':
                              YvalFit:= a1*Log10(a2*Xval);
                          'Power Law':
                              YvalFit:= a1*Power(Xval, a2);
                       end;
                    YvalSum:= YvalSum+Yval;
                    YvalFitSum:= YvalFitSum +YvalFit;
                    npoints:=npoints+1;
                  end;
               end;
             end;

           rsum1:=0;
           rsum2:=0;
           rsum3:=0;
           for i:=1 to lastrow-1 do
             begin
               if Form30.Combobox3.Caption = Form1.StringGrid1.Cells[2,i] then
               begin
                  Xval:= StrtoFloat(Form1.StringGrid1.Cells[xcol,i]);
                  if (Xval> Xpointstart) and (Xval < Xpointend) then
                  begin
                    Yval:= StrtoFloat(Form1.StringGrid1.Cells[ycol,i]);

                    Case ComboBox1.Caption of
                          'Average':
                              YvalFit:= a1;
                          'Linear':
                              YvalFit:= a1+a2*Xval;
                          'Quadratic':
                              YvalFit:= a1+a2*Xval+a3*IntPower(Xval,2);
                          'Cubic':
                              YvalFit:= a1+a2*Xval+a3*IntPower(Xval,2) +a4*IntPower(Xval,3);
                          'Polynomial (4th power)':
                              YvalFit:= a1+a2*Xval+a3*IntPower(Xval,2) +a4*IntPower(Xval,3)+a5*IntPower(Xval,4);
                          'Exponential':
                              YvalFit:= a1*Exp(a2*Xval);
                          'Logarhithmic':
                              YvalFit:= a1*Log10(a2*Xval);
                          'Power Law':
                              YvalFit:= a1*Power(Xval, a2);
                       end;
                    rsum1:= rsum1+ (Yval-YvalSum/npoints)*(YvalFit-YvalFitSum/npoints);
                    rsum2:= rsum2+ (Yval-YvalSum/npoints)**2;
                    rsum3:= rsum3+ (YvalFit-YvalFitSum/npoints)**2;
                  end;
               end;
             end;
           rsquared:=(rsum1/Sqrt(rsum2*rsum3))**2;


           Form1.StringGrid1.RowCount:= Form1.StringGrid1.RowCount+pointtot;
           for i:= 0 to pointtot-1 do
           begin

                 Xval:= Xpointstart + (Xpointend-Xpointstart)*i/pointtot;
                 Case ComboBox1.Caption of
                    'Average':
                        YvalFit:= a1;
                    'Linear':
                        YvalFit:= a1+a2*Xval;
                    'Quadratic':
                        YvalFit:= a1+a2*Xval+a3*IntPower(Xval,2);
                    'Cubic':
                        YvalFit:= a1+a2*Xval+a3*IntPower(Xval,2) +a4*IntPower(Xval,3);
                    'Polynomial (4th power)':
                        YvalFit:= a1+a2*Xval+a3*IntPower(Xval,2) +a4*IntPower(Xval,3)+a5*IntPower(Xval,4);
                    'Exponential':
                        YvalFit:= a1*Exp(a2*Xval);
                    'Logarhithmic':
                        YvalFit:= a1*Log10(a2*Xval);
                    'Power Law':
                        YvalFit:= a1*Power(Xval, a2);
                 end;


                 Form1.StringGrid1.Cells[xcol, lastrow+i]:= FloattoStr(Xval);
                 Form1.StringGrid1.Cells[ycol, lastrow+i]:= FloattoStr(Yval);
                 Form1.StringGrid1.Cells[0, lastrow+i]:= InttoStr(i+1);
                 Form1.StringGrid1.Cells[1, lastrow+i]:= InttoStr(lastdataset+1);
                 Form1.StringGrid1.Cells[2, lastrow+i]:= ComboBox1.Caption+InttoStr(lastdataset+1);

           end;
           mystring:= ComboBox1.Caption + InttoStr(lastdataset+1) +#13 +
                      'a1=' +floattostr(a1) + #13 +
                      'a2=' +floattostr(a2) + #13 +
                      'a3=' +floattostr(a3) + #13 +
                      'a4=' +floattostr(a4) + #13 +
                      'a5=' +floattostr(a5) + #13;
           mystring:= mystring + 'r-squared= ' + floattostr(rsquared) + #13;
           Form30.Memo1.Caption:= mystring;






  Form1.Button4.Click;

end;















procedure TForm30.ComboBox1Change(Sender: TObject);
begin
      // changed ComboBox1 for type of equation
    Case ComboBox1.Caption of
       'Average':
         begin

             Form30.Edit1.Caption:='y=a1';
             Form30.Edit2.Caption:='1';
             Form30.Edit3.Caption:='0';
             Form30.Edit4.Caption:='0';
             Form30.Edit5.Caption:='0';
             Form30.Edit6.Caption:='0';
             Form30.Checkbox1.Checked:=true;
             Form30.Checkbox2.Checked:=false;
             Form30.Checkbox3.Checked:=false;
             Form30.Checkbox4.Checked:=false;
             Form30.Checkbox5.Checked:=false;
         end;
       'Linear':
         begin

             Form30.Edit1.Caption:='y=a1+a2*x';
             Form30.Edit2.Caption:='1';
             Form30.Edit3.Caption:='1';
             Form30.Edit4.Caption:='0';
             Form30.Edit5.Caption:='0';
             Form30.Edit6.Caption:='0';
             Form30.Checkbox1.Checked:=true;
             Form30.Checkbox2.Checked:=true;
             Form30.Checkbox3.Checked:=false;
             Form30.Checkbox4.Checked:=false;
             Form30.Checkbox5.Checked:=false;
         end;
       'Quadratic':
         begin

           Form30.Edit1.Caption:='y=a1+a2*x+a3*x^2';
           Form30.Edit2.Caption:='1';
           Form30.Edit3.Caption:='1';
           Form30.Edit4.Caption:='1';
           Form30.Edit5.Caption:='0';
           Form30.Edit6.Caption:='0';
           Form30.Checkbox1.Checked:=true;
           Form30.Checkbox2.Checked:=true;
           Form30.Checkbox3.Checked:=true;
           Form30.Checkbox4.Checked:=false;
           Form30.Checkbox5.Checked:=false;
         end;
       'Cubic':
         begin

           Form30.Edit1.Caption:='y=a1+a2*x+a3*x^2+a4*x^3';
           Form30.Edit2.Caption:='1';
           Form30.Edit3.Caption:='1';
           Form30.Edit4.Caption:='1';
           Form30.Edit5.Caption:='1';
           Form30.Edit6.Caption:='0';
           Form30.Checkbox1.Checked:=true;
           Form30.Checkbox2.Checked:=true;
           Form30.Checkbox3.Checked:=true;
           Form30.Checkbox4.Checked:=true;
           Form30.Checkbox5.Checked:=false;
         end;
       'Polynomial (4th power)':
         begin

           Form30.Edit1.Caption:='y=a1+a2*x+a3*x^2+a4*x^3+a5*x^4';
           Form30.Edit2.Caption:='1';
           Form30.Edit3.Caption:='1';
           Form30.Edit4.Caption:='1';
           Form30.Edit5.Caption:='1';
           Form30.Edit6.Caption:='1';
           Form30.Checkbox1.Checked:=true;
           Form30.Checkbox2.Checked:=true;
           Form30.Checkbox3.Checked:=true;
           Form30.Checkbox4.Checked:=true;
           Form30.Checkbox5.Checked:=true;
         end;
       'Exponential':
         begin

           Form30.Edit1.Caption:='y=a1*exp(a2*x)';
           Form30.Edit2.Caption:='1';
           Form30.Edit3.Caption:='1';
           Form30.Edit4.Caption:='0';
           Form30.Edit5.Caption:='0';
           Form30.Edit6.Caption:='0';
           Form30.Checkbox1.Checked:=true;
           Form30.Checkbox2.Checked:=true;
             Form30.Checkbox3.Checked:=false;
             Form30.Checkbox4.Checked:=false;
             Form30.Checkbox5.Checked:=false;
         end;
       'Logarhithmic':
         begin

           Form30.Edit1.Caption:='y=a1*Log10(a2*x)';
           Form30.Edit2.Caption:='1';
           Form30.Edit3.Caption:='1';
           Form30.Edit4.Caption:='0';
           Form30.Edit5.Caption:='0';
           Form30.Edit6.Caption:='0';
           Form30.Checkbox1.Checked:=true;
           Form30.Checkbox2.Checked:=true;
             Form30.Checkbox3.Checked:=false;
             Form30.Checkbox4.Checked:=false;
             Form30.Checkbox5.Checked:=false;
         end;
       'Power Law':
         begin

           Form30.Edit1.Caption:='y=a1*x^a2';
           Form30.Edit2.Caption:='1';
           Form30.Edit3.Caption:='1';
           Form30.Edit4.Caption:='0';
           Form30.Edit5.Caption:='0';
           Form30.Edit6.Caption:='0';
           Form30.Checkbox1.Checked:=true;
           Form30.Checkbox2.Checked:=true;
             Form30.Checkbox3.Checked:=false;
             Form30.Checkbox4.Checked:=false;
             Form30.Checkbox5.Checked:=false;
         end;
    end;
end;

end.

