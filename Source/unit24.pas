unit Unit24;
// Change Units Form

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

var
  unitlist: Array of String;
  unittype: Array of String;
  myoffset: Array of Double;
  myfactor: Array of Double;

type

  { TForm24 }

  TForm24 = class(TForm)
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ToggleBox1: TToggleBox;
    procedure ComboBox1Change(Sender: TObject);
    procedure ToggleBox1Change(Sender: TObject);
  private

  public

  end;

var
  Form24: TForm24;

implementation
uses
  Unit1;

{$R *.lfm}

{ TForm24 }

procedure TForm24.ComboBox1Change(Sender: TObject);
var
  thename: String;
  i: integer;
  j: integer;
  ob: integer;
  cb: integer;
  theunit: String;
  thetype: String;


begin
  // Change Column selection
      unitlist:= ['s', 'sec', 'seconds', 'min', 'minutes', 'hr', 'hours', 'd', 'day', 'days',
                 'y', 'years', 'ms', 'microsecond',
                 'C', '°C', 'F', '°F', 'K', 'R', '°R',
                 'm', 'mm', 'microns', 'nm', 'Angstroms', 'cm', 'dm', 'km',
                 'in', 'inch', 'inches', 'ft', 'foot', 'feet',
                 'yd', 'yards', 'mi', 'miles', 'AU', 'lightyears',
                 'ft^2', 'in^2', 'm^2', 'mile^2', 'km^2', 'acre', 'hectare',
                 'Joule', 'J', 'cal', 'kcal', 'kWh', 'eV', 'BTU', 'ft-lb', 'kJ', 'MJ',
                 'm/s', 'MPH', 'mph', 'kph', 'km/h','km/s','ft/s', 'Knot', 'mm/s', 'mm/min',
                 'kg', 'KG', 'g', 'mg', 'Metric Ton', 'lb', 'oz',
                 'atm', 'Pa', 'bar', 'PSI', 'torr', 'MPa', 'GPa', 'mmHg',
                 'L', 'mL', 'ml', 'm^3', 'ft^3', 'in^3', 'US Gallon', 'gal', 'Imp Gallon',
                 'quart', 'pint', 'cup', 'fl oz', 'tablespoon', 'teaspoon',
                 'N', 'lbf', 'kgf', 'gmf', 'kN',
                 'N-m', 'ft-lb', 'oz-in',
                 'Pa-s', 'cp', 'centipoise', 'Poise', 'lb-s/ft^2',
                 'Hz', 'rad/s',
                 'm^3/s','L/s', 'ml/s', 'm^3/min', 'L/min', 'ml/min', 'gal/min', 'gpm',
                 'V', 'mV', 'kV',
                 'Amp', 'Amperes', 'mA', 'mAmp',
                 'W', 'mW', 'kW', 'hp'
                 ];
      unittype:= ['time', 'time', 'time', 'time','time','time','time','time','time','time',
                 'time','time', 'time', 'time',
                 'Temperature', 'Temperature','Temperature','Temperature','Temperature','Temperature','Temperature',
                 'length', 'length', 'length','length','length','length','length', 'length',
                 'length','length','length','length','length','length',
                 'length','length','length','length', 'length','length',
                 'area','area','area','area','area','area','area',
                 'energy','energy','energy','energy','energy','energy','energy','energy','energy','energy',
                 'speed','speed','speed','speed','speed','speed','speed','speed','speed','speed',
                 'mass','mass','mass','mass','mass','mass','mass',
                 'pressure','pressure','pressure','pressure','pressure','pressure','pressure','pressure',
                 'volume','volume','volume','volume','volume','volume','volume','volume','volume',
                 'volume','volume','volume','volume','volume','volume',
                 'force', 'force', 'force', 'force','force',
                 'torque', 'torque', 'torque',
                 'viscosity', 'viscosity', 'viscosity', 'viscosity','viscosity',
                 'frequency', 'frequency',
                 'flow rate','flow rate','flow rate','flow rate','flow rate','flow rate','flow rate','flow rate',
                 'voltage', 'voltage', 'voltage',
                 'current', 'current', 'current', 'current',
                 'power','power','power','power'
                 ];

      myfactor:= [1, 1, 1, 1/60, 1/60, 1/3600, 1/3600, 1/3600/24, 1/3600/24, 1/3600/24,
                 1/3600/24/365.2465, 1/3600/24/365.2465, 1000, 1000000,
                 1, 1, 9/5, 9/5, 1, 9/5, 9/5,
                 1, 1000, 1000000, 1000000000, 10000000000, 100, 10, 1/1000,
                 100/2.54, 100/2.54, 100/2.54, 100/2.54/12, 100/2.54/12, 100/2.54/12,
                 100/2.54/12/3, 100/2.54/12/3, 1/1000/1.60934, 1/1000/1.60934, 6.68459E-12, 1.057E-16,
                 10.7639, 1550, 1, 3.861E-7, 1E-6, 0.000247105, 1E-4,
                 1, 1, 0.239006, 0.000239006, 2.7778E-7, 6.242E18, 0.000947817, 0.737562, 0.001, 1E-6,
                 1, 2.23694,2.23694, 3.6, 3.6, 0.001, 3.28084, 1.94384, 1000, 1000*60,
                 1, 1, 1000, 1E6, 0.001, 2.20462, 35.274,
                 1, 101325, 1.01325, 14.6959, 760, 0.101325, 1.10325E-4, 760,
                 1, 1000, 1000, 0.001, 0.0353147, 61.0237, 0.264172, 0.264172, 0.219969,
                 1.05669, 2.11338, 4.16667, 33.814, 67.628, 202.884,
                 1, 0.224809, 0.101972, 101.972, 0.001,
                 1, 0.737562, 141.612,
                 1, 1000, 1000, 10, 0.02088543,
                 1, 6.2831853,
                 1, 1000, 1E6, 0.016666667, 16.666667, 16666.667, 15850.32314, 15850.32314,
                 1, 1000, 0.001,
                 1, 1000, 0.001, 0.001,
                 1, 1000, 0.001, 0.00134102

                 ];

      myoffset:= [0,0,0,0,0,0,0,0,0,0,
                 0,0,0,0,
                 0,0,32, 32, 273.15, 491.67, 491.67,
                 0,0,0,0,0,0,0,0,
                 0,0,0,0,0,0,
                 0,0,0,0,0,0,
                 0,0,0,0,0,0,0,
                 0,0,0,0,0,0,0,0,0,0,
                 0,0,0,0,0,0,0,0,0,0,
                 0,0,0,0,0,0,0,
                 0,0,0,0,0,0,0,0,
                 0,0,0,0,0,0,0,0,0,
                 0,0,0,0,0,0,
                 0,0,0,0,0,
                 0,0,0,
                 0,0,0,0,0,
                 0,0,
                 0,0,0,0,0,0,0,0];
  thename:= ComboBox1.Caption;
  if pos('[',thename) > 0 then
  begin
    ob := pos('[',thename);
    cb := pos(']',thename);
    theunit := Copy(thename,ob+1, cb-ob-1);
    ComboBox2.Clear;
    ComboBox2.Items.Add(theunit);
    ComboBox2.Caption:= theunit;
    // get unit type
    for i:= 0 to Length(unitlist)-1 do
    begin
        if unitlist[i] = theunit then
        begin
           thetype:= unittype[i];
           Form24.Label4.Caption := 'Unit Type: ' + thetype;
           Form24.Combobox3.Clear;
           for j:= 0 to Length(unittype) -1 do
           begin
               if unittype[j] = thetype then
                  Form24.ComboBox3.Items.Add(unitlist[j]);
           end;
        end;
    end;


  end
  else
  begin
    ComboBox2.Clear;
    ComboBox3.Clear;
    for j:= 0 to Length(unitlist) -1 do
    begin
         Form24.ComboBox2.Items.Add(unitlist[j]);
         Form24.ComboBox3.Items.Add(unitlist[j]);
    end;
  end;

end;

procedure TForm24.ToggleBox1Change(Sender: TObject);
var
  thename: String;
  newname: String;
  i: integer;
  j: integer;
  ob: integer;
  cb: integer;
  theunitnum: integer;
  newunitnum: integer;
  theunit: String;
  thetype: String;
  newunit: String;
  thefactor: double;
  oldoffset: double;
  newoffset: double;
  k: longint;
  thecol: integer;
  theval: double;
  fixy: boolean;
  fixx: boolean;


begin
  // Click to Update Units
  theunitnum:= 0;
  newunitnum:= 0;

  //unitlist:= ['s', 'sec', 'seconds', 'min', 'minutes', 'hr', 'hours', 'd', 'day', 'days',
  //           'y', 'years', 'ms', 'microsecond',
  //           'C', '°C', 'F', '°F', 'K', 'R', '°R',
  //           'm', 'mm', 'microns', 'nm', 'Angstroms', 'cm', 'dm', 'km',
  //           'in', 'inch', 'inches', 'ft', 'foot', 'feet',
  //           'yd', 'yards', 'mi', 'miles'];
  //unittype:= ['time', 'time', 'time', 'time','time','time','time','time','time','time',
  //           'time','time', 'time', 'time',
  //           'Temperature', 'Temperature','Temperature','Temperature','Temperature','Temperature','Temperature',
  //           'length', 'length', 'length','length','length','length','length', 'length',
  //           'length','length','length','length','length','length',
  //           'length','length','length','length'];



      theunit:= Form24.ComboBox2.Caption;
      newunit:= Form24.ComboBox3.Caption;
      for i:= 0 to Length(unitlist) -1 do
      begin
          if theunit = unitlist[i] then
             theunitnum:= i;
          if newunit = unitlist[i] then
             newunitnum:= i;
      end;

      thefactor:= myfactor[newunitnum]/myfactor[theunitnum];
      newoffset:= myoffset[newunitnum];
      oldoffset:= myoffset[theunitnum];
      thename:= Form24.ComboBox1.Caption;
      for i:= 3 to Form1.StringGrid1.ColCount -1 do
      begin
           if Form1.StringGrid1.Cells[i,0] = thename then
              thecol:= i;
      end;
      for k:= 1 to Form1.StringGrid1.RowCount -1 do
      begin
          theval:= StrtoFloat(Form1.StringGrid1.Cells[thecol,k]);
          theval:= (theval-oldoffset)*thefactor+newoffset;
          Form1.StringGrid1.Cells[thecol,k] := FloattoStr(theval);
      end;

      //fix units in column headers and axes titles
      fixx:= False;
      fixy:= False;
      if Form1.Chart1.LeftAxis.Title.Caption = thename then
         fixy:= true;
      if Form1.Chart1.BottomAxis.Title.Caption = thename then
         fixx:= true;
      if pos('[',thename) > 0 then
      begin
        ob := pos('[',thename);
        cb := pos(']',thename);

        newname:= Copy(thename,1, ob) + newunit + ']';
        Form1.StringGrid1.Cells[thecol,0] := newname;

      end
      else
      begin
        newname:= thename + ' [' + newunit + ']';
        Form1.StringGrid1.Cells[thecol,0] := newname;
      end;
      if fixx = True then
      begin
         Form1.Chart1.BottomAxis.Title.Caption := newname;
         myXAxisTitle:= newname;
      end;

      if fixy = True then
      begin
         Form1.Chart1.LeftAxis.Title.Caption := newname;
         myYAxisTitle:= newname;
      end;

      Form1.RebuildChart();
      Form24.Hide;
end;

end.

