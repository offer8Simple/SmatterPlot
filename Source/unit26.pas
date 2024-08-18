unit Unit26;
// More Colors / Custom Colors Form

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ComCtrls;

type

  { TForm26 }

  TForm26 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    UpDown3: TUpDown;
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private

  public

  end;

var
  Form26: TForm26;

implementation
uses
  Unit1;

{$R *.lfm}

{ TForm26 }

procedure TForm26.FormActivate(Sender: TObject);
begin
  // Populate form
  Form26.ComboBox1.clear;
  Form26.Edit1.Caption:= '50';
  Form26.Edit2.Caption:= '100';
  Form26.Edit3.Caption:= '150';
  Form26.Shape1.Brush.Color:= RGBtoColor(50, 100, 150);
  Form26.Shape2.Brush.Color:= RGBtoColor(255, 255, 255);

  Form26.Combobox1.Items.Add('Chart Background Color');
  Form26.Combobox1.Items.Add('Chart Plot Area Color');
  Form26.Combobox1.Items.Add('Chart Frame Color');
  Form26.Combobox1.Items.Add('Chart Title Text Color');
  Form26.Combobox1.Items.Add('Y-Axis Title Text Color');
  Form26.Combobox1.Items.Add('Y-Axis Mark Text Color');
  Form26.Combobox1.Items.Add('Y-Axis Tick Color');
  Form26.Combobox1.Items.Add('X-Axis Title Text Color');
  Form26.Combobox1.Items.Add('X-Axis Mark Text Color');
  Form26.Combobox1.Items.Add('X-Axis Tick Color');
  Form26.Combobox1.Items.Add('Legend Text Color');
  Form26.Combobox1.Items.Add('Legend Area Color');
  Form26.Combobox1.Items.Add('Legend Frame Color');
  Form26.Combobox1.Items.Add('Horizontal Grid Color');
  Form26.Combobox1.Items.Add('Vertical Grid Color');



end;

procedure TForm26.Edit1Change(Sender: TObject);
begin
  // change Edit1
  Form26.Shape1.Brush.Color:= RGBtoColor(
                              StrtoInt(Form26.Edit1.Caption),
                              StrtoInt(Form26.Edit2.Caption),
                              StrtoInt(Form26.Edit3.Caption)
                              );

end;

procedure TForm26.Button1Click(Sender: TObject);
begin
  // Click Update
  Case Form26.ComboBox1.Caption Of
  'Chart Background Color':
         Form1.Chart1.Color:=RGBtoColor(
                              StrtoInt(Form26.Edit1.Caption),
                              StrtoInt(Form26.Edit2.Caption),
                              StrtoInt(Form26.Edit3.Caption)
                              );
  'Chart Plot Area Color':
         Form1.Chart1.BackColor:=RGBtoColor(
                              StrtoInt(Form26.Edit1.Caption),
                              StrtoInt(Form26.Edit2.Caption),
                              StrtoInt(Form26.Edit3.Caption)
                              );
  'Legend Area Color':
         Form1.Chart1.Legend.BackgroundBrush.Color:=RGBtoColor(
                              StrtoInt(Form26.Edit1.Caption),
                              StrtoInt(Form26.Edit2.Caption),
                              StrtoInt(Form26.Edit3.Caption)
                              );
  'Chart Title Text Color':
         Form1.Chart1.Title.Font.Color:=RGBtoColor(
                              StrtoInt(Form26.Edit1.Caption),
                              StrtoInt(Form26.Edit2.Caption),
                              StrtoInt(Form26.Edit3.Caption)
                              );
  'Y-Axis Title Text Color':
         Form1.Chart1.LeftAxis.Title.LabelFont.Color:=RGBtoColor(
                              StrtoInt(Form26.Edit1.Caption),
                              StrtoInt(Form26.Edit2.Caption),
                              StrtoInt(Form26.Edit3.Caption)
                              );
  'X-Axis Title Text Color':
         Form1.Chart1.BottomAxis.Title.LabelFont.Color:=RGBtoColor(
                              StrtoInt(Form26.Edit1.Caption),
                              StrtoInt(Form26.Edit2.Caption),
                              StrtoInt(Form26.Edit3.Caption)
                              );
  'Y-Axis Mark Text Color':
         Form1.Chart1.LeftAxis.Marks.LabelFont.Color:=RGBtoColor(
                              StrtoInt(Form26.Edit1.Caption),
                              StrtoInt(Form26.Edit2.Caption),
                              StrtoInt(Form26.Edit3.Caption)
                              );
  'X-Axis Mark Text Color':
         Form1.Chart1.BottomAxis.Marks.LabelFont.Color:=RGBtoColor(
                              StrtoInt(Form26.Edit1.Caption),
                              StrtoInt(Form26.Edit2.Caption),
                              StrtoInt(Form26.Edit3.Caption)
                              );
  'Legend Text Color':
         Form1.Chart1.Legend.Font.Color:=RGBtoColor(
                              StrtoInt(Form26.Edit1.Caption),
                              StrtoInt(Form26.Edit2.Caption),
                              StrtoInt(Form26.Edit3.Caption)
                              );
  'Chart Frame Color':
         Form1.Chart1.Frame.Color:=RGBtoColor(
                              StrtoInt(Form26.Edit1.Caption),
                              StrtoInt(Form26.Edit2.Caption),
                              StrtoInt(Form26.Edit3.Caption)
                              );
  'Legend Frame Color':
         Form1.Chart1.Legend.Frame.Color:=RGBtoColor(
                              StrtoInt(Form26.Edit1.Caption),
                              StrtoInt(Form26.Edit2.Caption),
                              StrtoInt(Form26.Edit3.Caption)
                              );
  'Horizontal Grid Color':
         Form1.Chart1.LeftAxis.Grid.Color:=RGBtoColor(
                              StrtoInt(Form26.Edit1.Caption),
                              StrtoInt(Form26.Edit2.Caption),
                              StrtoInt(Form26.Edit3.Caption)
                              );
  'Vertical Grid Color':
         Form1.Chart1.BottomAxis.Grid.Color:=RGBtoColor(
                              StrtoInt(Form26.Edit1.Caption),
                              StrtoInt(Form26.Edit2.Caption),
                              StrtoInt(Form26.Edit3.Caption)
                              );
  'Y-Axis Tick Color':
         begin
         Form1.Chart1.LeftAxis.TickColor:=RGBtoColor(
                              StrtoInt(Form26.Edit1.Caption),
                              StrtoInt(Form26.Edit2.Caption),
                              StrtoInt(Form26.Edit3.Caption)
                              );
         Form1.Chart1.LeftAxis.Minors[0].TickColor:=RGBtoColor(
                              StrtoInt(Form26.Edit1.Caption),
                              StrtoInt(Form26.Edit2.Caption),
                              StrtoInt(Form26.Edit3.Caption)
                              );
         Form1.Chart1.LeftAxis.AxisPen.Color:=RGBtoColor(
                              StrtoInt(Form26.Edit1.Caption),
                              StrtoInt(Form26.Edit2.Caption),
                              StrtoInt(Form26.Edit3.Caption)
                              );
         end;
  'X-Axis Tick Color':
         begin
         Form1.Chart1.BottomAxis.TickColor:=RGBtoColor(
                              StrtoInt(Form26.Edit1.Caption),
                              StrtoInt(Form26.Edit2.Caption),
                              StrtoInt(Form26.Edit3.Caption)
                              );
         Form1.Chart1.BottomAxis.Minors[0].TickColor:=RGBtoColor(
                              StrtoInt(Form26.Edit1.Caption),
                              StrtoInt(Form26.Edit2.Caption),
                              StrtoInt(Form26.Edit3.Caption)
                              );
         Form1.Chart1.BottomAxis.AxisPen.Color:=RGBtoColor(
                              StrtoInt(Form26.Edit1.Caption),
                              StrtoInt(Form26.Edit2.Caption),
                              StrtoInt(Form26.Edit3.Caption)
                              );
         end;
  end;
  Form1.RebuildChart();

end;

procedure TForm26.ComboBox1Change(Sender: TObject);
begin
  // change ComboBox1
  Case Form26.ComboBox1.Caption Of
  'Chart Background Color':
         Form26.Shape2.Brush.Color:= Form1.Chart1.Color;
  'Chart Plot Area Color':
         Form26.Shape2.Brush.Color:=Form1.Chart1.BackColor;
  'Legend Area Color':
         Form26.Shape2.Brush.Color:=Form1.Chart1.Legend.BackgroundBrush.Color;
  'Chart Title Text Color':
         Form26.Shape2.Brush.Color:=Form1.Chart1.Title.Font.Color;
  'Y-Axis Title Text Color':
         Form26.Shape2.Brush.Color:=Form1.Chart1.LeftAxis.Title.LabelFont.Color;
  'X-Axis Title Text Color':
         Form26.Shape2.Brush.Color:=Form1.Chart1.BottomAxis.Title.LabelFont.Color;
  'Y-Axis Mark Text Color':
         Form26.Shape2.Brush.Color:=Form1.Chart1.LeftAxis.Marks.LabelFont.Color;
  'X-Axis Mark Text Color':
         Form26.Shape2.Brush.Color:=Form1.Chart1.BottomAxis.Marks.LabelFont.Color;
  'Legend Text Color':
         Form26.Shape2.Brush.Color:=Form1.Chart1.Legend.Font.Color;
  'Chart Frame Color':
         Form26.Shape2.Brush.Color:=Form1.Chart1.Frame.Color;
  'Legend Frame Color':
         Form26.Shape2.Brush.Color:=Form1.Chart1.Legend.Frame.Color;
  'Horizontal Grid Color':
         Form26.Shape2.Brush.Color:=Form1.Chart1.LeftAxis.Grid.Color;
  'Vertical Grid Color':
         Form26.Shape2.Brush.Color:=Form1.Chart1.BottomAxis.Grid.Color;
  'Y-Axis Tick Color':
         Form26.Shape2.Brush.Color:=Form1.Chart1.LeftAxis.TickColor;
  'X-Axis Tick Color':
         Form26.Shape2.Brush.Color:=Form1.Chart1.BottomAxis.TickColor;
  end;

end;

procedure TForm26.Edit2Change(Sender: TObject);
begin
  // change Edit2
  Form26.Shape1.Brush.Color:= RGBtoColor(
                              StrtoInt(Form26.Edit1.Caption),
                              StrtoInt(Form26.Edit2.Caption),
                              StrtoInt(Form26.Edit3.Caption)
                              );
end;

procedure TForm26.Edit3Change(Sender: TObject);
begin
  // change Edit3
  Form26.Shape1.Brush.Color:= RGBtoColor(
                              StrtoInt(Form26.Edit1.Caption),
                              StrtoInt(Form26.Edit2.Caption),
                              StrtoInt(Form26.Edit3.Caption)
                              );
end;

end.

