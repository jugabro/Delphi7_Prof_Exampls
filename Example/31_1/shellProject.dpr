program shellProject;

uses
  Forms, Windows,
  shellUnit in 'shellUnit.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.ShowMainForm := False;
  ShowWindow(Application.Handle, SW_HIDE);

  Application.Title := 'This is TrayIcon Example';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
