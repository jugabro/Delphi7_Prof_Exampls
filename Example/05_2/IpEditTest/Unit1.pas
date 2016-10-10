unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uIPEdit, IpAdress, StdCtrls, ComCtrls, Grids;

type
  TForm1 = class(TForm)
    IPEdit1: TIPEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    //IPAdress981: TIPAdress98;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
 IPEdit1.IPString := Format('%s.%s.%s.%s', [Edit1.Text,Edit2.Text,Edit3.Text,Edit4.Text]);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 ShowMessage( IPEdit1.IPString );
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 IPEdit1.IPString := '0.0.0.0';
end;

end.
