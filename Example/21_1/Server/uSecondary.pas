unit uSecondary;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, SimpleAppSrvr_TLB, StdVcl, DB, IBCustomDataSet, IBQuery,
  IBDatabase, IBTable, Provider;

type
  TSecondary = class(TRemoteDataModule, ISecondary)
    dbMastApp: TIBDatabase;
    MastAppTrans: TIBTransaction;
    tblVendors: TIBTable;
    tblParts: TIBTable;
    dsVendors: TDataSource;
    dspVendors: TDataSetProvider;
    dspParts: TDataSetProvider;
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
  public
    { Public declarations }
  end;

var
  FSecondaryFactory: TComponentFactory;

implementation     

{$R *.DFM}

class procedure TSecondary.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
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

initialization
  FSecondaryFactory := TComponentFactory.Create(ComServer, TSecondary,
    Class_Secondary, ciMultiInstance, tmApartment);
end.
