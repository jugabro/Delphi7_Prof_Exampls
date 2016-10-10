unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, BDE, ExtCtrls, DBCtrls, Grids, DBGrids, Db, DBTables, Buttons;

type
  TMainForm = class(TForm)
    AliasesList: TComboBox;
    TablesList: TComboBox;
    EmptyBtn: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure AliasesListChange(Sender: TObject);
    procedure EmptyBtnClick(Sender: TObject);
  private
    hDB: hDBIDB;
    hCursor: hDBICur;
    DBDesc: DBDesc;
    TblDesc : TBLBaseDesc;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.FormShow(Sender: TObject);
var Rslt: DBIResult;
begin
 AliasesList.Items.Clear;
 TablesList.Items.Clear;
 hDB := Nil;
 try
  DbiInit(Nil);   // Инициализация BDE
  DbiOpenDatabaseList(hCursor);
  repeat
   Rslt:= DbiGetNextRecord(hCursor, dbiNOLOCK, @DBDesc, nil);
   if (Rslt <> DBIERR_EOF) then AliasesList.Items.Add(StrPas(DBDesc.szName));
  until (rslt <> DBIERR_NONE);
  DbiCloseCursor(hCursor);
 except
  on E:EDBEngineError do ShowMessage('Ошибка инициализации BDE');
 end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 try
 finally
  if hDB <> Nil then DbiCloseDatabase(hDB); // Закрытие базы данных
  DbiExit;                                  // Закрытие сеанса работы с BDE
 end
end;


procedure TMainForm.AliasesListChange(Sender: TObject);
begin
 try
  if hDB <> Nil
  then DbiCloseDatabase(hDB);// Закрытие базы данных
  DbiOpenDatabase            // Открытие базы данных
  (
   PChar(AliasesList.Text),  // Псевдоним базы данных
   Nil,                      // Тип базы данных
   dbiReadWrite,             // Режим редактирования данных
   dbiOpenShared,            // Режим разделения данных
   Nil,                      // Пароль
   0,                        // Число дополнительных параметров
   Nil,                      // Перечень полей для доп. параметров
   Nil,                      // Список доп. параметров
   hDB                       // Дескриптор базы данных
  );
  DbiSetPrivateDir('c:\temp');// Определение временного каталога
  DbiOpenTableList(hDb, False, False, '*.DB', hCursor);
  TablesList.Items.Clear;
  TablesList.Clear;
  while DbiGetNextRecord(hCursor, dbiNOLOCK, @TblDesc, nil) = dbiErr_None
   do TablesList.Items.Add(TblDesc.szName);
  DbiCloseCursor(hCursor);
 except
  on E:EDBEngineError do ShowMessage('Ошибка открытия базы данных');
 end;
end;

procedure TMainForm.EmptyBtnClick(Sender: TObject);
begin
 try
 DbiEmptyTable(hDB, Nil, PChar(TablesList.Text), '');
 except
  on E:EDBEngineError do ShowMessage('Неверно задана таблица');
 end;
end;

end.
