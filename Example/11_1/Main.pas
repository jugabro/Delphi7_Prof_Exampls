unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids;

type
  TForm1 = class(TForm)
    CountryTable: TTable;
    CountrySource: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  CountryTable.Open;
 except
  ShowMessage('Table open error');
 end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CountryTable.Close;
end;

end.
