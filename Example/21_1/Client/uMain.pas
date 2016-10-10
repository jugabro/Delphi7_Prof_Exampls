unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MConnect, DB, DBClient, StdCtrls, Grids, DBGrids, Buttons,
  ExtCtrls, ComCtrls, ImgList, ToolWin, Mask, DBCtrls;

type
  TfmMain = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edServerName: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    dbgVendors: TDBGrid;
    dbgOrders: TDBGrid;
    Splitter1: TSplitter;
    ToolBar1: TToolBar;
    tbConnect: TToolButton;
    tbEdit: TToolButton;
    tbCancel: TToolButton;
    tbSave: TToolButton;
    ImageList1: TImageList;
    tbApply: TToolButton;
    tbClose: TToolButton;
    Panel2: TPanel;
    dbgParts: TDBGrid;
    edPriceSum: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edCostSum: TEdit;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    sbSetServer: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbConnectClick(Sender: TObject);
    procedure tbEditClick(Sender: TObject);
    procedure tbCancelClick(Sender: TObject);
    procedure tbSaveClick(Sender: TObject);
    procedure tbApplyClick(Sender: TObject);
    procedure tbCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sbSetServerClick(Sender: TObject);
  private
    IsEdit: Boolean;
    procedure SetCtrlState;
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

uses uDataModule, ShlObj, ActiveX;

const
  ServerNameError: String = 'Ошибка доступа к сети';
  ServerNameTitle: String = 'Выберите компьютер сервера приложения';
  SaveChangesMsg:  String = 'Сохранить изменения?';

{$R *.dfm}

procedure TfmMain.SetCtrlState;
begin
 tbConnect.Enabled := Not IsEdit;
 tbEdit.Enabled := not DM.cdsVendors.IsEmpty and not IsEdit;
 tbCancel.Enabled := IsEdit;
 tbSave.Enabled := IsEdit;
 tbApply.Enabled := DM.cdsParts.ChangeCount > 0;
 dbgVendors.Enabled := Not IsEdit;
end;

procedure TfmMain.FormShow(Sender: TObject);
begin
 IsEdit := False;
 SetCtrlState;
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 DM.SrvrCon.Close;
end;

procedure TfmMain.tbConnectClick(Sender: TObject);
begin
 try
  DM.SrvrCon.Close;
  DM.SrvrCon.ComputerName := edServerName.Text;
  DM.SrvrCon.Open;
 except
  on E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
 end;
 SetCtrlState;
end;

procedure TfmMain.tbEditClick(Sender: TObject);
begin
 IsEdit := True;
 dbgParts.ReadOnly := False;
 dbgParts.SetFocus;
 SetCtrlState;
end;

procedure TfmMain.tbCancelClick(Sender: TObject);
begin
 DM.cdsParts.Cancel;
 DM.cdsParts.UndoLastChange(False);
 dbgParts.ReadOnly := True;
 IsEdit := False;
 SetCtrlState;
end;

procedure TfmMain.tbSaveClick(Sender: TObject);
begin
 if DM.cdsParts.State in [dsInsert, dsEdit]
  then DM.cdsParts.Post;
 DM.cdsVendorsAfterScroll(DM.cdsVendors);
 dbgParts.ReadOnly := True;
 IsEdit := False;
 SetCtrlState;
end;

procedure TfmMain.tbApplyClick(Sender: TObject);
begin
 DM.cdsParts.ApplyUpdates(-1);
 SetCtrlState;
end;

procedure TfmMain.tbCloseClick(Sender: TObject);
begin
 Close;
end;

procedure TfmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if DM.cdsParts.ChangeCount > 0 then
  if MessageDlg(SaveChangesMsg, mtConfirmation, [mbOk, mbCancel], 0) = mrOk
   then
   with DM.cdsParts do
   begin
    if State in [dsInsert, dsEdit]
     then Post;
    ApplyUpdates(-1);
   end
   else tbCancelClick(tbCancel);
 CanClose := True;
end;

procedure TfmMain.sbSetServerClick(Sender: TObject);
var BrowseInfo: TBrowseInfo;
    ItemIDList: PItemIDList;
    ComputerName: array[0..MAX_PATH] of Char;
    ShellMalloc: IMalloc;
begin
 if Failed(SHGetSpecialFolderLocation(Application.Handle, CSIDL_NETWORK, ItemIDList))
  then raise Exception.Create('');
 try
  FillChar(BrowseInfo, SizeOf(BrowseInfo), 0);
  with BrowseInfo do
  begin
   hwndOwner := Application.Handle;
   pidlRoot := ItemIDList;
   pszDisplayName := ComputerName;
   ulFlags := BIF_BROWSEFORCOMPUTER;
   lpszTitle := PChar(Pointer(ServerNameTitle));
  end;
  if SHBrowseForFolder(BrowseInfo) <> nil
   then edServername.Text := BrowseInfo.pszDisplayName;
 finally
  if Succeeded(SHGetMalloc(ShellMalloc)) then
   ShellMalloc.Free(ItemIDList);
 end;
end;

end.
