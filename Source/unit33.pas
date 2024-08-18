unit Unit33;
// Project: SmatterPlot
// unit33 = Export to Excel form

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, FileUtil, zipper, AbZipper, LCLintf;

type

  { TForm33 }

  TForm33 = class(TForm)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ToggleBox3: TToggleBox;
    procedure ToggleBox3Change(Sender: TObject);
  private

  public

  end;

var
  Form33: TForm33;

implementation
uses
  unit1;
{$R *.lfm}

{ TForm33 }





function PackFiles(AZipFilename, ADirectory, AMask: String;
  IncludingSubDirs: Boolean): Boolean;
var
  OurZipper: TZipper;
  list: TStringList;
  i: Integer;
  diskFileName, archiveFileName: String;
begin
  Result := false;
  ADirectory := IncludeTrailingPathDelimiter(ADirectory);
  if DirectoryExists(ADirectory) then
  begin
     OurZipper := TZipper.Create;
     try
       // Set the name of the zip file to be created
       OurZipper.FileName := AZipFileName;

       // Read names of the files contained in ADirectory to a stringlist
       list := TStringList.Create;
       try
         // FindAllFiles adds all file names matching the mask (e.g. '*.*')
         // found in the given directory to the provided list.
         // When IncludingSubDirs is true the search continues recursively in
         // the subdirectories.
         FindAllFiles(list, ADirectory, AMask, IncludingSubDirs);
         for i := 0 to list.Count - 1 do
         begin
           // diskfilename is the name of the file to be zipped on the disk
           diskFileName := list[i];
           // archivefilename is the name of the file to be zipped as it appears
           // in the zip. We remove the deirectory from the
           archiveFileName := StringReplace(diskFileName, ADirectory, '', []);
           // Store these filenames for the zipper
           OurZipper.Entries.AddFileEntry(diskFileName, archiveFileName);
         end;
       finally
         list.Free;
       end;
       // By default zipper writes file names in encoding of the IBM PC, CP437.
       // UTF8 encoding is written when UseLanguageEncoding is true.
       OurZipper.UseLanguageEncoding := true;  // Requires FPC 3.2+
       // create and write the zip file
       OurZipper.ZipAllFiles;
       Result := true;
     finally
       OurZipper.Free;
     end;
  end else
    Result := false;
end;





procedure TForm33.ToggleBox3Change(Sender: TObject);
var
  filepath: String;
  newfilename: String;
  s1: TStringList;
  sharedstrings: TStringList;
  letterlist: Array of String;
  k: integer;
  j: integer;
  i: integer;
  k1: integer;
  k3: integer;
  lastrow: integer;
  datasetnum: integer;
  myoutval: double;
  datasetstart: Array of integer;
  datasetend: Array of integer;
  ptcount: Array of integer;
  mycounter: integer;
  firstrow: boolean;
  m: integer;
  MyZipper: TAbZipper;
  TheFileList:TStringList;
  MyDirectory: String;
  thestringnum: integer;
  n: integer;
  q: integer;
  sourceF: TFileStream;
  destF: TFileStream;
  Colorlist: Array of String;
  markerlist: Array of String;
  markerclosed: Array of Boolean;
  p: integer;
  diskfilename: String;
  archivefilename: String;




begin
  // Click Export to Excel Button
  Form33.Hide;

  filepath:= form33.Edit1.Caption;
  newfilename:= form33.Edit2.Caption;
  Colorlist:= ['0000FF', 'FF0000', '00a550', '2a3439', '00ffff', 'ffd700', 'adff2f', 'a020f0', 'eeaeee', '8c8c8c'];           //Excel colors
  markerlist:= ['circle', 'square', 'triangle', 'diamond','circle', 'square', 'triangle', 'Diamond','circle', 'square'];      //Excel markers
  letterlist:= ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
  lastrow:= form1.StringGrid1.RowCount;
  SetLength(datasetstart, lastrow);
  SetLength(datasetend, lastrow);
  SetLength(ptcount, lastrow);
  datasetnum:=0;
  for n:=0 to lastrow-1 do
  begin
    datasetstart[n]:=0;
    datasetend[n]:=0;
    ptcount[n]:=0;
  end;

  s1:= TStringList.Create;
  sharedstrings:= TStringList.Create;




  //Create folder structure
  If Not DirectoryExists(filepath) then
     CreateDir (filepath);
  If Not DirectoryExists(filepath+'temp\') then
     CreateDir (filepath+'temp');
  If Not DirectoryExists(filepath+'temp\xl') then
     CreateDir (filepath+'temp\xl');
  If Not DirectoryExists(filepath+'temp\xl\worksheets') then
     CreateDir (filepath+'temp\xl\worksheets');
  If Not DirectoryExists(filepath+'temp\docProps') then
    CreateDir (filepath+'temp\docProps');
  If Not DirectoryExists(filepath+'temp\docMetadata') then
    CreateDir (filepath+'temp\docMetadata');
  If Not DirectoryExists(filepath+'temp\xl\charts') then
     CreateDir (filepath+'temp\xl\charts');
  If Not DirectoryExists(filepath+'temp\xl\chartsheets') then
     CreateDir (filepath+'temp\xl\chartsheets');
  If Not DirectoryExists(filepath+'temp\xl\chartsheets\_rels') then
     CreateDir (filepath+'temp\xl\chartsheets\_rels');
  If Not DirectoryExists(filepath+'temp\xl\drawings') then
     CreateDir (filepath+'temp\xl\drawings');
  If Not DirectoryExists(filepath+'temp\xl\drawings\_rels') then
     CreateDir (filepath+'temp\xl\drawings\_rels');
  If Not DirectoryExists(filepath+'temp\_rels') then
     CreateDir (filepath+'temp\_rels');
  If Not DirectoryExists(filepath+'temp\xl\_rels') then
     CreateDir (filepath+'temp\xl\_rels');
  If Not DirectoryExists(filepath+'temp\xl\theme') then
     CreateDir (filepath+'temp\xl\theme');





  //create  [Content_Types].xml
  s1.Clear;
  s1.Add('<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">');
  s1.Add('<Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>');
  s1.Add('<Default Extension="xml" ContentType="application/xml"/>');
  s1.Add('<Override PartName="/xl/workbook.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml"/>');
  s1.Add('<Override PartName="/xl/chartsheets/sheet1.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.chartsheet+xml"/>');
  s1.Add('<Override PartName="/xl/worksheets/sheet1.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml"/>');
  s1.Add('<Override PartName="/xl/worksheets/sheet2.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml"/>');
  s1.Add('<Override PartName="/xl/theme/theme1.xml" ContentType="application/vnd.openxmlformats-officedocument.theme+xml"/>');
  s1.Add('<Override PartName="/xl/styles.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.styles+xml"/>');
  s1.Add('<Override PartName="/xl/sharedStrings.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.sharedStrings+xml"/>');
  s1.Add('<Override PartName="/xl/drawings/drawing1.xml" ContentType="application/vnd.openxmlformats-officedocument.drawing+xml"/>');
  s1.Add('<Override PartName="/xl/charts/chart1.xml" ContentType="application/vnd.openxmlformats-officedocument.drawingml.chart+xml"/>');
  s1.Add('<Override PartName="/docMetadata/LabelInfo.xml" ContentType="application/vnd.ms-office.classificationlabels+xml"/>');
  s1.Add('<Override PartName="/docProps/core.xml" ContentType="application/vnd.openxmlformats-package.core-properties+xml"/>');
  s1.Add('<Override PartName="/docProps/app.xml" ContentType="application/vnd.openxmlformats-officedocument.extended-properties+xml"/>');
  s1.Add('</Types>');
  s1.SaveToFile(filepath+'temp\[Content_Types].xml');















//------------------------------------------------------------------------------
  //create  \worksheets\sheet1.xml
s1.Clear;
s1.Add('');
s1.Add('<worksheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main"');
s1.Add('xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"');
s1.Add('xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"       ');
s1.Add('xmlns:x14ac="http://schemas.microsoft.com/office/spreadsheetml/2009/9/ac"    ');
s1.Add('xmlns:xr="http://schemas.microsoft.com/office/spreadsheetml/2014/revision"   ');
s1.Add('xmlns:xr2="http://schemas.microsoft.com/office/spreadsheetml/2015/revision2" ');
s1.Add('xmlns:xr3="http://schemas.microsoft.com/office/spreadsheetml/2016/revision3" ');
s1.Add('mc:Ignorable="x14ac xr xr2 xr3" xr:uid="{33DBEEA8-4767-4114-B9B5-D6EFEC81B3BC}">');

s1.Add('<dimension ref="A1:S306"/>');
s1.Add('<sheetViews>');
s1.Add('<sheetView workbookViewId="0">');
s1.Add('<selection activeCell="B2" sqref="B2"/>');
s1.Add('</sheetView>');
s1.Add('</sheetViews>');
s1.Add('<sheetFormatPr defaultRowHeight="15" x14ac:dyDescent="0.25"/>');
s1.Add('<sheetData>');

// get sheet data
lastrow:= form1.StringGrid1.RowCount;
k:=0;
datasetnum:=0;
ptcount[0]:=0;
j:=0;
// add header row
s1.Add('<row r="1" spans="1:19" x14ac:dyDescent="0.25">');
for i:= 0 to 18 do
begin
     if TryStrtoFloat(form1.StringGrid1.Cells[i,0], myoutval) = true then
        s1.Add('<c r="'+letterlist[i]+'1"><v>'+form1.StringGrid1.Cells[i,j]+'</v></c>')
     else
     begin
        thestringnum:=-1;
        for m:= 0 to sharedstrings.Count-1 do
        begin
          if form1.StringGrid1.Cells[i,0] = sharedstrings[m] then
             thestringnum:= m;
        end;
        if thestringnum = -1 then
        begin
           sharedstrings.Add(form1.StringGrid1.Cells[i,0]);
           thestringnum:= k;
           k:=k+1;
        end;
        s1.Add('<c r="'+letterlist[i]+'1" t="s"><v>'+InttoStr(thestringnum)+'</v></c>');
     end;
end;
s1.Add('</row>');

// add the rest of the rows
for j:= 1 to lastrow-1 do
begin
    if datasetnum <> strtoint(form1.StringGrid1.Cells[1,j]) then
    begin
       datasetnum:= strtoint(form1.StringGrid1.Cells[1,j]);
       ptcount[datasetnum]:= 0;
       datasetstart[datasetnum]:=j;
       if datasetnum>1 then
          datasetend[datasetnum-1]:=j-1;
    end;
    ptcount[datasetnum]:= ptcount[datasetnum]+1;
    s1.Add('<row r="'+InttoStr(j+1)+'" spans="1:19" x14ac:dyDescent="0.25">');
    for i:= 0 to 18 do
    begin
         if TryStrtoFloat(form1.StringGrid1.Cells[i,j], myoutval) = true then
            s1.Add('<c r="'+letterlist[i]+inttostr(j+1)+'"><v>'+form1.StringGrid1.Cells[i,j]+'</v></c>')
         else
         begin
            thestringnum:=-1;
            for m:= 0 to sharedstrings.Count-1 do
            begin
              if form1.StringGrid1.Cells[i,j] = sharedstrings[m] then
                 thestringnum:= m;
            end;
            if thestringnum = -1 then
            begin
               sharedstrings.Add(form1.StringGrid1.Cells[i,j]);
               thestringnum:= k;
               k:=k+1;
            end;

            s1.Add('<c r="'+letterlist[i]+inttostr(j+1)+'" t="s"><v>'+InttoStr(thestringnum)+'</v></c>');

         end;
    end;
    s1.Add('</row>');
end;
datasetend[datasetnum]:=lastrow-1;

s1.Add('</sheetData>');
s1.Add('<pageMargins left="0.7" right="0.7" top="0.75" bottom="0.75" header="0.3" footer="0.3"/>');
s1.Add('</worksheet>');

s1.SaveToFile(filepath+'temp\xl\worksheets\sheet1.xml');
//ShowMessage(inttostr(datasetnum));




















//create  \worksheets\sheet2.xml
s1.Clear;
s1.Add('<worksheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:x14ac="http://schemas.microsoft.com/office/spreadsheetml/2009/9/ac" xmlns:xr="http://schemas.microsoft.com/office/spreadsheetml/2014/revision" xmlns:xr2="http://schemas.microsoft.com/office/spreadsheetml/2015/revision2" xmlns:xr3="http://schemas.microsoft.com/office/spreadsheetml/2016/revision3" mc:Ignorable="x14ac xr xr2 xr3" xr:uid="{3509F1CA-EA1B-45B6-ADB3-26C8FBDFF248}">');
s1.Add('<dimension ref="A1:A5"/>');
s1.Add('<sheetViews>');
s1.Add('<sheetView workbookViewId="0">');
s1.Add('<selection activeCell="A9" sqref="A9"/>');
s1.Add('</sheetView>');
s1.Add('</sheetViews>');
s1.Add('<sheetFormatPr defaultRowHeight="15" x14ac:dyDescent="0.25"/>');
s1.Add('<sheetData>');
sharedstrings.Add('&lt;SmatterPlot v1.0&gt;');
sharedstrings.Add('HeaderRowPresent:=True');
sharedstrings.Add('HeaderRow:=27');
sharedstrings.Add('myChartTitle:='+myChartTitle);
sharedstrings.Add('myYAxisTitle:='+myYAxisTitle);
sharedstrings.Add('myXAxisTitle:='+myXAxisTitle);
sharedstrings.Add('myChartTitleFontSize:='+InttoStr(myChartTitleFontSize));
sharedstrings.Add('myYAxisTitleFontSize:='+InttoStr(myYAxisTitleFontSize));
sharedstrings.Add('myXAxisTitleFontSize:='+InttoStr(myXAxisTitleFontSize));
sharedstrings.Add('myYMarkFontSize:='+InttoStr(myYMarkFontSize));
sharedstrings.Add('myXMarkFontSize:='+InttoStr(myXMarkFontSize));
sharedstrings.Add('myLegendFontSize:='+InttoStr(myLegendFontSize));
sharedstrings.Add('myChartHeight:='+InttoStr(myChartHeight));
sharedstrings.Add('myChartWidth:='+InttoStr(myChartWidth));
sharedstrings.Add('myYNumberFormat:='+myYNumberFormat);
sharedstrings.Add('myXNumberFormat:='+myXNumberFormat);
sharedstrings.Add('mydatasets:='+InttoStr(mydatasets));
sharedstrings.Add('xcol:='+InttoStr(xcol));
sharedstrings.Add('ycol:='+InttoStr(ycol));
sharedstrings.Add('xmaxauto:='+BooltoStr(xmaxauto));
sharedstrings.Add('ymaxauto:='+BooltoStr(ymaxauto));
sharedstrings.Add('yminauto:='+BooltoStr(yminauto));
sharedstrings.Add('xminauto:='+BooltoStr(xminauto));
sharedstrings.Add('ymaxglob:='+FloattoStr(ymaxglob));
sharedstrings.Add('yminglob:='+FloattoStr(yminglob));
sharedstrings.Add('xmaxglob:='+FloattoStr(xmaxglob));
sharedstrings.Add('xminglob:='+FloattoStr(xminglob));
sharedstrings.Add('YisLog:='+BooltoStr(YisLog));
sharedstrings.Add('XisLog:='+BooltoStr(XisLog));
sharedstrings.Add('mySizeLocked:='+BooltoStr(mySizeLocked));
sharedstrings.Add('Created:='+DateTimeToStr(Now));
sharedstrings.Add('&lt;/SmatterPlot&gt;');
k3:= 0;
For q:= sharedstrings.Count-32 to sharedstrings.Count-1 do
begin
  k:=k+1;
  k3:=k3+1;
  s1.Add('<row r="'+inttostr(k3)+'" spans="1:1" x14ac:dyDescent="0.25"><c r="A'+inttostr(k3)+'" t="s"><v>'+inttostr(q)+'</v></c></row>');
end;

s1.Add('</sheetData>');
s1.Add('<phoneticPr fontId="1" type="noConversion"/>');
s1.Add('<pageMargins left="0.7" right="0.7" top="0.75" bottom="0.75" header="0.3" footer="0.3"/>');
s1.Add('</worksheet>');
s1.SaveToFile(filepath+'temp\xl\worksheets\sheet2.xml');




  //create  app.xml
s1.Clear;
s1.Add('<Properties xmlns="http://schemas.openxmlformats.org/officeDocument/2006/extended-properties" xmlns:vt="http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes">');
s1.Add('<Application>Microsoft Excel</Application>');
s1.Add('<DocSecurity>0</DocSecurity>');
s1.Add('<ScaleCrop>false</ScaleCrop>');
s1.Add('<HeadingPairs>');
s1.Add('<vt:vector size="4" baseType="variant">');
s1.Add('<vt:variant>');
s1.Add('<vt:lpstr>Worksheets</vt:lpstr>');
s1.Add('</vt:variant>');
s1.Add('<vt:variant>');
s1.Add('<vt:i4>2</vt:i4>');
s1.Add('</vt:variant>');
s1.Add('<vt:variant>');
s1.Add('<vt:lpstr>Charts</vt:lpstr>');
s1.Add('</vt:variant>');
s1.Add('<vt:variant>');
s1.Add('<vt:i4>1</vt:i4>');
s1.Add('</vt:variant>');
s1.Add('</vt:vector>');
s1.Add('</HeadingPairs>');
s1.Add('<TitlesOfParts>');
s1.Add('<vt:vector size="3" baseType="lpstr">');
s1.Add('<vt:lpstr>data</vt:lpstr>');
s1.Add('<vt:lpstr>Info</vt:lpstr>');
s1.Add('<vt:lpstr>Chart1</vt:lpstr>');
s1.Add('</vt:vector>');
s1.Add('</TitlesOfParts>');
s1.Add('<Company>Home</Company>');
s1.Add('<LinksUpToDate>false</LinksUpToDate>');
s1.Add('<SharedDoc>false</SharedDoc>');
s1.Add('<HyperlinksChanged>false</HyperlinksChanged>');
s1.Add('<AppVersion>16.0300</AppVersion>');
s1.Add('</Properties>');
s1.SaveToFile(filepath+'temp\docProps\'+'app.xml');


 //create  core.xml
s1.Clear;
s1.Add('<cp:coreProperties xmlns:cp="http://schemas.openxmlformats.org/package/2006/metadata/core-properties" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:dcmitype="http://purl.org/dc/dcmitype/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">');
s1.Add('<dc:creator>Shackleford</dc:creator>');
s1.Add('<cp:lastModifiedBy>Shackleford</cp:lastModifiedBy>');
s1.Add('<dcterms:created xsi:type="dcterms:W3CDTF">2024-07-23T17:18:54Z</dcterms:created>');
s1.Add('<dcterms:modified xsi:type="dcterms:W3CDTF">2024-07-23T18:26:34Z</dcterms:modified>');
s1.Add('</cp:coreProperties>');
s1.SaveToFile(filepath+'temp\docProps\'+'core.xml');






//create  styles.xml
s1.Clear;
s1.Add('<styleSheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:x14ac="http://schemas.microsoft.com/office/spreadsheetml/2009/9/ac" xmlns:x16r2="http://schemas.microsoft.com/office/spreadsheetml/2015/02/main" xmlns:xr="http://schemas.microsoft.com/office/spreadsheetml/2014/revision" mc:Ignorable="x14ac x16r2 xr">');
s1.Add('<fonts count="2" x14ac:knownFonts="1">');
s1.Add('<font>');
s1.Add('<sz val="11"/>');
s1.Add('<color theme="1"/>');
s1.Add('<name val="Calibri"/>');
s1.Add('<family val="2"/>');
s1.Add('<scheme val="minor"/>');
s1.Add('</font>');
s1.Add('<font>');
s1.Add('<sz val="8"/>');
s1.Add('<name val="Calibri"/>');
s1.Add('<family val="2"/>');
s1.Add('<scheme val="minor"/>');
s1.Add('</font>');
s1.Add('</fonts>');
s1.Add('<fills count="2">');
s1.Add('<fill>');
s1.Add('<patternFill patternType="none"/>');
s1.Add('</fill>');
s1.Add('<fill>');
s1.Add('<patternFill patternType="gray125"/>');
s1.Add('</fill>');
s1.Add('</fills>');
s1.Add('<borders count="1">');
s1.Add('<border>');
s1.Add('<left/>');
s1.Add('<right/>');
s1.Add('<top/>');
s1.Add('<bottom/>');
s1.Add('<diagonal/>');
s1.Add('</border>');
s1.Add('</borders>');
s1.Add('<cellStyleXfs count="1">');
s1.Add('<xf numFmtId="0" fontId="0" fillId="0" borderId="0"/>');
s1.Add('</cellStyleXfs>');
s1.Add('<cellXfs count="1">');
s1.Add('<xf numFmtId="0" fontId="0" fillId="0" borderId="0" xfId="0"/>');
s1.Add('</cellXfs>');
s1.Add('<cellStyles count="1">');
s1.Add('<cellStyle name="Normal" xfId="0" builtinId="0"/>');
s1.Add('</cellStyles>');
s1.Add('<dxfs count="0"/>');
s1.Add('<tableStyles count="0" defaultTableStyle="TableStyleMedium2" defaultPivotStyle="PivotStyleLight16"/>');
s1.Add('<extLst>');
s1.Add('<ext xmlns:x14="http://schemas.microsoft.com/office/spreadsheetml/2009/9/main" uri="{EB79DEF2-80B8-43e5-95BD-54CBDDF9020C}">');
s1.Add('<x14:slicerStyles defaultSlicerStyle="SlicerStyleLight1"/>');
s1.Add('</ext>');
s1.Add('<ext xmlns:x15="http://schemas.microsoft.com/office/spreadsheetml/2010/11/main" uri="{9260A510-F301-46a8-8635-F512D64BE5F5}">');
s1.Add('<x15:timelineStyles defaultTimelineStyle="TimeSlicerStyleLight1"/>');
s1.Add('</ext>');
s1.Add('</extLst>');
s1.Add('</styleSheet>');
s1.SaveToFile(filepath+'temp\xl\'+'styles.xml');






//create  workbook.xml
s1.Clear;
s1.Add('<workbook xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:x15="http://schemas.microsoft.com/office/spreadsheetml/2010/11/main" xmlns:xr="http://schemas.microsoft.com/office/spreadsheetml/2014/revision" xmlns:xr6="http://schemas.microsoft.com/office/spreadsheetml/2016/revision6" xmlns:xr10="http://schemas.microsoft.com/office/spreadsheetml/2016/revision10" xmlns:xr2="http://schemas.microsoft.com/office/spreadsheetml/2015/revision2" mc:Ignorable="x15 xr xr6 xr10 xr2">');
s1.Add('<fileVersion appName="xl" lastEdited="7" lowestEdited="7" rupBuild="26731"/>');
s1.Add('<workbookPr defaultThemeVersion="166925"/>');
s1.Add('<mc:AlternateContent xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006">');
s1.Add('<mc:Choice Requires="x15">');
s1.Add('<x15ac:absPath xmlns:x15ac="http://schemas.microsoft.com/office/spreadsheetml/2010/11/ac" url="C:\David-Local\Dev\Excel Structure"/>');
s1.Add('</mc:Choice>');
s1.Add('</mc:AlternateContent>');
s1.Add('<xr:revisionPtr revIDLastSave="0" documentId="8_{B21F6319-8527-4EE4-874C-6D460C918B8D}" xr6:coauthVersionLast="47" xr6:coauthVersionMax="47" xr10:uidLastSave="{00000000-0000-0000-0000-000000000000}"/>');
s1.Add('<bookViews>');
s1.Add('<workbookView xWindow="-28920" yWindow="-120" windowWidth="29040" windowHeight="16440" xr2:uid="{55F25B28-AECC-44E1-A622-0F72AAD82B5F}"/>');
s1.Add('</bookViews>');
s1.Add('<sheets>');
s1.Add('<sheet name="Chart1" sheetId="3" r:id="rId1"/>');
s1.Add('<sheet name="data" sheetId="1" r:id="rId2"/>');
s1.Add('<sheet name="Info" sheetId="2" r:id="rId3"/>');
s1.Add('</sheets>');
s1.Add('<calcPr calcId="191029"/>');
s1.Add('<fileRecoveryPr repairLoad="1"/>');
s1.Add('<extLst>');
s1.Add('<ext xmlns:x15="http://schemas.microsoft.com/office/spreadsheetml/2010/11/main" uri="{140A7094-0E35-4892-8432-C4D2E57EDEB5}">');
s1.Add('<x15:workbookPr chartTrackingRefBase="1"/>');
s1.Add('</ext>');
s1.Add('<ext xmlns:xcalcf="http://schemas.microsoft.com/office/spreadsheetml/2018/calcfeatures" uri="{B58B0392-4F1F-4190-BB64-5DF3571DCE5F}">');
s1.Add('<xcalcf:calcFeatures>');
s1.Add('<xcalcf:feature name="microsoft.com:RD"/>');
s1.Add('<xcalcf:feature name="microsoft.com:Single"/>');
s1.Add('<xcalcf:feature name="microsoft.com:FV"/>');
s1.Add('<xcalcf:feature name="microsoft.com:CNMTM"/>');
s1.Add('<xcalcf:feature name="microsoft.com:LET_WF"/>');
s1.Add('<xcalcf:feature name="microsoft.com:LAMBDA_WF"/>');
s1.Add('<xcalcf:feature name="microsoft.com:ARRAYTEXT_WF"/>');
s1.Add('</xcalcf:calcFeatures>');
s1.Add('</ext>');
s1.Add('</extLst>');
s1.Add('</workbook>');
s1.SaveToFile(filepath+'temp\xl\'+'workbook.xml');








//-----------------------------------------------------------------------------
//create  chart1.xml
s1.Clear;
s1.Add('');
s1.Add('<c:chartSpace xmlns:c="http://schemas.openxmlformats.org/drawingml/2006/chart" xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:c16r2="http://schemas.microsoft.com/office/drawing/2015/06/chart">');
s1.Add('<c:date1904 val="0"/>');
s1.Add('<c:lang val="en-US"/>');
s1.Add('<c:roundedCorners val="0"/>');
s1.Add('<mc:AlternateContent xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006">');
s1.Add('<mc:Choice xmlns:c14="http://schemas.microsoft.com/office/drawing/2007/8/2/chart" Requires="c14">');
s1.Add('<c14:style val="102"/>');
s1.Add('</mc:Choice>');
s1.Add('<mc:Fallback>');
s1.Add('<c:style val="2"/>');
s1.Add('</mc:Fallback>');
s1.Add('</mc:AlternateContent>');
s1.Add('<c:chart>');
s1.Add('<c:title>');
s1.Add('<c:tx>');
s1.Add('<c:rich>');
s1.Add('<a:bodyPr/>');
s1.Add('<a:lstStyle/>');
s1.Add('<a:p>');
s1.Add('<a:pPr>');
s1.Add('<a:defRPr/>');
s1.Add('</a:pPr>');
s1.Add('<a:r>');
s1.Add('<a:rPr lang="en-US"/>');
s1.Add('<a:t>'+ MyChartTitle +'</a:t>');
s1.Add('</a:r>');
s1.Add('</a:p>');
s1.Add('</c:rich>');
s1.Add('</c:tx>');
s1.Add('<c:overlay val="0"/>');
s1.Add('</c:title>');
s1.Add('<c:autoTitleDeleted val="0"/>');
s1.Add('<c:plotArea>');
s1.Add('<c:layout/>');
s1.Add('<c:scatterChart>');
s1.Add('<c:scatterStyle val="lineMarker"/>');
s1.Add('<c:varyColors val="0"/>');


// Starting Series data
datasetnum:=0;
mycounter:=0;
firstrow:= false;
for j:=1 to Form1.StringGrid1.RowCount-1 do
        begin
             if datasetnum <> StrtoInt(Form1.StringGrid1.Cells[1,j]) then
             begin
                datasetnum:= StrtoInt(Form1.StringGrid1.Cells[1,j]);
                mycounter:=0;
                firstrow:=true;
                s1.Add('<c:ser>');
                s1.Add('<c:idx val="'+inttostr(datasetnum)+'"/>');
                s1.Add('<c:order val="'+inttostr(datasetnum-1)+'"/>');
                s1.Add('<c:tx>');
                s1.Add('<c:v>'+Form1.StringGrid1.cells[2,j]+'</c:v>');
                s1.Add('</c:tx>');
                s1.Add('<c:spPr>');
                s1.Add('<a:ln w="12700">');
                s1.Add('<a:solidFill>');
                s1.Add('<a:srgbClr val="'+Colorlist[mycolorsint[datasetnum-1]]+'" />');
                s1.Add('</a:solidFill>');
                s1.Add('<a:prstDash val="solid" />');
                s1.Add('</a:ln>');
                s1.Add('</c:spPr>');
                s1.Add('<c:marker>');
                s1.Add('<c:symbol val="'+Markerlist[mysymbolsint[datasetnum-1]]+'" />');
                s1.Add('<c:size val="5" />');
                s1.Add('<c:spPr>');
                if mysymbolsopen[datasetnum-1]=1 then
                   s1.Add('<a:noFill/>')
                else
                   s1.Add('<a:solidFill><a:srgbClr val="'+Colorlist[mycolorsint[datasetnum-1]]+'"/></a:solidFill>');

                s1.Add('<a:ln>');
                s1.Add('<a:solidFill>');
                s1.Add('<a:srgbClr val="'+Colorlist[mycolorsint[datasetnum-1]]+'" />');
                s1.Add('</a:solidFill>');
                s1.Add('<a:prstDash val="solid" />');
                s1.Add('</a:ln>');
                s1.Add('<a:extLst>');
                s1.Add('<a:ext uri="{909E8E84-426E-40DD-AFC4-6F175D3DCCD1}">');
                s1.Add('<a14:hiddenFill xmlns:a14="http://schemas.microsoft.com/office/drawing/2010/main">');
                s1.Add('<a:solidFill>');
                s1.Add('<a:srgbClr val="'+Colorlist[mycolorsint[datasetnum-1]]+'" />');
                s1.Add('</a:solidFill>');
                s1.Add('</a14:hiddenFill>');
                s1.Add('</a:ext>');
                s1.Add('</a:extLst>');
                s1.Add('</c:spPr>');
                s1.Add('</c:marker>');
                s1.Add('<c:xVal>');
                s1.Add('<c:numRef>');
                s1.Add('<c:f>data!$'+letterlist[xcol]+'$'+inttostr(datasetstart[datasetnum]+1)+':$'+
                        letterlist[xcol]+'$'+inttostr(datasetend[datasetnum]+1)+'</c:f>');
                s1.Add('<c:numCache>');
                s1.Add('<c:formatCode>General</c:formatCode>');
                s1.Add('<c:ptCount val="'+inttostr(ptcount[datasetnum])+'" />');

                //<!-- add point X values here in this format:');
                for m:= datasetstart[datasetnum] to datasetend[datasetnum] do
                begin
                    s1.Add('<c:pt idx="'+inttostr(m)+'">');
                    s1.Add('<c:v>'+form1.StringGrid1.Cells[xcol,m]+'</c:v>');
                    s1.Add('</c:pt>');
                end;

                s1.Add('</c:numCache>');
                s1.Add('</c:numRef>');
                s1.Add('</c:xVal>');
                s1.Add('<c:yVal>');
                s1.Add('<c:numRef>');
                s1.Add('<c:f>data!$'+letterlist[ycol]+'$'+inttostr(datasetstart[datasetnum]+1)+':$'+
                        letterlist[ycol]+'$'+inttostr(datasetend[datasetnum]+1)+'</c:f>');
                s1.Add('<c:numCache>');
                s1.Add('<c:formatCode>General</c:formatCode>');
                s1.Add('<c:ptCount val="'+inttostr(ptcount[datasetnum])+'" />');

                // add point Y values here
                for m:= datasetstart[datasetnum] to datasetend[datasetnum] do
                begin
                    s1.Add('<c:pt idx="'+inttostr(m)+'">');
                    s1.Add('<c:v>'+form1.StringGrid1.Cells[ycol,m]+'</c:v>');
                    s1.Add('</c:pt>');
                end;

                s1.Add('</c:numCache>');
                s1.Add('</c:numRef>');
                s1.Add('</c:yVal>');
                s1.Add('<c:smooth val="0" />');
                s1.Add('<c:extLst>');
                s1.Add('<c:ext xmlns:c16="http://schemas.microsoft.com/office/drawing/2014/chart" uri="{C3380CC4-5D6E-409C-BE32-E72D297353CC}">');
                s1.Add('<c16:uniqueId val="{00000002-CA59-45B8-94F6-3E08F9877E75}" />');
                s1.Add('</c:ext>');
                s1.Add('</c:extLst>');
                s1.Add('</c:ser>');
                s1.Add('');
                s1.Add('<!-- End Series Data -->');
                mycounter:=mycounter+1;
             end;
        end;

s1.Add('<c:dLbls>');
s1.Add('<c:showLegendKey val="0" />');
s1.Add('<c:showVal val="0" />');
s1.Add('<c:showCatName val="0" />');
s1.Add('<c:showSerName val="0" />');
s1.Add('<c:showPercent val="0" />');
s1.Add('<c:showBubbleSize val="0" />');
s1.Add('</c:dLbls>');
s1.Add('<c:axId val="909134607" />');
s1.Add('<c:axId val="842372640" />');
s1.Add('</c:scatterChart>');
s1.Add('<c:valAx>');
s1.Add('<c:axId val="909134607" />');
s1.Add('<c:scaling>');
s1.Add('<c:orientation val="minMax" />');
s1.Add('</c:scaling>');
s1.Add('<c:delete val="0" />');
s1.Add('<c:axPos val="b" />');
s1.Add('<c:majorGridlines>');
s1.Add('<c:spPr>');
s1.Add('<a:ln>');
s1.Add('<a:solidFill>');
s1.Add('<a:srgbClr val="C8C8C8" />');
s1.Add('</a:solidFill>');
s1.Add('<a:prstDash val="solid" />');
s1.Add('</a:ln>');
s1.Add('</c:spPr>');
s1.Add('</c:majorGridlines>');
s1.Add('<c:title>');
s1.Add('<c:tx>');
s1.Add('<c:rich>');
s1.Add('<a:bodyPr />');
s1.Add('<a:lstStyle />');
s1.Add('<a:p>');
s1.Add('<a:pPr>');
s1.Add('<a:defRPr />');
s1.Add('</a:pPr>');
s1.Add('<a:r>');
s1.Add('<a:rPr lang="en-US" />');
s1.Add('<a:t>');
s1.Add(myXAxisTitle);
s1.Add('</a:t>');
s1.Add('</a:r>');
s1.Add('</a:p>');
s1.Add('</c:rich>');
s1.Add('</c:tx>');
s1.Add('<c:overlay val="0" />');
s1.Add('</c:title>');
s1.Add('<c:numFmt formatCode="General" sourceLinked="1" />');
s1.Add('<c:majorTickMark val="cross" />');
s1.Add('<c:minorTickMark val="in" />');
s1.Add('<c:tickLblPos val="nextTo" />');
s1.Add('<c:spPr>');
s1.Add('<a:ln>');
s1.Add('<a:solidFill>');
s1.Add('<a:srgbClr val="000000" />');
s1.Add('</a:solidFill>');
s1.Add('</a:ln>');
s1.Add('</c:spPr>');
s1.Add('<c:crossAx val="842372640" />');
s1.Add('<c:crossesAt val="-1.5" />');
s1.Add('<c:crossBetween val="midCat" />');
s1.Add('</c:valAx>');
s1.Add('<c:valAx>');
s1.Add('<c:axId val="842372640" />');
s1.Add('<c:scaling>');
s1.Add('<c:orientation val="minMax" />');
s1.Add('</c:scaling>');
s1.Add('<c:delete val="0" />');
s1.Add('<c:axPos val="l" />');
s1.Add('<c:majorGridlines>');
s1.Add('<c:spPr>');
s1.Add('<a:ln>');
s1.Add('<a:solidFill>');
s1.Add('<a:srgbClr val="C8C8C8" />');
s1.Add('</a:solidFill>');
s1.Add('<a:prstDash val="solid" />');
s1.Add('</a:ln>');
s1.Add('</c:spPr>');
s1.Add('</c:majorGridlines>');
s1.Add('<c:title>');
s1.Add('<c:tx>');
s1.Add('<c:rich>');
s1.Add('<a:bodyPr />');
s1.Add('<a:lstStyle />');
s1.Add('<a:p>');
s1.Add('<a:pPr>');
s1.Add('<a:defRPr />');
s1.Add('</a:pPr>');
s1.Add('<a:r>');
s1.Add('<a:rPr lang="en-US" />');
s1.Add('<a:t>');
s1.Add(myYAxisTitle);
s1.Add('</a:t>');
s1.Add('</a:r>');
s1.Add('</a:p>');
s1.Add('</c:rich>');
s1.Add('</c:tx>');
s1.Add('<c:overlay val="0" />');
s1.Add('</c:title>');
s1.Add('<c:numFmt formatCode="General" sourceLinked="1" />');
s1.Add('<c:majorTickMark val="cross" />');
s1.Add('<c:minorTickMark val="in" />');
s1.Add('<c:tickLblPos val="nextTo" />');
s1.Add('<c:spPr>');
s1.Add('<a:ln>');
s1.Add('<a:solidFill>');
s1.Add('<a:srgbClr val="000000" />');
s1.Add('</a:solidFill>');
s1.Add('</a:ln>');
s1.Add('</c:spPr>');
s1.Add('<c:crossAx val="909134607" />');
s1.Add('<c:crossesAt val="-4" />');
s1.Add('<c:crossBetween val="midCat" />');
s1.Add('</c:valAx>');
s1.Add('<c:spPr>');
s1.Add('<a:solidFill>');
s1.Add('<a:srgbClr val="FFFFFF" />');
s1.Add('</a:solidFill>');
s1.Add('<a:ln w="12700">');
s1.Add('<a:solidFill>');
s1.Add('<a:srgbClr val="000000" />');
s1.Add('</a:solidFill>');
s1.Add('<a:prstDash val="solid" />');
s1.Add('</a:ln>');
s1.Add('</c:spPr>');
s1.Add('</c:plotArea>');
s1.Add('<c:legend>');
s1.Add('<c:legendPos val="r" />');
//s1.Add('<c:legendEntry>');
//s1.Add('<c:idx val="0" />');
//s1.Add('<c:txPr>');
//s1.Add('<a:bodyPr />');
//s1.Add('<a:lstStyle />');
//s1.Add('<a:p>');
//s1.Add('<a:pPr>');
//s1.Add('<a:defRPr>');
//s1.Add('<a:solidFill>');
//s1.Add('<a:srgbClr val="0000FF" />');
//s1.Add('</a:solidFill>');
//s1.Add('</a:defRPr>');
//s1.Add('</a:pPr>');
//s1.Add('<a:endParaRPr lang="en-US" />');
//s1.Add('</a:p>');
//s1.Add('</c:txPr>');
//s1.Add('</c:legendEntry>');
//s1.Add('<!--Add more legend entries here as needed-->');
s1.Add('');
s1.Add('<c:overlay val="0" />');
s1.Add('</c:legend>');
s1.Add('<c:plotVisOnly val="1" />');
s1.Add('<c:dispBlanksAs val="gap" />');
s1.Add('<c:extLst>');
s1.Add('<c:ext xmlns:c16r3="http://schemas.microsoft.com/office/drawing/2017/03/chart" uri="{56B9EC1D-385E-4148-901F-78D8002777C0}">');
s1.Add('<c16r3:dataDisplayOptions16>');
s1.Add('<c16r3:dispNaAsBlank val="1" />');
s1.Add('</c16r3:dataDisplayOptions16>');
s1.Add('</c:ext>');
s1.Add('</c:extLst>');
s1.Add('<c:showDLblsOverMax val="0" />');
s1.Add('</c:chart>');
s1.Add('<c:spPr>');
s1.Add('<a:solidFill>');
s1.Add('<a:sysClr val="window" lastClr="FFFFFF" />');
s1.Add('</a:solidFill>');
s1.Add('<a:ln w="12700" cap="flat" cmpd="sng" algn="ctr">');
s1.Add('<a:noFill />');
s1.Add('<a:prstDash val="solid" />');
s1.Add('<a:round />');
s1.Add('</a:ln>');
s1.Add('<a:effectLst />');
s1.Add('<a:extLst>');
s1.Add('<a:ext uri="{91240B29-F687-4F45-9708-019B960494DF}">');
s1.Add('<a14:hiddenLine xmlns:a14="http://schemas.microsoft.com/office/drawing/2010/main" w="12700" cap="flat" cmpd="sng" algn="ctr">');
s1.Add('<a:solidFill>');
s1.Add('<a:sysClr val="windowText" lastClr="000000">');
s1.Add('<a:tint val="75000" />');
s1.Add('</a:sysClr>');
s1.Add('</a:solidFill>');
s1.Add('<a:prstDash val="solid" />');
s1.Add('<a:round />');
s1.Add('</a14:hiddenLine>');
s1.Add('</a:ext>');
s1.Add('</a:extLst>');
s1.Add('</c:spPr>');
s1.Add('<c:txPr>');
s1.Add('<a:bodyPr />');
s1.Add('<a:lstStyle />');
s1.Add('<a:p>');
s1.Add('<a:pPr>');
s1.Add('<a:defRPr sz="1600" />');
s1.Add('</a:pPr>');
s1.Add('<a:endParaRPr lang="en-US" />');
s1.Add('</a:p>');
s1.Add('</c:txPr>');
s1.Add('</c:chartSpace>');
s1.SaveToFile(filepath+'temp\xl\charts\'+'chart1.xml');













//create  chartsheets\sheet1.xml
s1.Clear;
s1.Add('<chartsheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:xr="http://schemas.microsoft.com/office/spreadsheetml/2014/revision" xmlns:xr3="http://schemas.microsoft.com/office/spreadsheetml/2016/revision3" mc:Ignorable="xr xr3" xr:uid="{90882DCA-F704-428C-B57A-30E114B6936A}">');
s1.Add('<sheetPr/>');
s1.Add('<sheetViews>');
s1.Add('<sheetView tabSelected="1" zoomScale="123" workbookViewId="0" zoomToFit="1"/>');
s1.Add('</sheetViews>');
s1.Add('<pageMargins left="0.7" right="0.7" top="0.75" bottom="0.75" header="0.3" footer="0.3"/>');
s1.Add('<drawing r:id="rId1"/>');
s1.Add('</chartsheet>');
s1.SaveToFile(filepath+'temp\xl\chartsheets\'+'sheet1.xml');




//create  \drawings\drawing1.xml
s1.Clear;
s1.Add('<xdr:wsDr xmlns:xdr="http://schemas.openxmlformats.org/drawingml/2006/spreadsheetDrawing" xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main">');
s1.Add('<xdr:absoluteAnchor>');
s1.Add('<xdr:pos x="0" y="0"/>');
s1.Add('<xdr:ext cx="8673171" cy="6295793"/>');
s1.Add('<xdr:graphicFrame macro="">');
s1.Add('<xdr:nvGraphicFramePr>');
s1.Add('<xdr:cNvPr id="2" name="Chart 1">');
s1.Add('<a:extLst>');
s1.Add('<a:ext uri="{FF2B5EF4-FFF2-40B4-BE49-F238E27FC236}">');
s1.Add('<a16:creationId xmlns:a16="http://schemas.microsoft.com/office/drawing/2014/main" id="{FC5F24E4-C15C-BF4D-F63F-299B5C228CEF}"/>');
s1.Add('</a:ext>');
s1.Add('</a:extLst>');
s1.Add('</xdr:cNvPr>');
s1.Add('<xdr:cNvGraphicFramePr>');
s1.Add('<a:graphicFrameLocks noGrp="1"/>');
s1.Add('</xdr:cNvGraphicFramePr>');
s1.Add('</xdr:nvGraphicFramePr>');
s1.Add('<xdr:xfrm>');
s1.Add('<a:off x="0" y="0"/>');
s1.Add('<a:ext cx="0" cy="0"/>');
s1.Add('</xdr:xfrm>');
s1.Add('<a:graphic>');
s1.Add('<a:graphicData uri="http://schemas.openxmlformats.org/drawingml/2006/chart">');
s1.Add('<c:chart xmlns:c="http://schemas.openxmlformats.org/drawingml/2006/chart" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" r:id="rId1"/>');
s1.Add('</a:graphicData>');
s1.Add('</a:graphic>');
s1.Add('</xdr:graphicFrame>');
s1.Add('<xdr:clientData/>');
s1.Add('</xdr:absoluteAnchor>');
s1.Add('</xdr:wsDr>');
s1.SaveToFile(filepath+'temp\xl\drawings\'+'drawing1.xml');













//create  \theme\theme1.xml
s1.Clear;
s1.Add('<a:theme xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" name="Office Theme">');
s1.Add('<a:themeElements>');
s1.Add('<a:clrScheme name="Office">');
s1.Add('<a:dk1>');
s1.Add('<a:sysClr val="windowText" lastClr="000000"/>');
s1.Add('</a:dk1>');
s1.Add('<a:lt1>');
s1.Add('<a:sysClr val="window" lastClr="FFFFFF"/>');
s1.Add('</a:lt1>');
s1.Add('<a:dk2>');
s1.Add('<a:srgbClr val="44546A"/>');
s1.Add('</a:dk2>');
s1.Add('<a:lt2>');
s1.Add('<a:srgbClr val="E7E6E6"/>');
s1.Add('</a:lt2>');
s1.Add('<a:accent1>');
s1.Add('<a:srgbClr val="4472C4"/>');
s1.Add('</a:accent1>');
s1.Add('<a:accent2>');
s1.Add('<a:srgbClr val="ED7D31"/>');
s1.Add('</a:accent2>');
s1.Add('<a:accent3>');
s1.Add('<a:srgbClr val="A5A5A5"/>');
s1.Add('</a:accent3>');
s1.Add('<a:accent4>');
s1.Add('<a:srgbClr val="FFC000"/>');
s1.Add('</a:accent4>');
s1.Add('<a:accent5>');
s1.Add('<a:srgbClr val="5B9BD5"/>');
s1.Add('</a:accent5>');
s1.Add('<a:accent6>');
s1.Add('<a:srgbClr val="70AD47"/>');
s1.Add('</a:accent6>');
s1.Add('<a:hlink>');
s1.Add('<a:srgbClr val="0563C1"/>');
s1.Add('</a:hlink>');
s1.Add('<a:folHlink>');
s1.Add('<a:srgbClr val="954F72"/>');
s1.Add('</a:folHlink>');
s1.Add('</a:clrScheme>');
s1.Add('<a:fontScheme name="Office">');
s1.Add('<a:majorFont>');
s1.Add('<a:latin typeface="Calibri Light" panose="020F0302020204030204"/>');
s1.Add('<a:ea typeface=""/>');
s1.Add('<a:cs typeface=""/>');
s1.Add('<a:font script="Arab" typeface="Times New Roman"/>');
s1.Add('<a:font script="Hebr" typeface="Times New Roman"/>');
s1.Add('<a:font script="Thai" typeface="Tahoma"/>');
s1.Add('<a:font script="Ethi" typeface="Nyala"/>');
s1.Add('<a:font script="Beng" typeface="Vrinda"/>');
s1.Add('<a:font script="Gujr" typeface="Shruti"/>');
s1.Add('<a:font script="Khmr" typeface="MoolBoran"/>');
s1.Add('<a:font script="Knda" typeface="Tunga"/>');
s1.Add('<a:font script="Guru" typeface="Raavi"/>');
s1.Add('<a:font script="Cans" typeface="Euphemia"/>');
s1.Add('<a:font script="Cher" typeface="Plantagenet Cherokee"/>');
s1.Add('<a:font script="Yiii" typeface="Microsoft Yi Baiti"/>');
s1.Add('<a:font script="Tibt" typeface="Microsoft Himalaya"/>');
s1.Add('<a:font script="Thaa" typeface="MV Boli"/>');
s1.Add('<a:font script="Deva" typeface="Mangal"/>');
s1.Add('<a:font script="Telu" typeface="Gautami"/>');
s1.Add('<a:font script="Taml" typeface="Latha"/>');
s1.Add('<a:font script="Syrc" typeface="Estrangelo Edessa"/>');
s1.Add('<a:font script="Orya" typeface="Kalinga"/>');
s1.Add('<a:font script="Mlym" typeface="Kartika"/>');
s1.Add('<a:font script="Laoo" typeface="DokChampa"/>');
s1.Add('<a:font script="Sinh" typeface="Iskoola Pota"/>');
s1.Add('<a:font script="Mong" typeface="Mongolian Baiti"/>');
s1.Add('<a:font script="Viet" typeface="Times New Roman"/>');
s1.Add('<a:font script="Uigh" typeface="Microsoft Uighur"/>');
s1.Add('<a:font script="Geor" typeface="Sylfaen"/>');
s1.Add('<a:font script="Armn" typeface="Arial"/>');
s1.Add('<a:font script="Bugi" typeface="Leelawadee UI"/>');
s1.Add('<a:font script="Bopo" typeface="Microsoft JhengHei"/>');
s1.Add('<a:font script="Java" typeface="Javanese Text"/>');
s1.Add('<a:font script="Lisu" typeface="Segoe UI"/>');
s1.Add('<a:font script="Mymr" typeface="Myanmar Text"/>');
s1.Add('<a:font script="Nkoo" typeface="Ebrima"/>');
s1.Add('<a:font script="Olck" typeface="Nirmala UI"/>');
s1.Add('<a:font script="Osma" typeface="Ebrima"/>');
s1.Add('<a:font script="Phag" typeface="Phagspa"/>');
s1.Add('<a:font script="Syrn" typeface="Estrangelo Edessa"/>');
s1.Add('<a:font script="Syrj" typeface="Estrangelo Edessa"/>');
s1.Add('<a:font script="Syre" typeface="Estrangelo Edessa"/>');
s1.Add('<a:font script="Sora" typeface="Nirmala UI"/>');
s1.Add('<a:font script="Tale" typeface="Microsoft Tai Le"/>');
s1.Add('<a:font script="Talu" typeface="Microsoft New Tai Lue"/>');
s1.Add('<a:font script="Tfng" typeface="Ebrima"/>');
s1.Add('</a:majorFont>');
s1.Add('<a:minorFont>');
s1.Add('<a:latin typeface="Calibri" panose="020F0502020204030204"/>');
s1.Add('<a:ea typeface=""/>');
s1.Add('<a:cs typeface=""/>');
s1.Add('<a:font script="Arab" typeface="Arial"/>');
s1.Add('<a:font script="Hebr" typeface="Arial"/>');
s1.Add('<a:font script="Thai" typeface="Tahoma"/>');
s1.Add('<a:font script="Ethi" typeface="Nyala"/>');
s1.Add('<a:font script="Beng" typeface="Vrinda"/>');
s1.Add('<a:font script="Gujr" typeface="Shruti"/>');
s1.Add('<a:font script="Khmr" typeface="DaunPenh"/>');
s1.Add('<a:font script="Knda" typeface="Tunga"/>');
s1.Add('<a:font script="Guru" typeface="Raavi"/>');
s1.Add('<a:font script="Cans" typeface="Euphemia"/>');
s1.Add('<a:font script="Cher" typeface="Plantagenet Cherokee"/>');
s1.Add('<a:font script="Yiii" typeface="Microsoft Yi Baiti"/>');
s1.Add('<a:font script="Tibt" typeface="Microsoft Himalaya"/>');
s1.Add('<a:font script="Thaa" typeface="MV Boli"/>');
s1.Add('<a:font script="Deva" typeface="Mangal"/>');
s1.Add('<a:font script="Telu" typeface="Gautami"/>');
s1.Add('<a:font script="Taml" typeface="Latha"/>');
s1.Add('<a:font script="Syrc" typeface="Estrangelo Edessa"/>');
s1.Add('<a:font script="Orya" typeface="Kalinga"/>');
s1.Add('<a:font script="Mlym" typeface="Kartika"/>');
s1.Add('<a:font script="Laoo" typeface="DokChampa"/>');
s1.Add('<a:font script="Sinh" typeface="Iskoola Pota"/>');
s1.Add('<a:font script="Mong" typeface="Mongolian Baiti"/>');
s1.Add('<a:font script="Viet" typeface="Arial"/>');
s1.Add('<a:font script="Uigh" typeface="Microsoft Uighur"/>');
s1.Add('<a:font script="Geor" typeface="Sylfaen"/>');
s1.Add('<a:font script="Armn" typeface="Arial"/>');
s1.Add('<a:font script="Bugi" typeface="Leelawadee UI"/>');
s1.Add('<a:font script="Bopo" typeface="Microsoft JhengHei"/>');
s1.Add('<a:font script="Java" typeface="Javanese Text"/>');
s1.Add('<a:font script="Lisu" typeface="Segoe UI"/>');
s1.Add('<a:font script="Mymr" typeface="Myanmar Text"/>');
s1.Add('<a:font script="Nkoo" typeface="Ebrima"/>');
s1.Add('<a:font script="Olck" typeface="Nirmala UI"/>');
s1.Add('<a:font script="Osma" typeface="Ebrima"/>');
s1.Add('<a:font script="Phag" typeface="Phagspa"/>');
s1.Add('<a:font script="Syrn" typeface="Estrangelo Edessa"/>');
s1.Add('<a:font script="Syrj" typeface="Estrangelo Edessa"/>');
s1.Add('<a:font script="Syre" typeface="Estrangelo Edessa"/>');
s1.Add('<a:font script="Sora" typeface="Nirmala UI"/>');
s1.Add('<a:font script="Tale" typeface="Microsoft Tai Le"/>');
s1.Add('<a:font script="Talu" typeface="Microsoft New Tai Lue"/>');
s1.Add('<a:font script="Tfng" typeface="Ebrima"/>');
s1.Add('</a:minorFont>');
s1.Add('</a:fontScheme>');
s1.Add('<a:fmtScheme name="Office">');
s1.Add('<a:fillStyleLst>');
s1.Add('<a:solidFill>');
s1.Add('<a:schemeClr val="phClr"/>');
s1.Add('</a:solidFill>');
s1.Add('<a:gradFill rotWithShape="1">');
s1.Add('<a:gsLst>');
s1.Add('<a:gs pos="0">');
s1.Add('<a:schemeClr val="phClr">');
s1.Add('<a:lumMod val="110000"/>');
s1.Add('<a:satMod val="105000"/>');
s1.Add('<a:tint val="67000"/>');
s1.Add('</a:schemeClr>');
s1.Add('</a:gs>');
s1.Add('<a:gs pos="50000">');
s1.Add('<a:schemeClr val="phClr">');
s1.Add('<a:lumMod val="105000"/>');
s1.Add('<a:satMod val="103000"/>');
s1.Add('<a:tint val="73000"/>');
s1.Add('</a:schemeClr>');
s1.Add('</a:gs>');
s1.Add('<a:gs pos="100000">');
s1.Add('<a:schemeClr val="phClr">');
s1.Add('<a:lumMod val="105000"/>');
s1.Add('<a:satMod val="109000"/>');
s1.Add('<a:tint val="81000"/>');
s1.Add('</a:schemeClr>');
s1.Add('</a:gs>');
s1.Add('</a:gsLst>');
s1.Add('<a:lin ang="5400000" scaled="0"/>');
s1.Add('</a:gradFill>');
s1.Add('<a:gradFill rotWithShape="1">');
s1.Add('<a:gsLst>');
s1.Add('<a:gs pos="0">');
s1.Add('<a:schemeClr val="phClr">');
s1.Add('<a:satMod val="103000"/>');
s1.Add('<a:lumMod val="102000"/>');
s1.Add('<a:tint val="94000"/>');
s1.Add('</a:schemeClr>');
s1.Add('</a:gs>');
s1.Add('<a:gs pos="50000">');
s1.Add('<a:schemeClr val="phClr">');
s1.Add('<a:satMod val="110000"/>');
s1.Add('<a:lumMod val="100000"/>');
s1.Add('<a:shade val="100000"/>');
s1.Add('</a:schemeClr>');
s1.Add('</a:gs>');
s1.Add('<a:gs pos="100000">');
s1.Add('<a:schemeClr val="phClr">');
s1.Add('<a:lumMod val="99000"/>');
s1.Add('<a:satMod val="120000"/>');
s1.Add('<a:shade val="78000"/>');
s1.Add('</a:schemeClr>');
s1.Add('</a:gs>');
s1.Add('</a:gsLst>');
s1.Add('<a:lin ang="5400000" scaled="0"/>');
s1.Add('</a:gradFill>');
s1.Add('</a:fillStyleLst>');
s1.Add('<a:lnStyleLst>');
s1.Add('<a:ln w="6350" cap="flat" cmpd="sng" algn="ctr">');
s1.Add('<a:solidFill>');
s1.Add('<a:schemeClr val="phClr"/>');
s1.Add('</a:solidFill>');
s1.Add('<a:prstDash val="solid"/>');
s1.Add('<a:miter lim="800000"/>');
s1.Add('</a:ln>');
s1.Add('<a:ln w="12700" cap="flat" cmpd="sng" algn="ctr">');
s1.Add('<a:solidFill>');
s1.Add('<a:schemeClr val="phClr"/>');
s1.Add('</a:solidFill>');
s1.Add('<a:prstDash val="solid"/>');
s1.Add('<a:miter lim="800000"/>');
s1.Add('</a:ln>');
s1.Add('<a:ln w="19050" cap="flat" cmpd="sng" algn="ctr">');
s1.Add('<a:solidFill>');
s1.Add('<a:schemeClr val="phClr"/>');
s1.Add('</a:solidFill>');
s1.Add('<a:prstDash val="solid"/>');
s1.Add('<a:miter lim="800000"/>');
s1.Add('</a:ln>');
s1.Add('</a:lnStyleLst>');
s1.Add('<a:effectStyleLst>');
s1.Add('<a:effectStyle>');
s1.Add('<a:effectLst/>');
s1.Add('</a:effectStyle>');
s1.Add('<a:effectStyle>');
s1.Add('<a:effectLst/>');
s1.Add('</a:effectStyle>');
s1.Add('<a:effectStyle>');
s1.Add('<a:effectLst>');
s1.Add('<a:outerShdw blurRad="57150" dist="19050" dir="5400000" algn="ctr" rotWithShape="0">');
s1.Add('<a:srgbClr val="000000">');
s1.Add('<a:alpha val="63000"/>');
s1.Add('</a:srgbClr>');
s1.Add('</a:outerShdw>');
s1.Add('</a:effectLst>');
s1.Add('</a:effectStyle>');
s1.Add('</a:effectStyleLst>');
s1.Add('<a:bgFillStyleLst>');
s1.Add('<a:solidFill>');
s1.Add('<a:schemeClr val="phClr"/>');
s1.Add('</a:solidFill>');
s1.Add('<a:solidFill>');
s1.Add('<a:schemeClr val="phClr">');
s1.Add('<a:tint val="95000"/>');
s1.Add('<a:satMod val="170000"/>');
s1.Add('</a:schemeClr>');
s1.Add('</a:solidFill>');
s1.Add('<a:gradFill rotWithShape="1">');
s1.Add('<a:gsLst>');
s1.Add('<a:gs pos="0">');
s1.Add('<a:schemeClr val="phClr">');
s1.Add('<a:tint val="93000"/>');
s1.Add('<a:satMod val="150000"/>');
s1.Add('<a:shade val="98000"/>');
s1.Add('<a:lumMod val="102000"/>');
s1.Add('</a:schemeClr>');
s1.Add('</a:gs>');
s1.Add('<a:gs pos="50000">');
s1.Add('<a:schemeClr val="phClr">');
s1.Add('<a:tint val="98000"/>');
s1.Add('<a:satMod val="130000"/>');
s1.Add('<a:shade val="90000"/>');
s1.Add('<a:lumMod val="103000"/>');
s1.Add('</a:schemeClr>');
s1.Add('</a:gs>');
s1.Add('<a:gs pos="100000">');
s1.Add('<a:schemeClr val="phClr">');
s1.Add('<a:shade val="63000"/>');
s1.Add('<a:satMod val="120000"/>');
s1.Add('</a:schemeClr>');
s1.Add('</a:gs>');
s1.Add('</a:gsLst>');
s1.Add('<a:lin ang="5400000" scaled="0"/>');
s1.Add('</a:gradFill>');
s1.Add('</a:bgFillStyleLst>');
s1.Add('</a:fmtScheme>');
s1.Add('</a:themeElements>');
s1.Add('<a:objectDefaults/>');
s1.Add('<a:extraClrSchemeLst/>');
s1.Add('<a:extLst>');
s1.Add('<a:ext uri="{05A4C25C-085E-4340-85A3-A5531E510DB2}">');
s1.Add('<thm15:themeFamily xmlns:thm15="http://schemas.microsoft.com/office/thememl/2012/main" name="Office Theme" id="{62F939B6-93AF-4DB8-9C6B-D6C7DFDC589F}" vid="{4A3C46E8-61CC-4603-A589-7422A47A8E4A}"/>');
s1.Add('</a:ext>');
s1.Add('</a:extLst>');
s1.Add('</a:theme>');
s1.SaveToFile(filepath+'temp\xl\theme\theme1.xml');




//create  docMetadata\LabelInfo.xml
s1.Add('<clbl:labelList xmlns:clbl="http://schemas.microsoft.com/office/2020/mipLabelMetadata"> ');
s1.Add('<clbl:label id="{ced06422-c515-4a4e-a1f2-e6a0c0200eae}"');
s1.Add('enabled="1"  ');
s1.Add('method="Standard"   ');
s1.Add('siteId="{e339bd4b-2e3b-4035-a452-2112d502f2ff}" ');
s1.Add('contentBits="0" ');
s1.Add('removed="0"/> ');
s1.Add('</clbl:labelList>  ');
s1.SaveToFile(filepath+'temp\docMetadata\'+'LabelInfo.xml');





 //create  chartsheets\_rels\sheet1.xml.rels
s1.Clear;
s1.Add('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>');
s1.Add('<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"> ');
s1.Add('<Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/drawing" Target="../drawings/drawing1.xml"/></Relationships> ');
s1.SaveToFile(filepath+'temp\xl\chartsheets\_rels\'+'sheet1.xml.rels');



 //create  \drawings\_rels\drawing1.xml.rels
s1.Clear;
s1.Add('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>');
s1.Add('<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">');
s1.Add('<Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/chart" Target="../charts/chart1.xml"/></Relationships>');
s1.SaveToFile(filepath+'temp\xl\drawings\_rels\drawing1.xml.rels');




//create  \_rels\workbook.xml.rels
s1.Clear;
s1.Add('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>');
s1.Add('<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"> ');
s1.Add('<Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/chartsheet" Target="chartsheets/sheet1.xml"/>');
s1.Add('<Relationship Id="rId2" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/worksheet" Target="worksheets/sheet1.xml"/>');
s1.Add('<Relationship Id="rId3" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/worksheet" Target="worksheets/sheet2.xml"/>');
s1.Add('<Relationship Id="rId4" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/theme" Target="theme/theme1.xml"/> ');
s1.Add('<Relationship Id="rId5" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles" Target="styles.xml"/> ');
s1.Add('<Relationship Id="rId6" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/sharedStrings" Target="sharedStrings.xml"/> ');
s1.Add('</Relationships>');
s1.SaveToFile(filepath+'temp\xl\_rels\workbook.xml.rels');



//create  \_rels\.rels
s1.Clear;
s1.Add('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>');
s1.Add('<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">');
s1.Add('<Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="xl/workbook.xml"/>');
s1.Add('<Relationship Id="rId2" Type="http://schemas.microsoft.com/office/2020/02/relationships/classificationlabels" Target="docMetadata/LabelInfo.xml"/>');
s1.Add('<Relationship Id="rId3" Type="http://schemas.openxmlformats.org/package/2006/relationships/metadata/core-properties" Target="docProps/core.xml"/>');
s1.Add('<Relationship Id="rId4" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/extended-properties" Target="docProps/app.xml"/>');
s1.Add('</Relationships>');
s1.SaveToFile(filepath+'temp\_rels\.rels');


//create  sharedStrings.xml
s1.Clear;
s1.Add('<sst xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" count="'+inttostr(sharedstrings.Count)+'" uniqueCount="'+inttostr(sharedstrings.Count)+'">');
for k1:= 0 to sharedstrings.Count-1 do
    s1.Add('<si><t>'+sharedstrings[k1]+'</t></si>');
s1.Add('</sst>');
s1.SaveToFile(filepath+'temp\xl\'+'sharedStrings.xml');





//Copy files to a zip folder
  MyDirectory:=filepath+'temp';
  MyZipper:= TabZipper.create(Application);
  MyZipper.Filename:= filepath+'myzipfile.zip';
  MyZipper.BaseDirectory:= MyDirectory;
  TheFileList:=TStringList.Create;

  FindAllFiles(TheFileList, MyDirectory, '*.*', true);

  for p:= 0 to TheFilelist.Count-1 do
  begin
      diskfilename:= TheFileList[p];
      archivefilename:= StringReplace(diskfilename, MyDirectory+'\', '', []);
      //ShowMessage(archivefilename);
      MyZipper.AddFiles(archivefilename, 0);

  end;
  //AZipper.Entries.AddFileEntries(TheFileList);
  MyZipper.DeleteFiles('Dev');
  MyZipper.Save;
  MyZipper.CloseArchive;
    //ShowMessage('Zip Completed Successfully.');
  SourceF:= TFileStream.Create(filepath+'myzipfile.zip', fmOpenRead);
  DestF:= TFileStream.Create(filepath+newfilename, fmCreate);
  DestF.CopyFrom(SourceF, SourceF.Size);

  TheFileList.Free;
  s1.Free;
  DestF.Free;
  SourceF.Free;
  sharedstrings.Free;
  MyZipper.Free;
  DeleteFile(filepath+'myzipfile.zip');

ShowMessage('Export Completed Successfully.');
if Form33.CheckBox4.Checked = true then
   OpenDocument(filepath+newfilename);


end;



end.

