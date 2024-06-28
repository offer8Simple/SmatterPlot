unit Unit25;
// Resize Chart Form

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm25 }

  TForm25 = class(TForm)
    CheckBox1: TCheckBox;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ToggleBox1: TToggleBox;
    procedure ComboBox1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ToggleBox1Change(Sender: TObject);
  private

  public

  end;

var
  Form25: TForm25;

implementation
uses
  Unit1;

{$R *.lfm}

{ TForm25 }

procedure TForm25.FormActivate(Sender: TObject);
begin
    // On activate Form
  Form25.ComboBox1.Clear;
  Form25.Edit1.Clear;
  Form25.Edit2.Clear;
  Form25.ComboBox1.Items.Add('Locked to Window');
  Form25.ComboBox1.Items.Add('Default (500x500)');
  Form25.ComboBox1.Items.Add('SDTV (480x640)');
  Form25.ComboBox1.Items.Add('HDTV (720x1280)');
  Form25.ComboBox1.Items.Add('Full HD (1080x1920)');
  Form25.ComboBox1.Items.Add('Ultrawide HD (1080x2560)');
  Form25.ComboBox1.Items.Add('4K (2160x3840)');
  Form25.ComboBox1.Items.Add('iPhone SE (568x320)');
  Form25.ComboBox1.Items.Add('iPhone 14 Pro Max (1398x645)');
  Form25.ComboBox1.Items.Add('iPad Pro 12.9" (2048x2732)');
  Form25.ComboBox1.Items.Add('iPad Air (1536x2048)');
  Form25.ComboBox1.Items.Add('Typical Laptop (900x1600)');
  Form25.ComboBox1.Items.Add('Old Desktop (768x1024)');

  if mySizeLocked = true then
  begin
    Form25.ComboBox1.Caption:= 'Locked to Window';
    myChartHeight:= Form1.PageControl1.Height - 60;
    myChartWidth:= Form1.PageControl1.Width - 60;
    Form1.Chart1.Height:= myChartHeight;
    Form1.Chart1.Width:= myChartWidth;
    Form25.Edit1.Caption:=InttoStr(myChartHeight);
    Form25.Edit2.Caption:=InttoStr(myChartWidth);
  end
  else
  begin
    Form1.Chart1.Height:= myChartHeight;
    Form1.Chart1.Width:= myChartWidth;
    Form25.Edit1.Caption:=InttoStr(myChartHeight);
    Form25.Edit2.Caption:=InttoStr(myChartWidth);
  end;



end;

procedure TForm25.ToggleBox1Change(Sender: TObject);
begin
  Form25.Hide;

  if Form25.CheckBox1.Checked = true then
  begin
    mySizeLocked := true;
    myChartHeight:= Form1.PageControl1.Height - 60;
    myChartWidth:= Form1.PageControl1.Width - 60;
    Form1.Chart1.Height:= myChartHeight;
    Form1.Chart1.Width:= myChartWidth;

  end
  else
  begin
    mySizeLocked := false;
    myChartHeight:= StrtoInt(Form25.Edit1.Caption);
    myChartWidth:= StrtoInt(Form25.Edit2.Caption);
    Form1.Chart1.Height:= myChartHeight;
    Form1.Chart1.Width:= myChartWidth;
  end;
  Form1.Button4.Click;

end;

procedure TForm25.ComboBox1Change(Sender: TObject);
begin
  // changed Chart Size Combobox
  Case Form25.Combobox1.Caption Of
  'Locked to Window':
        begin
          Form25.Edit1.Caption:=InttoStr(Form1.PageControl1.Height - 60);
          Form25.Edit2.Caption:=InttoStr(Form1.PageControl1.Width - 60);
        end;

  'Default (500x500)':
        begin
          Form25.Edit1.Caption:=InttoStr(500);
          Form25.Edit2.Caption:=InttoStr(500);
        end;


  'SDTV (480x640)':
        begin
          Form25.Edit1.Caption:=InttoStr(480);
          Form25.Edit2.Caption:=InttoStr(620);
        end;


  'HDTV (720x1280)':
        begin
        Form25.Edit1.Caption:=InttoStr(720);
        Form25.Edit2.Caption:=InttoStr(1280);
        end;
  'Full HD (1080x1920)':
        begin
        Form25.Edit1.Caption:=InttoStr(1080);
        Form25.Edit2.Caption:=InttoStr(1920);

        end;
  'Ultrawide HD (1080x2560)':
        begin
        Form25.Edit1.Caption:=InttoStr(1080);
        Form25.Edit2.Caption:=InttoStr(2560);

        end;
  '4K (2160x3840)':
        begin
        Form25.Edit1.Caption:=InttoStr(2160);
        Form25.Edit2.Caption:=InttoStr(3840);

        end;
  'iPhone SE (568x320)':
        begin
        Form25.Edit1.Caption:=InttoStr(568);
        Form25.Edit2.Caption:=InttoStr(320);

        end;
  'iPhone 14 Pro Max (1398x645)':
        begin
        Form25.Edit1.Caption:=InttoStr(1398);
        Form25.Edit2.Caption:=InttoStr(645);

        end;
  'iPad Pro 12.9" (2048x2732)':
        begin
        Form25.Edit1.Caption:=InttoStr(2048);
        Form25.Edit2.Caption:=InttoStr(2732);

        end;
  'iPad Air (1536x2048)':
        begin
        Form25.Edit1.Caption:=InttoStr(1536);
        Form25.Edit2.Caption:=InttoStr(2048);

        end;
  'Typical Laptop (900x1600)':
        begin
        Form25.Edit1.Caption:=InttoStr(900);
        Form25.Edit2.Caption:=InttoStr(1600);

        end;
  'Old Desktop (768x1024)':
        begin
        Form25.Edit1.Caption:=InttoStr(768);
        Form25.Edit2.Caption:=InttoStr(1024);

        end;
  end;


end;

end.

