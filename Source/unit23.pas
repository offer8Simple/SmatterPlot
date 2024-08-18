unit Unit23;
// Line Sequence Form

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm23 }

  TForm23 = class(TForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    ComboBox1: TComboBox;
    ComboBox10: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    ComboBox8: TComboBox;
    ComboBox9: TComboBox;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox10Change(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure CheckBox3Change(Sender: TObject);
    procedure CheckBox4Change(Sender: TObject);
    procedure CheckBox5Change(Sender: TObject);
    procedure CheckBox6Change(Sender: TObject);
    procedure CheckBox7Change(Sender: TObject);
    procedure CheckBox8Change(Sender: TObject);
    procedure CheckBox9Change(Sender: TObject);
    procedure ComboBox10Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure ComboBox7Change(Sender: TObject);
    procedure ComboBox8Change(Sender: TObject);
    procedure ComboBox9Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private

  public

  end;

var
  Form23: TForm23;

implementation
uses
  unit1, unit2;

{$R *.lfm}

{ TForm23 }

procedure TForm23.ComboBox1Change(Sender: TObject);
var
  i: integer;

begin
for i:=0 to 4 do
begin
  if Form23.ComboBox1.Caption = mylinestext[i] then
     mylinestylesint[0]:= i;
end;
Form1.RebuildChart();

end;

procedure TForm23.ComboBox10Change(Sender: TObject);
var
  i: integer;

begin
for i:=0 to 4 do
begin
  if Form23.ComboBox10.Caption = mylinestext[i] then
     mylinestylesint[9]:= i;
end;
Form1.RebuildChart();

end;

procedure TForm23.CheckBox1Change(Sender: TObject);
begin
    if Form23.CheckBox1.Checked = true then
     mylinesint[0]:=1
  else
     mylinesint[0]:=0;
  Form1.RebuildChart();
end;

procedure TForm23.CheckBox10Change(Sender: TObject);
begin
      if Form23.CheckBox10.Checked = true then
     mylinesint[9]:=1
  else
     mylinesint[9]:=0;
  Form1.RebuildChart();
end;

procedure TForm23.Button1Click(Sender: TObject);
begin
  mylinesint:=mylinesintdef;
  mylinestylesint:=mylinestylesintdef;
  Form23.Combobox1.Caption:=mylinestext[mylinestylesint[0]];
  Form23.Combobox2.Caption:=mylinestext[mylinestylesint[1]];
  Form23.Combobox3.Caption:=mylinestext[mylinestylesint[2]];
  Form23.Combobox4.Caption:=mylinestext[mylinestylesint[3]];
  Form23.Combobox5.Caption:=mylinestext[mylinestylesint[4]];
  Form23.Combobox6.Caption:=mylinestext[mylinestylesint[5]];
  Form23.Combobox7.Caption:=mylinestext[mylinestylesint[6]];
  Form23.Combobox8.Caption:=mylinestext[mylinestylesint[7]];
  Form23.Combobox9.Caption:=mylinestext[mylinestylesint[8]];
  Form23.Combobox10.Caption:=mylinestext[mylinestylesint[9]];


  if mylinesint[0] = 1 then
     Form23.CheckBox1.Checked:=true
  else
     Form23.CheckBox1.Checked:=false;
  if mylinesint[1] = 1 then
     Form23.CheckBox2.Checked:=true
  else
     Form23.CheckBox1.Checked:=false;
  if mylinesint[2] = 1 then
     Form23.CheckBox3.Checked:=true
  else
     Form23.CheckBox1.Checked:=false;
  if mylinesint[3] = 1 then
     Form23.CheckBox4.Checked:=true
  else
     Form23.CheckBox1.Checked:=false;
  if mylinesint[4] = 1 then
     Form23.CheckBox5.Checked:=true
  else
     Form23.CheckBox1.Checked:=false;
  if mylinesint[5] = 1 then
     Form23.CheckBox6.Checked:=true
  else
     Form23.CheckBox1.Checked:=false;
  if mylinesint[6] = 1 then
     Form23.CheckBox7.Checked:=true
  else
     Form23.CheckBox1.Checked:=false;
  if mylinesint[7] = 1 then
     Form23.CheckBox8.Checked:=true
  else
     Form23.CheckBox1.Checked:=false;
  if mylinesint[8] = 1 then
     Form23.CheckBox9.Checked:=true
  else
     Form23.CheckBox1.Checked:=false;
  if mylinesint[9] = 1 then
     Form23.CheckBox10.Checked:=true
  else
     Form23.CheckBox1.Checked:=false;

  Form2.RadioButton21.Checked;
  Form1.RebuildChart();
end;

procedure TForm23.CheckBox2Change(Sender: TObject);
begin
      if Form23.CheckBox2.Checked = true then
     mylinesint[1]:=1
  else
     mylinesint[1]:=0;
  Form1.RebuildChart();
end;

procedure TForm23.CheckBox3Change(Sender: TObject);
begin
      if Form23.CheckBox3.Checked = true then
     mylinesint[2]:=1
  else
     mylinesint[2]:=0;
  Form1.RebuildChart();
end;

procedure TForm23.CheckBox4Change(Sender: TObject);
begin
      if Form23.CheckBox4.Checked = true then
     mylinesint[3]:=1
  else
     mylinesint[3]:=0;
  Form1.RebuildChart();
end;

procedure TForm23.CheckBox5Change(Sender: TObject);
begin
      if Form23.CheckBox5.Checked = true then
     mylinesint[4]:=1
  else
     mylinesint[4]:=0;
  Form1.RebuildChart();
end;

procedure TForm23.CheckBox6Change(Sender: TObject);
begin
      if Form23.CheckBox6.Checked = true then
     mylinesint[5]:=1
  else
     mylinesint[5]:=0;
  Form1.RebuildChart();
end;

procedure TForm23.CheckBox7Change(Sender: TObject);
begin
      if Form23.CheckBox7.Checked = true then
     mylinesint[6]:=1
  else
     mylinesint[6]:=0;
  Form1.RebuildChart();
end;

procedure TForm23.CheckBox8Change(Sender: TObject);
begin
      if Form23.CheckBox8.Checked = true then
     mylinesint[7]:=1
  else
     mylinesint[7]:=0;
  Form1.RebuildChart();
end;

procedure TForm23.CheckBox9Change(Sender: TObject);
begin
      if Form23.CheckBox9.Checked = true then
     mylinesint[8]:=1
  else
     mylinesint[8]:=0;
  Form1.RebuildChart();
end;

procedure TForm23.ComboBox2Change(Sender: TObject);
var
  i: integer;

begin
for i:=0 to 4 do
begin
  if Form23.ComboBox2.Caption = mylinestext[i] then
     mylinestylesint[1]:= i;
end;
Form1.RebuildChart();

end;

procedure TForm23.ComboBox3Change(Sender: TObject);
var
  i: integer;

begin
for i:=0 to 4 do
begin
  if Form23.ComboBox3.Caption = mylinestext[i] then
     mylinestylesint[2]:= i;
end;
Form1.RebuildChart();

end;

procedure TForm23.ComboBox4Change(Sender: TObject);
var
  i: integer;

begin
for i:=0 to 4 do
begin
  if Form23.ComboBox4.Caption = mylinestext[i] then
     mylinestylesint[3]:= i;
end;
Form1.RebuildChart();

end;

procedure TForm23.ComboBox5Change(Sender: TObject);
var
  i: integer;

begin
for i:=0 to 4 do
begin
  if Form23.ComboBox5.Caption = mylinestext[i] then
     mylinestylesint[4]:= i;
end;
Form1.RebuildChart();

end;

procedure TForm23.ComboBox6Change(Sender: TObject);
var
  i: integer;

begin
for i:=0 to 4 do
begin
  if Form23.ComboBox6.Caption = mylinestext[i] then
     mylinestylesint[5]:= i;
end;
Form1.RebuildChart();

end;

procedure TForm23.ComboBox7Change(Sender: TObject);
var
  i: integer;

begin
for i:=0 to 4 do
begin
  if Form23.ComboBox7.Caption = mylinestext[i] then
     mylinestylesint[6]:= i;
end;
Form1.RebuildChart();

end;

procedure TForm23.ComboBox8Change(Sender: TObject);
var
  i: integer;

begin
for i:=0 to 4 do
begin
  if Form23.ComboBox8.Caption = mylinestext[i] then
     mylinestylesint[7]:= i;
end;
Form1.RebuildChart();

end;

procedure TForm23.ComboBox9Change(Sender: TObject);
var
  i: integer;

begin
for i:=0 to 4 do
begin
  if Form23.ComboBox9.Caption = mylinestext[i] then
     mylinestylesint[8]:= i;
end;
Form1.RebuildChart();

end;

procedure TForm23.FormActivate(Sender: TObject);
var
   i: integer;

begin
  // Click Line Sequence
  Form23.Combobox1.Clear;
  Form23.Combobox2.Clear;
  Form23.Combobox3.Clear;
  Form23.Combobox4.Clear;
  Form23.Combobox5.Clear;
  Form23.Combobox6.Clear;
  Form23.Combobox7.Clear;
  Form23.Combobox8.Clear;
  Form23.Combobox9.Clear;
  Form23.Combobox10.Clear;


  for i:= 0 to 4 do
  begin
     Form23.ComboBox1.Items.Add(mylinestext[i]);
     Form23.ComboBox2.Items.Add(mylinestext[i]);
     Form23.ComboBox3.Items.Add(mylinestext[i]);
     Form23.ComboBox4.Items.Add(mylinestext[i]);
     Form23.ComboBox5.Items.Add(mylinestext[i]);
     Form23.ComboBox6.Items.Add(mylinestext[i]);
     Form23.ComboBox7.Items.Add(mylinestext[i]);
     Form23.ComboBox8.Items.Add(mylinestext[i]);
     Form23.ComboBox9.Items.Add(mylinestext[i]);
     Form23.ComboBox10.Items.Add(mylinestext[i]);

  end;
  //ShowMessage('pause');
  Form23.Combobox1.Caption:=mylinestext[mylinestylesint[0]];
  Form23.Combobox2.Caption:=mylinestext[mylinestylesint[1]];
  Form23.Combobox3.Caption:=mylinestext[mylinestylesint[2]];
  Form23.Combobox4.Caption:=mylinestext[mylinestylesint[3]];
  Form23.Combobox5.Caption:=mylinestext[mylinestylesint[4]];
  Form23.Combobox6.Caption:=mylinestext[mylinestylesint[5]];
  Form23.Combobox7.Caption:=mylinestext[mylinestylesint[6]];
  Form23.Combobox8.Caption:=mylinestext[mylinestylesint[7]];
  Form23.Combobox9.Caption:=mylinestext[mylinestylesint[8]];
  Form23.Combobox10.Caption:=mylinestext[mylinestylesint[9]];


  if mylinesint[0] = 1 then
     Form23.CheckBox1.Checked:=true
  else
     Form23.CheckBox1.Checked:=false;
  if mylinesint[1] = 1 then
     Form23.CheckBox2.Checked:=true
  else
     Form23.CheckBox1.Checked:=false;
  if mylinesint[2] = 1 then
     Form23.CheckBox3.Checked:=true
  else
     Form23.CheckBox1.Checked:=false;
  if mylinesint[3] = 1 then
     Form23.CheckBox4.Checked:=true
  else
     Form23.CheckBox1.Checked:=false;
  if mylinesint[4] = 1 then
     Form23.CheckBox5.Checked:=true
  else
     Form23.CheckBox1.Checked:=false;
  if mylinesint[5] = 1 then
     Form23.CheckBox6.Checked:=true
  else
     Form23.CheckBox1.Checked:=false;
  if mylinesint[6] = 1 then
     Form23.CheckBox7.Checked:=true
  else
     Form23.CheckBox1.Checked:=false;
  if mylinesint[7] = 1 then
     Form23.CheckBox8.Checked:=true
  else
     Form23.CheckBox1.Checked:=false;
  if mylinesint[8] = 1 then
     Form23.CheckBox9.Checked:=true
  else
     Form23.CheckBox1.Checked:=false;
  if mylinesint[9] = 1 then
     Form23.CheckBox10.Checked:=true
  else
     Form23.CheckBox1.Checked:=false;


end;

end.

