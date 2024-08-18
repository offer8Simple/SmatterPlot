unit Unit28;
// Project: SmatterPlot
// unit28 = Create random dataset form

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, math;

type

  { TForm28 }

  TForm28 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
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
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private

  public

  end;

var
  Form28: TForm28;

implementation
uses
  Unit1;

{$R *.lfm}

{ TForm28 }

procedure TForm28.FormActivate(Sender: TObject);
begin
  // Activate Create Random Dataset Form
  Form28.Combobox1.Clear;
  Form28.Combobox1.Items.Add('Flat Random Y');
  Form28.Combobox1.Items.Add('Flat Random X');
  Form28.Combobox1.Items.Add('Flat Random Y & X');
  Form28.Combobox1.Items.Add('Gaussian Random Y');
  Form28.Combobox1.Items.Add('Gaussian Random X');
  Form28.Combobox1.Items.Add('Gaussian Random Y & X');
  Form28.Edit1.Caption:='1.0';
  Form28.Edit2.Caption:='0.3';
  Form28.Edit3.Caption:='2.0';
  Form28.Edit4.Caption:='0.0';
  Form28.Edit5.Caption:='1.0';
  Form28.Edit6.Caption:='0.3';
  Form28.Edit7.Caption:='2.0';
  Form28.Edit8.Caption:='0.0';
  Form28.Edit9.Caption:='1000';
  Form28.Edit10.Caption:='0.0';

end;

procedure TForm28.Button1Click(Sender: TObject);
var
  i: integer;
  j: longint;
  k: longint;
  lastrow: longint;
  lastdataset: longint;
  pointtot: longint;
  pointspacing: String;
  Xval: double;
  Yval: double;
  Ymean: double;
  Ystdev: double;
  Xmean: double;
  Xstdev: double;
  Ymax: double;
  Ymin: double;
  Xmax: double;
  Xmin: double;
  XYcorrel: double;
  foundit: boolean;

begin
  // Create Dataset Click
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
     Form1.StringGrid1.Cells[2,0]:= 'Dataset';
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


  pointtot:= StrtoInt(Form28.Edit9.Caption);
  Ymean:= StrtoFloat(Form28.Edit1.Caption);
  Ystdev:= StrtoFloat(Form28.Edit2.Caption);
  Ymax:= StrtoFloat(Form28.Edit3.Caption);
  Ymin:= StrtoFloat(Form28.Edit4.Caption);
  Xmean:= StrtoFloat(Form28.Edit5.Caption);
  Xstdev:= StrtoFloat(Form28.Edit6.Caption);
  Xmax:= StrtoFloat(Form28.Edit7.Caption);
  Xmin:= StrtoFloat(Form28.Edit8.Caption);
  XYcorrel:= StrtoFloat(Form28.Edit10.Caption);

  Case ComboBox1.Caption of
       'Flat Random Y':
         begin

           Form1.StringGrid1.RowCount:= Form1.StringGrid1.RowCount+pointtot;
           for i:= 0 to pointtot-1 do
           begin
                 Xval:= Xmin + (Xmax-Xmin)*i/pointtot;
                 Yval:= Random*(Ymax-Ymin) + Ymin;
                 Yval:=Yval*(1+XYCorrel*(Xval-Xmin)/(Xmax-Xmin));
                 Form1.StringGrid1.Cells[xcol, lastrow+i]:= FloattoStr(Xval);
                 Form1.StringGrid1.Cells[ycol, lastrow+i]:= FloattoStr(Yval);
                 Form1.StringGrid1.Cells[0, lastrow+i]:= InttoStr(i+1);
                 Form1.StringGrid1.Cells[1, lastrow+i]:= InttoStr(lastdataset+1);
                 Form1.StringGrid1.Cells[2, lastrow+i]:= 'Random'+InttoStr(lastdataset+1);
           end;
         end;
       'Flat Random X':
         begin
           Form1.StringGrid1.RowCount:= Form1.StringGrid1.RowCount+pointtot;
           for i:= 0 to pointtot-1 do
           begin
                 Yval:= Ymin + (Ymax-Ymin)*i/pointtot;
                 Xval:= Random*(Xmax-Xmin) + Xmin;
                 Yval:=Yval*(1+XYCorrel*(Xval-Xmin)/(Xmax-Xmin));
                 Form1.StringGrid1.Cells[xcol, lastrow+i]:= FloattoStr(Xval);
                 Form1.StringGrid1.Cells[ycol, lastrow+i]:= FloattoStr(Yval);
                 Form1.StringGrid1.Cells[0, lastrow+i]:= InttoStr(i+1);
                 Form1.StringGrid1.Cells[1, lastrow+i]:= InttoStr(lastdataset+1);
                 Form1.StringGrid1.Cells[2, lastrow+i]:= 'Random'+InttoStr(lastdataset+1);
           end;
         end;
       'Flat Random Y & X':
         begin
           Form1.StringGrid1.RowCount:= Form1.StringGrid1.RowCount+pointtot;
           for i:= 0 to pointtot-1 do
           begin
                 Xval:= Xmin + Random*(Xmax-Xmin);
                 Yval:= Ymin + Random*(Ymax-Ymin);
                 Yval:=Yval*(1+XYCorrel*(Xval-Xmin)/(Xmax-Xmin));
                 Form1.StringGrid1.Cells[xcol, lastrow+i]:= FloattoStr(Xval);
                 Form1.StringGrid1.Cells[ycol, lastrow+i]:= FloattoStr(Yval);
                 Form1.StringGrid1.Cells[0, lastrow+i]:= InttoStr(i+1);
                 Form1.StringGrid1.Cells[1, lastrow+i]:= InttoStr(lastdataset+1);
                 Form1.StringGrid1.Cells[2, lastrow+i]:= 'Random'+InttoStr(lastdataset+1);
           end;
         end;
      'Gaussian Random Y':
        begin
          Form1.StringGrid1.RowCount:= Form1.StringGrid1.RowCount+pointtot;
          for i:= 0 to pointtot-1 do
          begin
                Xval:= Xmin + (Xmax-Xmin)*i/pointtot;
                k:=1;
                foundit:=false;
                while (k < 1000) and (foundit = false) do
                begin
                     Yval:= Ymean + (Random-0.5)*10*Ystdev;
                     if (Yval > Ymin) and (Yval < Ymax) then
                     begin
                      if exp(-1/2*Power((Yval-Ymean)/Ystdev,2)) > Random then
                        foundit:= true;
                     end;
                     k:=k+1;
                end;
                Yval:=Yval*(1+XYCorrel*(Xval-Xmin)/(Xmax-Xmin));
                Form1.StringGrid1.Cells[xcol, lastrow+i]:= FloattoStr(Xval);
                Form1.StringGrid1.Cells[ycol, lastrow+i]:= FloattoStr(Yval);
                Form1.StringGrid1.Cells[0, lastrow+i]:= InttoStr(i+1);
                Form1.StringGrid1.Cells[1, lastrow+i]:= InttoStr(lastdataset+1);
                Form1.StringGrid1.Cells[2, lastrow+i]:= 'Random'+InttoStr(lastdataset+1);
          end;
        end;
      'Gaussian Random X':
        begin
          Form1.StringGrid1.RowCount:= Form1.StringGrid1.RowCount+pointtot;
          for i:= 0 to pointtot-1 do
          begin
                Yval:= Ymin + (Ymax-Ymin)*i/pointtot;
                k:=1;
                foundit:=false;
                while (k < 1000) and (foundit = false) do
                begin
                     Xval:= Xmean + (Random-0.5)*10*Xstdev;
                     if (Xval > Xmin) and (Xval < Xmax) then
                     begin
                      if exp(-1/2*Power((Xval-Xmean)/Xstdev,2)) > Random then
                        foundit:= true;
                     end;
                     k:=k+1;
                end;
                Yval:=Yval*(1+XYCorrel*(Xval-Xmin)/(Xmax-Xmin));
                Form1.StringGrid1.Cells[xcol, lastrow+i]:= FloattoStr(Xval);
                Form1.StringGrid1.Cells[ycol, lastrow+i]:= FloattoStr(Yval);
                Form1.StringGrid1.Cells[0, lastrow+i]:= InttoStr(i+1);
                Form1.StringGrid1.Cells[1, lastrow+i]:= InttoStr(lastdataset+1);
                Form1.StringGrid1.Cells[2, lastrow+i]:= 'Random'+InttoStr(lastdataset+1);
          end;
        end;
      'Gaussian Random Y & X':
        begin
          Form1.StringGrid1.RowCount:= Form1.StringGrid1.RowCount+pointtot;
          for i:= 0 to pointtot-1 do
          begin

                k:=1;
                foundit:=false;
                while (k < 1000) and (foundit = false) do
                begin
                     Xval:= Xmean + (Random-0.5)*10*Xstdev;
                     if (Xval > Xmin) and (Xval < Xmax) then
                     begin
                      if exp(-1/2*Power((Xval-Xmean)/Xstdev,2)) > Random then
                        foundit:= true;
                     end;
                     k:=k+1;
                end;
                k:=1;
                foundit:=false;
                while (k < 1000) and (foundit = false) do
                begin
                     Yval:= Ymean + (Random-0.5)*10*Ystdev;
                     if (Yval > Ymin) and (Yval < Ymax) then
                     begin
                      if exp(-1/2*Power((Yval-Ymean)/Ystdev,2)) > Random then
                        foundit:= true;
                     end;
                     k:=k+1;
                end;
                Yval:=Yval*(1+XYCorrel*(Xval-Xmin)/(Xmax-Xmin));
                Form1.StringGrid1.Cells[xcol, lastrow+i]:= FloattoStr(Xval);
                Form1.StringGrid1.Cells[ycol, lastrow+i]:= FloattoStr(Yval);
                Form1.StringGrid1.Cells[0, lastrow+i]:= InttoStr(i+1);
                Form1.StringGrid1.Cells[1, lastrow+i]:= InttoStr(lastdataset+1);
                Form1.StringGrid1.Cells[2, lastrow+i]:= 'Random'+InttoStr(lastdataset+1);
          end;
        end;
  end;

  Form1.RebuildChart();
end;

end.

