library DataCheck;

uses
  Windows,
  SysUtils,
  Classes,
  Messages,
  Forms,
  Dialogs,
  StdCtrls,
  ComCtrls,
  FormUnit in 'FormUnit.pas' {DemoForm};

  procedure ShowDemoForm(AOwner: TComponent);
  begin
   DemoForm := TDemoForm.Create(AOwner);
   DemoForm.ShowModal;
   DemoForm.Free;
  end;

  function IsValidDate(AText: String): Boolean;
  begin
   try
    Result := True;
    if AText <> ''
     then StrToDate(AText);
   except
    on E: EConvertError do Result := False;
   end;
  end;

  function IsValidTime(AText: String): Boolean;
  begin
   try
    Result := True;
    if AText <> ''
     then StrToTime(AText);
   except
    on E: EConvertError do Result := False;
   end;
  end;

  function IsValidInt(AText: String): Boolean;
  begin
   try
    Result := True;
    if AText <> ''
     then StrToInt(AText);
   except
    on E: EConvertError do Result := False;
   end;
  end;


exports
  IsValidInt,
  IsValidDate index 1,
  IsValidTime index 2 name 'ValidTime',
  ShowDemoForm index 3;

type TSomeObject = class(TObject)
                       Field1: String;
                     end;
var FirstObj: TSomeObject;

  procedure DLLEntryPoint(Reason: Word);
  begin
   case Reason of
    DLL_PROCESS_ATTACH: begin
                         FirstObj := TSomeObject.Create;
                         FirstObj.Field1 := 'Объект создан';
                         ShowMessage(FirstObj.Field1);
                        end;
    DLL_PROCESS_DETACH: FirstObj.Free;
     DLL_THREAD_ATTACH: ShowMessage('Создан новый поток');
     DLL_THREAD_DETACH: ;
   end;
  end;

begin
 DLLProc := @DLLEntryPoint;
 DLLEntryPoint(DLL_PROCESS_ATTACH);
end.
