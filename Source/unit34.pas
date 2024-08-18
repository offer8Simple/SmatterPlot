unit Unit34;
// Project: SmatterPlot
// unit34 = Export to Python/Matplotlib form

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm34 }

  TForm34 = class(TForm)
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ToggleBox3: TToggleBox;
    procedure ToggleBox3Change(Sender: TObject);
  private

  public

  end;

var
  Form34: TForm34;

implementation
uses
  unit1, unit33;

{$R *.lfm}

{ TForm34 }

procedure TForm34.ToggleBox3Change(Sender: TObject);
var
  s1: TStringList;

begin
  // click Export to Python/Matplotlib
  Form33.Edit1.Caption:= Form34.Edit1.Caption;
  Form33.Edit2.Caption:= Form34.Edit2.Caption;
  Form33.CheckBox4.Checked:=false;
  Form33.ToggleBox3Change(Sender);

  //create  python script
  s1:= TStringList.Create;
  s1.Clear;
  s1.Add('#Python script to create a Matplotlib chart from data in an Excel Workbook');
  s1.Add('#Created: '+DateTimeToStr(Now)+' using SmatterPlot');
  s1.Add('#Requires Openpyxl to be installed in python ');
  s1.Add('#Requires Pandas to be installed in python ');
  s1.Add('#Requires Matplotlib to be installed in python ');
  s1.Add('import pandas as pd ');
  s1.Add('from matplotlib import pyplot as plt ');
  s1.Add('from matplotlib.ticker import (MultipleLocator, FormatStrFormatter, AutoMinorLocator)');
  s1.Add('#initialize plot and variables');
  s1.Add('fig, ax = plt.subplots() ');
  s1.Add('iopath = r'''+ Form34.Edit1.Caption+Form34.Edit2.Caption+''' ');
  s1.Add('xlsfile = pd.ExcelFile(iopath)  ');
  s1.Add('xcol = 3    ');
  s1.Add('ycol = 4    ');
  s1.Add('df1 = []    ');
  s1.Add('df2 = []    ');
  s1.Add('df3 = []    ');
  s1.Add('#read data from Excelfile   ');
  s1.Add('df1.append(xlsfile.parse(sheet_name=''data'',header=0))  ');
  s1.Add('df2.append(xlsfile.parse(sheet_name=''Info'',header=0))  ');
  s1.Add('columnheaders = df1[0].columns                         ');
  s1.Add('datasets = df1[0][columnheaders[1]].unique()           ');
  s1.Add('datasetnames = df1[0][columnheaders[2]].unique()       ');
  s1.Add('print(datasets)                                        ');
  s1.Add('print(datasetnames)                                    ');
  s1.Add('for dataset in datasets:                               ');
  s1.Add('    df3.append(df1[0].loc[df1[0][columnheaders[1]]==dataset]) ');
  s1.Add('#add datasets to plot                                  ');
  s1.Add('for dataset in datasets:                               ');
  s1.Add('    ax.plot(df3[dataset-1][columnheaders[xcol]], df3[dataset-1][columnheaders[ycol]], label=datasetnames[dataset-1]) ');
  s1.Add('#get chart info  ');
  s1.Add('mycharttitle= df2[0].iloc[2][''<SmatterPlot v1.0>''].split(''='')[1]');
  s1.Add('myYAxistitle= df2[0].iloc[3][''<SmatterPlot v1.0>''].split(''='')[1]');
  s1.Add('myXAxistitle= df2[0].iloc[4][''<SmatterPlot v1.0>''].split(''='')[1]');
  s1.Add('ax.set_xlabel(myXAxistitle) ');
  s1.Add('ax.set_ylabel(myYAxistitle) ');
  s1.Add('if (mycharttitle != ''none''):');
  s1.Add('    ax.set_title(mycharttitle)  ');
  s1.Add('ax.legend() ');
  s1.Add('#Show the plot and also save to an SVG file  ');
  s1.Add('plt.show()       ');
  s1.Add('plt.savefig(''SPToPythonChart.svg'')  ');
  s1.SaveToFile(Form34.Edit1.Caption+Form34.Edit3.Caption);

end;

end.

