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
var ErrInfo: dbiErrInfo;         //Структура, содержащая информацию об ошибках
    AStr: String;
begin
 DbiGetErrorInfo(True, ErrInfo); //Функция возвращает информацию об ошибке
 case ErrInfo.iError of
   9733: AStr := 'Для создания записи недостаточно параметров ';
  10024: AStr := 'Ошибка доступа к данным';
  10245: AStr := 'База данных занята другим пользователем';
  10038: AStr := 'Значение поля задано неверно';
  11871: AStr := 'Несоответствие типов';
  11959: AStr := 'В выражении отсутствует оператор GROUP BY';
 else
  AStr := 'Ошибочная операция с данными';
 end;
 ShowMessage(AStr);
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
 hDB := Nil;
 hCur := Nil;
 DbiInit(Nil);                      // Инициализация системы BDE
 DbiOpenDatabase                    // Открытие базы данных
 (
  'DBDEMOS',                        // Псевдоним базы данных
  Nil,                              // Тип базы данных
  dbiReadWrite,                     // Режим редактирования данных
  dbiOpenShared,                    // Режим разделения данных
  Nil,                              // Пароль
  0,                                // Число дополнительных параметров
  Nil,                              // Перечень полей для доп. параметров
  Nil,                              // Список доп. параметров
  hDB                               // Дескриптор базы данных
 );
 DbiSetPrivateDir('c:\temp');       // Определение временного каталога
 DbiOpenTable                       // Открытие таблицы
 (
  hDB,                              // Дескриптор базы данных
  PChar('COUNTRY'),                 // Название таблицы
  PChar(szParadox),                 // Тип таблицы (только для локальных БД)
  Nil,                              // Название индекса (необязательный)
  Nil,                              // IndexTagName - только для dBASE
  0,                                // 0 - использовать первичный индекс
  dbiReadWrite,                     // Режим редактирования данных
  dbiOpenShared,                    // Режим разделения данных
  xltField,                         // Режим трансляции данных
  False,                            // Признак одностороннего перемещения курсора
  Nil,                              // Дополнительные параметры
  hCur                              // Дескриптор курсора таблицы
 );
 DbiGetCursorProps                  // Определение параметров курсора
 (
  hCur,                             // Дескриптор курсора таблицы
  CursProps                         // Структура параметров курсора
 );
 GetMem(RecBuf, CursProps.iRecbufSize*SizeOf(Byte));// Выделение памяти под буфер записи
 DbiSetToBegin(hCur);               // Установка курсора в начало набора данных
 DbiGetNextRecord                   // Перемещение на первую запись
 (
  hCur,                             // Дескриптор курсора таблицы
  dbiNoLock,                        // Режим ограничения доступа
  RecBuf,                           // Буфер записи
  Nil                               // Параметры записи
 );
 DbiGetField                        // Получение значения поля
 (
  hCur,                             // Дескриптор курсора таблицы
  1,                                // Номер поля в структуре таблицы
  RecBuf,                           // Буфер записи
  @FValue,                          // Переменная, в кторую передается значение
  IsEmpty                           // Признак пустой ячейки
 );
 MainForm.CountryEdit.Text := FValue;
 DbiGetField(hCur, 2, RecBuf, @FValue, IsEmpty);
 MainForm.CapitalEdit.Text := FValue;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 try
 finally
  FreeMem(RecBuf);                  // Освобождение памяти буфера записи
  DbiCloseCursor(hCur);             // Закрытие курсора
  DbiCloseDatabase(hDB);            // Закрытие базы данных
  DbiExit;                          // Закрытие сеанса работы с BDE
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
