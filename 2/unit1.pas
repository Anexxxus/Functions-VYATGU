unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type
  CompInfo=record
    index,top,left,width,height,fontsize:integer;
  end;
  complist=array of CompInfo;

  { TForm1 }

  TForm1 = class(TForm)
    ButtonClear: TButton;
    Calculate: TButton;
    X1: TEdit;
    Y1: TEdit;
    X2: TEdit;
    Y2: TEdit;
    S_value: TEdit;
    P_value: TEdit;
    Coord_A: TLabel;
    Coord_B: TLabel;
    Coord_X1: TLabel;
    Coord_Y1: TLabel;
    Coord_X2: TLabel;
    Coord_Y2: TLabel;
    S: TLabel;
    P: TLabel;
    procedure ButtonClearClick(Sender: TObject);
    procedure CalculateClick(Sender: TObject);
    procedure Coord_BClick(Sender: TObject);
    procedure Coord_X2Click(Sender: TObject);
    procedure Coord_Y1Click(Sender: TObject);
    procedure Coord_Y2Click(Sender: TObject);
    procedure PClick(Sender: TObject);
    procedure SClick(Sender: TObject);
    procedure X1Change(Sender: TObject);
    procedure EditKeyPress(Sender: TObject; var Key: char);
    procedure X2Change(Sender: TObject);
    procedure Y1Change(Sender: TObject);
    procedure Y2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
   DefWidth,defHeight:integer;
    clist:complist;
  public

  end;

var
  Form1: TForm1;

implementation
  uses math;
{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var i:integer;
begin
  defwidth:=width;
  defheight:=height;
  for i:= 0 to ComponentCount-1 do
    if (Components[i].Classname = 'TRadioButton')
    or (Components[i].Classname ='TCheckBox')
    or (Components[i].Classname ='TButton')
    or (Components[i].Classname ='TBitBtn')
    or (Components[i].Classname ='TSpeedButton')
    or (Components[i].Classname ='TEdit')
    or (Components[i].Classname ='TRadioGroup')
    or (Components[i].Classname ='TCheckGroup')
    or (Components[i].Classname ='TListBox')
    or (Components[i].Classname ='TComboBox')
    or (Components[i].Classname ='TEdit')
    or (Components[i].Classname ='TSpinEdit')
    or (Components[i].Classname ='TLabel') then begin
      setlength(clist,Length(clist)+1);
      clist[Length(clist)-1].top:=(Components[i] as tcontrol).top;
      clist[Length(clist)-1].left:=(Components[i]as tcontrol).left;
      clist[Length(clist)-1].width:=(Components[i] as tcontrol).width;
      clist[Length(clist)-1].height:=(Components[i]as tcontrol).height;
      clist[Length(clist)-1].fontsize:=(Components[i]as tcontrol).font.Size;
      clist[Length(clist)-1].index:=i;
    end;
end;

procedure TForm1.FormResize(Sender: TObject);
var i:integer;
begin
  if width >1000 then width:=800;
  if width<150   then width:=250;
  if height>800 then height:=800;
  if height<150 then height:=250;
  For i:=0 to length(clist)-1 do begin
    (components[clist[i].index] as tcontrol).Top:=round(clist[i].top*height/defheight);
    (components[clist[i].index] as tcontrol).height:=round(clist[i].height*height/defheight);
    (components[clist[i].index] as tcontrol).left:=round(clist[i].left*width/defwidth);
    (components[clist[i].index] as tcontrol).width:=round(clist[i].width*width/defwidth);
    (components[clist[i].index] as tcontrol).font.Size:=round(clist[i].fontsize*min(width/defwidth,height/defheight));
  end;
end;


procedure TForm1.X1Change(Sender: TObject);
begin
  X1.MaxLength:=5;
end;

procedure TForm1.CalculateClick(Sender: TObject);
var C_x1, C_y1, C_x2, C_y2, V_s, V_p: real;
begin
  if X1.Text = '' then abort;
  if X2.Text = '' then abort;
  if Y1.Text = '' then abort;
  if Y2.Text = '' then abort;
  C_x1:= strtoint(X1.text);
  C_x2:= strtoint(X2.text);
  C_y1:= strtoint(Y1.text);
  C_y2:= strtoint(Y2.text);
  V_s:= ((sqr(C_y2 - C_y1)) + (sqr(C_x2 - C_x1)))/2;
  V_p:= round(4*sqrt(V_s));
  S_value.text:= floattostr(V_s);
  P_value.text:= floattostr(V_p);
end;

procedure TForm1.ButtonClearClick(Sender: TObject);
begin
  X1.Clear;
  X2.Clear;
  Y1.Clear;
  Y2.Clear;
  S_value.Clear;
  P_value.Clear;
  X1.SetFocus;
end;

procedure TForm1.Coord_BClick(Sender: TObject);
begin

end;

procedure TForm1.Coord_X2Click(Sender: TObject);
begin

end;

procedure TForm1.Coord_Y1Click(Sender: TObject);
begin

end;

procedure TForm1.Coord_Y2Click(Sender: TObject);
begin

end;


procedure TForm1.PClick(Sender: TObject);
begin

end;

procedure TForm1.SClick(Sender: TObject);
begin

end;

procedure TForm1.EditKeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TForm1.X2Change(Sender: TObject);
begin
  X2.MaxLength:=5;
end;

procedure TForm1.Y1Change(Sender: TObject);
begin
  Y1.MaxLength:=5;
end;

procedure TForm1.Y2Change(Sender: TObject);
begin
  Y2.MaxLength:=5;
end;



end.

