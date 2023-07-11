unit Unit1;
// Project: SmatterPlot
// unit1 = main form

{$mode objfpc}{$H+}

interface



uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComCtrls, Menus, ExtDlgs, TAGraph, TATypes, TASeries, LCLType,
  TATransformations, Clipbrd, Grids, TADrawUtils, TATools;

var
  mycolors: array of TColor;
  mycolorsint: array of integer;
  mysymbols: array of TSeriesPointerStyle;
  mysymbolsint: array of integer;
  //mylinesvis: array of boolean;
  mylines: array of TLineType;
  mylinesint: array of integer;
  mylinestyles: array of TPenStyle;
  mylinestylesint: array of integer;
  myChartTitleFontSize: integer;
  myYAxisTitleFontSize: integer;
  myXAxisTitleFontSize: integer;
  myChartHeight: integer;
  myChartWidth: integer;
  myYMarkFontSize: integer;
  myXMarkFontSize: integer;
  myYNumberFormat: String;
  myXNumberFormat: String;




type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Chart1: TChart;
    ChartAxisTransformations1: TChartAxisTransformations;
    ChartAxisTransformations2: TChartAxisTransformations;
    ChartAxisTransformations1LinearAxisTransform1: TLinearAxisTransform;
    ChartAxisTransformations1LogarithmAxisTransform1: TLogarithmAxisTransform;
    ChartToolset1: TChartToolset;
    ChartToolset1ZoomMouseWheelTool1: TZoomMouseWheelTool;
    ComboBox1: TComboBox;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
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
    MenuItem30: TMenuItem;
    MenuItem31: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem33: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    PopupMenu1: TPopupMenu;
    SavePictureDialog1: TSavePictureDialog;
    Separator1: TMenuItem;
    StringGrid1: TStringGrid;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Chart1AfterDraw(ASender: TChart; ADrawer: IChartDrawer);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MenuItem20Click(Sender: TObject);
    procedure MenuItem21Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem32Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure OpenMyFiles(Sender: TObject; FileName: String);
    procedure AddMemoDataToList(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of string);

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
  unit2, unit3, unit4, Unit8;

{$R *.lfm}

{ TForm1 }


// David's first procedure!!!!!!!!!!!!!!!!!
procedure TForm1.OpenMyFiles(Sender: TObject; FileName: String);
var
  myfile: String;
  newseries: TLineSeries;
  i: integer;
  j: integer;
  mypos: integer;
  xstr: String;
  ystr: String;
  mystr: String;
  x, y: array[1..100000] of double;      //[1..100]
  snum: integer;
  slashpos: integer;
  noslashstr: String;



begin
  //find filename and extension
  //mycolors:= (clblue, clRed, clGreen, clBlack, clOlive, clTeal, clGray, clFuchsia, clAqua, clSilver);
  //mysymbols: array of TSeriesPointerStyle = (psCircle, psRectangle, psTriangle, psDiamond, psStar, psHexagon,psVertBar, psHorBar,psCross, psFullStar);

  if pos('\', FileName) > 0 then
     begin
       slashpos := pos('\', FileName);
       noslashstr := copy(FileName, slashpos+1);
       while pos('\', noslashstr) > 0 do
         begin
              slashpos := pos('\', noslashstr);
              noslashstr := copy(noslashstr, slashpos+1);
              //ShowMessage(noslashstr)
              // A change    2

         end;
     end;
  myfile :=FileName;

  myStringList.LoadfromFile(myfile);
  StringGrid1.Clear;
  StringGrid1.RowCount:=myStringList.Count;

  for i := 1 to myStringList.count -1 do
  begin
     mystr:= myStringList[i];
     mypos:= pos(',', mystr);
     if mypos > 0 then
     begin

       xstr := Copy(mystr,1,mypos-1);
       ystr := Copy(mystr,mypos+1);
       x[i] := StrtoFloat(xstr);
       y[i] := StrtoFloat(ystr);

       StringGrid1.Cells[0,i]:=xstr;
       StringGrid1.Cells[1,i]:=ystr;
     end;
  end;

  Memo1.Lines.Assign(myStringList);               //assign text content
  newseries := TLineSeries.Create(Chart1.Owner);
  newseries.ShowPoints:= true;
  Chart1.AddSeries(newseries);
  snum := Chart1.Series.Count;
  Chart1.BottomAxis.Grid.Visible:=false;
  Chart1.LeftAxis.Grid.Visible:=false;

  mystr:= myStringList[0];
  mypos:= pos(',', mystr);
  if mypos > 0 then
  begin
    Chart1.BottomAxis.Title.Caption:=Copy(myStringList[0],1,mypos-1);
    Chart1.LeftAxis.Title.Caption:=Copy(myStringList[0],mypos+1);
  end;


  for j := 1 to myStringList.count-1 do
  begin
     TLineSeries(Chart1.Series[snum-1]).AddXY(x[j],y[j]);
     TLineSeries(Chart1.Series[snum-1]).ShowInLegend:=true;
     TLineSeries(Chart1.Series[snum-1]).Title := noslashstr;
     TLineSeries(Chart1.Series[snum-1]).SeriesColor:=mycolors[mycolorsint[snum-1]];
     TLineSeries(Chart1.Series[snum-1]).Pointer.Brush.Color:=mycolors[mycolorsint[snum-1]];
     TLineSeries(Chart1.Series[snum-1]).Pointer.Pen.Color:=mycolors[mycolorsint[snum-1]];
     TLineSeries(Chart1.Series[snum-1]).Pointer.Style:=mysymbols[mysymbolsint[snum-1]];
     TLineSeries(Chart1.Series[snum-1]).LineType:=mylines[mylinesint[snum-1]];
     TLineSeries(Chart1.Series[snum-1]).ShowLines:=true;
     TLineSeries(Chart1.Series[snum-1]).LinePen.Style:=mylinestyles[mylinestylesint[snum-1]];
     TLineSeries(Chart1.Series[snum-1]).AxisIndexX:=1;
     TLineSeries(Chart1.Series[snum-1]).AxisIndexY:=0;
     //TLineSeries(Chart1.Series[snum-1]).Marks.Format:='%.1f';

  end;

  Chart1.LeftAxis.Range.UseMax:= false;
  Chart1.LeftAxis.Range.UseMin:= false;
  Chart1.LeftAxis.Intervals.MaxLength:= 200;
  Chart1.BottomAxis.Range.UseMax:= false;
  Chart1.BottomAxis.Range.UseMin:= false;
  Chart1.BottomAxis.Intervals.MaxLength:= 200;

end;




// David's procedure to add memo data to Table View
procedure TForm1.AddMemoDataToList(Sender: TObject);
  var
    mystr: String;
    xstr: String;
    ystr: String;
    i: integer;
    num: integer;
    mypos: integer;

  begin
    num:=Memo1.Lines.Count;
    for i := 0 to num-1 do
    begin
      mystr:= Memo1.Lines[i];   //myStringList[i];
      mypos:= pos(',', mystr);
      if mypos > 0 then
      begin
        xstr := Copy(mystr,1,mypos-1);
        ystr := Copy(mystr,mypos+1);
        StringGrid1.InsertRowWithValues(i,[xstr, ystr]);

      end;
    end;

  end;



procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  // Open Selected
  if OpenDialog1.Execute then
    begin
      if fileExists(OpenDialog1.Filename) then
        OpenMyFiles(Sender, OpenDialog1.Filename);
    end
  else
    ShowMessage('No file selected');
end;

procedure TForm1.MenuItem32Click(Sender: TObject);
begin
  Form2.Show;

end;















procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  // Clicked "SAVE"
  if SavePictureDialog1.Execute then
    begin
      Chart1.Savetofile(TJPEGImage, SavePictureDialog1.Filename);
      if fileExists(SavePictureDialog1.Filename) then
        ShowMessage('File already exists with that name');
        //OpenMyFiles(Sender, OpenDialog1.Filename);
    end
  else
    ShowMessage('No file selected');

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

procedure TForm1.MenuItem14Click(Sender: TObject);
begin
  Form3.Show;

end;

procedure TForm1.MenuItem16Click(Sender: TObject);
begin
  // go to "Change Color Sequence form"
  Form4.show;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  // Formatter Button Click
  Form2.Show;

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  AddMemoDataToList(Sender);

end;

procedure TForm1.Button4Click(Sender: TObject);
var
  myymin: double;
  myymax: double;
  mystr: string;

begin
  // click button to show message
  // ShowMessage('clicked it');

  myymax:=Chart1.LeftAxis.Range.Max;
  mystr:= 'ymax ' + floattoStrf(myymax,ffgeneral,5,5);
  ShowMessage(mystr);
  myymin:=Chart1.LeftAxis.Range.Min;
  mystr:= 'ymin ' + floattoStrf(myymin,ffgeneral,5,5);
  ShowMessage(mystr);
  Chart1.LeftAxis.Range.Max:= myymax;
  Chart1.LeftAxis.Range.Min:= myymin;
  Chart1.LeftAxis.Range.UseMax:= false;
  Chart1.LeftAxis.Range.UseMin:= false;
  Chart1.LeftAxis.Intervals.MaxLength:= 200;

end;

procedure TForm1.Chart1AfterDraw(ASender: TChart; ADrawer: IChartDrawer);
begin
  Form1.Chart1.Title.Font.Size:= myChartTitleFontSize;
  Form1.Chart1.LeftAxis.Title.LabelFont.Size:= myYAxisTitleFontSize;
  Form1.Chart1.BottomAxis.Title.LabelFont.Size:= myXAxisTitleFontSize;
  Form1.Chart1.Height:= myChartHeight;
  Form1.Chart1.Width:= myChartWidth;
  Form1.Chart1.LeftAxis.Marks.LabelFont.Size:= myYMarkFontSize;
  Form1.Chart1.BottomAxis.Marks.LabelFont.Size:= myXMarkFontSize;

  Form1.Chart1.LeftAxis.Marks.Format:= myYNumberFormat;

  Form1.Chart1.BottomAxis.Marks.Format:=myXNumberFormat;
  //Form1.Chart1.LeftAxis.LabelSize:=12;
end;

procedure TForm1.MenuItem13Click(Sender: TObject);
begin
     // show about box
  Form8.Show;
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin

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

end;



procedure TForm1.Button1Click(Sender: TObject);
// Read memo data into chart
var
  newseries: TLineSeries;
  num: integer;
  i: integer;
  j: integer;
  mypos: integer;
  xstr: String;
  ystr: String;
  mystr: String;
  x, y: array[1..100] of double;
  snum: integer;
  //mycolors: array of TColor = (clblue, clRed, clGreen, clBlack, clOlive, clTeal, clGray, clFuchsia, clAqua, clSilver);

begin

  num:=Memo1.Lines.Count;
  //ShowMessage(InttoStr(num));

  for i := 1 to num-1 do
  begin
     mystr:= Memo1.Lines[i];   //myStringList[i];
     mypos:= pos(',', mystr);
     if mypos > 0 then
     begin

       xstr := Copy(mystr,1,mypos-1);
       ystr := Copy(mystr,mypos+1);
       x[i] := StrtoFloat(xstr);
       y[i] := StrtoFloat(ystr);
     end;
  end;

  newseries := TLineSeries.Create(Chart1.Owner);
  newseries.ShowPoints:= true;
  Chart1.AddSeries(newseries);
  snum := Chart1.Series.Count;

  for j := 1 to num-1 do
  begin
     TLineSeries(Chart1.Series[snum-1]).AddXY(x[j],y[j]);
     TLineSeries(Chart1.Series[snum-1]).ShowInLegend:=true;
     TLineSeries(Chart1.Series[snum-1]).Title := 'Paste';
     TLineSeries(Chart1.Series[snum-1]).SeriesColor:=mycolors[mycolorsint[snum-1]];
     TLineSeries(Chart1.Series[snum-1]).Pointer.Brush.Color:=mycolors[mycolorsint[snum-1]];
     TLineSeries(Chart1.Series[snum-1]).Pointer.Pen.Color:=mycolors[mycolorsint[snum-1]];
     TLineSeries(Chart1.Series[snum-1]).Pointer.Style:=mysymbols[mysymbolsint[snum-1]];
     TLineSeries(Chart1.Series[snum-1]).LineType:=mylines[mylinesint[snum-1]];
     TLineSeries(Chart1.Series[snum-1]).ShowLines:=true;
     TLineSeries(Chart1.Series[snum-1]).LinePen.Style:=mylinestyles[mylinestylesint[snum-1]];
     TLineSeries(Chart1.Series[snum-1]).AxisIndexX:=1;
     TLineSeries(Chart1.Series[snum-1]).AxisIndexY:=0;
     //TLineSeries(Chart1.Series[snum-1]).Marks.Format:='%.1f';

  end;
  Chart1.LeftAxis.Range.UseMax:= false;
  Chart1.LeftAxis.Range.UseMin:= false;
  Chart1.LeftAxis.Intervals.MaxLength:= 200;
  Chart1.BottomAxis.Range.UseMax:= false;
  Chart1.BottomAxis.Range.UseMin:= false;
  Chart1.BottomAxis.Intervals.MaxLength:= 200;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
      //initialize the global variables
      myStringList:=TStringList.Create;               //Create my StringList
      mycolors:= [clblue, clRed, clGreen, clBlack, clOlive, clTeal, clGray, clFuchsia, clAqua, clSilver];
      mycolorsint:= [0,1,2,3,4,5,6,7,8,9,10];
      mysymbols:= [psCircle, psRectangle, psTriangle, psDiamond, psStar, psHexagon,psVertBar, psHorBar,psCross, psPoint];
      mysymbolsint:= [0,1,2,3,4,5,6,7,8,9,10];
      mylines:=[ltNone, ltFromPrevious, ltFromOrigin, ltStepXY, ltStepYX];
      mylinesint:=[1,1,1,1,1,1,1,1,1,1];
      mylinestyles:=[psSolid, psDash, psDot, psDashDot, psDashDotDot];
      mylinestylesint:=[0,0,0,0,0,0,0,0,0,0];
      myChartTitleFontSize:= 16;
      myYAxisTitleFontSize:= 14;
      myXAxisTitleFontSize:= 14;
      myYMarkFontSize:= 12;
      myXMarkFontSize:= 12;
      myChartHeight:= 500;
      myChartWidth:= 500;
      myYNumberFormat:= '%:.2f%';
      myXNumberFormat:= '%:.1f%';


end;

procedure TForm1.FormDropFiles(Sender: TObject; const FileNames: array of string
  );
var
  FileName: String;

begin
  for FileName in FileNames do
  begin
    OpenMyFiles(Sender, FileName);

  end;
end;



end.

