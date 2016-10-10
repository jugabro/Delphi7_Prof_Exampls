unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, StdCtrls, Buttons, FileCtrl, ExtCtrls,
  ComCtrls, ToolWin, ImgList;

type
  TfmMain = class(TForm)
    ADOConn: TADOConnection;
    tblIndustry: TADOTable;
    dsIndustry: TDataSource;
    Panel2: TPanel;
    dbgIndustry: TDBGrid;
    dbgMaster: TDBGrid;
    Splitter1: TSplitter;
    tblMaster: TADOTable;
    dsMaster: TDataSource;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    tbConnect: TToolButton;
    tbSave: TToolButton;
    tbFilter: TToolButton;
    tbUnFilter: TToolButton;
    Panel3: TPanel;
    edDefDB: TEdit;
    sbDefDB: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure sbDefDBClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ADOConnAfterConnect(Sender: TObject);
    procedure ADOConnBeforeDisconnect(Sender: TObject);
    procedure tbConnectClick(Sender: TObject);
    procedure tbSaveClick(Sender: TObject);
    procedure tbFilterClick(Sender: TObject);
    procedure tbUnFilterClick(Sender: TObject);
    procedure dbgIndustryTitleClick(Column: TColumn);
  private
    Bookmarks: array of TVarRec;
    SortStr: String;
    DefDBStr: String;
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

uses IniFiles;

const sIniFileName: String = 'ADODemo.ini';
      sEmptyDefDB:  String = 'Не задан путь к базе данных';
      sEmptyFilter: String = 'Не выбраны записи для фильтра';

{$R *.dfm}

procedure TfmMain.FormShow(Sender: TObject);
begin
 with TIniFile.Create(ExtractFilePath(ParamStr(0)) + sIniFileName) do
 try
  DefDBStr := ReaDString('DefDB', 'DefDBStr', '');
  edDefDB.Text := DefDBStr;
 finally
  Free;
 end;
 SetLength(Bookmarks, 0);
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 with TIniFile.Create(ExtractFilePath(ParamStr(0)) + sIniFileName) do
 try
  WriteString('DefDB', 'DefDBStr', edDefDB.Text);
 finally
  Free;
 end;
end;

procedure TfmMain.sbDefDBClick(Sender: TObject);
begin
 if SelectDirectory(DefDBStr, [], 0)
  then edDefDB.Text := DefDBStr;
end;

procedure TfmMain.tbConnectClick(Sender: TObject);
begin
 ADOConn.Close;
 ADOConn.DefaultDatabase := '';
 if DefDBStr = '' then
 begin
  MessageDlg(sEmptyDefDB, mtError, [mbOK], 0);
  Abort;
 end
 else
 begin
  ADOConn.DefaultDatabase := DefDBStr;
  ADOConn.Open;
 end;
end;

procedure TfmMain.tbSaveClick(Sender: TObject);
begin
 tblIndustry.UpdateBatch();
end;

procedure TfmMain.tbFilterClick(Sender: TObject);
var i: Integer;
begin
 if dbgIndustry.SelectedRows.Count > 0 then
 begin
  SetLength(Bookmarks, dbgIndustry.SelectedRows.Count);
  for i := 0 to dbgIndustry.SelectedRows.Count - 1 do
  begin
   Bookmarks[i].VType := vtPointer;
   Bookmarks[i].VPointer := pointer(dbgIndustry.SelectedRows[i]);
  end;
  tblIndustry.FilterOnBookmarks(Bookmarks);
 end
 else
  MessageDlg(sEmptyFilter, mtWarning, [mbOK], 0);
end;

procedure TfmMain.tbUnFilterClick(Sender: TObject);
begin
 tblIndustry.Filtered := False;
 dbgIndustry.SelectedRows.Clear;
end;

procedure TfmMain.dbgIndustryTitleClick(Column: TColumn);
begin
 if tblIndustry.Active then
  if (Pos(Column.FieldName, tblIndustry.Sort) > 0)and(Pos('ASC', tblIndustry.Sort) > 0)
   then tblIndustry.Sort := Column.FieldName + ' DESC'
   else tblIndustry.Sort := Column.FieldName + ' ASC';
end;

procedure TfmMain.ADOConnAfterConnect(Sender: TObject);
var i: Integer;
begin
  for i := 0 to adoConn.DataSetCount - 1 do
   ADOConn.DataSets[i].Open;
end;

procedure TfmMain.ADOConnBeforeDisconnect(Sender: TObject);
var i: Integer;
begin
  for i := 0 to adoConn.DataSetCount - 1 do
   ADOConn.DataSets[i].Close;
end;

end.
