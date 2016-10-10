unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type

  StandardProc = function(AText: String): Boolean;

  TMainForm = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
  private
    DLLHandle: THandle;
    LoadError: Word;
    IsValidInt: StandardProc;
    IsValidDate: StandardProc;
    ValidTime: StandardProc;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.FormShow(Sender: TObject);
begin
 DLLHandle := LoadLibrary('DataCheck');
 if DLLHandle = 0 then
 begin
  if GetLastError = ERROR_DLL_NOT_FOUND
   then ShowMessage('Ошибка загрузки DLL');
  Close;
 end;
 @IsValidInt := GetProcAddress(DLLHandle, 'IsValidInt');
 @IsValidDate := GetProcAddress(DLLHandle, 'IsValidDate');
 @ValidTime := GetProcAddress(DLLHandle, 'ValidTime');
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if DLLHandle <> 0
  then FreeLibrary(DLLHandle);
end;

procedure TMainForm.Edit1Exit(Sender: TObject);
begin
  if not IsValidInt(Edit1.Text)
  then Edit2.Clear;
end;

procedure TMainForm.Edit2Exit(Sender: TObject);
begin
 if not IsValidDate(Edit2.Text)
  then Edit1.Clear;
end;

procedure TMainForm.Edit3Exit(Sender: TObject);
begin
 if not ValidTime(Edit3.Text)
  then Edit3.Clear;
end;

end.
