unit Unit22;
// Symbol Sequence Form

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm22 }

  TForm22 = class(TForm)
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
  Form22: TForm22;

implementation
uses
  unit1, unit2;

{$R *.lfm}

{ TForm22 }

procedure TForm22.ComboBox1Change(Sender: TObject);
var
  i: integer;

begin
  for i:=0 to 9 do
  begin
    if Form22.ComboBox1.Caption = mysymbolstext[i] then
       mysymbolsint[0]:= i;
  end;
  Form1.RebuildChart();
end;

procedure TForm22.ComboBox10Change(Sender: TObject);
var
  i: integer;

begin
  for i:=0 to 9 do
  begin
    if Form22.ComboBox10.Caption = mysymbolstext[i] then
       mysymbolsint[9]:= i;
  end;
  Form1.RebuildChart();
end;

procedure TForm22.CheckBox1Change(Sender: TObject);
begin
  if Form22.CheckBox1.Checked = true then
     mysymbolsopen[0]:=1
  else
     mysymbolsopen[0]:=0;
  Form1.RebuildChart();

end;

procedure TForm22.CheckBox10Change(Sender: TObject);
begin
  if Form22.CheckBox10.Checked = true then
     mysymbolsopen[9]:=1
  else
     mysymbolsopen[9]:=0;
  Form1.RebuildChart();
end;

procedure TForm22.Button1Click(Sender: TObject);
begin
  // Reset
  mysymbolsint:=mysymbolsintdef;
  mysymbolsopen:=mysymbolsopendef;
  Form22.Combobox1.Caption:=mysymbolstext[mysymbolsint[0]];
  Form22.Combobox2.Caption:=mysymbolstext[mysymbolsint[1]];
  Form22.Combobox3.Caption:=mysymbolstext[mysymbolsint[2]];
  Form22.Combobox4.Caption:=mysymbolstext[mysymbolsint[3]];
  Form22.Combobox5.Caption:=mysymbolstext[mysymbolsint[4]];
  Form22.Combobox6.Caption:=mysymbolstext[mysymbolsint[5]];
  Form22.Combobox7.Caption:=mysymbolstext[mysymbolsint[6]];
  Form22.Combobox8.Caption:=mysymbolstext[mysymbolsint[7]];
  Form22.Combobox9.Caption:=mysymbolstext[mysymbolsint[8]];
  Form22.Combobox10.Caption:=mysymbolstext[mysymbolsint[9]];

  if mysymbolsopen[0] = 1 then
     Form22.CheckBox1.Checked:=true
  else
     Form22.CheckBox1.Checked:=false;
  if mysymbolsopen[1] = 1 then
     Form22.CheckBox2.Checked:=true
  else
     Form22.CheckBox1.Checked:=false;
  if mysymbolsopen[2] = 1 then
     Form22.CheckBox3.Checked:=true
  else
     Form22.CheckBox1.Checked:=false;
  if mysymbolsopen[3] = 1 then
     Form22.CheckBox4.Checked:=true
  else
     Form22.CheckBox1.Checked:=false;
  if mysymbolsopen[4] = 1 then
     Form22.CheckBox5.Checked:=true
  else
     Form22.CheckBox1.Checked:=false;
  if mysymbolsopen[5] = 1 then
     Form22.CheckBox6.Checked:=true
  else
     Form22.CheckBox1.Checked:=false;
  if mysymbolsopen[6] = 1 then
     Form22.CheckBox7.Checked:=true
  else
     Form22.CheckBox1.Checked:=false;
  if mysymbolsopen[7] = 1 then
     Form22.CheckBox8.Checked:=true
  else
     Form22.CheckBox1.Checked:=false;
  if mysymbolsopen[8] = 1 then
     Form22.CheckBox9.Checked:=true
  else
     Form22.CheckBox1.Checked:=false;
  if mysymbolsopen[9] = 1 then
     Form22.CheckBox10.Checked:=true
  else
     Form22.CheckBox1.Checked:=false;

  Form2.RadioButton7.Checked;
  Form1.RebuildChart();
end;

procedure TForm22.CheckBox2Change(Sender: TObject);
begin
  if Form22.CheckBox2.Checked = true then
     mysymbolsopen[1]:=1
  else
     mysymbolsopen[1]:=0;
  Form1.RebuildChart();
end;

procedure TForm22.CheckBox3Change(Sender: TObject);
begin
  if Form22.CheckBox3.Checked = true then
     mysymbolsopen[2]:=1
  else
     mysymbolsopen[2]:=0;
  Form1.RebuildChart();
end;

procedure TForm22.CheckBox4Change(Sender: TObject);
begin
  if Form22.CheckBox4.Checked = true then
     mysymbolsopen[3]:=1
  else
     mysymbolsopen[3]:=0;
  Form1.RebuildChart();
end;

procedure TForm22.CheckBox5Change(Sender: TObject);
begin
    if Form22.CheckBox5.Checked = true then
     mysymbolsopen[4]:=1
  else
     mysymbolsopen[4]:=0;
  Form1.RebuildChart();
end;

procedure TForm22.CheckBox6Change(Sender: TObject);
begin
    if Form22.CheckBox6.Checked = true then
     mysymbolsopen[5]:=1
  else
     mysymbolsopen[5]:=0;
  Form1.RebuildChart();
end;

procedure TForm22.CheckBox7Change(Sender: TObject);
begin
    if Form22.CheckBox7.Checked = true then
     mysymbolsopen[6]:=1
  else
     mysymbolsopen[6]:=0;
  Form1.RebuildChart();
end;

procedure TForm22.CheckBox8Change(Sender: TObject);
begin
    if Form22.CheckBox8.Checked = true then
     mysymbolsopen[7]:=1
  else
     mysymbolsopen[7]:=0;
  Form1.RebuildChart();
end;

procedure TForm22.CheckBox9Change(Sender: TObject);
begin
    if Form22.CheckBox9.Checked = true then
     mysymbolsopen[8]:=1
  else
     mysymbolsopen[8]:=0;
  Form1.RebuildChart();
end;

procedure TForm22.ComboBox2Change(Sender: TObject);
var
  i: integer;

begin
  for i:=0 to 9 do
  begin
    if Form22.ComboBox2.Caption = mysymbolstext[i] then
       mysymbolsint[1]:= i;
  end;
  Form1.RebuildChart();
end;

procedure TForm22.ComboBox3Change(Sender: TObject);
var
  i: integer;

begin
  for i:=0 to 9 do
  begin
    if Form22.ComboBox3.Caption = mysymbolstext[i] then
       mysymbolsint[2]:= i;
  end;
  Form1.RebuildChart();
end;

procedure TForm22.ComboBox4Change(Sender: TObject);
var
  i: integer;

begin
  for i:=0 to 9 do
  begin
    if Form22.ComboBox4.Caption = mysymbolstext[i] then
       mysymbolsint[3]:= i;
  end;
  Form1.RebuildChart();
end;

procedure TForm22.ComboBox5Change(Sender: TObject);
var
  i: integer;

begin
  for i:=0 to 9 do
  begin
    if Form22.ComboBox5.Caption = mysymbolstext[i] then
       mysymbolsint[4]:= i;
  end;
  Form1.RebuildChart();
end;

procedure TForm22.ComboBox6Change(Sender: TObject);
var
  i: integer;

begin
  for i:=0 to 9 do
  begin
    if Form22.ComboBox6.Caption = mysymbolstext[i] then
       mysymbolsint[5]:= i;
  end;
  Form1.RebuildChart();
end;

procedure TForm22.ComboBox7Change(Sender: TObject);
var
  i: integer;

begin
  for i:=0 to 9 do
  begin
    if Form22.ComboBox7.Caption = mysymbolstext[i] then
       mysymbolsint[6]:= i;
  end;
  Form1.RebuildChart();
end;

procedure TForm22.ComboBox8Change(Sender: TObject);
var
  i: integer;

begin
  for i:=0 to 9 do
  begin
    if Form22.ComboBox8.Caption = mysymbolstext[i] then
       mysymbolsint[7]:= i;
  end;
  Form1.RebuildChart();
end;

procedure TForm22.ComboBox9Change(Sender: TObject);
var
  i: integer;

begin
  for i:=0 to 9 do
  begin
    if Form22.ComboBox9.Caption = mysymbolstext[i] then
       mysymbolsint[8]:= i;
  end;
  Form1.RebuildChart();
end;

procedure TForm22.FormActivate(Sender: TObject);
var
  i: integer;

begin
  // on activate form

  Form22.Combobox1.Clear;
  Form22.Combobox2.Clear;
  Form22.Combobox3.Clear;
  Form22.Combobox4.Clear;
  Form22.Combobox5.Clear;
  Form22.Combobox6.Clear;
  Form22.Combobox7.Clear;
  Form22.Combobox8.Clear;
  Form22.Combobox9.Clear;
  Form22.Combobox10.Clear;


  for i:= 0 to 9 do
  begin
     Form22.ComboBox1.Items.Add(mysymbolstext[i]);
     Form22.ComboBox2.Items.Add(mysymbolstext[i]);
     Form22.ComboBox3.Items.Add(mysymbolstext[i]);
     Form22.ComboBox4.Items.Add(mysymbolstext[i]);
     Form22.ComboBox5.Items.Add(mysymbolstext[i]);
     Form22.ComboBox6.Items.Add(mysymbolstext[i]);
     Form22.ComboBox7.Items.Add(mysymbolstext[i]);
     Form22.ComboBox8.Items.Add(mysymbolstext[i]);
     Form22.ComboBox9.Items.Add(mysymbolstext[i]);
     Form22.ComboBox10.Items.Add(mysymbolstext[i]);

  end;

  Form22.Combobox1.Caption:=mysymbolstext[mysymbolsint[0]];
  Form22.Combobox2.Caption:=mysymbolstext[mysymbolsint[1]];
  Form22.Combobox3.Caption:=mysymbolstext[mysymbolsint[2]];
  Form22.Combobox4.Caption:=mysymbolstext[mysymbolsint[3]];
  Form22.Combobox5.Caption:=mysymbolstext[mysymbolsint[4]];
  Form22.Combobox6.Caption:=mysymbolstext[mysymbolsint[5]];
  Form22.Combobox7.Caption:=mysymbolstext[mysymbolsint[6]];
  Form22.Combobox8.Caption:=mysymbolstext[mysymbolsint[7]];
  Form22.Combobox9.Caption:=mysymbolstext[mysymbolsint[8]];
  Form22.Combobox10.Caption:=mysymbolstext[mysymbolsint[9]];

  if mysymbolsopen[0] = 1 then
     Form22.CheckBox1.Checked:=true
  else
     Form22.CheckBox1.Checked:=false;
  if mysymbolsopen[1] = 1 then
     Form22.CheckBox2.Checked:=true
  else
     Form22.CheckBox1.Checked:=false;
  if mysymbolsopen[2] = 1 then
     Form22.CheckBox3.Checked:=true
  else
     Form22.CheckBox1.Checked:=false;
  if mysymbolsopen[3] = 1 then
     Form22.CheckBox4.Checked:=true
  else
     Form22.CheckBox1.Checked:=false;
  if mysymbolsopen[4] = 1 then
     Form22.CheckBox5.Checked:=true
  else
     Form22.CheckBox1.Checked:=false;
  if mysymbolsopen[5] = 1 then
     Form22.CheckBox6.Checked:=true
  else
     Form22.CheckBox1.Checked:=false;
  if mysymbolsopen[6] = 1 then
     Form22.CheckBox7.Checked:=true
  else
     Form22.CheckBox1.Checked:=false;
  if mysymbolsopen[7] = 1 then
     Form22.CheckBox8.Checked:=true
  else
     Form22.CheckBox1.Checked:=false;
  if mysymbolsopen[8] = 1 then
     Form22.CheckBox9.Checked:=true
  else
     Form22.CheckBox1.Checked:=false;
  if mysymbolsopen[9] = 1 then
     Form22.CheckBox10.Checked:=true
  else
     Form22.CheckBox1.Checked:=false;
end;

end.

