program ComputationPi;

uses
  Forms,
  uMain in 'uMain.pas' {fmMain},
  uPiThread in 'uPiThread.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
