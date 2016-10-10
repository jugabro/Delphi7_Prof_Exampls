program DemoDLL2;

uses
  Forms,
  Unit2 in 'Unit2.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
