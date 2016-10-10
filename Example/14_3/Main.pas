unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Grids, DBGrids, Db, DBTables, ADODB;

type
  TMainForm = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    StartBookmark: TButton;
    StopBookmark: TButton;
    BookmarkControl: TShape;
    Bevel1: TBevel;
    Cust: TADOTable;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StartBookmarkClick(Sender: TObject);
    procedure StopBookmarkClick(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

var SaveRecPos: TBookMark;

procedure TMainForm.FormShow(Sender: TObject);
begin
 try
  Cust.Open;
  BookmarkControl.Brush.Color := clBtnFace;
 except
  ShowMessage('Ошибка открытия набора данных');
 end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Cust.Close;
end;

procedure TMainForm.StartBookmarkClick(Sender: TObject);
begin
 if Not Cust.BookmarkValid(SaveRecPos)
  then SaveRecPos := Cust.GetBookmark;
 BookmarkControl.Brush.Color := clLime
end;

procedure TMainForm.StopBookmarkClick(Sender: TObject);
begin
 with Cust do
 begin
  if Not BookmarkValid(SaveRecPos)
   then Exit;
  GotoBookmark(SaveRecPos);
  FreeBookmark(SaveRecPos);
  SaveRecPos := Nil;
 end;
 BookmarkControl.Brush.Color := clBtnFace;
end;

end.
