unit Unit6;

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
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    UpDown3: TUpDown;
    UpDown4: TUpDown;
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
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
  Form1.Chart1.LeftAxis.Marks.Format:= myYNumberformat;

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
  Form1.Chart1.BottomAxis.Marks.Format:= myXNumberformat;

end;

procedure TForm6.Edit3Change(Sender: TObject);
begin
  // change interval spacing on Y-Axis
  Form1.Chart1.LeftAxis.Intervals.MaxLength:= StrtoInt(Form6.Edit3.Caption);

end;

procedure TForm6.Edit4Change(Sender: TObject);
begin
  // change interval spacing on X-Axis
  Form1.Chart1.BottomAxis.Intervals.MaxLength:= StrtoInt(Form6.Edit4.Caption);

end;

end.

