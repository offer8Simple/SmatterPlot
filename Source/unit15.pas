unit Unit15;
// Project: SmatterPlot
// unit15 = rename datasets form
{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm15 }

  TForm15 = class(TForm)
    Label1: TLabel;
    ListBox1: TListBox;
    ToggleBox3: TToggleBox;
    procedure ToggleBox3Change(Sender: TObject);
  private

  public

  end;

var
  Form15: TForm15;

implementation
uses
  Unit16;


{$R *.lfm}

{ TForm15 }

procedure TForm15.ToggleBox3Change(Sender: TObject);
var
  i: integer;

begin
  for i:= 0 to Form15.ListBox1.Items.Count-1 do
  begin
    if Form15.ListBox1.Selected[i] = True then
    begin
       Form16.Edit1.Caption:= Form15.ListBox1.Items[i];
       Form16.Label2.Caption:= Form15.ListBox1.Items[i];
    end;
  end;
  Form16.Show;

end;

end.

