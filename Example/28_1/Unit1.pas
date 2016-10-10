unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, comctrls, Buttons;

type
  TMainForm = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

  function IsValidInt(AText: String): Boolean; external 'DataCheck.dll';
  function IsValidDate(AText: String): Boolean; external 'DataCheck.dll';
  function ValidTime(AText: String): Boolean; external 'DataCheck.dll';
  procedure ShowDemoForm(AOwner: TComponent); external 'DataCheck.dll';

implementation

{$R *.DFM}

procedure TMainForm.Edit1Exit(Sender: TObject);
begin
 if not IsValidInt(Edit1.Text)
  then Edit1.Clear;
end;

procedure TMainForm.Edit2Exit(Sender: TObject);
begin
 if not IsValidDate(Edit2.Text)
  then Edit2.Clear;
end;

procedure TMainForm.Edit3Exit(Sender: TObject);
begin
 if not ValidTime(Edit3.Text)
  then Edit3.Clear;
end;

procedure TMainForm.BitBtn1Click(Sender: TObject);
begin
 ShowDemoForm(Application);
end;

end.
