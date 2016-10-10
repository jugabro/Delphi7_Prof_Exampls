unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, StdCtrls, Mask, DBCtrls, DBCGrids, ExtCtrls;

type
  TMainForm = class(TForm)
    CustTable: TTable;
    CustSource: TDataSource;
    DBGrid1: TDBGrid;
    OrdTable: TTable;
    OrdSource: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.FormShow(Sender: TObject);
begin
 CustTable.Open;
 OrdTable.Open;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 CustTable.Close;
 OrdTable.Close;
end;

end.
