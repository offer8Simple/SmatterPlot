unit Unit31;
// Project: SmatterPlot
// unit31 = transform datasets form

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Math;

type

  { TForm31 }

  TForm31 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    RadioButton1: TRadioButton;
    RadioButton10: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form31: TForm31;

implementation
uses
    unit1;

{$R *.lfm}

{ TForm31 }

procedure TForm31.Button1Click(Sender: TObject);
var
  i: integer;
  j: longint;
  x1: double;
  x2: double;
  x3: double;
  x1n: double;
  x2n: double;
  mycol1: integer;
  mycol2: integer;
  mycol3: integer;
  oldcolumncount: integer;
  lastrow: longint;
  newcolname: String;
  myintegral: double;

begin
  // Click TRANSFORM button

  //find variable columns
  oldcolumncount:= Form1.StringGrid1.ColCount;
  mycol1:=0;
  mycol2:=0;
  mycol3:=0;
  myintegral:=0.0;

  for i:= 3 to oldcolumncount-1 do      // find columns for selected variables
  begin
     if Form31.ComboBox1.Caption = Form1.StringGrid1.Cells[i,0] then
     begin
        mycol1:= i;
     end;
     if Form31.ComboBox2.Caption = Form1.StringGrid1.Cells[i,0] then
     begin
        mycol2:= i;
     end;
     if (Form1.StringGrid1.Cells[i,0] = '') and (mycol3 = 0) then
     begin
        mycol3:= i;
     end;
  end;


  lastrow:= Form1.StringGrid1.RowCount;
  //ShowMessage(inttostr(mycol2));
  // Get new Column name
  if Form31.ComboBox2.Caption = '[Value]' then
  begin
    if Form31.RadioButton1.Checked = true then
       newcolname:= '('+Form31.ComboBox1.Caption + ')+'+Form31.Edit1.Caption;
    if Form31.RadioButton2.Checked = true then
       newcolname:= '('+Form31.ComboBox1.Caption + ')-'+Form31.Edit1.Caption;
    if Form31.RadioButton3.Checked = true then
       newcolname:= '('+Form31.ComboBox1.Caption + ')*'+Form31.Edit1.Caption;
    if Form31.RadioButton4.Checked = true then
       newcolname:= '('+Form31.ComboBox1.Caption + ')/'+Form31.Edit1.Caption;
    if Form31.RadioButton5.Checked = true then
       newcolname:= 'Ln('+ Form31.ComboBox1.Caption + ')';
    if Form31.RadioButton6.Checked = true then
       newcolname:= 'Log10('+ Form31.ComboBox1.Caption + ')';
    if Form31.RadioButton7.Checked = true then
       newcolname:= 'Exp('+ Form31.ComboBox1.Caption + ')';
    if Form31.RadioButton8.Checked = true then
       newcolname:= '('+Form31.ComboBox1.Caption + ')^'+Form31.Edit1.Caption;
    if Form31.RadioButton9.Checked = true then
       ShowMessage('Derivatives require a second variable.');
    if Form31.RadioButton10.Checked = true then
       ShowMessage('Integrals require a second variable.');

  end

  else
  begin
     if Form31.RadioButton1.Checked = true then
        newcolname:= '('+Form31.ComboBox1.Caption + ')+('+Form31.ComboBox2.Caption+ ')';
     if Form31.RadioButton2.Checked = true then
        newcolname:= '('+Form31.ComboBox1.Caption + ')-('+Form31.ComboBox2.Caption+ ')';
     if Form31.RadioButton3.Checked = true then
        newcolname:= '('+Form31.ComboBox1.Caption + ')*('+Form31.ComboBox2.Caption+ ')';
     if Form31.RadioButton4.Checked = true then
        newcolname:= '('+Form31.ComboBox1.Caption + ')/('+Form31.ComboBox2.Caption+ ')';
     if Form31.RadioButton5.Checked = true then
        newcolname:= 'Ln('+ Form31.ComboBox1.Caption + ')';
     if Form31.RadioButton6.Checked = true then
        newcolname:= 'Log10('+ Form31.ComboBox1.Caption + ')';
     if Form31.RadioButton7.Checked = true then
        newcolname:= 'Exp('+ Form31.ComboBox1.Caption + ')';
     if Form31.RadioButton8.Checked = true then
        newcolname:= '('+Form31.ComboBox1.Caption + ')^('+Form31.ComboBox2.Caption+ ')';
     if Form31.RadioButton9.Checked = true then
        newcolname:= 'd('+Form31.ComboBox1.Caption + ')/d('+Form31.ComboBox2.Caption+ ')';
     if Form31.RadioButton10.Checked = true then
        newcolname:= 'Integral('+Form31.ComboBox1.Caption + ')vs('+Form31.ComboBox2.Caption+ ')';
  end;
  Form1.StringGrid1.Cells[mycol3,0]:=newcolname;



  for j:= 1 to lastrow-1 do
  begin
      x1:= strtofloat(Form1.StringGrid1.Cells[mycol1,j]);
      if Form31.ComboBox2.Caption = '[Value]' then
         x2:= strtofloat(Form31.Edit1.Caption)
      else
         x2:= strtofloat(Form1.StringGrid1.Cells[mycol2,j]);

      if Form31.RadioButton1.Checked = true then
         x3:= x1+x2;
      if Form31.RadioButton2.Checked = true then
         x3:= x1-x2;
      if Form31.RadioButton3.Checked = true then
         x3:= x1*x2;
      if Form31.RadioButton4.Checked = true then
         x3:= x1/x2;
      if Form31.RadioButton5.Checked = true then
         x3:= LN(x1);
      if Form31.RadioButton6.Checked = true then
         x3:= Log10(x1);
      if Form31.RadioButton7.Checked = true then
         x3:= Exp(x1);
      if Form31.RadioButton8.Checked = true then
         x3:= x1**x2;
      if Form31.RadioButton9.Checked = true then     //derivative
      begin
         if j<lastrow-1 then
         begin
            x1n:= strtofloat(Form1.StringGrid1.Cells[mycol1,j+1]);
            x2n:= strtofloat(Form1.StringGrid1.Cells[mycol2,j+1]);
          end
         else
         begin
            x1n:= strtofloat(Form1.StringGrid1.Cells[mycol1,j-1]);
            x2n:= strtofloat(Form1.StringGrid1.Cells[mycol2,j-1]);
         end;
         x3:= (x1n-x1)/(x2n-x2);
      end;

      if Form31.RadioButton10.Checked = true then    //integral
      begin
         if j<lastrow-1 then
         begin
            x1n:= strtofloat(Form1.StringGrid1.Cells[mycol1,j+1]);
            x2n:= strtofloat(Form1.StringGrid1.Cells[mycol2,j+1]);
          end
         else
         begin
            x1n:= x1;
            x2n:= x2;
         end;
         myintegral:= myintegral+ (x1n-x1)*(x2n-x2);
         x3:=myintegral;
      end;

      Form1.StringGrid1.Cells[mycol3,j]:= floattostr(x3);
  end;

  // refresh form
  Form31.Combobox1.Clear;
  Form31.Combobox2.Clear;
  For i:= 3 to Form1.StringGrid1.ColCount -1 do
     Form31.ComboBox1.Items.Add(Form1.StringGrid1.Cells[i,0]);

  Form31.ComboBox2.Items.Add('[Value]');
  For i:= 3 to Form1.StringGrid1.ColCount -1 do
     Form31.ComboBox2.Items.Add(Form1.StringGrid1.Cells[i,0]);
  Form31.ComboBox2.Caption:= '[Value]';
  Form31.Edit1.Caption:= '0.0';

  ycol:= mycol3;
  myYAxisTitle:= newcolname;
  Form1.RebuildChart();


end;

end.

