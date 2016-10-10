unit SimpleAppSrvr_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 22.10.2002 11:00:32 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Mark\Bin\Books\d7\Demos\21_1\Server\SimpleAppSrvr.tlb (1)
// LIBID: {93577575-0F4F-43B5-9FBE-A5745128D9A4}
// LCID: 0
// Helpfile: 
// HelpString: SimpleAppSrvr Library
// DepndLst: 
//   (1) v1.0 Midas, (C:\WINNT\system32\midas.dll)
//   (2) v2.0 stdole, (C:\WINNT\System32\STDOLE2.TLB)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, Midas, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  SimpleAppSrvrMajorVersion = 1;
  SimpleAppSrvrMinorVersion = 0;

  LIBID_SimpleAppSrvr: TGUID = '{93577575-0F4F-43B5-9FBE-A5745128D9A4}';

  IID_ISimpleRDM: TGUID = '{E2CBEBCB-1950-4054-B823-62906306E840}';
  CLASS_SimpleRDM: TGUID = '{DB6A6463-5F61-485F-8F23-EC6622091908}';
  IID_ISecondary: TGUID = '{D23CDDD2-7652-48F3-8EC2-D411966B4880}';
  CLASS_Secondary: TGUID = '{7394399D-7B4F-4659-A382-2242EE50B017}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ISimpleRDM = interface;
  ISimpleRDMDisp = dispinterface;
  ISecondary = interface;
  ISecondaryDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  SimpleRDM = ISimpleRDM;
  Secondary = ISecondary;


// *********************************************************************//
// Interface: ISimpleRDM
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E2CBEBCB-1950-4054-B823-62906306E840}
// *********************************************************************//
  ISimpleRDM = interface(IAppServer)
    ['{E2CBEBCB-1950-4054-B823-62906306E840}']
    function Get_Secondary: Secondary; safecall;
    property Secondary: Secondary read Get_Secondary;
  end;

// *********************************************************************//
// DispIntf:  ISimpleRDMDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E2CBEBCB-1950-4054-B823-62906306E840}
// *********************************************************************//
  ISimpleRDMDisp = dispinterface
    ['{E2CBEBCB-1950-4054-B823-62906306E840}']
    property Secondary: Secondary readonly dispid 1;
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer; 
                             out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                           Options: Integer; const CommandText: WideString; var Params: OleVariant; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// Interface: ISecondary
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D23CDDD2-7652-48F3-8EC2-D411966B4880}
// *********************************************************************//
  ISecondary = interface(IAppServer)
    ['{D23CDDD2-7652-48F3-8EC2-D411966B4880}']
  end;

// *********************************************************************//
// DispIntf:  ISecondaryDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D23CDDD2-7652-48F3-8EC2-D411966B4880}
// *********************************************************************//
  ISecondaryDisp = dispinterface
    ['{D23CDDD2-7652-48F3-8EC2-D411966B4880}']
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer; 
                             out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                           Options: Integer; const CommandText: WideString; var Params: OleVariant; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoSimpleRDM provides a Create and CreateRemote method to          
// create instances of the default interface ISimpleRDM exposed by              
// the CoClass SimpleRDM. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSimpleRDM = class
    class function Create: ISimpleRDM;
    class function CreateRemote(const MachineName: string): ISimpleRDM;
  end;

// *********************************************************************//
// The Class CoSecondary provides a Create and CreateRemote method to          
// create instances of the default interface ISecondary exposed by              
// the CoClass Secondary. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSecondary = class
    class function Create: ISecondary;
    class function CreateRemote(const MachineName: string): ISecondary;
  end;

implementation

uses ComObj;

class function CoSimpleRDM.Create: ISimpleRDM;
begin
  Result := CreateComObject(CLASS_SimpleRDM) as ISimpleRDM;
end;

class function CoSimpleRDM.CreateRemote(const MachineName: string): ISimpleRDM;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SimpleRDM) as ISimpleRDM;
end;

class function CoSecondary.Create: ISecondary;
begin
  Result := CreateComObject(CLASS_Secondary) as ISecondary;
end;

class function CoSecondary.CreateRemote(const MachineName: string): ISecondary;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Secondary) as ISecondary;
end;

end.
