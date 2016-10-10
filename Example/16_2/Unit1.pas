unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, BDE, ExtCtrls;

type
  TMainForm = class(TForm)
    PriorBtn: TBitBtn;
    Panel2: TPanel;
    NextBtn: TBitBtn;
    Label3: TLabel;
    CountryEdit: TEdit;
    Label1: TLabel;
    CapitalEdit: TEdit;
    procedure PriorBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NextBtnClick(Sender: TObject);
  private
    hDB: hDBIDB;
    hCur: hDBICur;
    CursProps: CurProps;
    RecBuf: pByte;
    FValue: array[0..255] of Char;
    IsEmpty: Bool;
    procedure OnBDEError;
  public
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.OnBDEError;
var ErrInfo: dbiErrInfo;         //���������, ���������� ���������� �� �������
    AStr: String;
begin
 DbiGetErrorInfo(True, ErrInfo); //������� ���������� ���������� �� ������
 case ErrInfo.iError of
   9733: AStr := '��� �������� ������ ������������ ���������� ';
  10024: AStr := '������ ������� � ������';
  10245: AStr := '���� ������ ������ ������ �������������';
  10038: AStr := '�������� ���� ������ �������';
  11871: AStr := '�������������� �����';
  11959: AStr := '� ��������� ����������� �������� GROUP BY';
 else
  AStr := '��������� �������� � �������';
 end;
 ShowMessage(AStr);
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
 hDB := Nil;
 hCur := Nil;
 DbiInit(Nil);                      // ������������� ������� BDE
 DbiOpenDatabase                    // �������� ���� ������
 (
  'DBDEMOS',                        // ��������� ���� ������
  Nil,                              // ��� ���� ������
  dbiReadWrite,                     // ����� �������������� ������
  dbiOpenShared,                    // ����� ���������� ������
  Nil,                              // ������
  0,                                // ����� �������������� ����������
  Nil,                              // �������� ����� ��� ���. ����������
  Nil,                              // ������ ���. ����������
  hDB                               // ���������� ���� ������
 );
 DbiSetPrivateDir('c:\temp');       // ����������� ���������� ��������
 DbiOpenTable                       // �������� �������
 (
  hDB,                              // ���������� ���� ������
  PChar('COUNTRY'),                 // �������� �������
  PChar(szParadox),                 // ��� ������� (������ ��� ��������� ��)
  Nil,                              // �������� ������� (��������������)
  Nil,                              // IndexTagName - ������ ��� dBASE
  0,                                // 0 - ������������ ��������� ������
  dbiReadWrite,                     // ����� �������������� ������
  dbiOpenShared,                    // ����� ���������� ������
  xltField,                         // ����� ���������� ������
  False,                            // ������� �������������� ����������� �������
  Nil,                              // �������������� ���������
  hCur                              // ���������� ������� �������
 );
 DbiGetCursorProps                  // ����������� ���������� �������
 (
  hCur,                             // ���������� ������� �������
  CursProps                         // ��������� ���������� �������
 );
 GetMem(RecBuf, CursProps.iRecbufSize*SizeOf(Byte));// ��������� ������ ��� ����� ������
 DbiSetToBegin(hCur);               // ��������� ������� � ������ ������ ������
 DbiGetNextRecord                   // ����������� �� ������ ������
 (
  hCur,                             // ���������� ������� �������
  dbiNoLock,                        // ����� ����������� �������
  RecBuf,                           // ����� ������
  Nil                               // ��������� ������
 );
 DbiGetField                        // ��������� �������� ����
 (
  hCur,                             // ���������� ������� �������
  1,                                // ����� ���� � ��������� �������
  RecBuf,                           // ����� ������
  @FValue,                          // ����������, � ������ ���������� ��������
  IsEmpty                           // ������� ������ ������
 );
 MainForm.CountryEdit.Text := FValue;
 DbiGetField(hCur, 2, RecBuf, @FValue, IsEmpty);
 MainForm.CapitalEdit.Text := FValue;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 try
 finally
  FreeMem(RecBuf);                  // ������������ ������ ������ ������
  DbiCloseCursor(hCur);             // �������� �������
  DbiCloseDatabase(hDB);            // �������� ���� ������
  DbiExit;                          // �������� ������ ������ � BDE
 end
end;

procedure TMainForm.PriorBtnClick(Sender: TObject);
begin
 try
  if DbiGetPriorRecord(hCur, dbiNoLock, RecBuf, Nil) = DBIERR_BOF
  then PriorBtn.Enabled := False
  else
  begin
   if Not NextBtn.Enabled then NextBtn.Enabled := True;
   DbiGetField(hCur, 1, RecBuf, @FValue, IsEmpty);
   MainForm.CountryEdit.Text := FValue;
   DbiGetField(hCur, 2, RecBuf, @FValue, IsEmpty);
   MainForm.CapitalEdit.Text := FValue;
  end;
 except
  OnBDEError;
 end;
end;

procedure TMainForm.NextBtnClick(Sender: TObject);
begin
 try
  if DbiGetNextRecord(hCur, dbiNoLock, RecBuf, Nil)=DBIERR_EOF
  then NextBtn.Enabled := False
  else
  begin
   if Not PriorBtn.Enabled then PriorBtn.Enabled := True;
   DbiGetField(hCur, 1, RecBuf, @FValue, IsEmpty);
   MainForm.CountryEdit.Text := FValue;
   DbiGetField(hCur, 2, RecBuf, @FValue, IsEmpty);
   MainForm.CapitalEdit.Text := FValue;
  end;
 except
  OnBDEError;
 end;
end;

end.
