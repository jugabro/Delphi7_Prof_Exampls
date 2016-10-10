program SimpleClient;

uses
  Forms,
  uMain in 'uMain.pas' {fmMain},
  uDataModule in 'uDataModule.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
