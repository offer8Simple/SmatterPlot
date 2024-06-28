unit Unit21;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm21 }

  TForm21 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure Button3Click(Sender: TObject);
  private

  public

  end;

var
  Form21: TForm21;

implementation

{$R *.lfm}

{ TForm21 }

procedure TForm21.Button3Click(Sender: TObject);
begin
  // Update Chart with new tick mark locations


end;

end.

