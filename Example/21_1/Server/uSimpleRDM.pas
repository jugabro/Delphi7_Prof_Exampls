unit uSimpleRDM;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, SimpleAppSrvr_TLB, StdVcl, uSecondary, DB, DBTables, Provider;

type
  TSimpleRDM = class(TRemoteDataModule, ISimpleRDM)
    dbMastApp: TDatabase;
    tblEmplyees: TTable;
    dspEmployees: TDataSetProvider;
    tblOrders: TTable;
    dspOrders: TDataSetProvider;
    dspCustomers: TDataSetProvider;
    tblCustomers: TTable;
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    function Get_Secondary: Secondary; safecall;
  public
    { Public declarations }
  end;


implementation


{$R *.DFM}

class procedure TSimpleRDM.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

function TSimpleRDM.Get_Secondary: Secondary;
begin
 Result := FSecondaryFactory.CreateCOMObject(nil) as ISecondary;
end;

initialization
  TComponentFactory.Create(ComServer, TSimpleRDM,
    Class_SimpleRDM, ciMultiInstance, tmApartment);
end.

