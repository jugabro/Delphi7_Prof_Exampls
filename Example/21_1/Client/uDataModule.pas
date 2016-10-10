unit uDataModule;

interface

uses
  SysUtils, Classes, MConnect, DB, DBClient;

type
  TDM = class(TDataModule)
    dsParts: TDataSource;
    cdsParts: TClientDataSet;
    cdsVendors: TClientDataSet;
    cdsVendorsVENDORNAME: TStringField;
    cdsVendorsADDRESS1: TStringField;
    cdsVendorsCITY: TStringField;
    cdsVendorsCOUNTRY: TStringField;
    cdsVendorsPHONE: TStringField;
    cdsVendorsFAX: TStringField;
    cdsVendorstblParts: TDataSetField;
    dsVendors: TDataSource;
    cdsEmployees: TClientDataSet;
    cdsCustomers: TClientDataSet;
    dsOrders: TDataSource;
    cdsOrders: TClientDataSet;
    cdsOrdersCustName: TStringField;
    cdsOrdersCustNo: TFloatField;
    cdsOrdersSaleDate: TDateTimeField;
    cdsOrdersShipDate: TDateTimeField;
    cdsOrdersEmpName: TStringField;
    cdsOrdersEmpNo: TIntegerField;
    cdsOrdersPaymentMethod: TStringField;
    cdsOrdersItemsTotal: TCurrencyField;
    cdsOrdersAmountPaid: TCurrencyField;
    Secondary: TSharedConnection;
    SrvrCon: TDCOMConnection;
    cdsPartsPARTNO: TFloatField;
    cdsPartsDESCRIPTION: TStringField;
    cdsPartsONHAND: TFloatField;
    cdsPartsONORDER: TFloatField;
    cdsPartsCOST: TFloatField;
    cdsPartsLISTPRICE: TFloatField;
    cdsOrdersOrderNo: TFloatField;
    cdsOrdersPaidSum: TAggregateField;
    procedure SrvrConBeforeDisconnect(Sender: TObject);
    procedure SrvrConAfterConnect(Sender: TObject);
    procedure cdsVendorsAfterScroll(DataSet: TDataSet);
    procedure cdsPartsReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
  private
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses uMain, Variants, Dialogs;

{$R *.dfm}

procedure TDM.SrvrConAfterConnect(Sender: TObject);
var i: Integer;
begin
 for i := 0 to SrvrCon.DataSetCount - 1 do
  SrvrCon.DataSets[i].Open;
 cdsVendors.Open;
end;

procedure TDM.SrvrConBeforeDisconnect(Sender: TObject);
var i: Integer;
begin
 for i := 0 to SrvrCon.DataSetCount - 1 do
  SrvrCon.DataSets[i].Close;
 cdsVendors.Close;
end;

procedure TDM.cdsVendorsAfterScroll(DataSet: TDataSet);
begin
 fmMain.edCostSum.Text := VarToStr(cdsParts.Aggregates[0].Value);
 fmMain.edPriceSum.Text := VarToStr(cdsParts.Aggregates[1].Value);
end;

procedure TDM.cdsPartsReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
 cdsParts.CancelUpdates;
 MessageDlg(E.Message, mtError, [mbOK], 0);
end;

end.
