unit Unit35;
// Project: SmatterPlot
// unit34 = Save Settings form

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm35 }

  TForm35 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
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
    Label17: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form35: TForm35;

implementation
uses
  unit1;

{$R *.lfm}

{ TForm35 }

procedure TForm35.Button1Click(Sender: TObject);
var
  filestringlist: TStringList;

begin
  // Click Save Settings

  defaultfolder:= Form35.Edit1.Caption;
  excelname:=  Form35.Edit2.Caption;
  scriptname:=  Form35.Edit3.Caption;
  myChartTitle:=  Form35.Edit4.Caption;
  myYAxisTitle:=  Form35.Edit5.Caption;
  myXAxisTitle:=  Form35.Edit6.Caption;
  myChartTitleFontSize:=  StrtoInt(Form35.Edit7.Caption);
  myYAxisTitleFontSize:= StrtoInt(Form35.Edit8.Caption);
  myXAxisTitleFontSize:= StrtoInt(Form35.Edit9.Caption);
  myYMarkFontSize:= StrtoInt(Form35.Edit10.Caption);
  myXMarkFontSize:= StrtoInt(Form35.Edit11.Caption);
  myLegendFontSize:= StrtoInt(Form35.Edit12.Caption);
  myChartHeight:=StrtoInt(Form35.Edit13.Caption);
  myChartWidth:= StrtoInt(Form35.Edit14.Caption);
  myYNumberFormat:=Form35.Edit15.Caption;
  myXNumberFormat:=Form35.Edit16.Caption;

  Form35.Hide;

  // Now save settings to file:
         filestringlist:=TstringList.Create;
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

end;

procedure TForm35.Button2Click(Sender: TObject);
begin
  // Click Cancel
  Form35.Hide;

end;

end.

