unit Unit6;
// Project: SmatterPlot
// unit6 = number format form
{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls;

type

  { TForm6 }

  TForm6 = class(TForm)
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);

  private

  public

  end;

var
  Form6: TForm6;

implementation
uses
  unit1;

{$R *.lfm}

{ TForm6 }

procedure TForm6.Edit1Change(Sender: TObject);
begin
     // change to Digits on Y-Axis

  Case Form6.Edit1.Caption of
       '0': myYNumberFormat:='%:.0f%';
       '1': myYNumberFormat:='%:.1f%';
       '2': myYNumberFormat:='%:.2f%';
       '3': myYNumberFormat:='%:.3f%';
       '4': myYNumberFormat:='%:.4f%';
       '5': myYNumberFormat:='%:.5f%';
       '6': myYNumberFormat:='%:.6f%';
  end;
  If Form6.Combobox1.Caption = 'Scientific' then
  begin
    Case Form6.Edit1.Caption of
         '0': myYNumberFormat:='%:.0E%';
         '1': myYNumberFormat:='%:.1E%';
         '2': myYNumberFormat:='%:.2E%';
         '3': myYNumberFormat:='%:.3E%';
         '4': myYNumberFormat:='%:.4E%';
         '5': myYNumberFormat:='%:.5E%';
         '6': myYNumberFormat:='%:.6E%';
    end;
  end;



  Form1.Chart1.LeftAxis.Marks.Format:= myYNumberformat;

end;

procedure TForm6.ComboBox1Change(Sender: TObject);
begin
  // change to Digits on Y-Axis

  Case Form6.Edit1.Caption of
      '0': myYNumberFormat:='%:.0f%';
      '1': myYNumberFormat:='%:.1f%';
      '2': myYNumberFormat:='%:.2f%';
      '3': myYNumberFormat:='%:.3f%';
      '4': myYNumberFormat:='%:.4f%';
      '5': myYNumberFormat:='%:.5f%';
      '6': myYNumberFormat:='%:.6f%';
  end;
  If Form6.Combobox1.Caption = 'Scientific' then
  begin
   Case Form6.Edit1.Caption of
        '0': myYNumberFormat:='%:.0E%';
        '1': myYNumberFormat:='%:.1E%';
        '2': myYNumberFormat:='%:.2E%';
        '3': myYNumberFormat:='%:.3E%';
        '4': myYNumberFormat:='%:.4E%';
        '5': myYNumberFormat:='%:.5E%';
        '6': myYNumberFormat:='%:.6E%';
   end;
  end;
  // not read y yet
  //If Form6.Combobox1.Caption = 'Date M/D/YYYY' then
  //    myYNumberFormat:='M/D/YYYY';
  //If Form6.Combobox1.Caption = 'Date MM/DD/YYYY' then
  //    myYNumberFormat:='MM/DD/YYYY';
  Form1.Chart1.LeftAxis.Marks.Format:= myYNumberformat;

end;

procedure TForm6.ComboBox2Change(Sender: TObject);
begin
  // change to Digits on X-Axis
  Case Form6.Edit2.Caption of
      '0': myXNumberFormat:='%:.0f%';
      '1': myXNumberFormat:='%:.1f%';
      '2': myXNumberFormat:='%:.2f%';
      '3': myXNumberFormat:='%:.3f%';
      '4': myXNumberFormat:='%:.4f%';
      '5': myXNumberFormat:='%:.5f%';
      '6': myXNumberFormat:='%:.6f%';
  end;
  If Form6.Combobox2.Caption = 'Scientific' then
  begin
    Case Form6.Edit2.Caption of
         '0': myXNumberFormat:='%:.0E%';
         '1': myXNumberFormat:='%:.1E%';
         '2': myXNumberFormat:='%:.2E%';
         '3': myXNumberFormat:='%:.3E%';
         '4': myXNumberFormat:='%:.4E%';
         '5': myXNumberFormat:='%:.5E%';
         '6': myXNumberFormat:='%:.6E%';
    end;
  end;
  // not ready yet
  //If Form6.Combobox2.Caption = 'Date M/D/YYYY' then
  //    myYNumberFormat:='M/D/YYYY';
  //If Form6.Combobox2.Caption = 'Date MM/DD/YYYY' then
  //    myYNumberFormat:='MM/DD/YYYY';

  Form1.Chart1.BottomAxis.Marks.Format:= myXNumberformat;
end;

procedure TForm6.Edit2Change(Sender: TObject);
begin
  // change to Digits on X-Axis
  Case Form6.Edit2.Caption of
      '0': myXNumberFormat:='%:.0f%';
      '1': myXNumberFormat:='%:.1f%';
      '2': myXNumberFormat:='%:.2f%';
      '3': myXNumberFormat:='%:.3f%';
      '4': myXNumberFormat:='%:.4f%';
      '5': myXNumberFormat:='%:.5f%';
      '6': myXNumberFormat:='%:.6f%';
  end;
  If Form6.Combobox2.Caption = 'Scientific' then
  begin
    Case Form6.Edit2.Caption of
         '0': myXNumberFormat:='%:.0E%';
         '1': myXNumberFormat:='%:.1E%';
         '2': myXNumberFormat:='%:.2E%';
         '3': myXNumberFormat:='%:.3E%';
         '4': myXNumberFormat:='%:.4E%';
         '5': myXNumberFormat:='%:.5E%';
         '6': myXNumberFormat:='%:.6E%';
    end;
  end;
  Form1.Chart1.BottomAxis.Marks.Format:= myXNumberformat;

end;



end.

