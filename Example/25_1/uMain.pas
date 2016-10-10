unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RpBase, RpSystem, RpDefine, RpRave, StdCtrls, Buttons, RpRender,
  RpRenderCanvas, RpRenderPreview, ComCtrls, ToolWin, ImgList;

type
  TfmMain = class(TForm)
    rsSystem: TRvSystem;
    lbxRptList: TListBox;
    Label1: TLabel;
    edName: TEdit;
    GroupBox1: TGroupBox;
    meDesc: TMemo;
    ToolBar1: TToolBar;
    tbSelect: TToolButton;
    tbPreview: TToolButton;
    tbPrint: TToolButton;
    tbFile: TToolButton;
    tbSave: TToolButton;
    tbLoad: TToolButton;
    ToolButton7: TToolButton;
    ImageList1: TImageList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    dlgSavePRN: TSaveDialog;
    dlgOpenProject: TOpenDialog;
    dlgSaveProject: TSaveDialog;
    rpProject: TRvProject;
    procedure lbxRptListClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbSelectClick(Sender: TObject);
    procedure tbPreviewClick(Sender: TObject);
    procedure tbPrintClick(Sender: TObject);
    procedure tbFileClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure tbSaveClick(Sender: TObject);
    procedure tbLoadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

procedure TfmMain.FormShow(Sender: TObject);
begin
 rpProject.Open;
 rpProject.GetReportList(lbxRptList.Items, True);
 lbxRptList.ItemIndex := 0;
 lbxRptListClick(Self);
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 rpProject.Close;
end;

procedure TfmMain.lbxRptListClick(Sender: TObject);
begin
 rpProject.SelectReport(lbxRptList.Items[lbxRptList.ItemIndex], True);
 rpProject.ReportDescToMemo(meDesc);
 edName.Text := rpProject.ReportName;
end;

procedure TfmMain.tbSelectClick(Sender: TObject);
begin
 rsSystem.DoNativeOutput := True;
 rsSystem.SystemSetups := rsSystem.SystemSetups + [ssAllowSetup];
 rpProject.Execute;
end;

procedure TfmMain.tbPreviewClick(Sender: TObject);
begin
 rsSystem.DoNativeOutput := False;
 rsSystem.DefaultDest := rdPreview;
 rsSystem.SystemSetups := rsSystem.SystemSetups - [ssAllowSetup];
 rpProject.Execute;
end;

procedure TfmMain.tbPrintClick(Sender: TObject);
begin
 rsSystem.DoNativeOutput := False;
 rsSystem.DefaultDest := rdPrinter;
 rsSystem.SystemSetups := rsSystem.SystemSetups - [ssAllowSetup];
 rpProject.Execute;
end;

procedure TfmMain.tbFileClick(Sender: TObject);
begin
 if dlgSavePRN.Execute then
 begin
  rsSystem.DoNativeOutput := False;
  rsSystem.DefaultDest := rdFile;
  rsSystem.SystemSetups := rsSystem.SystemSetups - [ssAllowSetup];
  rsSystem.OutputFileName := dlgSavePRN.FileName;
  rpProject.Execute;
 end;
end;

procedure TfmMain.ToolButton2Click(Sender: TObject);
begin
 Close;
end;

procedure TfmMain.tbSaveClick(Sender: TObject);
begin
 if dlgSaveProject.Execute
  then rpProject.SaveToFile(dlgSaveProject.FileName);
end;

procedure TfmMain.tbLoadClick(Sender: TObject);
begin
 if dlgOpenProject.Execute then
 begin
  rpProject.Close;
  rpProject.SetProjectFile(dlgOpenProject.FileName);
  rpProject.Open;
  rpProject.GetReportList(lbxRptList.Items, True);
  lbxRptList.ItemIndex := 0;
  lbxRptListClick(Self);
 end;
end;

end.
