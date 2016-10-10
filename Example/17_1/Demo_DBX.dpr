program Demo_DBX;

uses
  Forms,
  Unit1 in 'Unit1.pas' {fmDemoDBX};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmDemoDBX, fmDemoDBX);
  Application.Run;
end.
