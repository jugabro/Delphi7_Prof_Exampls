program DemoBrowser;

uses
  Forms,
  main in 'main.pas' {RegForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TRegForm, RegForm);
  Application.Run;
end.
