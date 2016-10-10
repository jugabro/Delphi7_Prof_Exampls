unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBTables, Grids, DBGrids, ExtCtrls, DBCtrls;

type
  TForm1 = class(TForm)
    OrdersQuery: TQuery;
    DBGrid1: TDBGrid;
    OrdersSource: TDataSource;
    DBGrid2: TDBGrid;
    CustSource: TDataSource;
    CustQuery: TQuery;
    DBNavigator1: TDBNavigator;
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
 OrdersQuery.Open;
 CustQuery.Open;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 OrdersQuery.Close;
 CustQuery.Close;
end;

end.
