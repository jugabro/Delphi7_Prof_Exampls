unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  uPiThread;

type
  TfmMain = class(TForm)
    cbCalculate: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    laBuiltIn: TLabel;
    laValue: TLabel;
    laIterNum: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cbCalculateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   PiThread : TPiThread;
   procedure UpdatePi;
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

procedure TfmMain.UpdatePi;
begin
  if IsIconic( Application.Handle ) then Exit;
  LaValue.Caption := FloatToStrF( GlobalPi, ffFixed, 18, 18 );
  laIterNum.Caption := IntToStr( GlobalCounter ) + ' iterations';
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
 laBuiltIn.Caption := FloatToStrF( Pi, ffFixed, 18, 18 );
end;

procedure TfmMain.cbCalculateClick(Sender: TObject);
begin
  if cbCalculate.Checked then
  begin
   PiThread := TPiThread.Create( True );
   PiThread.FreeOnTerminate := True;
   PiThread.Priority := tpLower;
   PiThread.Resume;
  end
 else
  begin
   if Assigned( PiThread ) then PiThread.Terminate;
  end;

end;

end.
