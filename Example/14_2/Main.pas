unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBTables, Grids, DBGrids, ComCtrls, ExtCtrls,
  ToolWin, ImgList, ADODB;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    CustSource: TDataSource;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    FindBtn: TBitBtn;
    Cust: TTable;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FindBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormShow(Sender: TObject);
begin
 try
  Cust.Open;
 except
  on E: EDBEngineError do ShowMessage('Ошибка при открытии таблицы');
 end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Cust.Close;
end;

procedure TForm1.FindBtnClick(Sender: TObject);
begin
 try
 if not Cust.FindKey([Edit1.Text, Edit2.Text])
  then ShowMessage('Запись не найдена');
 except
  on E: EDatabaseError
   do ShowMessage('Ошибка поиска');
 end;
end;

end.
