program DemoADO;

uses
  Forms,
  uMain in 'uMain.pas' {fmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ADO Demo';
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
