unit Unit2;
// Project: SmatterPlot
// unit2 = formatter form

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ColorBox,
  ExtCtrls, Buttons, TATransformations, TASeries, TAGraph, TATypes, TAChartUtils,
  TADrawUtils, TATools, TASources, math;

type

  { TForm2 }

  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button6: TButton;
    ChartAxisTransformations1: TChartAxisTransformations;
    ChartAxisTransformations2: TChartAxisTransformations;
    ChartAxisTransformations1LinearAxisTransform1: TLinearAxisTransform;
    ChartAxisTransformations1LogarithmAxisTransform1: TLogarithmAxisTransform;
    RadioButton1: TRadioButton;
    RadioButton10: TRadioButton;
    RadioButton11: TRadioButton;
    RadioButton12: TRadioButton;
    RadioButton13: TRadioButton;
    RadioButton14: TRadioButton;
    RadioButton15: TRadioButton;
    RadioButton16: TRadioButton;
    RadioButton17: TRadioButton;
    RadioButton18: TRadioButton;
    RadioButton19: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton20: TRadioButton;
    RadioButton21: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    ToggleBox1: TToggleBox;
    ToggleBox10: TToggleBox;
    ToggleBox11: TToggleBox;
    ToggleBox2: TToggleBox;
    ToggleBox3: TToggleBox;
    ToggleBox4: TToggleBox;
    ToggleBox5: TToggleBox;
    ToggleBox6: TToggleBox;
    ToggleBox7: TToggleBox;
    ToggleBox8: TToggleBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);

    procedure FormCreate(Sender: TObject);
    procedure RadioButton10Change(Sender: TObject);
    procedure RadioButton11Change(Sender: TObject);
    procedure RadioButton12Change(Sender: TObject);
    procedure RadioButton13Change(Sender: TObject);
    procedure RadioButton14Change(Sender: TObject);
    procedure RadioButton15Change(Sender: TObject);
    procedure RadioButton16Change(Sender: TObject);
    procedure RadioButton17Change(Sender: TObject);
    procedure RadioButton18Change(Sender: TObject);
    procedure RadioButton19Change(Sender: TObject);
    procedure RadioButton1Change(Sender: TObject);
    procedure RadioButton20Change(Sender: TObject);
    procedure RadioButton21Change(Sender: TObject);
    procedure RadioButton2Change(Sender: TObject);
    procedure RadioButton3Change(Sender: TObject);
    procedure RadioButton4Change(Sender: TObject);
    procedure RadioButton5Change(Sender: TObject);
    procedure RadioButton6Change(Sender: TObject);
    procedure RadioButton7Change(Sender: TObject);
    procedure RadioButton8Change(Sender: TObject);
    procedure RadioButton9Change(Sender: TObject);
    procedure ToggleBox10Change(Sender: TObject);
    procedure ToggleBox11Change(Sender: TObject);
    procedure ToggleBox1Change(Sender: TObject);
    procedure ToggleBox2Change(Sender: TObject);
    procedure ToggleBox2Click(Sender: TObject);
    procedure ToggleBox3Change(Sender: TObject);
    procedure ToggleBox4Change(Sender: TObject);
    procedure ToggleBox5Change(Sender: TObject);
    procedure ToggleBox6Change(Sender: TObject);
    procedure ToggleBox7Change(Sender: TObject);
    procedure ToggleBox7Click(Sender: TObject);
    procedure ToggleBox8Change(Sender: TObject);
    procedure ToggleBox8Click(Sender: TObject);
    procedure ToggleBox9Click(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation
uses
    unit1, Unit3, Unit4, Unit5, Unit6, Unit7, Unit9, Unit10,
    Unit14, Unit21, Unit22, Unit23, Unit24, Unit26, Unit27;

{$R *.lfm}

{ TForm2 }



procedure TForm2.RadioButton10Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group symbols by 4
  mysymbolsint:= [0,0,0,0,1,1,1,1,2,2,
                 2,2,3,3,3,3,4,4,4,4,
                 5,5,5,5,6,6,6,6,7,7,
                 7,7,8,8,8,8,9,9,9,9,
                 0,0,0,0,1,1,1,1,2,2,
                 2,2,3,3,3,3,4,4,4,4,
                 5,5,5,5,6,6,6,6,7,7,
                 7,7,8,8,8,8,9,9,9,9,
                 0,0,0,0,1,1,1,1,2,2,
                 2,2,3,3,3,3,4,4,4,4
                  ];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Style:=mysymbols[mysymbolsint[j]];

  end;

end;

procedure TForm2.RadioButton11Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group symbols by 5
  mysymbolsint:= [0,0,0,0,0,1,1,1,1,1,
                 2,2,2,2,2,3,3,3,3,3,
                 4,4,4,4,4,5,5,5,5,5,
                 6,6,6,6,6,7,7,7,7,7,
                 8,8,8,8,8,9,9,9,9,9,
                 0,0,0,0,0,1,1,1,1,1,
                 2,2,2,2,2,3,3,3,3,3,
                 4,4,4,4,4,5,5,5,5,5,
                 6,6,6,6,6,7,7,7,7,7,
                 8,8,8,8,8,9,9,9,9,9
                 ];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Style:=mysymbols[mysymbolsint[j]];

  end;

end;

procedure TForm2.RadioButton12Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group symbols -- no symbols
  mysymbolsint:= [9,9,9,9,9,9,9,9,9,9,
                 9,9,9,9,9,9,9,9,9,9,
                 9,9,9,9,9,9,9,9,9,9,
                 9,9,9,9,9,9,9,9,9,9,
                 9,9,9,9,9,9,9,9,9,9,
                 9,9,9,9,9,9,9,9,9,9,
                 9,9,9,9,9,9,9,9,9,9,
                 9,9,9,9,9,9,9,9,9,9,
                 9,9,9,9,9,9,9,9,9,9,
                 9,9,9,9,9,9,9,9,9,9
                 ];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Style:=mysymbols[mysymbolsint[j]];

  end;

end;

procedure TForm2.RadioButton13Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group Lines -- no grouping
  mylinesint:= [1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1
                   ];
  mylinestylesint:= [0,1,2,3,4,0,1,2,3,4,
                    0,1,2,3,4,0,1,2,3,4,
                    0,1,2,3,4,0,1,2,3,4,
                    0,1,2,3,4,0,1,2,3,4,
                    0,1,2,3,4,0,1,2,3,4,
                    0,1,2,3,4,0,1,2,3,4,
                    0,1,2,3,4,0,1,2,3,4,
                    0,1,2,3,4,0,1,2,3,4,
                    0,1,2,3,4,0,1,2,3,4,
                    0,1,2,3,4,0,1,2,3,4
                    ];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).LineType:=mylines[mylinesint[j]];
     TLineSeries(Form1.Chart1.Series[j]).LinePen.Style:=mylinestyles[mylinestylesint[j]];

  end;

end;

procedure TForm2.RadioButton14Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group Lines by 2
  mylinesint:= [1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1
                   ];
  mylinestylesint:= [0,0,1,1,2,2,3,3,4,4,
                    0,0,1,1,2,2,3,3,4,4,
                    0,0,1,1,2,2,3,3,4,4,
                    0,0,1,1,2,2,3,3,4,4,
                    0,0,1,1,2,2,3,3,4,4,
                    0,0,1,1,2,2,3,3,4,4,
                    0,0,1,1,2,2,3,3,4,4,
                    0,0,1,1,2,2,3,3,4,4,
                    0,0,1,1,2,2,3,3,4,4,
                    0,0,1,1,2,2,3,3,4,4
                    ];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).LineType:=mylines[mylinesint[j]];
     TLineSeries(Form1.Chart1.Series[j]).LinePen.Style:=mylinestyles[mylinestylesint[j]];

  end;

end;

procedure TForm2.RadioButton15Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group Lines by 3
  mylinesint:= [1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1
                   ];
  mylinestylesint:= [0,0,0,1,1,1,2,2,2,3,
                    3,3,4,4,4,0,0,0,1,1,
                    1,2,2,2,3,3,3,4,4,4,
                    0,0,0,1,1,1,2,2,2,3,
                    3,3,4,4,4,0,0,0,1,1,
                    1,2,2,2,3,3,3,4,4,4,
                    0,0,0,1,1,1,2,2,2,3,
                    3,3,4,4,4,0,0,0,1,1,
                    1,2,2,2,3,3,3,4,4,4,
                    0,0,0,1,1,1,2,2,2,3
                    ];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).LineType:=mylines[mylinesint[j]];
     TLineSeries(Form1.Chart1.Series[j]).LinePen.Style:=mylinestyles[mylinestylesint[j]];

  end;

end;

procedure TForm2.RadioButton16Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group Lines by 4
  mylinesint:= [1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1
                   ];
  mylinestylesint:= [0,0,0,0,1,1,1,1,2,2,
                    2,2,3,3,3,3,4,4,4,4,
                    0,0,0,0,1,1,1,1,2,2,
                    2,2,3,3,3,3,4,4,4,4,
                    0,0,0,0,1,1,1,1,2,2,
                    2,2,3,3,3,3,4,4,4,4,
                    0,0,0,0,1,1,1,1,2,2,
                    2,2,3,3,3,3,4,4,4,4,
                    0,0,0,0,1,1,1,1,2,2,
                    2,2,3,3,3,3,4,4,4,4
                    ];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).LineType:=mylines[mylinesint[j]];
     TLineSeries(Form1.Chart1.Series[j]).LinePen.Style:=mylinestyles[mylinestylesint[j]];

  end;


end;

procedure TForm2.RadioButton17Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group Lines by 5
  mylinesint:= [1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1
                   ];
  mylinestylesint:= [0,0,0,0,0,1,1,1,1,1,
                 2,2,2,2,2,3,3,3,3,3,
                 4,4,4,4,4,0,0,0,0,0,
                 1,1,1,1,1,2,2,2,2,2,
                 3,3,3,3,3,4,4,4,4,4,
                 0,0,0,0,0,1,1,1,1,1,
                 2,2,2,2,2,3,3,3,3,3,
                 4,4,4,4,4,0,0,0,0,0,
                 1,1,1,1,1,2,2,2,2,2,
                 3,3,3,3,3,4,4,4,4,4
                 ];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).LineType:=mylines[mylinesint[j]];
     TLineSeries(Form1.Chart1.Series[j]).LinePen.Style:=mylinestyles[mylinestylesint[j]];

  end;

end;

procedure TForm2.RadioButton18Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group Lines -- no lines
  mylinesint:= [0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0
                      ];
  mylinestylesint:= [0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0
                      ];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).LineType:=mylines[mylinesint[j]];
     TLineSeries(Form1.Chart1.Series[j]).LinePen.Style:=mylinestyles[mylinestylesint[j]];

  end;

end;

procedure TForm2.RadioButton19Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group colors all the same
  mycolorsint:= [0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0
                      ];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).SeriesColor:=mycolors[mycolorsint[j]];
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Brush.Color:=mycolors[mycolorsint[j]];
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Pen.Color:=mycolors[mycolorsint[j]];
     //TLineSeries(Form1.Chart1.Series[j]).Pointer.Style:=mysymbols[j];

  end;

end;

procedure TForm2.RadioButton1Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // No Color grouping
  mycolorsint:= [0,1,2,3,4,5,6,7,8,9,
                0,1,2,3,4,5,6,7,8,9,
                0,1,2,3,4,5,6,7,8,9,
                0,1,2,3,4,5,6,7,8,9,
                0,1,2,3,4,5,6,7,8,9,
                0,1,2,3,4,5,6,7,8,9,
                0,1,2,3,4,5,6,7,8,9,
                0,1,2,3,4,5,6,7,8,9,
                0,1,2,3,4,5,6,7,8,9,
                0,1,2,3,4,5,6,7,8,9
                ];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).SeriesColor:=mycolors[mycolorsint[j]];
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Brush.Color:=mycolors[mycolorsint[j]];
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Pen.Color:=mycolors[mycolorsint[j]];
     //TLineSeries(Form1.Chart1.Series[j]).Pointer.Style:=mysymbols[j];

  end;

end;

procedure TForm2.RadioButton20Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group symbols - all the same
  mysymbolsint:= [0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0
                      ];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Style:=mysymbols[mysymbolsint[j]];

  end;

end;

procedure TForm2.RadioButton21Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group Lines -- all the same
  mylinesint:= [1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1,
                   1,1,1,1,1,1,1,1,1,1
                   ];
  mylinestylesint:= [0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0,
                      0,0,0,0,0,0,0,0,0,0
                      ];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).LineType:=mylines[mylinesint[j]];
     TLineSeries(Form1.Chart1.Series[j]).LinePen.Style:=mylinestyles[mylinestylesint[j]];

  end;

end;

procedure TForm2.RadioButton2Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group colors by 2
  mycolorsint:= [0,0,1,1,2,2,3,3,4,4,
                 5,5,6,6,7,7,8,8,9,9,
                 0,0,1,1,2,2,3,3,4,4,
                 5,5,6,6,7,7,8,8,9,9,
                 0,0,1,1,2,2,3,3,4,4,
                 5,5,6,6,7,7,8,8,9,9,
                 0,0,1,1,2,2,3,3,4,4,
                 5,5,6,6,7,7,8,8,9,9,
                 0,0,1,1,2,2,3,3,4,4,
                 5,5,6,6,7,7,8,8,9,9
                ];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).SeriesColor:=mycolors[mycolorsint[j]];
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Brush.Color:=mycolors[mycolorsint[j]];
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Pen.Color:=mycolors[mycolorsint[j]];
     //TLineSeries(Form1.Chart1.Series[j]).Pointer.Style:=mysymbols[j];

  end;


end;

procedure TForm2.RadioButton3Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group colors by 3
  mycolorsint:= [0,0,0,1,1,1,2,2,2,3,
                3,3,4,4,4,5,5,5,6,6,
                6,7,7,7,8,8,8,9,9,9,
                0,0,0,1,1,1,2,2,2,3,
                3,3,4,4,4,5,5,5,6,6,
                6,7,7,7,8,8,8,9,9,9,
                0,0,0,1,1,1,2,2,2,3,
                3,3,4,4,4,5,5,5,6,6,
                6,7,7,7,8,8,8,9,9,9,
                0,0,0,1,1,1,2,2,2,3
                ];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).SeriesColor:=mycolors[mycolorsint[j]];
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Brush.Color:=mycolors[mycolorsint[j]];
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Pen.Color:=mycolors[mycolorsint[j]];
     //TLineSeries(Form1.Chart1.Series[j]).Pointer.Style:=mysymbols[j];

  end;

end;

procedure TForm2.RadioButton4Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group colors by 4
  mycolorsint:= [0,0,0,0,1,1,1,1,2,2,
                 2,2,3,3,3,3,4,4,4,4,
                 5,5,5,5,6,6,6,6,7,7,
                 7,7,8,8,8,8,9,9,9,9,
                 0,0,0,0,1,1,1,1,2,2,
                 2,2,3,3,3,3,4,4,4,4,
                 5,5,5,5,6,6,6,6,7,7,
                 7,7,8,8,8,8,9,9,9,9,
                 0,0,0,0,1,1,1,1,2,2,
                 2,2,3,3,3,3,4,4,4,4
                  ];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).SeriesColor:=mycolors[mycolorsint[j]];
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Brush.Color:=mycolors[mycolorsint[j]];
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Pen.Color:=mycolors[mycolorsint[j]];
     //TLineSeries(Form1.Chart1.Series[j]).Pointer.Style:=mysymbols[j];

  end;

end;

procedure TForm2.RadioButton5Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group colors by 5
  mycolorsint:= [0,0,0,0,0,1,1,1,1,1,
                 2,2,2,2,2,3,3,3,3,3,
                 4,4,4,4,4,5,5,5,5,5,
                 6,6,6,6,6,7,7,7,7,7,
                 8,8,8,8,8,9,9,9,9,9,
                 0,0,0,0,0,1,1,1,1,1,
                 2,2,2,2,2,3,3,3,3,3,
                 4,4,4,4,4,5,5,5,5,5,
                 6,6,6,6,6,7,7,7,7,7,
                 8,8,8,8,8,9,9,9,9,9
                 ];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).SeriesColor:=mycolors[mycolorsint[j]];
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Brush.Color:=mycolors[mycolorsint[j]];
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Pen.Color:=mycolors[mycolorsint[j]];
     //TLineSeries(Form1.Chart1.Series[j]).Pointer.Style:=mysymbols[j];

  end;

end;

procedure TForm2.RadioButton6Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group colors by 6
  mycolorsint:= [0,0,0,0,0,0,1,1,1,1,
                2,2,2,2,2,2,3,3,3,3,
                3,3,4,4,4,4,4,4,5,5,
                5,5,5,5,6,6,6,6,6,6,
                7,7,7,7,7,7,8,8,8,8,
                8,8,9,9,9,9,9,9,0,0,
                0,0,0,0,1,1,1,1,1,1,
                2,2,2,2,2,2,3,3,3,3,
                3,3,4,4,4,4,4,4,5,5,
                5,5,5,5,6,6,6,6,6,6
                ];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).SeriesColor:=mycolors[mycolorsint[j]];
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Brush.Color:=mycolors[mycolorsint[j]];
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Pen.Color:=mycolors[mycolorsint[j]];
     //TLineSeries(Form1.Chart1.Series[j]).Pointer.Style:=mysymbols[j];

  end;

end;

procedure TForm2.RadioButton7Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group symbols -- no grouping
  mysymbolsint:= [0,1,2,3,4,5,6,7,8,9,
                 0,1,2,3,4,5,6,7,8,9,
                 0,1,2,3,4,5,6,7,8,9,
                 0,1,2,3,4,5,6,7,8,9,
                 0,1,2,3,4,5,6,7,8,9,
                 0,1,2,3,4,5,6,7,8,9,
                 0,1,2,3,4,5,6,7,8,9,
                 0,1,2,3,4,5,6,7,8,9,
                 0,1,2,3,4,5,6,7,8,9,
                 0,1,2,3,4,5,6,7,8,9
                 ];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Style:=mysymbols[mysymbolsint[j]];

  end;

end;

procedure TForm2.RadioButton8Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group symbols by 2
  mysymbolsint:= [0,0,1,1,2,2,3,3,4,4,
                 5,5,6,6,7,7,8,8,9,9,
                 0,0,1,1,2,2,3,3,4,4,
                 5,5,6,6,7,7,8,8,9,9,
                 0,0,1,1,2,2,3,3,4,4,
                 5,5,6,6,7,7,8,8,9,9,
                 0,0,1,1,2,2,3,3,4,4,
                 5,5,6,6,7,7,8,8,9,9,
                 0,0,1,1,2,2,3,3,4,4,
                 5,5,6,6,7,7,8,8,9,9
                ];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Style:=mysymbols[mysymbolsint[j]];

  end;

end;

procedure TForm2.RadioButton9Change(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // Group symbols by 3
  mysymbolsint:= [0,0,0,1,1,1,2,2,2,3,
                3,3,4,4,4,5,5,5,6,6,
                6,7,7,7,8,8,8,9,9,9,
                0,0,0,1,1,1,2,2,2,3,
                3,3,4,4,4,5,5,5,6,6,
                6,7,7,7,8,8,8,9,9,9,
                0,0,0,1,1,1,2,2,2,3,
                3,3,4,4,4,5,5,5,6,6,
                6,7,7,7,8,8,8,9,9,9,
                0,0,0,1,1,1,2,2,2,3
                ];
  snum := Form1.Chart1.Series.Count;

  for j := 0 to snum-1 do
  begin
     TLineSeries(Form1.Chart1.Series[j]).Pointer.Style:=mysymbols[mysymbolsint[j]];

  end;

end;

procedure TForm2.ToggleBox10Change(Sender: TObject);
var
  i: longint;

begin
  // Change Units
  Form24.ComboBox1.Clear;
  Form24.ComboBox2.Clear;
  Form24.ComboBox3.Clear;

  For i:= 3 to Form1.StringGrid1.ColCount -1 do
     Form24.ComboBox1.Items.Add(Form1.StringGrid1.Cells[i,0]);

  Form24.Show;

end;

procedure TForm2.ToggleBox11Change(Sender: TObject);
begin
  // More Colors
  Form26.Show;

end;

procedure TForm2.ToggleBox1Change(Sender: TObject);
begin
   // Toggle X axis scale between log and linear
  if Form1.Chart1.BottomAxis.Transformations=Form1.ChartAxisTransformations1 then
     Form1.Chart1.BottomAxis.Transformations:=Form1.ChartAxisTransformations2
  else
     Form1.Chart1.BottomAxis.Transformations:=Form1.ChartAxisTransformations1;

  Form1.Chart1.BottomAxis.Range.UseMax:= false;
  Form1.Chart1.BottomAxis.Range.UseMin:= false;
  Form1.RebuildChart();

end;

procedure TForm2.ToggleBox2Change(Sender: TObject);
begin
  // Toggle Y axis scale between log and linear
  if Form1.Chart1.LeftAxis.Transformations=Form1.ChartAxisTransformations2 then
     Form1.Chart1.LeftAxis.Transformations:=Form1.ChartAxisTransformations1
  else
     Form1.Chart1.LeftAxis.Transformations:=Form1.ChartAxisTransformations2;

  Form1.Chart1.LeftAxis.Range.UseMax:= false;
  Form1.Chart1.LeftAxis.Range.UseMin:= false;
  Form1.RebuildChart();

end;



procedure TForm2.ToggleBox2Click(Sender: TObject);
begin

end;

procedure TForm2.Button1Click(Sender: TObject);
begin   // Show Titles form
  Form3.Show;

end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  // go to "Sizes" Form
  Form5.show;

end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  //Go to Legend Form
  Form10.Show;

end;

procedure TForm2.Button4Click(Sender: TObject);
var
olddataset: integer;
i: integer;

begin
  //Go to Error Bars Form
  Form14.ComboBox1.Clear;
  Form14.ComboBox2.Clear;
  Form14.ComboBox3.Clear;
  Form14.ComboBox4.Clear;
  Form14.ComboBox5.Clear;
  Form14.ComboBox6.Clear;
  Form14.ListBox1.Clear;


  olddataset:= StrtoInt(Form1.StringGrid1.Cells[1,1]);
  Form14.ListBox1.Items.Add(Form1.StringGrid1.Cells[2,1]);
  for i:= 1 to Form1.StringGrid1.RowCount-1 do
  begin
    if StrtoInt(Form1.StringGrid1.Cells[1,i]) <> olddataset then
    begin
       Form14.ListBox1.Items.Add(Form1.StringGrid1.Cells[2,i]);
       olddataset:= StrtoInt(Form1.StringGrid1.Cells[1,i]);
    end;
  end;

  Form14.ComboBox1.Items.Add('None');
  Form14.ComboBox1.Items.Add('Fixed Value');
  Form14.ComboBox1.Items.Add('Fixed Percent');
  Form14.ComboBox1.Items.Add('Use Columns');
  Form14.ComboBox4.Items.Add('None');
  Form14.ComboBox4.Items.Add('Fixed Value');
  Form14.ComboBox4.Items.Add('Fixed Percent');
  Form14.ComboBox4.Items.Add('Use Columns');
  Form14.Edit1.Caption:= '';
  Form14.Edit2.Caption:= '';
  Form14.Edit3.Caption:= '';
  Form14.Edit4.Caption:= '';

  Form14.Show


end;

procedure TForm2.Button6Click(Sender: TObject);
begin
  // Go to Scaling form
  if Form1.Chart1.LeftAxis.Transformations=Form1.ChartAxisTransformations1 then
  begin   // log scale
    Form7.Edit1.Caption:= FloattoStr(Power(10, Form1.Chart1.CurrentExtent.b.y));
    Form7.Edit2.Caption:= FloattoStr(Power(10, Form1.Chart1.CurrentExtent.a.y));
  end
  else
  begin
    Form7.Edit1.Caption:= FloattoStr(Form1.Chart1.CurrentExtent.b.y);
    Form7.Edit2.Caption:= FloattoStr(Form1.Chart1.CurrentExtent.a.y);

  end;
  if Form1.Chart1.BottomAxis.Transformations=Form1.ChartAxisTransformations1 then
  begin   // log scale
    Form7.Edit3.Caption:= FloattoStr(Power(10, Form1.Chart1.CurrentExtent.b.x));
    Form7.Edit4.Caption:= FloattoStr(Power(10, Form1.Chart1.CurrentExtent.a.x));
  end
  else
  begin
    Form7.Edit3.Caption:= FloattoStr(Form1.Chart1.CurrentExtent.b.x);
    Form7.Edit4.Caption:= FloattoStr(Form1.Chart1.CurrentExtent.a.x);
  end;
  if ymaxauto = true then
     Form7.CheckBox1.Checked:= true
  else
     Form7.CheckBox1.Checked:= false;

  if yminauto = true then
     Form7.CheckBox2.Checked:= true
  else
     Form7.CheckBox2.Checked:= false;
  if xmaxauto = true then
     Form7.CheckBox3.Checked:= true
  else
     Form7.CheckBox3.Checked:= false;
  if xminauto = true then
     Form7.CheckBox4.Checked:= true
  else
     Form7.CheckBox4.Checked:= false;
  Form7.Edit5.Caption:= InttoStr(YTickNum);
  Form7.Edit6.Caption:= InttoStr(XTickNum);
  Form7.show;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  // go to "Change Color Sequence form"
  Form27.show;

end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
  // click Symbol Sequence

  Form22.Show;

end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
  // click Line Sequence
  Form23.Show;

end;



procedure TForm2.FormCreate(Sender: TObject);
begin

end;

procedure TForm2.ToggleBox3Change(Sender: TObject);


begin // Toggle Grid on/off X-Axis
  If Form1.Chart1.BottomAxis.Grid.Visible = true then

       Form1.Chart1.BottomAxis.Grid.Visible:=false
  else
       Form1.Chart1.BottomAxis.Grid.Visible:=true;
       Form1.Chart1.BottomAxis.Grid.Style := psSolid;
       Form1.Chart1.BottomAxis.Grid.Color := cl3Dlight;



end;

procedure TForm2.ToggleBox4Change(Sender: TObject);
begin      // Toggle Grid on/off Y-Axis
  If Form1.Chart1.LeftAxis.Grid.Visible = true then

       Form1.Chart1.LeftAxis.Grid.Visible:=false
  else
       Form1.Chart1.LeftAxis.Grid.Visible:=true;
       Form1.Chart1.LeftAxis.Grid.Style := psSolid;
       Form1.Chart1.LeftAxis.Grid.Color := cl3Dlight;
end;

procedure TForm2.ToggleBox5Change(Sender: TObject);
begin
  // Toggle Minor Ticks on/off Y-Axis
      If Form1.Chart1.BottomAxis.Minors[0].Visible = true then

           Form1.Chart1.BottomAxis.Minors[0].Visible:=false
      else
           Form1.Chart1.BottomAxis.Minors[0].Visible:=true;
end;

procedure TForm2.ToggleBox6Change(Sender: TObject);
begin
  // Toggle Minor Ticks on/off Y-Axis
    If Form1.Chart1.LeftAxis.Minors[0].Visible = true then

         Form1.Chart1.LeftAxis.Minors[0].Visible:=false
    else
         Form1.Chart1.LeftAxis.Minors[0].Visible:=true;
end;

procedure TForm2.ToggleBox7Change(Sender: TObject);
begin
     // nothing
end;

procedure TForm2.ToggleBox7Click(Sender: TObject);
begin
  // Open Number Formats Form
  Form6.ComboBox1.Clear;
  Form6.ComboBox1.Items.Add('General');
  Form6.ComboBox1.Items.Add('Scientific');
  //Form6.ComboBox1.Items.Add('Date M/D/YY');                  // not ready yet
  //Form6.ComboBox1.Items.Add('Date MM/DD/YYYY');
  //Form6.ComboBox1.Items.Add('Time hh:mm:ss');
  //Form6.ComboBox1.Items.Add('DateTime MM/DD/YYYY hh:mm:ss');
  Form6.ComboBox1.AutoSelect:=true;
  Form6.ComboBox2.Clear;
  Form6.ComboBox2.Items.Add('General');
  Form6.ComboBox2.Items.Add('Scientific');
  Form6.ComboBox2.AutoSelect:=true;
  Case Form1.Chart1.LeftAxis.Marks.Format of
       '%:.0f%': Form6.Edit1.Caption:=InttoStr(0);
       '%:.1f%': Form6.Edit1.Caption:=InttoStr(1);
       '%:.2f%': Form6.Edit1.Caption:=InttoStr(2);
       '%:.3f%': Form6.Edit1.Caption:=InttoStr(3);
       '%:.4f%': Form6.Edit1.Caption:=InttoStr(4);
  else
       Form6.Edit1.Caption:=InttoStr(2);
  end;
  Case Form1.Chart1.BottomAxis.Marks.Format of
       '%:.0f%': Form6.Edit2.Caption:=InttoStr(0);
       '%:.1f%': Form6.Edit2.Caption:=InttoStr(1);
       '%:.2f%': Form6.Edit2.Caption:=InttoStr(2);
       '%:.3f%': Form6.Edit2.Caption:=InttoStr(3);
       '%:.4f%': Form6.Edit2.Caption:=InttoStr(4);
  else
       Form6.Edit1.Caption:=InttoStr(2);
  end;

  Form6.Show;

end;

procedure TForm2.ToggleBox8Change(Sender: TObject);
begin

end;

procedure TForm2.ToggleBox8Click(Sender: TObject);
var
  i: integer;

begin
  // Click Select Variables

  // Get variables from dataset1 headers
  Form9.Combobox1.Clear;
  Form9.Combobox2.Clear;
  Form9.ComboBox1.Caption := Form1.StringGrid1.Cells[ycol,0];
  Form9.ComboBox2.Caption := Form1.StringGrid1.Cells[xcol,0];

  //ShowMessage(InttoStr(Form1.StringGrid1.ColCount-1));
  for i:= 3 to Form1.StringGrid1.ColCount-1 do
  begin
      Form9.ComboBox1.Items.Add(Form1.StringGrid1.Cells[i,0]);
      Form9.ComboBox2.Items.Add(Form1.StringGrid1.Cells[i,0]);

  end;

  Form9.Show;

end;

procedure TForm2.ToggleBox9Click(Sender: TObject);
var
  list1num: integer;
  list2num: integer;
  i: integer;

begin
  // click Tick Labels
  Form21.Memo1.Clear;
  Form21.Memo2.Clear;
  list1num:= Form1.ListChartSource1.Count;
  list2num:= Form1.ListChartSource2.Count;
  for i:=0 to list1num-1 do
  begin
    Form21.Memo1.Append(Form1.ListChartSource1.Item[i]^.Text);
    Form21.Memo1.Append(Form1.Chart1.LeftAxis.Marks.Source.ToString);
  end;
  for i:=0 to list2num-1 do
  begin
    Form21.Memo2.Append(Form1.ListChartSource2.Item[i]^.Text);
  end;
  Form21.Show;

end;

end.

