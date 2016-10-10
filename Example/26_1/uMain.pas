unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RpCon, RpBase, RpSystem, RpDefine, RpRave, StdCtrls, Buttons;

type
  TfmMain = class(TForm)
    bbPrint: TBitBtn;
    rpReport: TRvProject;
    rsSystem: TRvSystem;
    rcCustom: TRvCustomConnection;
    meLeft: TMemo;
    meRight: TMemo;
    bbOpenLeft: TBitBtn;
    bbClearLeft: TBitBtn;
    dlgOpen: TOpenDialog;
    bbOpenRight: TBitBtn;
    bbClearRight: TBitBtn;
    procedure bbPrintClick(Sender: TObject);
    procedure rcCustomOpen(Connection: TRvCustomConnection);
    procedure rcCustomGetCols(Connection: TRvCustomConnection);
    procedure rcCustomGetRow(Connection: TRvCustomConnection);
    procedure bbOpenLeftClick(Sender: TObject);
    procedure bbClearLeftClick(Sender: TObject);
    procedure bbOpenRightClick(Sender: TObject);
    procedure bbClearRightClick(Sender: TObject);
  private
    i: integer;
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

uses Math;

procedure TfmMain.bbPrintClick(Sender: TObject);
begin
 rpReport.Execute;
end;

procedure TfmMain.rcCustomOpen(Connection: TRvCustomConnection);
begin
 Connection.DataRows := Max(meLeft.Lines.Count, meRight.Lines.Count);
 i := 0;
end;

procedure TfmMain.rcCustomGetCols(Connection: TRvCustomConnection);
begin
 Connection.WriteField('LeftColumn', dtString, 40, 'LeftColumn', '');
 Connection.WriteField('RightColumn', dtString, 40, 'RightColumn', '');
end;

procedure TfmMain.rcCustomGetRow(Connection: TRvCustomConnection);
begin
 if meLeft.Lines.Count >= i
  then Connection.WriteStrData('',  meLeft.Lines[i])
  else Connection.WriteNullData;
 if meRight.Lines.Count >= i
  then Connection.WriteStrData('',  meRight.Lines[i])
  else Connection.WriteNullData;
 Inc(i);
end;

procedure TfmMain.bbOpenLeftClick(Sender: TObject);
begin
 if dlgOpen.Execute then
 begin
  meLeft.Clear;
  meLeft.Lines.LoadFromFile(dlgOpen.FileName);
 end;
end;

procedure TfmMain.bbClearLeftClick(Sender: TObject);
begin
 meLeft.Clear;
end;

procedure TfmMain.bbOpenRightClick(Sender: TObject);
begin
 if dlgOpen.Execute then
 begin
  meRight.Clear;
  meRight.Lines.LoadFromFile(dlgOpen.FileName);
 end;
end;

procedure TfmMain.bbClearRightClick(Sender: TObject);
begin
 meRight.Clear;
end;

end.
