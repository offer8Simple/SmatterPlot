unit Unit1;
// Project: SmatterPlot
// unit1 = main form

{$mode objfpc}{$H+}

interface



uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComCtrls, Menus, ExtDlgs, TAGraph, TATypes, TASeries, LCLType,
  TATransformations, Clipbrd, Grids, Buttons, TADrawUtils, TATools, TASources,
  math, TAChartUtils, TAGeometry, BGRABitmap, BGRABitmapTypes, BGRASVG, LCLIntf,
  fpspreadsheet, xlsbiff8, fpsallformats;


var
  mycolors: array of TColor;
  mycolorsint: array of integer;
  mysymbols: array of TSeriesPointerStyle;
  mysymbolsint: array of integer;
  mysymbolsopen: array of integer;
  mysymbolstext: array of String;
  mylines: array of TLineType;
  mylinesint: array of integer;
  mylinestyles: array of TPenStyle;
  mylinestylesint: array of integer;
  mylinestext: array of String;
  myDSnames: array of String;
  mySeriesnames: array of String;

  mycolorsintdef: array of integer;
  mysymbolsintdef: array of integer;
  mysymbolsopendef: array of integer;
  mylinesintdef: array of integer;
  mylinestylesintdef: array of integer;

  myChartTitle: String;
  myYAxisTitle: String;
  myXAxisTitle: String;
  myChartTitleFontSize: integer;
  myYAxisTitleFontSize: integer;
  myXAxisTitleFontSize: integer;
  myLegendFontSize: integer;
  myChartHeight: integer;
  myChartWidth: integer;
  myYMarkFontSize: integer;
  myXMarkFontSize: integer;
  myYNumberFormat: String;
  myXNumberFormat: String;
  mydatasets: integer;
  ycol: integer;
  xcol: integer;
  ymaxauto: boolean;
  yminauto: boolean;
  xmaxauto: boolean;
  xminauto: boolean;
  ymaxglob: double;
  yminglob: double;
  xmaxglob: double;
  xminglob: double;
  YisLog: boolean;
  XisLog: boolean;
  mySizeLocked: boolean;
  YTickNum: integer;
  XTickNum: integer;
  defaultfolder: String;
  ExecutablePath: String;
  UserDir: String;
  excelname: String;
  scriptname: String;





type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button3: TButton;
    Button5: TButton;
    Button6: TButton;
    Chart1: TChart;
    ChartAxisTransformations1: TChartAxisTransformations;
    ChartAxisTransformations2: TChartAxisTransformations;
    ChartAxisTransformations1LinearAxisTransform1: TLinearAxisTransform;
    ChartAxisTransformations1LogarithmAxisTransform1: TLogarithmAxisTransform;
    ChartToolset1: TChartToolset;
    ChartToolset1ZoomMouseWheelTool1: TZoomMouseWheelTool;
    ComboBox1: TComboBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Label1: TLabel;
    ListChartSource2: TListChartSource;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem31: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem33: TMenuItem;
    MenuItem34: TMenuItem;
    MenuItem35: TMenuItem;
    MenuItem36: TMenuItem;
    MenuItem37: TMenuItem;
    MenuItem38: TMenuItem;
    MenuItem39: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem40: TMenuItem;
    MenuItem41: TMenuItem;
    MenuItem42: TMenuItem;
    MenuItem43: TMenuItem;
    MenuItem44: TMenuItem;
    MenuItem45: TMenuItem;
    MenuItem46: TMenuItem;
    MenuItem47: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    PopupMenu1: TPopupMenu;
    SaveDialog1: TSaveDialog;
    SavePictureDialog1: TSavePictureDialog;
    Separator1: TMenuItem;
    StringGrid1: TStringGrid;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    ListChartSource1: TListChartSource;


    procedure Button3Click(Sender: TObject);


    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Chart1AfterDraw(ASender: TChart; ADrawer: IChartDrawer);
    procedure Chart1ExtentChanged(ASender: TChart);
    procedure Chart1FullExtentChanged(ASender: TChart);
    procedure FormResize(Sender: TObject);
    procedure Image1Click(Sender: TObject);

    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Label2SizeConstraintsChange(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MenuItem17Click(Sender: TObject);
    procedure MenuItem18Click(Sender: TObject);
    procedure MenuItem19Click(Sender: TObject);
    procedure MenuItem20Click(Sender: TObject);
    procedure MenuItem21Click(Sender: TObject);
    procedure MenuItem22Click(Sender: TObject);
    procedure MenuItem23Click(Sender: TObject);
    procedure MenuItem24Click(Sender: TObject);
    procedure MenuItem25Click(Sender: TObject);
    procedure MenuItem26Click(Sender: TObject);
    procedure MenuItem27Click(Sender: TObject);
    procedure MenuItem28Click(Sender: TObject);
    procedure MenuItem29Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem31Click(Sender: TObject);
    procedure MenuItem32Click(Sender: TObject);
    procedure MenuItem34Click(Sender: TObject);
    procedure MenuItem35Click(Sender: TObject);
    procedure MenuItem36Click(Sender: TObject);
    procedure MenuItem37Click(Sender: TObject);
    procedure MenuItem38Click(Sender: TObject);
    procedure MenuItem39Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem40Click(Sender: TObject);
    procedure MenuItem41Click(Sender: TObject);
    procedure MenuItem42Click(Sender: TObject);
    procedure MenuItem43Click(Sender: TObject);
    procedure MenuItem44Click(Sender: TObject);
    procedure MenuItem45Click(Sender: TObject);
    procedure MenuItem46Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);

    procedure OpenMyFiles3(Sender: TObject; FileName: String);
    procedure RebuildChart();

    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of string);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StringGrid1SelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1SelectEditor(Sender: TObject; aCol, aRow: Integer;
      var Editor: TWinControl);
    procedure StringGrid1Selection(Sender: TObject; aCol, aRow: Integer);

  private

  public
    var
       myStringList: TStringList;
       NoDataYet: boolean;
       MyNumData: array of array of double;



  end;

var
  Form1: TForm1;

implementation
uses
  unit2, unit3, unit4, Unit7, Unit8, Unit9, unit10, Unit11, Unit12, Unit13, Unit14,
  Unit15, Unit17, Unit18, Unit19, Unit20, Unit22, Unit23, Unit24, Unit25, Unit28,
  Unit29, Unit30, Unit31, Unit32, Unit33, Unit34, Unit35;

{$R *.lfm}

{ TForm1 }
// REBUILDCHART procedure!!!!!!!!!!!!!!!!!
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
procedure TForm1.RebuildChart();

var
  i: integer;
  j: integer;
  k: integer;
  snum: integer;
  datasetnum: integer;
  newseries: TLineSeries;
  x: double;
  y: double;
  xmaxext: double;
  xminext: double;
  ymaxext: double;
  yminext: double;
  ymidext: double;
  xmidext: double;
  ymidlo: double;
  ymidhi: double;
  xmidlo: double;
  xmidhi: double;
  xmidmarks: array of double;
  ymidmarks: array of double;


begin
  //clear chart and repopulate it with all the data in StringGrid1
    Form1.Chart1.Visible:= True;
    Form1.Image1.Visible:= False;
    //Form1.Button5.BringToFront;
    //Form1.Button6.BringToFront;
    Form1.Panel1.BringToFront;
    Form1.Panel2.BringToFront;
    Form1.Panel1.Visible:= True;


    ymidmarks:= [0,0,0,0,0,0,0,0,0,0,
                0,0,0,0,0,0,0,0,0,0,
                0,0,0,0,0,0,0,0,0,0,
                0,0,0,0,0,0,0,0,0,0
                ];
    xmidmarks:= [0,0,0,0,0,0,0,0,0,0,
                0,0,0,0,0,0,0,0,0,0,
                0,0,0,0,0,0,0,0,0,0,
                0,0,0,0,0,0,0,0,0,0
                ];
    snum := Form1.Chart1.Series.Count;

    if snum>0 then
    begin
      for j := 0 to snum-1 do
      begin
         TLineSeries(Form1.Chart1.Series[0]).Destroy;
      end;
    end;

    If Form1.StringGrid1.RowCount > 2 then
    begin
      datasetnum:= StrtoInt(Form1.StringGrid1.Cells[1,1]);

      if datasetnum > 0 then
      begin

        newseries := TLineSeries.Create(Form1.Chart1.Owner);
        newseries.ShowPoints:= true;
        Form1.Chart1.AddSeries(newseries);
        snum := Form1.Chart1.Series.Count;

        TLineSeries(Form1.Chart1.Series[snum-1]).ShowInLegend:=true;
        TLineSeries(Form1.Chart1.Series[snum-1]).Title := Form1.StringGrid1.Cells[2,1];
        mySeriesnames[snum-1]:=Form1.StringGrid1.Cells[2,1];
        myDSnames[snum-1]:=Form1.StringGrid1.Cells[2,1];
        TLineSeries(Form1.Chart1.Series[snum-1]).SeriesColor:=mycolors[mycolorsint[snum-1]];
        TLineSeries(Form1.Chart1.Series[snum-1]).Pointer.Brush.Color:=mycolors[mycolorsint[snum-1]];
        TLineSeries(Form1.Chart1.Series[snum-1]).Pointer.Pen.Color:=mycolors[mycolorsint[snum-1]];

        TLineSeries(Form1.Chart1.Series[snum-1]).Pointer.Style:=mysymbols[mysymbolsint[snum-1]];
        if mysymbolsopen[snum-1] = 0 then
           TLineSeries(Form1.Chart1.Series[snum-1]).Pointer.Brush.Style:=bsSolid
        else
           TLineSeries(Form1.Chart1.Series[snum-1]).Pointer.Brush.Style:=bsClear;

        TLineSeries(Form1.Chart1.Series[snum-1]).LineType:=mylines[mylinesint[snum-1]];
        TLineSeries(Form1.Chart1.Series[snum-1]).ShowLines:=true;
        TLineSeries(Form1.Chart1.Series[snum-1]).LinePen.Style:=mylinestyles[mylinestylesint[snum-1]];
        TLineSeries(Form1.Chart1.Series[snum-1]).AxisIndexX:=1;
        TLineSeries(Form1.Chart1.Series[snum-1]).AxisIndexY:=0;
        Form1.Chart1.BottomAxis.Grid.Visible:=false;
        Form1.Chart1.LeftAxis.Grid.Visible:=false;
        Form1.Chart1.LeftAxis.Minors[0].TickLength:=3;
        Form1.Chart1.BottomAxis.Minors[0].TickLength:=3;
        Form1.Chart1.LeftAxis.TickInnerLength:=2;
        Form1.Chart1.BottomAxis.TickInnerLength:=2;
        Form1.Chart1.BottomAxis.Title.Caption:= Form1.StringGrid1.Cells[xcol,0];
        Form1.Chart1.LeftAxis.Title.Caption:= Form1.StringGrid1.Cells[ycol,0];
        Form1.Chart1.BorderSpacing.InnerBorder:=0;
        Form1.Chart1.Legend.TextFormat:=tfHTML;

        for j:=1 to Form1.StringGrid1.RowCount-1 do
        begin
             if datasetnum <> StrtoInt(Form1.StringGrid1.Cells[1,j]) then
             begin
                  datasetnum:= StrtoInt(Form1.StringGrid1.Cells[1,j]);
                  newseries := TLineSeries.Create(Form1.Chart1.Owner);
                  newseries.ShowPoints:= true;
                  Form1.Chart1.AddSeries(newseries);
                  snum := Form1.Chart1.Series.Count;
                  TLineSeries(Form1.Chart1.Series[snum-1]).ShowInLegend:=true;
                  TLineSeries(Form1.Chart1.Series[snum-1]).Title := Form1.StringGrid1.Cells[2,j];
                  mySeriesnames[snum-1]:=Form1.StringGrid1.Cells[2,j];
                  myDSnames[snum-1]:=Form1.StringGrid1.Cells[2,j];
                  TLineSeries(Form1.Chart1.Series[snum-1]).SeriesColor:=mycolors[mycolorsint[snum-1]];
                  TLineSeries(Form1.Chart1.Series[snum-1]).Pointer.Brush.Color:=mycolors[mycolorsint[snum-1]];
                  if mysymbolsopen[snum-1] = 0 then
                     TLineSeries(Form1.Chart1.Series[snum-1]).Pointer.Brush.Style:=bsSolid
                  else
                     TLineSeries(Form1.Chart1.Series[snum-1]).Pointer.Brush.Style:=bsClear;


                  TLineSeries(Form1.Chart1.Series[snum-1]).Pointer.Pen.Color:=mycolors[mycolorsint[snum-1]];
                  TLineSeries(Form1.Chart1.Series[snum-1]).Pointer.Style:=mysymbols[mysymbolsint[snum-1]];
                  TLineSeries(Form1.Chart1.Series[snum-1]).LineType:=mylines[mylinesint[snum-1]];
                  TLineSeries(Form1.Chart1.Series[snum-1]).ShowLines:=true;
                  TLineSeries(Form1.Chart1.Series[snum-1]).LinePen.Style:=mylinestyles[mylinestylesint[snum-1]];
                  TLineSeries(Form1.Chart1.Series[snum-1]).AxisIndexX:=1;
                  TLineSeries(Form1.Chart1.Series[snum-1]).AxisIndexY:=0;
             end;

             if TrystrtoFloat(Form1.StringGrid1.Cells[xcol,j], x) = true then
             begin
                  if TrystrtoFloat(Form1.StringGrid1.Cells[xcol,j], y) = true then
                  begin
                     x:= StrtoFloat(Form1.StringGrid1.Cells[xcol,j]);
                     y:= StrtoFloat(Form1.StringGrid1.Cells[ycol,j]);

                     TLineSeries(Form1.Chart1.Series[snum-1]).AddXY(x,y);
                  end;
             end;
        end;
      end;


      //resize chart
      if mySizeLocked = true then
      begin
        myChartHeight:= Form1.PageControl1.Height - 60;
        myChartWidth:= Form1.PageControl1.Width - 60;
        Form1.Chart1.Height:= myChartHeight;
        Form1.Chart1.Width:= myChartWidth;
      end
      else
      begin
        if Form1.Chart1.Height <> myChartHeight then
        begin
          Form1.Chart1.Height:= myChartHeight;
          Form1.PageControl1.Height:=Form1.Chart1.Height+30;
        end;
        if Form1.Chart1.Width <> myChartWidth then
        begin
          Form1.Chart1.Width:= myChartWidth;
          Form1.PageControl1.Width:=Form1.Chart1.Width+30;
        end;

      end;
      Form1.Chart1.Title.Text.Strings[0]:= myChartTitle;
      Form1.Chart1.LeftAxis.Title.Caption:= myYAxisTitle;
      Form1.Chart1.BottomAxis.Title.Caption:= myXAxisTitle;

      Chart1.LeftAxis.Range.UseMax:= false;
      Chart1.LeftAxis.Range.UseMin:= false;
      Chart1.BottomAxis.Range.UseMax:= false;
      Chart1.BottomAxis.Range.UseMin:= false;
      Chart1.Update;

      // Place the Tick Labels
      if ymaxauto = true then
         ymaxext:=Form1.Chart1.CurrentExtent.b.y
      else
          if Form1.Chart1.LeftAxis.Transformations=Form1.ChartAxisTransformations1 then
             ymaxext:= Log10(ymaxglob)
          else
             ymaxext:= ymaxglob;
      if yminauto = true then
         yminext:=Form1.Chart1.CurrentExtent.a.y
      else
          if Form1.Chart1.LeftAxis.Transformations=Form1.ChartAxisTransformations1 then
             yminext:= Log10(yminglob)
          else
             yminext:= yminglob;

      if xmaxauto = true then
         xmaxext:=Form1.Chart1.CurrentExtent.b.x
      else
          if Form1.Chart1.BottomAxis.Transformations=Form1.ChartAxisTransformations1 then
             xmaxext:= Log10(xmaxglob)
          else
             xmaxext:= xmaxglob;
      if xminauto = true then
         xminext:=Form1.Chart1.CurrentExtent.a.x
      else
          if Form1.Chart1.BottomAxis.Transformations=Form1.ChartAxisTransformations1 then
             xminext:= Log10(xminglob)
          else
             xminext:= xminglob;

      ymidext:=yminext+(ymaxext-yminext)/2;
      ymidlo:=yminext+(ymidext-yminext)/2;
      ymidhi:=ymidext+(ymaxext-ymidext)/2;
      ymidmarks[0]:=yminext+(ymaxext-yminext)/3;
      ymidmarks[1]:=yminext+(ymaxext-yminext)*2/3;
      ymidmarks[2]:=yminext+(ymaxext-yminext)*1/5;
      ymidmarks[3]:=yminext+(ymaxext-yminext)*3/5;
      ymidmarks[4]:=yminext+(ymaxext-yminext)*2/5;
      ymidmarks[5]:=yminext+(ymaxext-yminext)*4/5;
      ymidmarks[6]:=yminext+(ymaxext-yminext)*1/6;
      ymidmarks[7]:=yminext+(ymaxext-yminext)*4/6;
      ymidmarks[8]:=yminext+(ymaxext-yminext)*2/6;
      ymidmarks[9]:=yminext+(ymaxext-yminext)*5/6;
      ymidmarks[10]:=yminext+(ymaxext-yminext)*1/7;
      ymidmarks[11]:=yminext+(ymaxext-yminext)*2/7;
      ymidmarks[12]:=yminext+(ymaxext-yminext)*3/7;
      ymidmarks[13]:=yminext+(ymaxext-yminext)*4/7;
      ymidmarks[14]:=yminext+(ymaxext-yminext)*5/7;
      ymidmarks[15]:=yminext+(ymaxext-yminext)*6/7;
      ymidmarks[16]:=yminext+(ymaxext-yminext)*1/8;
      ymidmarks[17]:=yminext+(ymaxext-yminext)*2/8;
      ymidmarks[18]:=yminext+(ymaxext-yminext)*3/8;
      ymidmarks[19]:=yminext+(ymaxext-yminext)*5/8;
      ymidmarks[20]:=yminext+(ymaxext-yminext)*6/8;
      ymidmarks[21]:=yminext+(ymaxext-yminext)*7/8;
      ymidmarks[22]:=yminext+(ymaxext-yminext)*1/9;
      ymidmarks[23]:=yminext+(ymaxext-yminext)*2/9;
      ymidmarks[24]:=yminext+(ymaxext-yminext)*3/9;
      ymidmarks[25]:=yminext+(ymaxext-yminext)*4/9;
      ymidmarks[26]:=yminext+(ymaxext-yminext)*5/9;
      ymidmarks[27]:=yminext+(ymaxext-yminext)*6/9;
      ymidmarks[28]:=yminext+(ymaxext-yminext)*7/9;
      ymidmarks[29]:=yminext+(ymaxext-yminext)*8/9;
      ymidmarks[30]:=yminext+(ymaxext-yminext)*1/10;
      ymidmarks[31]:=yminext+(ymaxext-yminext)*2/10;
      ymidmarks[32]:=yminext+(ymaxext-yminext)*3/10;
      ymidmarks[33]:=yminext+(ymaxext-yminext)*4/10;
      ymidmarks[34]:=yminext+(ymaxext-yminext)*6/10;
      ymidmarks[35]:=yminext+(ymaxext-yminext)*7/10;
      ymidmarks[36]:=yminext+(ymaxext-yminext)*8/10;
      ymidmarks[37]:=yminext+(ymaxext-yminext)*9/10;

      xmidext:=xminext+(xmaxext-xminext)/2;
      xmidlo:=xminext+(xmidext-xminext)/2;
      xmidhi:=xmidext+(xmaxext-xmidext)/2;
      xmidmarks[0]:=xminext+(xmaxext-xminext)/3;
      xmidmarks[1]:=xminext+(xmaxext-xminext)*2/3;
      xmidmarks[2]:=xminext+(xmaxext-xminext)*1/5;
      xmidmarks[3]:=xminext+(xmaxext-xminext)*3/5;
      xmidmarks[4]:=xminext+(xmaxext-xminext)*2/5;
      xmidmarks[5]:=xminext+(xmaxext-xminext)*4/5;
      xmidmarks[6]:=xminext+(xmaxext-xminext)*1/6;
      xmidmarks[7]:=xminext+(xmaxext-xminext)*4/6;
      xmidmarks[8]:=xminext+(xmaxext-xminext)*2/6;
      xmidmarks[9]:=xminext+(xmaxext-xminext)*5/6;
      xmidmarks[10]:=xminext+(xmaxext-xminext)*1/7;
      xmidmarks[11]:=xminext+(xmaxext-xminext)*2/7;
      xmidmarks[12]:=xminext+(xmaxext-xminext)*3/7;
      xmidmarks[13]:=xminext+(xmaxext-xminext)*4/7;
      xmidmarks[14]:=xminext+(xmaxext-xminext)*5/7;
      xmidmarks[15]:=xminext+(xmaxext-xminext)*6/7;
      xmidmarks[16]:=xminext+(xmaxext-xminext)*1/8;
      xmidmarks[17]:=xminext+(xmaxext-xminext)*2/8;
      xmidmarks[18]:=xminext+(xmaxext-xminext)*3/8;
      xmidmarks[19]:=xminext+(xmaxext-xminext)*5/8;
      xmidmarks[20]:=xminext+(xmaxext-xminext)*6/8;
      xmidmarks[21]:=xminext+(xmaxext-xminext)*7/8;
      xmidmarks[22]:=xminext+(xmaxext-xminext)*1/9;
      xmidmarks[23]:=xminext+(xmaxext-xminext)*2/9;
      xmidmarks[24]:=xminext+(xmaxext-xminext)*3/9;
      xmidmarks[25]:=xminext+(xmaxext-xminext)*4/9;
      xmidmarks[26]:=xminext+(xmaxext-xminext)*5/9;
      xmidmarks[27]:=xminext+(xmaxext-xminext)*6/9;
      xmidmarks[28]:=xminext+(xmaxext-xminext)*7/9;
      xmidmarks[29]:=xminext+(xmaxext-xminext)*8/9;
      xmidmarks[30]:=xminext+(xmaxext-xminext)*1/10;
      xmidmarks[31]:=xminext+(xmaxext-xminext)*2/10;
      xmidmarks[32]:=xminext+(xmaxext-xminext)*3/10;
      xmidmarks[33]:=xminext+(xmaxext-xminext)*4/10;
      xmidmarks[34]:=xminext+(xmaxext-xminext)*6/10;
      xmidmarks[35]:=xminext+(xmaxext-xminext)*7/10;
      xmidmarks[36]:=xminext+(xmaxext-xminext)*8/10;
      xmidmarks[37]:=xminext+(xmaxext-xminext)*9/10;

      //ShowMessage('pause here');

      if Form1.Chart1.LeftAxis.Transformations=Form1.ChartAxisTransformations1 then
      begin      // log scale so adjust tick mark label locations
        if ymaxext > 0 then
           ymaxext:=Ceil(ymaxext)
        else
           ymaxext:=Ceil(ymaxext);
        if yminext > 0 then
           yminext:=Floor(yminext)
        else
           yminext:=Floor(yminext);
        ymidext:=yminext+(ymaxext-yminext)/2;
        ymidlo:=yminext+(ymidext-yminext)/2;
        ymidhi:=ymidext+(ymaxext-ymidext)/2;
        if ymaxext-yminext = 3 then
        begin
          ymidlo:=yminext+1;
          ymidhi:=ymaxext-1;
        end;

        ymaxext:=Power(10, ymaxext);
        yminext:=Power(10, yminext);
        ymidext:=Power(10, ymidext);
        ymidlo:=Power(10, ymidlo);
        ymidhi:=Power(10, ymidhi);

      end;

      if Form1.Chart1.BottomAxis.Transformations=Form1.ChartAxisTransformations1 then
      begin   // log scale so adjust tick mark label locations
        if xmaxext > 0 then
           xmaxext:=Ceil(xmaxext)
        else
           xmaxext:=Ceil(xmaxext);
        if xminext > 0 then
           xminext:=Floor(xminext)
        else
           xminext:=Floor(xminext);

        xmidext:=xminext+(xmaxext-xminext)/2;
        xmidlo:=xminext+(xmidext-xminext)/2;
        xmidhi:=xmidext+(xmaxext-xmidext)/2;
        if xmaxext-xminext = 3 then
        begin
          xmidlo:=xminext+1;
          xmidhi:=xmaxext-1;
        end;

        xmaxext:=Power(10, xmaxext);
        xminext:=Power(10, xminext);
        xmidext:=Power(10, xmidext);
        xmidlo:=Power(10, xmidlo);
        xmidhi:=Power(10, xmidhi);

        Form1.Chart1.BottomAxis.Range.Min:= xminext;
        Form1.Chart1.BottomAxis.Range.UseMin:= true;
        Form1.Chart1.BottomAxis.Range.Max:= xmaxext;
        Form1.Chart1.BottomAxis.Range.UseMax:= true;

      end;
      if Form1.Chart1.LeftAxis.Transformations=Form1.ChartAxisTransformations1 then
      begin
        Form1.Chart1.LeftAxis.Range.Min:= yminext;
        Form1.Chart1.LeftAxis.Range.UseMin:= true;
        Form1.Chart1.LeftAxis.Range.Max:= ymaxext;
        Form1.Chart1.LeftAxis.Range.UseMax:= true;
      end;

      ListChartSource1.Clear;
      ListChartSource1.add(yminext, yminext);
      ListChartSource1.add(ymaxext, ymaxext);
      Case YTickNum Of
      3:
        ListChartSource1.add(ymidext, ymidext);
      4:
        begin
           ListChartSource1.add(ymidmarks[0], ymidmarks[0]);
           ListChartSource1.add(ymidmarks[1], ymidmarks[1]);
        end;
      5:
        begin
           ListChartSource1.add(ymidext, ymidext);
           ListChartSource1.add(ymidlo, ymidlo);
           ListChartSource1.add(ymidhi, ymidhi);
        end;
      6:
        begin
          ListChartSource1.add(ymidmarks[2], ymidmarks[2]);
          ListChartSource1.add(ymidmarks[3], ymidmarks[3]);
          ListChartSource1.add(ymidmarks[4], ymidmarks[4]);
          ListChartSource1.add(ymidmarks[5], ymidmarks[5]);
        end;
      7:
        begin
          ListChartSource1.add(ymidext, ymidext);
          ListChartSource1.add(ymidmarks[6], ymidmarks[6]);
          ListChartSource1.add(ymidmarks[7], ymidmarks[7]);
          ListChartSource1.add(ymidmarks[8], ymidmarks[8]);
          ListChartSource1.add(ymidmarks[9], ymidmarks[9]);
        end;
      8:
        begin
          ListChartSource1.add(ymidmarks[10], ymidmarks[10]);
          ListChartSource1.add(ymidmarks[11], ymidmarks[11]);
          ListChartSource1.add(ymidmarks[12], ymidmarks[12]);
          ListChartSource1.add(ymidmarks[13], ymidmarks[13]);
          ListChartSource1.add(ymidmarks[14], ymidmarks[14]);
          ListChartSource1.add(ymidmarks[15], ymidmarks[15]);
        end;
      9:
        begin
          ListChartSource1.add(ymidext, ymidext);
          ListChartSource1.add(ymidmarks[16], ymidmarks[16]);
          ListChartSource1.add(ymidmarks[17], ymidmarks[17]);
          ListChartSource1.add(ymidmarks[18], ymidmarks[18]);
          ListChartSource1.add(ymidmarks[19], ymidmarks[19]);
          ListChartSource1.add(ymidmarks[20], ymidmarks[20]);
          ListChartSource1.add(ymidmarks[21], ymidmarks[21]);
        end;
      10:
        begin
          ListChartSource1.add(ymidmarks[22], ymidmarks[22]);
          ListChartSource1.add(ymidmarks[23], ymidmarks[23]);
          ListChartSource1.add(ymidmarks[24], ymidmarks[24]);
          ListChartSource1.add(ymidmarks[25], ymidmarks[25]);
          ListChartSource1.add(ymidmarks[26], ymidmarks[26]);
          ListChartSource1.add(ymidmarks[27], ymidmarks[27]);
          ListChartSource1.add(ymidmarks[28], ymidmarks[28]);
          ListChartSource1.add(ymidmarks[29], ymidmarks[29]);
        end;
      11:
        begin
          ListChartSource1.add(ymidext, ymidext);
          ListChartSource1.add(ymidmarks[30], ymidmarks[30]);
          ListChartSource1.add(ymidmarks[31], ymidmarks[31]);
          ListChartSource1.add(ymidmarks[32], ymidmarks[32]);
          ListChartSource1.add(ymidmarks[33], ymidmarks[33]);
          ListChartSource1.add(ymidmarks[34], ymidmarks[34]);
          ListChartSource1.add(ymidmarks[35], ymidmarks[35]);
          ListChartSource1.add(ymidmarks[36], ymidmarks[36]);
          ListChartSource1.add(ymidmarks[37], ymidmarks[37]);
        end;
      end;
      if YTickNum > 11 then
      begin
        ListChartSource1.add(ymidext, ymidext);
        ListChartSource1.add(ymidlo, ymidlo);
        ListChartSource1.add(ymidhi, ymidhi);
      end;


      ListChartSource2.Clear;
      ListChartSource2.add(xminext, xminext);
      ListChartSource2.add(xmaxext, xmaxext);
      Case XTickNum Of
            3:
              ListChartSource2.add(xmidext, xmidext);
            4:
              begin
                 ListChartSource2.add(xmidmarks[0], xmidmarks[0]);
                 ListChartSource2.add(xmidmarks[1], xmidmarks[1]);
              end;
            5:
              begin
                 ListChartSource2.add(xmidext, xmidext);
                 ListChartSource2.add(xmidlo, xmidlo);
                 ListChartSource2.add(xmidhi, xmidhi);
              end;
            6:
              begin
                ListChartSource2.add(xmidmarks[2], xmidmarks[2]);
                ListChartSource2.add(xmidmarks[3], xmidmarks[3]);
                ListChartSource2.add(xmidmarks[4], xmidmarks[4]);
                ListChartSource2.add(xmidmarks[5], xmidmarks[5]);
              end;
            7:
              begin
                ListChartSource2.add(xmidext, xmidext);
                ListChartSource2.add(xmidmarks[6], xmidmarks[6]);
                ListChartSource2.add(xmidmarks[7], xmidmarks[7]);
                ListChartSource2.add(xmidmarks[8], xmidmarks[8]);
                ListChartSource2.add(xmidmarks[9], xmidmarks[9]);
              end;
            8:
              begin
                ListChartSource2.add(xmidmarks[10], xmidmarks[10]);
                ListChartSource2.add(xmidmarks[11], xmidmarks[11]);
                ListChartSource2.add(xmidmarks[12], xmidmarks[12]);
                ListChartSource2.add(xmidmarks[13], xmidmarks[13]);
                ListChartSource2.add(xmidmarks[14], xmidmarks[14]);
                ListChartSource2.add(xmidmarks[15], xmidmarks[15]);
              end;
            9:
              begin
                ListChartSource2.add(xmidext, xmidext);
                ListChartSource2.add(xmidmarks[16], xmidmarks[16]);
                ListChartSource2.add(xmidmarks[17], xmidmarks[17]);
                ListChartSource2.add(xmidmarks[18], xmidmarks[18]);
                ListChartSource2.add(xmidmarks[19], xmidmarks[19]);
                ListChartSource2.add(xmidmarks[20], xmidmarks[20]);
                ListChartSource2.add(xmidmarks[21], xmidmarks[21]);
              end;
            10:
              begin
                ListChartSource2.add(xmidmarks[22], xmidmarks[22]);
                ListChartSource2.add(xmidmarks[23], xmidmarks[23]);
                ListChartSource2.add(xmidmarks[24], xmidmarks[24]);
                ListChartSource2.add(xmidmarks[25], xmidmarks[25]);
                ListChartSource2.add(xmidmarks[26], xmidmarks[26]);
                ListChartSource2.add(xmidmarks[27], xmidmarks[27]);
                ListChartSource2.add(xmidmarks[28], xmidmarks[28]);
                ListChartSource2.add(xmidmarks[29], xmidmarks[29]);
              end;
            11:
              begin
                ListChartSource2.add(xmidext, xmidext);
                ListChartSource2.add(xmidmarks[30], xmidmarks[30]);
                ListChartSource2.add(xmidmarks[31], xmidmarks[31]);
                ListChartSource2.add(xmidmarks[32], xmidmarks[32]);
                ListChartSource2.add(xmidmarks[33], xmidmarks[33]);
                ListChartSource2.add(xmidmarks[34], xmidmarks[34]);
                ListChartSource2.add(xmidmarks[35], xmidmarks[35]);
                ListChartSource2.add(xmidmarks[36], xmidmarks[36]);
                ListChartSource2.add(xmidmarks[37], xmidmarks[37]);
              end;
            end;
            if XTickNum > 11 then
            begin
              ListChartSource2.add(xmidext, xmidext);
              ListChartSource2.add(xmidlo, xmidlo);
              ListChartSource2.add(xmidhi, xmidhi);
            end;


      Chart1.LeftAxis.Marks.Source:=ListChartSource1;
      Chart1.BottomAxis.Marks.Source:=ListChartSource2;
      if ymaxauto = false then
         Form1.Chart1.LeftAxis.Range.UseMax:= true;
      if yminauto = false then
         Form1.Chart1.LeftAxis.Range.UseMin:= true;
      if xmaxauto = false then
         Form1.Chart1.BottomAxis.Range.UseMax:= true;
      if xminauto = false then
         Form1.Chart1.BottomAxis.Range.UseMin:= true;


      Form1.StringGrid1.Cells[0,0]:= '{PointNumber}';
      Form1.StringGrid1.Cells[1,0]:= '{DatasetNumber}';

    end;
    Form1.Chart1.Title.Font.Size:= myChartTitleFontSize;
    Form1.Chart1.LeftAxis.Title.LabelFont.Size:= myYAxisTitleFontSize;
    Form1.Chart1.BottomAxis.Title.LabelFont.Size:= myXAxisTitleFontSize;
    Form1.Chart1.LeftAxis.Marks.LabelFont.Size:= myYMarkFontSize;
    Form1.Chart1.BottomAxis.Marks.LabelFont.Size:= myXMarkFontSize;
    Form1.Chart1.Legend.Font.Size:= myLegendFontSize;
    Form1.Chart1.LeftAxis.Marks.Format:= myYNumberFormat;
    Form1.Chart1.BottomAxis.Marks.Format:=myXNumberFormat;
    Form1.Button5.Visible:= False;
    Form1.Button6.Visible:= False;
    Form7.Edit1.Caption:=FloattoStr(ymaxext);
    Form7.Edit2.Caption:=FloattoStr(yminext);
    Form7.Edit3.Caption:=FloattoStr(xmaxext);
    Form7.Edit4.Caption:=FloattoStr(xminext);
    Chart1.Update;


end;












// David's fourth procedure!!!!!!!!!!!!!!!!!
procedure TForm1.OpenMyFiles3(Sender: TObject; FileName: String);
// Open File into Paste Pad
var
  myfile: String;
  i: integer;
  mypos: integer;
  slashpos: integer;
  noslashstr: String;
  myWorkbook: TsWorkbook;
  myWorksheet: TsWorksheet;
  myRow: integer;
  myCol: integer;
  mystr: String;


begin
     //open a file and store data in Paste Pad only -- no table, no chart yet
    Form1.Memo1.Clear;
    myStringList.Clear;

    if pos('\', FileName) > 0 then
       begin
         slashpos := pos('\', FileName);
         noslashstr := copy(FileName, slashpos+1);
         while pos('\', noslashstr) > 0 do
           begin
                slashpos := pos('\', noslashstr);
                noslashstr := copy(noslashstr, slashpos+1);
           end;
       end;
    Form1.Memo1.Lines.Add('<' + noslashstr + '>');
    myfile :=FileName;

    //check if file is excel workbook
    if (pos('.xls', FileName) > 0) or (pos('.ods', FileName) >0) then
    begin
       myWorkbook:= TsWorkbook.create;
       myWorkbook.ReadFromFile(FileName);
       myWorksheet:= myWorkbook.GetWorksheetByIndex(0);
       for myRow:= 0 to myWorksheet.GetLastRowIndex do
       begin
         mystr:= '';
         for myCol:= 0 to myWorksheet.GetLastColIndex do
         begin
              mystr:= mystr+myWorksheet.ReadAsText(myWorksheet.FindCell(myRow, myCol)) + #9;
         end;
         myStringList.Add(mystr);
       end;
       myWorkbook.Free;
       //ShowMessage('Opened as Excel Workbook');
    end
    else    // open like textfile
       myStringList.LoadfromFile(myfile);

    // read rows
    for i := 0 to myStringList.count -1 do
    begin
        Form1.Memo1.Lines.Add(myStringList[i]);
    end;

    // check for degree symbol
    if pos('?',Form1.Memo1.Lines[1]) > 0 then
      begin
        mypos:= pos('?',Form1.Memo1.Lines[1]);
        Form1.Memo1.Lines[1]:= copy(Form1.Memo1.Lines[1],1, mypos-1) + '°' +
                               copy(Form1.Memo1.Lines[1],mypos+1);
      end;
end;














procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  // Open Selected
  OpenDialog1.InitialDir:=defaultfolder;
  if OpenDialog1.Execute then
    begin
      if fileExists(OpenDialog1.Filename) then
        OpenMyFiles3(Sender, OpenDialog1.Filename);
        Form1.Button1.Click;
        RebuildChart();
    end
  else
    ShowMessage('No file selected');
end;

procedure TForm1.MenuItem31Click(Sender: TObject);
begin
  // Click to open Settings
  Form35.Edit1.Caption:= defaultfolder;
  Form35.Edit2.Caption:= excelname;
  Form35.Edit3.Caption:= scriptname;
  Form35.Edit4.Caption:= myChartTitle;
  Form35.Edit5.Caption:= myYAxisTitle;
  Form35.Edit6.Caption:= myXAxisTitle;
  Form35.Edit7.Caption:= InttoStr(myChartTitleFontSize);
  Form35.Edit8.Caption:= InttoStr(myYAxisTitleFontSize);
  Form35.Edit9.Caption:= InttoStr(myXAxisTitleFontSize);
  Form35.Edit10.Caption:= InttoStr(myYMarkFontSize);
  Form35.Edit11.Caption:= InttoStr(myXMarkFontSize);
  Form35.Edit12.Caption:= InttoStr(myLegendFontSize);
  Form35.Edit13.Caption:= InttoStr(myChartHeight);
  Form35.Edit14.Caption:= InttoStr(myChartWidth);
  Form35.Edit15.Caption:= myYNumberFormat;
  Form35.Edit16.Caption:= myXNumberFormat;
  Form35.Edit17.Caption:= '---';

  Form35.Show;

end;

procedure TForm1.MenuItem32Click(Sender: TObject);
begin
  // Show Formatter
  Form2.Show;

end;

procedure TForm1.MenuItem34Click(Sender: TObject);
var
  i: integer;
  olddataset: integer;

begin
  // Click to Sort Datasets
  olddataset:= StrtoInt(Form1.StringGrid1.Cells[1,1]);
  Form11.ListBox1.Clear;
  Form11.ListBox1.Items.Add(StringGrid1.Cells[2,1]);
  for i:= 1 to Form1.StringGrid1.RowCount-1 do
  begin
    if StrtoInt(Form1.StringGrid1.Cells[1,i]) <> olddataset then
    begin
       Form11.ListBox1.Items.Add(StringGrid1.Cells[2,i]);
       olddataset:= StrtoInt(Form1.StringGrid1.Cells[1,i]);
    end;
  end;
  Form11.show;

end;

procedure TForm1.MenuItem35Click(Sender: TObject);
begin
  // Plot Equation
  Form13.Combobox1.Clear;
  Form13.Combobox1.Items.Add('Linear');
  Form13.Combobox1.Items.Add('Quadratic');
  Form13.Combobox1.Items.Add('Cubic');
  Form13.Combobox1.Items.Add('Polynomial (4th power)');
  Form13.Combobox1.Items.Add('Exponential');
  Form13.Combobox1.Items.Add('Logarhithmic');
  Form13.Combobox1.Items.Add('Power Law');
  Form13.Combobox1.Items.Add('Arhenius');
  Form13.Combobox1.Items.Add('Langmuir');
  Form13.ComboBox1.AutoSelected:=true;
  Form13.ComboBox1.Caption:= 'Linear';

  Form13.ComboBox2.Clear;
  Form13.ComboBox2.Items.Add('Linear');
  Form13.ComboBox2.Items.Add('Logarhithmic');
  Form13.ComboBox2.Caption:= 'Linear';
  Form13.ComboBox2.AutoSelected:=true;

  Form13.Edit1.Caption:='y=a1+a2*x';
  Form13.Edit2.Caption:='1';
  Form13.Edit3.Caption:='1';
  Form13.Edit4.Caption:='0';
  Form13.Edit5.Caption:='0';
  Form13.Edit6.Caption:='0';
  Form13.Edit7.Caption:='-10';
  Form13.Edit8.Caption:='10';
  Form13.Edit9.Caption:='50';

  Form13.Show;

end;

procedure TForm1.MenuItem36Click(Sender: TObject);
var
  i: integer;

begin
    // Fit Model
  Form30.Combobox3.Clear;
  for i:=0 to Length(myDSNames) -1 do
  begin
    Form30.Combobox3.Items.Add(myDSNames[i]);
  end;
  Form30.Combobox3.Caption:= myDSNames[0];

  Form30.Combobox1.Clear;
  Form30.Combobox1.Items.Add('Average');
  Form30.Combobox1.Items.Add('Linear');
  Form30.Combobox1.Items.Add('Quadratic');
  Form30.Combobox1.Items.Add('Cubic');
  Form30.Combobox1.Items.Add('Polynomial (4th power)');
  Form30.Combobox1.Items.Add('Exponential');
  Form30.Combobox1.Items.Add('Logarhithmic(Natural)');
  Form30.Combobox1.Items.Add('Logarhithmic(Base10)');
  Form30.Combobox1.Items.Add('Power Law');
  Form30.Combobox1.Items.Add('Arrhenius Equation');
  Form30.Combobox1.Items.Add('[---- more models ----]');
  Form30.Combobox1.Items.Add('Power Law for Viscosity');
  Form30.Combobox1.Items.Add('Bingham Model for Viscosity');
  Form30.Combobox1.Items.Add('Briant Model for Viscosity');
  Form30.Combobox1.Items.Add('Carreau-Yasuda Model for Viscosity');
  Form30.Combobox1.Items.Add('Casson Model for Viscosity');
  Form30.Combobox1.Items.Add('Gauss Distribution');
  Form30.Combobox1.Items.Add('Gompertz Sigmoid');
  Form30.Combobox1.Items.Add('Herschel-Bulkley Model for Viscosity');

  Form30.ComboBox1.AutoSelected:=true;
  Form30.ComboBox1.Caption:= 'Linear';
  form30.Image1.Picture.LoadFromFile('linear.png');

  Form30.Edit2.Caption:='1';
  Form30.Edit3.Caption:='1';
  Form30.Edit4.Caption:='0';
  Form30.Edit5.Caption:='0';
  Form30.Edit6.Caption:='0';
  Form30.Edit7.Caption:='-10';
  Form30.Edit8.Caption:='10';
  Form30.Edit9.Caption:='50';
  Form30.Edit10.Caption:='100';
  Form30.Memo1.Clear;
  Form30.Edit2.Caption:='1';
  Form30.Edit3.Caption:='1';
  Form30.Edit4.Caption:='0';
  Form30.Edit5.Caption:='0';
  Form30.Edit6.Caption:='0';
  Form30.Edit2.Visible:=true;
  Form30.Edit3.Visible:=true;
  Form30.Edit4.Visible:=false;
  Form30.Edit5.Visible:=false;
  Form30.Edit6.Visible:=false;
  Form30.Checkbox1.Checked:=true;
  Form30.Checkbox2.Checked:=true;
  Form30.Checkbox3.Checked:=false;
  Form30.Checkbox4.Checked:=false;
  Form30.Checkbox5.Checked:=false;
  Form30.Checkbox1.Visible:=true;
  Form30.Checkbox2.Visible:=true;
  Form30.Checkbox3.Visible:=false;
  Form30.Checkbox4.Visible:=false;
  Form30.Checkbox5.Visible:=false;
  Form30.Memo1.Clear;
  Form30.Memo1.Lines.Add('Linear Model');
  Form30.Memo1.Lines.Add('y=a1+a2*x');
  Form30.Memo1.Lines.Add('a1: intercept');
  Form30.Memo1.Lines.Add('a2: slope');
  Form30.Memo1.Lines.Add('Solve using Linear Least Squares');
  Form30.Image1.Picture.LoadFromFile('linear.png');
  Form30.HideSearchBoxes();


  // get current zoom scaling and set at X range default
  if Form1.Chart1.BottomAxis.Transformations=Form1.ChartAxisTransformations1 then
  begin   // log scale
    Form30.Edit8.Caption:= FloattoStr(Power(10, Form1.Chart1.CurrentExtent.b.x));
    Form30.Edit7.Caption:= FloattoStr(Power(10, Form1.Chart1.CurrentExtent.a.x));
  end
  else
  begin
    Form30.Edit8.Caption:= FloattoStr(Form1.Chart1.CurrentExtent.b.x);
    Form30.Edit7.Caption:= FloattoStr(Form1.Chart1.CurrentExtent.a.x);
  end;

  Form30.Show;
end;

procedure TForm1.MenuItem37Click(Sender: TObject);
var
  i: longint;


begin
  // Transform datasets
  // create a new variable (a new column) computed from existing columns
  Form31.Combobox1.Clear;
  Form31.Combobox2.Clear;
  For i:= 3 to StringGrid1.ColCount -1 do
     Form31.ComboBox1.Items.Add(StringGrid1.Cells[i,0]);

  Form31.ComboBox2.Items.Add('[Value]');
  For i:= 3 to StringGrid1.ColCount -1 do
     Form31.ComboBox2.Items.Add(StringGrid1.Cells[i,0]);
  Form31.ComboBox2.Caption:= '[Value]';
  Form31.Edit1.Caption:= '0.0';
  Form31.RadioButton1.Checked:=true;
  Form31.Show;

end;





procedure TForm1.MenuItem38Click(Sender: TObject);
var
  i: longint;
  j: integer;
  olddataset: longint;


begin
  // Sort points within datasets
  olddataset:= StrtoInt(Form1.StringGrid1.Cells[1,1]);
  Form19.ComboBox1.Clear;
  Form19.ComboBox2.Clear;
  Form19.ComboBox1.Items.Add('{All}');
  Form19.ComboBox1.Caption:= '{All}';
  Form19.ComboBox1.Items.Add(Form1.StringGrid1.Cells[2,1]);
  for i:= 1 to Form1.StringGrid1.RowCount-1 do
  begin
    if StrtoInt(Form1.StringGrid1.Cells[1,i]) <> olddataset then
    begin
       Form19.ComboBox1.Items.Add(Form1.StringGrid1.Cells[2,i]);
       olddataset:= StrtoInt(Form1.StringGrid1.Cells[1,i]);
    end;
  end;
  Form19.ComboBox2.Items.Add('{Point Number}');
  Form19.ComboBox2.Caption:= '{Point Number}';
  for j:= 3 to Form1.StringGrid1.ColCount-1 do
  begin
    Form19.ComboBox2.Items.Add(Form1.StringGrid1.Cells[j,0]);
  end;


  Form19.Show;

end;

procedure TForm1.MenuItem39Click(Sender: TObject);
begin
  // resize chart
  Form25.Show;

end;















procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  // Clicked "SAVE Table"
  if SaveDialog1.Execute then
    begin
      Form1.StringGrid1.SaveToCSVFile(SaveDialog1.FileName);
    end
  else
    ShowMessage('No file selected');

end;

procedure TForm1.MenuItem40Click(Sender: TObject);
begin
  // Create random dataset
  Form28.Show;

end;

procedure TForm1.MenuItem41Click(Sender: TObject);
var
  i: longint;
  olddataset: integer;

begin
  // go to Descriptive Statistics Form
  Form32.Combobox1.Clear;
  Form32.Combobox2.Clear;
  Form32.Memo1.Clear;
  Form32.ComboBox1.Caption := Form1.StringGrid1.Cells[2,1];
  Form32.ComboBox2.Caption := Form1.StringGrid1.Cells[ycol,0];

  for i:= 3 to Form1.StringGrid1.ColCount-1 do
  begin
      Form32.ComboBox2.Items.Add(Form1.StringGrid1.Cells[i,0]);
  end;

  olddataset:= StrtoInt(Form1.StringGrid1.Cells[1,1]);
  Form32.ComboBox1.Items.Add(StringGrid1.Cells[2,1]);
  for i:= 1 to Form1.StringGrid1.RowCount-1 do
  begin
    if StrtoInt(Form1.StringGrid1.Cells[1,i]) <> olddataset then
    begin
       Form32.ComboBox1.Items.Add(StringGrid1.Cells[2,i]);
       olddataset:= StrtoInt(Form1.StringGrid1.Cells[1,i]);
    end;
  end;
  Form32.ComboBox1.Items.Add('[All]');
  Form32.ComboBox2.Items.Add('[All]');
  Form32.Show;

end;

procedure TForm1.MenuItem42Click(Sender: TObject);
var
  i: integer;
  F: TFileStream;
  thefile: String;
  myheader: String;


begin
  // Clicked "SAVE" -- to Save all settings in XML file


  thefile:= '';
  if SaveDialog1.Execute then
    begin
      //Form1.StringGrid1.SaveToCSVFile(SaveDialog1.FileName);
      thefile:= SaveDialog1.FileName;
      F:= TFileStream.Create(thefile, fmCreate);
      myheader:= '<SmatterPlot v1.0>' + LineEnding;
      myheader:=myheader +'HeaderRowPresent:=True'+ LineEnding;
      myheader:=myheader +'HeaderRow:=27'+ LineEnding;
      myheader:=myheader +'myChartTitle:='+myChartTitle+ LineEnding;
      myheader:=myheader +'myYAxisTitle:='+myYAxisTitle+ LineEnding;
      myheader:=myheader +'myXAxisTitle:='+myXAxisTitle+ LineEnding;
      myheader:=myheader +'myChartTitleFontSize:='+InttoStr(myChartTitleFontSize)+ LineEnding;
      myheader:=myheader +'myYAxisTitleFontSize:='+InttoStr(myYAxisTitleFontSize)+ LineEnding;
      myheader:=myheader +'myXAxisTitleFontSize:='+InttoStr(myXAxisTitleFontSize)+ LineEnding;
      myheader:=myheader +'myYMarkFontSize:='+InttoStr(myYMarkFontSize)+ LineEnding;
      myheader:=myheader +'myXMarkFontSize:='+InttoStr(myXMarkFontSize)+ LineEnding;
      myheader:=myheader +'myLegendFontSize:='+InttoStr(myLegendFontSize)+ LineEnding;
      myheader:=myheader +'myChartHeight:='+InttoStr(myChartHeight)+ LineEnding;
      myheader:=myheader +'myChartWidth:='+InttoStr(myChartWidth)+ LineEnding;
      myheader:=myheader +'myYNumberFormat:='+myYNumberFormat+ LineEnding;
      myheader:=myheader +'myXNumberFormat:='+myXNumberFormat+ LineEnding;
      myheader:=myheader +'mydatasets:='+InttoStr(mydatasets)+ LineEnding;
      myheader:=myheader +'xcol:='+InttoStr(xcol)+ LineEnding;
      myheader:=myheader +'ycol:='+InttoStr(ycol)+ LineEnding;
      myheader:=myheader +'xmaxauto:='+BooltoStr(xmaxauto)+ LineEnding;
      myheader:=myheader +'xminauto:='+BooltoStr(xminauto)+ LineEnding;
      myheader:=myheader +'ymaxauto:='+BooltoStr(ymaxauto)+ LineEnding;
      myheader:=myheader +'yminauto:='+BooltoStr(yminauto)+ LineEnding;
      myheader:=myheader +'ymaxglob:='+FloattoStr(ymaxglob)+ LineEnding;
      myheader:=myheader +'yminglob:='+FloattoStr(yminglob)+ LineEnding;
      myheader:=myheader +'xmaxglob:='+FloattoStr(xmaxglob)+ LineEnding;
      myheader:=myheader +'xminglob:='+FloattoStr(xminglob)+ LineEnding;
      myheader:=myheader +'YisLog:='+BooltoStr(YisLog)+ LineEnding;
      myheader:=myheader +'XisLog:='+BooltoStr(XisLog)+ LineEnding;
      myheader:=myheader +'mySizeLocked:='+BooltoStr(mySizeLocked)+ LineEnding;
      myheader:=myheader +'</SmatterPlot>'+ LineEnding;
      F.Write(myheader[1], Length(myheader));
      Form1.StringGrid1.SaveToCSVStream(F,',',true,false);
      F.Destroy;
      //ShowMessage(thefile);
    end
  else
    ShowMessage('No file selected');


end;
//------------------------------------------------------------------------------------------------------------------------------















procedure TForm1.MenuItem43Click(Sender: TObject);
begin
  // Click QUIT
  Form1.Close;

end;

procedure TForm1.MenuItem44Click(Sender: TObject);
begin
  // Separate columns into different datasets

  Form29.show;

end;

procedure TForm1.MenuItem45Click(Sender: TObject);
begin
  // copy chart image to clipboard
  Chart1.CopyToClipboardBitmap;

end;









//*********************************************************************
procedure TForm1.MenuItem46Click(Sender: TObject);
var
  //SVG: TBGRASVG;
  //bmp: TBGRABitmap;
  myfile: TextFile;
  ASVGFileName: String;
  mystring: String;

begin
  // Export SVG menu item click
  ASVGFileName:= 'C:\Dev\MySVG.svg';



  mystring:= '<svg height="' + inttostr(Chart1.Height) +
             '" width="' + inttostr(Chart1.Width) +
             '" xmlns="http://www.w3.org/2000/svg">  ' + #13;
  mystring:= mystring + '<circle r="45" cx="50" cy="50" fill="red" ' +
                      'stroke="green" stroke-width="3" opacity="0.5" />' + #13;

  mystring:= mystring + '<rect width="200" height="100" x="10" ' +
                      'y="10" rx="20" ry="20" fill="blue" />' + #13;

  mystring:= mystring + '<ellipse rx="100" ry="50" cx="120" cy="80" ' +
                      'style="fill:yellow;stroke:green;stroke-width:3" />' +#13;
  mystring:= mystring + '<text x="75" y="60" font-size="30" '+
                      'text-anchor="middle" fill="red">SVG</text>' + #13;

  mystring:= mystring + '</svg>';
  append(myfile);
  writeln(myfile, mystring);
  CloseFile(myfile)

  // Create a new SVG document
  //SVG := TBGRASVG.Create(Chart1.Width, Chart1.Height,cuPixel);

    //bmp:= TBGRABitmap.Create;
    //try
      // Draw the chart onto the SVG canvas
       //bmp.SetSize(Chart1.Width,Chart1.Height);
       //bmp.GetImageFromCanvas(Chart1.Canvas,0,0);

       //SVG.Draw(bmp.Canvas2D,0,0,cuPixel);

      //Chart1.Drawer.TextOut.Pos(10,10).Text('This is text');
      //Chart1.Draw(SVG, Rect(0, 0, 800, 600));
      // Save the SVG file
      //SVG.SaveToFile(ASVGFileName);


    //finally
    //SVG.Free;

end;

procedure TForm1.MenuItem20Click(Sender: TObject);
begin
  // Toggle X axis scale between log and linear
  if Chart1.BottomAxis.Transformations=ChartAxisTransformations2 then
     Chart1.BottomAxis.Transformations:=ChartAxisTransformations1
  else
     Chart1.BottomAxis.Transformations:=ChartAxisTransformations2;

end;

procedure TForm1.MenuItem21Click(Sender: TObject);
begin
  // Toggle Y axis scale between log and linear
  if Chart1.LeftAxis.Transformations=ChartAxisTransformations2 then
     Chart1.LeftAxis.Transformations:=ChartAxisTransformations1
  else
     Chart1.LeftAxis.Transformations:=ChartAxisTransformations2;
end;

procedure TForm1.MenuItem22Click(Sender: TObject);
begin
  // go to Legend form
  Form10.Show;

end;

procedure TForm1.MenuItem23Click(Sender: TObject);
  // click rename datasets
var
  i: integer;
  olddataset: integer;

begin
  // Click to rename Datasets
  olddataset:= StrtoInt(Form1.StringGrid1.Cells[1,1]);
  Form15.ListBox1.Clear;
  Form15.ListBox1.Items.Add(StringGrid1.Cells[2,1]);
  for i:= 1 to Form1.StringGrid1.RowCount-1 do
  begin
    if StrtoInt(Form1.StringGrid1.Cells[1,i]) <> olddataset then
    begin
       Form15.ListBox1.Items.Add(StringGrid1.Cells[2,i]);
       olddataset:= StrtoInt(Form1.StringGrid1.Cells[1,i]);
    end;
  end;
  Form15.show;

end;

procedure TForm1.MenuItem24Click(Sender: TObject);
var
  olddataset: integer;
  i: longint;

begin
  // go to "Combine Datasets"
  olddataset:= StrtoInt(Form1.StringGrid1.Cells[1,1]);
  Form17.ListBox1.Clear;
  Form17.ListBox1.Items.Add(Form1.StringGrid1.Cells[2,1]);
  for i:= 1 to Form1.StringGrid1.RowCount-1 do
  begin
    if StrtoInt(Form1.StringGrid1.Cells[1,i]) <> olddataset then
    begin
       Form17.ListBox1.Items.Add(Form1.StringGrid1.Cells[2,i]);
       olddataset:= StrtoInt(Form1.StringGrid1.Cells[1,i]);
    end;
  end;
  Form17.Show;

end;

procedure TForm1.MenuItem25Click(Sender: TObject);
var
  i: longint;
  j: integer;
  olddataset: integer;

begin
  // Click Split datasets

  Form18.ComboBox1.Clear;
  Form18.ComboBox2.Clear;
  Form18.ComboBox3.Clear;
  Form18.Edit1.Caption:= '0';

  // get datasets for combobox1
  olddataset:= StrtoInt(Form1.StringGrid1.Cells[1,1]);
  Form18.ComboBox1.Items.Add(StringGrid1.Cells[2,1]);
  for i:= 1 to Form1.StringGrid1.RowCount-1 do
  begin
    if StrtoInt(Form1.StringGrid1.Cells[1,i]) <> olddataset then
    begin
       Form18.ComboBox1.Items.Add(StringGrid1.Cells[2,i]);
       olddataset:= StrtoInt(Form1.StringGrid1.Cells[1,i]);
    end;
  end;

  // get columns for Combobox2
  for j:=0 to StringGrid1.ColCount -1 do
  begin
    Form18.ComboBox2.Items.Add(Form1.StringGrid1.Cells[j,0]);
  end;

  Form18.ComboBox3.Items.Add('Less than / greater than value');
  Form18.ComboBox3.Items.Add('Category Column');
  Form18.ComboBox3.Items.Add('Within Zoom Window');

  Form18.Show;
end;

procedure TForm1.MenuItem26Click(Sender: TObject);
var
  olddataset: integer;
  i: longint;
  j: integer;

begin
  // click Reduce datasets
  Form20.ComboBox1.Clear;
  Form20.Combobox2.Clear;
  Form20.Combobox3.Clear;
  Form20.Edit1.Caption:='10';

  //get datasets for Combobox1
  olddataset:= StrtoInt(Form1.StringGrid1.Cells[1,1]);
  Form20.ComboBox1.Items.Add(Form1.StringGrid1.Cells[2,1]);
  for i:= 1 to Form1.StringGrid1.RowCount-1 do
  begin
    if StrtoInt(Form1.StringGrid1.Cells[1,i]) <> olddataset then
    begin
       Form20.ComboBox1.Items.Add(Form1.StringGrid1.Cells[2,i]);
       olddataset:= StrtoInt(Form1.StringGrid1.Cells[1,i]);
    end;
  end;

  Form20.ComboBox2.Items.Add('Single Point');
  Form20.ComboBox2.Items.Add('Average (Mean)');
  Form20.ComboBox2.Items.Add('Median');
  Form20.ComboBox2.Items.Add('Maximum');
  Form20.ComboBox2.Items.Add('Minimum');
  Form20.ComboBox2.Items.Add('Mean +/- 1 Std Dev');
  Form20.ComboBox2.Items.Add('Mean +/- 2 Std Dev');
  Form20.ComboBox2.Items.Add('Mean +/- 3 Std Dev');
  Form20.ComboBox2.Items.Add('Mean +/- 95% Conf Int');



  // get columns for Combobox3
  for j:=0 to Form1.StringGrid1.ColCount -1 do
  begin
    Form20.ComboBox3.Items.Add(Form1.StringGrid1.Cells[j,0]);
  end;



  Form20.Show


end;

procedure TForm1.MenuItem27Click(Sender: TObject);
begin
  // click Export to Excel
  Form33.Edit1.Caption:= defaultfolder;
  Form33.Edit2.Caption:= 'SP-output.xlsx';
  Form33.Checkbox1.Checked:= true;
  Form33.Checkbox2.Checked:= true;
  Form33.Checkbox3.Checked:= true;
  Form33.Show;

end;

procedure TForm1.MenuItem28Click(Sender: TObject);
var
  i: integer;

begin
  // click change units
  Form24.ComboBox1.Clear;
  Form24.ComboBox2.Clear;
  Form24.ComboBox3.Clear;

  For i:= 3 to StringGrid1.ColCount -1 do
     Form24.ComboBox1.Items.Add(StringGrid1.Cells[i,0]);

  Form24.Show;

end;

procedure TForm1.MenuItem29Click(Sender: TObject);
begin
  // Export to Python/Matplotlib
    // click Export to Excel
  Form34.Edit1.Caption:= defaultfolder;
  Form34.Edit2.Caption:= 'SP-output.xlsx';
  Form34.Edit3.Caption:= 'SP-script.py';
  Form34.Checkbox1.Checked:= true;

  Form34.show;

end;

procedure TForm1.MenuItem14Click(Sender: TObject);
begin
  // click titles
  Form3.Show;

end;

procedure TForm1.MenuItem16Click(Sender: TObject);
begin
  // go to "Change Color Sequence form"
  Form4.show;

end;

procedure TForm1.MenuItem17Click(Sender: TObject);
begin
  // Goto Series Markers
  Form22.show;
end;

procedure TForm1.MenuItem18Click(Sender: TObject);
begin
  // Series lines Form
  Form23.Show;
end;

procedure TForm1.MenuItem19Click(Sender: TObject);
var
  i: integer;

begin
  // go to Select Variables Form
    // Get variables from dataset1 headers
  Form9.Combobox1.Clear;
  Form9.Combobox2.Clear;
  Form9.ComboBox1.Caption := Form1.StringGrid1.Cells[ycol,0];
  Form9.ComboBox2.Caption := Form1.StringGrid1.Cells[xcol,0];

  //ShowMessage(InttoStr(Form1.StringGrid1.ColCount-1));
  Form9.ComboBox1.Items.Add(Form1.StringGrid1.Cells[0,0]);
  Form9.ComboBox2.Items.Add(Form1.StringGrid1.Cells[0,0]);
  for i:= 3 to Form1.StringGrid1.ColCount-1 do
  begin
      Form9.ComboBox1.Items.Add(Form1.StringGrid1.Cells[i,0]);
      Form9.ComboBox2.Items.Add(Form1.StringGrid1.Cells[i,0]);

  end;
  Form9.Show;

end;



procedure TForm1.Button3Click(Sender: TObject);
begin
  // Clear Paste Pad
  Form1.Memo1.Clear;

end;





procedure TForm1.Button5Click(Sender: TObject);
begin
  // Resize Chart to Fit Window

  Form1.Button5.Visible:= False;
  Form1.Button6.Visible:= False;
  Form1.Chart1.Height:= Form1.PageControl1.Height - 60;
  Form1.Chart1.Width:= Form1.PageControl1.Width - 60;
  myChartHeight:= Form1.PageControl1.Height - 60;
  myChartWidth:= Form1.PageControl1.Width - 60;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  // click keep size
    Form1.Button5.Visible:= False;
    Form1.Button6.Visible:= False;
end;

procedure TForm1.Chart1AfterDraw(ASender: TChart; ADrawer: IChartDrawer);
var
  i: Integer;
  ave: Double;
  ext: TDoubleRect;
  Rext, R: TRect;
  s: String;
begin

  // Text to be displayed - use 3 decimal places
  s := 'annotate#13#10line two#13#10line three';

  // Limits of the chart box in graph coordinates
  ext := Chart1.LogicalExtent;

  // ... and in image (screen) coordinates
  Rext.TopLeft := Chart1.GraphToImage(DoublePoint(ext.a.x, ext.b.y));
  Rext.BottomRight := Chart1.GraphToImage(DoublePoint(ext.b.x, ext.a.y));

  // Calculate rectangle boundaries for text
  R.TopLeft := Point(Abs(Round((Rext.TopLeft.X-Rext.BottomRight.X)/2)),
                     Abs(Round((Rext.BottomRight.Y-Rext.TopLeft.Y)/2)));
  ADrawer.SetFont(Chart1.Title.Font);  // let's use the same font as the chart title
  R.BottomRight := ADrawer.TextExtent(s);

  // Now draw text
  //ADrawer.TextOut.Pos(R.Left, R.Top).Text(s).Done;  // .Done must be last command!

end;

procedure TForm1.Chart1ExtentChanged(ASender: TChart);
begin


end;

procedure TForm1.Chart1FullExtentChanged(ASender: TChart);
begin
  //chart changes extent
  //RebuildChart();

end;

procedure TForm1.FormResize(Sender: TObject);
begin
  // On resize -- adjust Pagecontrol and Tab sheet sizes
  Form1.PageControl1.Height:= Form1.Height - 24;
  Form1.PageControl1.Width:= Form1.Width - 29;
  //Form1.Button5.Visible:= True;
  //Form1.Button6.Visible:= True;
  Form1.Panel2.Visible:= True;
  Form1.Image4.Visible:= True;
  Form1.Image5.Visible:= True;

end;

procedure TForm1.Image1Click(Sender: TObject);
begin
   // Click on Start Image
  ShowMessage('Add some data here to make a chart!');

end;



procedure TForm1.Image2Click(Sender: TObject);
begin
  // Click UpdateImageButton
  RebuildChart();

end;

procedure TForm1.Image3Click(Sender: TObject);
begin
    // Formatter ImageButton Click
  Form2.Show;
end;

procedure TForm1.Image4Click(Sender: TObject);
begin
  // Click on Resize-to-Fit Image Button
  // Resize Chart to Fit Window

  Form1.Button5.Visible:= False;
  Form1.Button6.Visible:= False;
  Form1.Image4.Visible:= False;
  Form1.Image5.Visible:= False;
  Form1.Chart1.Height:= Form1.PageControl1.Height - 60;
  Form1.Chart1.Width:= Form1.PageControl1.Width - 60;
  myChartHeight:= Form1.PageControl1.Height - 60;
  myChartWidth:= Form1.PageControl1.Width - 60;
  Form1.Panel2.Visible:= False;

end;

procedure TForm1.Image5Click(Sender: TObject);
begin
     // click keep size
    Form1.Button5.Visible:= False;
    Form1.Button6.Visible:= False;
    Form1.Image4.Visible:= False;
    Form1.Image5.Visible:= False;
    Form1.Panel2.Visible:= False;
end;

procedure TForm1.Label2SizeConstraintsChange(Sender: TObject);
begin


end;

procedure TForm1.MenuItem12Click(Sender: TObject);
begin
  // click PDF help
  OpenDocument('SmatterPlot Documentation.pdf');

end;

procedure TForm1.MenuItem13Click(Sender: TObject);
begin
     // show about box
  Form8.Show;
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin


end;

procedure TForm1.MenuItem5Click(Sender: TObject);
var
  olddataset: integer;
  i: integer;

begin
  // clicked "CLOSE ..."
    olddataset:= StrtoInt(Form1.StringGrid1.Cells[1,1]);
  Form12.ListBox1.Clear;
  Form12.ListBox1.Items.Add(Form1.StringGrid1.Cells[2,1]);
  for i:= 1 to Form1.StringGrid1.RowCount-1 do
  begin
    if StrtoInt(Form1.StringGrid1.Cells[1,i]) <> olddataset then
    begin
       Form12.ListBox1.Items.Add(Form1.StringGrid1.Cells[2,i]);
       olddataset:= StrtoInt(Form1.StringGrid1.Cells[1,i]);
    end;
  end;
  Form12.Show


end;

procedure TForm1.MenuItem6Click(Sender: TObject);
var
  snum: integer;
  j: integer;

begin
  // click "NEW"
  snum := Chart1.Series.Count;
  for j := 0 to snum-1 do
  begin
     TLineSeries(Chart1.Series[0]).Destroy;
  end;
  StringGrid1.Clear;
  mydatasets:=0;
  Form1.Chart1.Visible:= False;
  Form1.Image1.Visible:= True;

end;

procedure TForm1.MenuItem7Click(Sender: TObject);
begin
  // Export to Image File
  if SavePictureDialog1.Execute then
    begin
      Chart1.Savetofile(TJPEGImage, SavePictureDialog1.Filename);
      //if fileExists(SavePictureDialog1.Filename) then
      //  ShowMessage('File already exists with that name');

    end
  else
    ShowMessage('No file selected');
end;











//#################################################################
procedure TForm1.Button1Click(Sender: TObject);
// Read memo data into table and chart
var
  newseries: TLineSeries;
  hrnum: integer;
  i: longint;
  num: longint;
  j: integer;
  k: integer;
  mypos: integer;
  xstr: String;
  ystr: String;
  mystr: String;
  snum: integer;
  mycommas: integer;
  mytabs: integer;
  mydelimstr: String;
  prevlastrow: integer;
  tagline: String;
  datasetname: String;
  firstdatarow: longint;
  SPfile: boolean;
  myHeaderRow: integer;
  nextchunk: String;
  numberchr: Array of String;
  chrisanumber: boolean;
  chunkisanumber: boolean;
  nonumbercolumn: boolean;
  kk: integer;
  mm: integer;
  nn: integer;

begin
    // check for tags
    datasetname:= 'paste';
    firstdatarow:= 1;
    numberchr:= [ '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.', 'e', '-', '+' ];
    hrnum:=1; // one header row assume for now
    SPfile:=false;
    if Form1.Memo1.Lines[0].Chars[0] = '<' then
    begin
       tagline:= Form1.Memo1.Lines[0];

       if pos('>', tagline) >0 then
            datasetname:= Copy(tagline, 2, pos('>', tagline)-2);
       firstdatarow:=firstdatarow+1;
       // look for more tags
       for i:= 1 to Form1.Memo1.Lines.Count-1 do
       begin
          if Form1.Memo1.Lines[i].Chars[0] = '<' then
             firstdatarow:= i+1+hrnum;
          if Form1.Memo1.Lines[i]='HeaderRowPresent:=False' then
          begin
               hrnum:=0;
               firstdatarow:=i+1+hrnum;
          end;
       end;

    end;


    //use memo and store data in StringGrid1 only -- no charting yet
    if pos('<SmatterPlot', Form1.Memo1.Lines[0]) >0 then
          SPfile:= true;
    if pos('<SmatterPlot', Form1.Memo1.Lines[1]) >0 then
          SPfile:= true;
    if SPfile = false then
    begin
       //ShowMessage('Not SP file');
       if mydatasets = 0 then
       begin
          prevlastrow:=0;
          StringGrid1.RowCount:=Form1.Memo1.Lines.Count-firstdatarow+1;
       end
       else
       begin
          prevlastrow:= StringGrid1.RowCount-1;
          StringGrid1.RowCount:=StringGrid1.RowCount+Form1.Memo1.Lines.Count-firstdatarow;
       end;
       mydatasets:=mydatasets+1;

       //Find commas or tabs
       num:=Form1.Memo1.Lines.Count;
       mycommas:= 0;
       mytabs:= 0;
       if num > 3 then
       begin
         for i:= firstdatarow to firstdatarow+3 do
         begin
            if pos(#9, Form1.Memo1.Lines[i]) >0 then
               mytabs:=mytabs+1;
            if pos(#44, Form1.Memo1.Lines[i]) >0 then
               mycommas:=mycommas+1;
         end;
       end;
       if mytabs < mycommas then
         mydelimstr:= #44;
       if mytabs >= mycommas then
         mydelimstr:= #9;



       // find number of columns
       mystr:= Form1.Memo1.Lines[firstdatarow];
       j:=1;
       while pos(mydelimstr,mystr) > 0 do
       begin
         mypos:= pos(mydelimstr, mystr);
         mystr:=Copy(mystr,mypos+1);
         j:=j+1;
       end;              // j = number of columns in source


       // check for header row
       mystr:= Form1.Memo1.Lines[firstdatarow-hrnum];
       for k:= 1 to j do
       begin
         mypos:= pos(mydelimstr, mystr);
         if mypos<1 then
            nextchunk:=mystr
         else
            nextchunk:=Copy(mystr,1,mypos-1);
         //ShowMessage(nextchunk);
         if Length(nextchunk) > 0 then
            chunkisanumber:= true
         else
            chunkisanumber:= false;
         for kk:= 1 to Length(nextchunk) do
         begin
            chrisanumber:= false;
            for mm:= 0 to Length(numberchr) do
            begin
               if numberchr[mm] = nextchunk[kk] then chrisanumber:= true;
            end;
            if chrisanumber = false then chunkisanumber:= false;
         end;
         //Showmessage(booltostr(chunkisanumber));
         if chunkisanumber = true then
         begin
            hrnum:=0;
            firstdatarow:=firstdatarow-1;
            StringGrid1.RowCount:=StringGrid1.RowCount+1;
            //Showmessage(inttostr(hrnum));
         end;
         mystr:=Copy(mystr,mypos+1);
       end;




       // add header row to stringgrid
       if mydatasets = 1 then
       begin
         if hrnum = 0 then
         begin
            for k:= 3 to j+2 do
               StringGrid1.Cells[k,0]:='Column'+InttoStr(k-2);
         end
         else
         begin
           mystr:= Form1.Memo1.Lines[firstdatarow-hrnum];
           for k:= 1 to j do
           begin
             mypos:= pos(mydelimstr, mystr);
             StringGrid1.Cells[k+2,0]:=Copy(mystr,1,mypos-1);
             mystr:=Copy(mystr,mypos+1);
           end;
           StringGrid1.Cells[j+2,0]:=mystr;
         end;
       end;

       // read rows
       for i := firstdatarow to Form1.Memo1.Lines.Count -1 do
       begin
           StringGrid1.Cells[0,i+prevlastrow-firstdatarow+1]:=InttoStr(i);
           StringGrid1.Cells[1,i+prevlastrow-firstdatarow+1]:=InttoStr(mydatasets);
           StringGrid1.Cells[2,i+prevlastrow-firstdatarow+1]:=datasetname;

           mystr:= Form1.Memo1.Lines[i];
           for k:= 1 to j do
           begin
             mypos:= pos(mydelimstr, mystr);
             StringGrid1.Cells[k+2,i+prevlastrow-firstdatarow+1]:=Copy(mystr,1,mypos-1);
             mystr:=Copy(mystr,mypos+1);
           end;
           StringGrid1.Cells[j+2,i+prevlastrow-firstdatarow+1]:=mystr;
       end;
       StringGrid1.Cells[0,0]:='{PointNumber}';
       StringGrid1.Cells[1,0]:='{DatasetNumber}';
       StringGrid1.Cells[2,0]:='DatasetName';



       // assign x and y columns to first two number columns
       if j < 2 then
       begin
         xcol:=0;
         ycol:=3;
       end
       else
       begin
         xcol:= 0;
         ycol:= 3;
         mystr:= Form1.Memo1.Lines[firstdatarow];
         for mm:= 3 to j+2 do
         begin
           //showmessage(mystr);
           mypos:= pos(mydelimstr, mystr);
           nextchunk:=Copy(mystr,1,mypos-1);
           chunkisanumber:= false;
           if Length(nextchunk) > 0 then
              chunkisanumber:= true;
           for kk:= 1 to Length(nextchunk) do
           begin
                chrisanumber:= false;
                for nn:= 0 to Length(numberchr) do
                begin
                   if numberchr[nn] = nextchunk[kk] then chrisanumber:= true;
                end;
                if chrisanumber = false then chunkisanumber:= false;
           end;
           if (chunkisanumber = true) and (xcol = 0) then
           begin
             xcol:=mm;
             ycol:=mm;
           end;
           mystr:=Copy(mystr,mypos+1);
         end;
         if xcol = j+2 then // only one number column
         begin
              ycol:=xcol;
              xcol:=0;
              //ShowMessage('xcol = j+2 so only one number column');
         end
         else
         begin
           mystr:= Form1.Memo1.Lines[firstdatarow];
           for mm:= 3 to j+2 do
           begin
             mypos:= pos(mydelimstr, mystr);
             nextchunk:=Copy(mystr,1,mypos-1);
             chunkisanumber:= true;
             for kk:= 1 to Length(nextchunk) do
             begin
                  chrisanumber:= false;
                  for nn:= 0 to Length(numberchr) do
                  begin
                     if numberchr[nn] = nextchunk[kk] then chrisanumber:= true;
                  end;
                  if chrisanumber = false then chunkisanumber:= false;
             end;
             if (chunkisanumber = true) and (ycol=xcol) then
             begin
               ycol:=mm;
             end;
             mystr:=Copy(mystr,mypos+1);
           end;
           if ycol = xcol then
             begin       // only one number column
                 ycol:=xcol;
                 xcol:=0;
                 //ShowMessage('cannot find a second number column so only one number column');

             end;
         end;


       end;


    end
    else
    begin
       //SmatterPlot File found
       //clear StringGrid and start fresh
       //ShowMessage('SP file');
       Form1.StringGrid1.Clear;
       myHeaderRow:= 27;
       For i:= 1 to 40 do
       begin
          if pos('myChartTitle:=',Form1.Memo1.Lines[i]) > 0 then
             myChartTitle:= Copy(Form1.Memo1.Lines[i], pos('=',Form1.Memo1.Lines[i])+1);
          if pos('myYAxisTitle:=',Form1.Memo1.Lines[i]) > 0 then
             myYAxisTitle:= Copy(Form1.Memo1.Lines[i], pos('=',Form1.Memo1.Lines[i])+1);
          if pos('myXAxisTitle:=',Form1.Memo1.Lines[i]) > 0 then
             myXAxisTitle:= Copy(Form1.Memo1.Lines[i], pos('=',Form1.Memo1.Lines[i])+1);
          if pos('myChartTitleFontSize:=',Form1.Memo1.Lines[i]) > 0 then
             myChartTitleFontSize:= StrtoInt(Copy(Form1.Memo1.Lines[i], pos('=',Form1.Memo1.Lines[i])+1));
          if pos('myYAxisTitleFontSize:=',Form1.Memo1.Lines[i]) > 0 then
             myYAxisTitleFontSize:= StrtoInt(Copy(Form1.Memo1.Lines[i], pos('=',Form1.Memo1.Lines[i])+1));
          if pos('myXAxisTitleFontSize:=',Form1.Memo1.Lines[i]) > 0 then
             myXAxisTitleFontSize:= StrtoInt(Copy(Form1.Memo1.Lines[i], pos('=',Form1.Memo1.Lines[i])+1));
          if pos('myYMarkFontSize:=',Form1.Memo1.Lines[i]) > 0 then
             myYMarkFontSize:= StrtoInt(Copy(Form1.Memo1.Lines[i], pos('=',Form1.Memo1.Lines[i])+1));
          if pos('myXMarkFontSize:=',Form1.Memo1.Lines[i]) > 0 then
             myXMarkFontSize:= StrtoInt(Copy(Form1.Memo1.Lines[i], pos('=',Form1.Memo1.Lines[i])+1));
          if pos('myXMarkFontSize:=',Form1.Memo1.Lines[i]) > 0 then
             myXMarkFontSize:= StrtoInt(Copy(Form1.Memo1.Lines[i], pos('=',Form1.Memo1.Lines[i])+1));
          if pos('myLegendFontSize:=',Form1.Memo1.Lines[i]) > 0 then
             myLegendFontSize:= StrtoInt(Copy(Form1.Memo1.Lines[i], pos('=',Form1.Memo1.Lines[i])+1));
          if pos('myChartHeight:=',Form1.Memo1.Lines[i]) > 0 then
             myChartHeight:= StrtoInt(Copy(Form1.Memo1.Lines[i], pos('=',Form1.Memo1.Lines[i])+1));
          if pos('myChartWidth:=',Form1.Memo1.Lines[i]) > 0 then
             myChartWidth:= StrtoInt(Copy(Form1.Memo1.Lines[i], pos('=',Form1.Memo1.Lines[i])+1));
          if pos('myYNumberFormat:=',Form1.Memo1.Lines[i]) > 0 then
             myYNumberFormat:= (Copy(Form1.Memo1.Lines[i], pos('=',Form1.Memo1.Lines[i])+1));
          if pos('myXNumberFormat:=',Form1.Memo1.Lines[i]) > 0 then
             myXNumberFormat:= (Copy(Form1.Memo1.Lines[i], pos('=',Form1.Memo1.Lines[i])+1));
          if pos('mydatasets:=',Form1.Memo1.Lines[i]) > 0 then
             mydatasets:= StrtoInt(Copy(Form1.Memo1.Lines[i], pos('=',Form1.Memo1.Lines[i])+1));
          if pos('xcol:=',Form1.Memo1.Lines[i]) > 0 then
             xcol:= StrtoInt(Copy(Form1.Memo1.Lines[i], pos('=',Form1.Memo1.Lines[i])+1));
          if pos('ycol:=',Form1.Memo1.Lines[i]) > 0 then
             ycol:= StrtoInt(Copy(Form1.Memo1.Lines[i], pos('=',Form1.Memo1.Lines[i])+1));
          if pos('xmaxauto:=',Form1.Memo1.Lines[i]) > 0 then
             xmaxauto:= StrtoBool(Copy(Form1.Memo1.Lines[i], pos('=',Form1.Memo1.Lines[i])+1));
          if pos('xminauto:=',Form1.Memo1.Lines[i]) > 0 then
             xminauto:= StrtoBool(Copy(Form1.Memo1.Lines[i], pos('=',Form1.Memo1.Lines[i])+1));
          if pos('ymaxauto:=',Form1.Memo1.Lines[i]) > 0 then
             ymaxauto:= StrtoBool(Copy(Form1.Memo1.Lines[i], pos('=',Form1.Memo1.Lines[i])+1));
          if pos('yminauto:=',Form1.Memo1.Lines[i]) > 0 then
             yminauto:= StrtoBool(Copy(Form1.Memo1.Lines[i], pos('=',Form1.Memo1.Lines[i])+1));
          if pos('ymaxglob:=',Form1.Memo1.Lines[i]) > 0 then
             ymaxglob:= StrtoInt(Copy(Form1.Memo1.Lines[i], pos('=',Form1.Memo1.Lines[i])+1));
          if pos('yminglob:=',Form1.Memo1.Lines[i]) > 0 then
             yminglob:= StrtoInt(Copy(Form1.Memo1.Lines[i], pos('=',Form1.Memo1.Lines[i])+1));
          if pos('xmaxglob:=',Form1.Memo1.Lines[i]) > 0 then
             xmaxglob:= StrtoInt(Copy(Form1.Memo1.Lines[i], pos('=',Form1.Memo1.Lines[i])+1));
          if pos('xminglob:=',Form1.Memo1.Lines[i]) > 0 then
             xminglob:= StrtoInt(Copy(Form1.Memo1.Lines[i], pos('=',Form1.Memo1.Lines[i])+1));
          if pos('Yislog:=',Form1.Memo1.Lines[i]) > 0 then
             Yislog:= StrtoBool(Copy(Form1.Memo1.Lines[i], pos('=',Form1.Memo1.Lines[i])+1));
          if pos('Xislog:=',Form1.Memo1.Lines[i]) > 0 then
             Xislog:= StrtoBool(Copy(Form1.Memo1.Lines[i], pos('=',Form1.Memo1.Lines[i])+1));
          if pos('mySizeLocked:=',Form1.Memo1.Lines[i]) > 0 then
             mySizeLocked:= StrtoBool(Copy(Form1.Memo1.Lines[i], pos('=',Form1.Memo1.Lines[i])+1));
          if pos('{Point',Form1.Memo1.Lines[i]) > 0 then
             myHeaderRow:= i;
       end;
       firstdatarow:=myHeaderRow+1;


       // find number of columns
       mydelimstr:= #44;
       mystr:= Form1.Memo1.Lines[firstdatarow];
       j:=1;
       while pos(mydelimstr,mystr) > 0 do
       begin
         mypos:= pos(mydelimstr, mystr);
         mystr:=Copy(mystr,mypos+1);
         j:=j+1;
       end;
       if mydatasets = 1 then
       begin
         if hrnum = 0 then
         begin
            for k:= 3 to j do
               StringGrid1.Cells[k,0]:='Column'+InttoStr(k-2);
         end
         else
         begin
           mystr:= Form1.Memo1.Lines[firstdatarow-hrnum];
           for k:= 1 to j do
           begin
             mypos:= pos(mydelimstr, mystr);
             StringGrid1.Cells[k+2,0]:=Copy(mystr,1,mypos-1);
             mystr:=Copy(mystr,mypos+1);
           end;
           StringGrid1.Cells[j+2,0]:=mystr;
         end;
       end;


       // read rows
       StringGrid1.RowCount:=Form1.Memo1.Lines.Count-myHeaderRow;
       for i := myHeaderRow to Form1.Memo1.Lines.Count -1 do
       begin
            //ShowMessage(InttoStr(i));
            mystr:= Form1.Memo1.Lines[i];
           for k:= 0 to j-1 do
           begin
             mypos:= pos(mydelimstr, mystr);
             StringGrid1.Cells[k,i-myHeaderRow]:=Copy(mystr,1,mypos-1);
             mystr:=Copy(mystr,mypos+1);
           end;

       end;
       StringGrid1.Cells[0,0]:='{PointNumber}';
       StringGrid1.Cells[1,0]:='{DatasetNumber}';
       StringGrid1.Cells[2,0]:='DatasetName';

    end;
    myYAxisTitle:= Form1.StringGrid1.Cells[ycol,0];
    myXAxisTitle:= Form1.StringGrid1.Cells[xcol,0];



    // call RebuildChart
    RebuildChart();
    TabSheet1.Show;

end;

procedure TForm1.FormCreate(Sender: TObject);
var
  filestringlist: TStringList;
  colonpos:       integer;
  i:              integer;
  aline:          String;
  thefile:        String;


begin
      //initialize the global variables
      myStringList:=TStringList.Create;               //Create my StringList
      filestringlist:=TstringList.Create;
      Form1.Panel1.Visible:= False;
      Form1.Panel2.Visible:= False;
      Form1.Image4.Visible:= False;
      Form1.Image5.Visible:= False;
      Form1.Image1.BringToFront;


      myDSnames:= [ '-','-','-','-','-','-','-','-','-','-',
                '-','-','-','-','-','-','-','-','-','-',
                '-','-','-','-','-','-','-','-','-','-',
                '-','-','-','-','-','-','-','-','-','-',
                '-','-','-','-','-','-','-','-','-','-',
                '-','-','-','-','-','-','-','-','-','-',
                '-','-','-','-','-','-','-','-','-','-',
                '-','-','-','-','-','-','-','-','-','-',
                '-','-','-','-','-','-','-','-','-','-',
                '-','-','-','-','-','-','-','-','-','-'
                ];
      mySeriesnames:= [ '-','-','-','-','-','-','-','-','-','-',
                '-','-','-','-','-','-','-','-','-','-',
                '-','-','-','-','-','-','-','-','-','-',
                '-','-','-','-','-','-','-','-','-','-',
                '-','-','-','-','-','-','-','-','-','-',
                '-','-','-','-','-','-','-','-','-','-',
                '-','-','-','-','-','-','-','-','-','-',
                '-','-','-','-','-','-','-','-','-','-',
                '-','-','-','-','-','-','-','-','-','-',
                '-','-','-','-','-','-','-','-','-','-'
                ];
      mycolors:= [clblue, clRed, clGreen, clBlack, clOlive, clTeal, clGray, clFuchsia, clAqua, clSilver,
                  clblue, clRed, clGreen, clBlack, clOlive, clTeal, clGray, clFuchsia, clAqua, clSilver,
                  clblue, clRed, clGreen, clBlack, clOlive, clTeal, clGray, clFuchsia, clAqua, clSilver,
                  clblue, clRed, clGreen, clBlack, clOlive, clTeal, clGray, clFuchsia, clAqua, clSilver,
                  clblue, clRed, clGreen, clBlack, clOlive, clTeal, clGray, clFuchsia, clAqua, clSilver,
                  clblue, clRed, clGreen, clBlack, clOlive, clTeal, clGray, clFuchsia, clAqua, clSilver,
                  clblue, clRed, clGreen, clBlack, clOlive, clTeal, clGray, clFuchsia, clAqua, clSilver,
                  clblue, clRed, clGreen, clBlack, clOlive, clTeal, clGray, clFuchsia, clAqua, clSilver,
                  clblue, clRed, clGreen, clBlack, clOlive, clTeal, clGray, clFuchsia, clAqua, clSilver,
                  clblue, clRed, clGreen, clBlack, clOlive, clTeal, clGray, clFuchsia, clAqua, clSilver,
                  clblue, clRed, clGreen, clBlack, clOlive, clTeal, clGray, clFuchsia, clAqua, clSilver
                 ];
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
      mycolorsintdef:= [0,1,2,3,4,5,6,7,8,9,
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
      mysymbols:= [psCircle, psRectangle, psTriangle, psDiamond, psStar, psHexagon,psVertBar, psHorBar,psCross, psPoint];
      mysymbolstext:= ['Circle', 'Rectangle', 'Triangle', 'Diamond', 'Star', 'Hexagon','VertBar', 'HorBar','Cross', 'Point'];
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
      mysymbolsopen:= [0,0,0,0,0,0,0,0,0,0,
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
      mysymbolsintdef:= [0,1,2,3,4,5,6,7,8,9,
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
      mysymbolsopendef:= [0,0,0,0,0,0,0,0,0,0,
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
      mylinesint:=[1,1,1,1,1,1,1,1,1,1,
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
      mylinestylesint:=[0,0,0,0,0,0,0,0,0,0,
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
      mylinesintdef:=[1,1,1,1,1,1,1,1,1,1,
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
      mylinestylesintdef:=[0,0,0,0,0,0,0,0,0,0,
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


      mylines:=[ltNone, ltFromPrevious, ltFromOrigin, ltStepXY, ltStepYX];

      mylinestyles:=[psSolid, psDash, psDot, psDashDot, psDashDotDot];
      mylinestext:= ['Solid', 'Dash', 'Dot', 'DashDot', 'DashDotDot'];

      myChartTitle:= 'Chart Title';
      myYAxisTitle:= 'Y-Axis';
      myXAxisTitle:= 'X-Axis';
      myChartTitleFontSize:= 16;
      myYAxisTitleFontSize:= 14;
      myXAxisTitleFontSize:= 14;
      myYMarkFontSize:= 12;
      myXMarkFontSize:= 12;
      myLegendFontSize:= 12;
      myChartHeight:= 500;
      myChartWidth:= 500;
      myYNumberFormat:= '%.1f%';
      myXNumberFormat:= '%:.1f%';
      Memo1.Caption:='<Paste Here/>';
      mydatasets:=0;
      xcol:=3;
      ycol:=4;
      YTickNum:=5;
      XTickNum:=5;
      xmaxauto:= true;
      xminauto:= true;
      ymaxauto:= true;
      yminauto:= true;
      ymaxglob:= 10;
      yminglob:= 1;
      xmaxglob:= 10;
      xminglob:= 1;
      YisLog:= False;
      XisLog:= False;
      mySizeLocked:= False;
      excelname:= 'SP-output.xlsx';
      scriptname:= 'SP-script.py';

      StringGrid1.Options := StringGrid1.Options + [goEditing];

      // Tick label location lists:
      ListChartSource1.Add(1,1);
      ListChartSource1.Add(2,2);
      ListChartSource1.Add(5,5);
      ListChartSource1.Add(10,10);
      ListChartSource1.Add(20,20);

      ListChartSource2.Add(1,1);
      ListChartSource2.Add(2,2);
      ListChartSource2.Add(5,5);
      ListChartSource2.Add(10,10);
      ListChartSource2.Add(20,20);
      Form1.Button5.Visible:= False;
      Form1.Button6.Visible:= False;

      //Get Folder paths
      ExecutablePath := ExtractFilePath(ParamStr(0));
      UserDir := GetUserDir;
      defaultfolder:= GetUserDir+'SP\';

      //Check if a settings file exists
      if FileExists(ExecutablePath+'SmatterPlot Settings.txt') then
      begin
         // FileExists so read it
        thefile:=ExecutablePath+'SmatterPlot Settings.txt';
        filestringlist.LoadfromFile(thefile,true);

         for i:= 0 to filestringlist.Count-1 do
         begin
              if Pos(':', filestringlist[i]) > 0 then
              begin
                  aline:= filestringlist[i];
                  colonpos:= Pos(':', aline);
                  if Copy(aline, 1, colonpos-1) = 'myChartTitle' then
                     myChartTitle:= Copy(aline, colonpos+2, Length(aline));
                  if Copy(aline, 1, colonpos-1) = 'myYAxisTitle' then
                     myYAxisTitle:= Copy(aline, colonpos+2, Length(aline));
                  if Copy(aline, 1, colonpos-1) = 'myXAxisTitle' then
                     myXAxisTitle:= Copy(aline, colonpos+2, Length(aline));
                  if Copy(aline, 1, colonpos-1) = 'myChartTitleFontSize' then
                     myChartTitleFontSize:= StrtoInt(Copy(aline, colonpos+2, Length(aline)));
                  if Copy(aline, 1, colonpos-1) = 'myYAxisTitleFontSize' then
                     myYAxisTitleFontSize:= StrtoInt(Copy(aline, colonpos+2, Length(aline)));
                  if Copy(aline, 1, colonpos-1) = 'myXAxisTitleFontSize' then
                     myXAxisTitleFontSize:= StrtoInt(Copy(aline, colonpos+2, Length(aline)));
                  if Copy(aline, 1, colonpos-1) = 'myYMarkFontSize' then
                     myYMarkFontSize:= StrtoInt(Copy(aline, colonpos+2, Length(aline)));
                  if Copy(aline, 1, colonpos-1) = 'myXMarkFontSize' then
                     myXMarkFontSize:= StrtoInt(Copy(aline, colonpos+2, Length(aline)));
                  if Copy(aline, 1, colonpos-1) = 'myLegendFontSize' then
                     myLegendFontSize:= StrtoInt(Copy(aline, colonpos+2, Length(aline)));
                  if Copy(aline, 1, colonpos-1) = 'myChartHeight' then
                     myChartHeight:= StrtoInt(Copy(aline, colonpos+2, Length(aline)));
                  if Copy(aline, 1, colonpos-1) = 'myChartWidth' then
                     myChartWidth:= StrtoInt(Copy(aline, colonpos+2, Length(aline)));
                  if Copy(aline, 1, colonpos-1) = 'myYNumberFormat' then
                     myYNumberFormat:= Copy(aline, colonpos+2, Length(aline));
                  if Copy(aline, 1, colonpos-1) = 'myXNumberFormat' then
                     myXNumberFormat:= Copy(aline, colonpos+2, Length(aline));
                  if Copy(aline, 1, colonpos-1) = 'defaultfolder' then
                     defaultfolder:= Copy(aline, colonpos+2, Length(aline));
                  if Copy(aline, 1, colonpos-1) = 'excelname' then
                     excelname:= Copy(aline, colonpos+2, Length(aline));
                  if Copy(aline, 1, colonpos-1) = 'scriptname' then
                     scriptname:= Copy(aline, colonpos+2, Length(aline));
              end;
         end;
         //ShowMessage('Read from ' +ExecutablePath+'Smatterplot Settings.txt');
      end

      else
      begin
         // File doesn't exist so write it
         filestringlist.Add('<SmatterPlot v1.0>');
         filestringlist.Add('HeaderRowPresent:=True');
         filestringlist.Add('HeaderRow:=27');
         filestringlist.Add('myChartTitle:='+myChartTitle);
         filestringlist.Add('myYAxisTitle:='+myYAxisTitle);
         filestringlist.Add('myXAxisTitle:='+myXAxisTitle);
         filestringlist.Add('myChartTitleFontSize:='+InttoStr(myChartTitleFontSize));
         filestringlist.Add('myYAxisTitleFontSize:='+InttoStr(myYAxisTitleFontSize));
         filestringlist.Add('myXAxisTitleFontSize:='+InttoStr(myXAxisTitleFontSize));
         filestringlist.Add('myYMarkFontSize:='+InttoStr(myYMarkFontSize));
         filestringlist.Add('myXMarkFontSize:='+InttoStr(myXMarkFontSize));
         filestringlist.Add('myLegendFontSize:='+InttoStr(myLegendFontSize));
         filestringlist.Add('myChartHeight:='+InttoStr(myChartHeight));
         filestringlist.Add('myChartWidth:='+InttoStr(myChartWidth));
         filestringlist.Add('myYNumberFormat:='+myYNumberFormat);
         filestringlist.Add('myXNumberFormat:='+myXNumberFormat);
         filestringlist.Add('mydatasets:='+InttoStr(mydatasets));
         filestringlist.Add('xcol:='+InttoStr(xcol));
         filestringlist.Add('ycol:='+InttoStr(ycol));
         filestringlist.Add('xmaxauto:='+BooltoStr(xmaxauto));
         filestringlist.Add('ymaxauto:='+BooltoStr(ymaxauto));
         filestringlist.Add('yminauto:='+BooltoStr(yminauto));
         filestringlist.Add('xminauto:='+BooltoStr(xminauto));
         filestringlist.Add('ymaxglob:='+FloattoStr(ymaxglob));
         filestringlist.Add('yminglob:='+FloattoStr(yminglob));
         filestringlist.Add('xmaxglob:='+FloattoStr(xmaxglob));
         filestringlist.Add('xminglob:='+FloattoStr(xminglob));
         filestringlist.Add('YisLog:='+BooltoStr(YisLog));
         filestringlist.Add('XisLog:='+BooltoStr(XisLog));
         filestringlist.Add('mySizeLocked:='+BooltoStr(mySizeLocked));
         filestringlist.Add('defaultfolder:='+defaultfolder);
         filestringlist.Add('excelname:='+excelname);
         filestringlist.Add('scriptname:='+scriptname);
         filestringlist.Add('Created:='+DateTimeToStr(Now));
         filestringlist.Add('</SmatterPlot>');
         filestringlist.SaveToFile(ExecutablePath+'SmatterPlot Settings.txt');
         //ShowMessage('Wrote to '+ExecutablePath+'Smatterplot Settings.txt');
      end;

end;

procedure TForm1.FormDropFiles(Sender: TObject; const FileNames: array of string
  );
var
  FileName: String;

begin
  for FileName in FileNames do
  begin
    If TabSheet1.Showing = true then    // add to chart and table
    begin
      OpenMyFiles3(Sender, FileName);
      Form1.Button1.Click;
      RebuildChart();
    end;
    If TabSheet3.Showing = true then   // add to paste pad
    begin
      OpenMyFiles3(Sender, FileName);

    end;


  end;
end;

procedure TForm1.StringGrid1DblClick(Sender: TObject);
begin

end;

procedure TForm1.StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TForm1.StringGrid1SelectCell(Sender: TObject; aCol, aRow: Integer;
  var CanSelect: Boolean);
begin
  //ShowMessage(Form1.StringGrid1.Cells[aCol,aRow]);

end;

procedure TForm1.StringGrid1SelectEditor(Sender: TObject; aCol, aRow: Integer;
  var Editor: TWinControl);
begin
   ShowMessage(Form1.StringGrid1.Cells[aCol,aRow]);
end;

procedure TForm1.StringGrid1Selection(Sender: TObject; aCol, aRow: Integer);
begin
  //ShowMessage(Form1.StringGrid1.Cells[aCol,aRow]);
end;



end.

