program SimpleAppSrvr;

uses
  Forms,
  SimpleAppSrvr_TLB in 'SimpleAppSrvr_TLB.pas',
  uSimpleRDM in 'uSimpleRDM.pas' {SimpleRDM: TRemoteDataModule},
  uSimpleAppSrvr in 'uSimpleAppSrvr.pas' {fmMain},
  uSecondary in 'uSecondary.pas' {Secondary: TRemoteDataModule};

{$R *.TLB}

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
