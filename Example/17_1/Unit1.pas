unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, FMTBcd, Provider, SqlExpr, DBClient, DBLocal,
  DB, Grids, DBGrids, ExtCtrls, DBCtrls, StdCtrls, Buttons,
  SimpleDS;

type
  TfmDemoDBX = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edVenNo: TEdit;
    edVenName: TEdit;
    edVenAdr: TEdit;
    edVenCity: TEdit;
    edVenPhone: TEdit;
    dbgCusts: TDBGrid;
    cnMast: TSQLConnection;
    tblVens: TSQLTable;
    dsVens: TDataSource;
    dsCusts: TDataSource;
    sbFirst: TSpeedButton;
    sbNext: TSpeedButton;
    sbPost: TSpeedButton;
    quUpdate: TSQLQuery;
    sdsCusts: TSimpleDataSet;
    procedure tblVensAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cdsCustsAfterPost(DataSet: TDataSet);
    procedure sbCancelClick(Sender: TObject);
    procedure sbNextClick(Sender: TObject);
    procedure sbPostClick(Sender: TObject);
    procedure cdsCustsReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmDemoDBX: TfmDemoDBX;

implementation

{$R *.dfm}

procedure TfmDemoDBX.FormCreate(Sender: TObject);
begin
 tblVens.Open;
 sdsCusts.Open;
end;

procedure TfmDemoDBX.FormDestroy(Sender: TObject);
begin
 tblVens.Close;
 sdsCusts.Close;
end;

{Editing feature with updating query}

procedure TfmDemoDBX.tblVensAfterScroll(DataSet: TDataSet);
begin
 edVenNo.Text := tblVens.FieldByName('VENDORNO').AsString;
 edVenName.Text := tblVens.FieldByName('VENDORNAME').AsString;
 edVenAdr.Text := tblVens.FieldByName('ADDRESS1').AsString;
 edVenCity.Text := tblVens.FieldByName('CITY').AsString;
 edVenPhone.Text := tblVens.FieldByName('PHONE').AsString;
end;

procedure TfmDemoDBX.sbCancelClick(Sender: TObject);
begin
 tblVens.First;
end;

procedure TfmDemoDBX.sbNextClick(Sender: TObject);
begin
 tblVens.Next;
end;

procedure TfmDemoDBX.sbPostClick(Sender: TObject);
begin
 with quUpdate do
 try
  ParamByName('Idx').AsInteger := tblVens.FieldByName('VENDORNO').AsInteger;
  ParamByName('No').AsString := edVenNo.Text;
  ParamByName('Name').AsString := edVenName.Text;
  ParamByName('Adr').AsString :=  edVenAdr.Text;
  ParamByName('City').AsString :=  edVenCity.Text;
  ParamByName('Phone').AsString :=  edVenPhone.Text;
  ExecSQL;
 except
  MessageDlg('Vendor''s info post error', mtError, [mbOK], 0);
  tblVens.First;
 end;
end;

{Editing feature with cached updates}

procedure TfmDemoDBX.cdsCustsAfterPost(DataSet: TDataSet);
begin
 sdsCusts.ApplyUpdates(-1);
end;

procedure TfmDemoDBX.cdsCustsReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
 MessageDlg('Customer''s info post error', mtError, [mbOK], 0);
 sdsCusts.CancelUpdates;
end;

end.
