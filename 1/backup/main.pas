unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ActnList,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Edit1.Clear; // Очиска
  Edit2.Clear;
  Edit3.Clear;
end;

procedure TForm1.Button1Click(Sender: TObject);
var x, y:integer;
    f:real;
begin
     x:=strtoint(edit1.text);
     y:=strtoint(edit3.text);
     f:=(x+1/x-1)*x+18*x*sqr(y);
     f:=f+1;
     edit2.text:=floattostr(f);
end;

end.

