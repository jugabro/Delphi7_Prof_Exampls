unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, Grids, DBGrids, Db, DBTables, ADODB;

type
  TForm1 = class(TForm)
    CustSource: TDataSource;
    DBGrid1: TDBGrid;
    OrdSource: TDataSource;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    EmpSource: TDataSource;
    DBDEMOS: TADOConnection;
    Cust: TADOTable;
    Ord: TADOTable;
    Emp: TADOTable;
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
 Cust.Open;
 Ord.Open;
 Emp.Open;
 except
  on E: Exception do ShowMessage(E.Message);
 end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Cust.Close;
 Ord.Close;
 Emp.Close;
end;

end.
