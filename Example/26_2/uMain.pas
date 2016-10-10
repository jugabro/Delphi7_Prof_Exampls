unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RpBase, RpSystem, DB, ADODB, RpCon, RpConDS, RpDefine, RpRave,
  StdCtrls, Buttons, ExtCtrls;

type
  TfmMain = class(TForm)
    rpReport: TRvProject;
    rcCountry: TRvDataSetConnection;
    tCountry: TADOTable;
    DBDemos: TADOConnection;
    rsSystem: TRvSystem;
    bbPrint: TBitBtn;
    tCustomer: TADOTable;
    tOrders: TADOTable;
    rcCustomers: TRvDataSetConnection;
    rcOrders: TRvDataSetConnection;
    rcItems: TRvDataSetConnection;
    quItems: TADOQuery;
    rgReports: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    edUserName: TEdit;
    edPassword: TEdit;
    quVendorsParts: TADOQuery;
    rcVendorsParts: TRvDataSetConnection;
    procedure bbPrintClick(Sender: TObject);
    procedure rgReportsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

procedure TfmMain.bbPrintClick(Sender: TObject);
begin
 rpReport.Open;
 if rpReport.ReportName = 'SimpleReport' then
  if rpReport.ProjMan.ActiveReport.SecurityControl.IsValidUser(edUserName.Text, edPassword.Text)
   then rpReport.Execute
   else ShowMessage('Доступ запрещен')
  else rpReport.Execute;
 rpReport.Close;
end;

procedure TfmMain.rgReportsClick(Sender: TObject);
begin
 case rgReports.ItemIndex of
  0: rpReport.SelectReport('SipmleReport', False);
  1: rpReport.SelectReport('MasterDetailReport', False);
  2: rpReport.SelectReport('MultiReport', False);
  3: rpReport.SelectReport('GroupReport', False);
 end;
end;

end.
