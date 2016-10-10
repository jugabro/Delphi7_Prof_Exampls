object DM: TDM
  OldCreateOrder = False
  Left = 327
  Top = 240
  Height = 140
  Width = 368
  object dsParts: TDataSource
    DataSet = cdsParts
    Left = 312
    Top = 8
  end
  object cdsParts: TClientDataSet
    Aggregates = <
      item
        Active = True
        AggregateName = 'CostSum'
        Expression = 'SUM(Cost*OnHand)'
        Visible = False
      end
      item
        Active = True
        AggregateName = 'PriceSum'
        Expression = 'SUM(ListPrice*OnOrder)'
        Visible = False
      end>
    AggregatesActive = True
    DataSetField = cdsVendorstblParts
    Params = <>
    OnReconcileError = cdsPartsReconcileError
    Left = 256
    Top = 8
    object cdsPartsPARTNO: TFloatField
      DisplayLabel = #1055#1072#1088#1090#1080#1103
      FieldName = 'PARTNO'
      Origin = 'PARTS.PARTNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPartsDESCRIPTION: TStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077
      FieldName = 'DESCRIPTION'
      Origin = 'PARTS.DESCRIPTION'
      Required = True
      Size = 30
    end
    object cdsPartsONHAND: TFloatField
      DisplayLabel = #1053#1072#1083#1080#1095#1080#1077
      FieldName = 'ONHAND'
      Origin = 'PARTS.ONHAND'
    end
    object cdsPartsONORDER: TFloatField
      DisplayLabel = #1042' '#1079#1072#1082#1072#1079#1072#1093
      FieldName = 'ONORDER'
      Origin = 'PARTS.ONORDER'
    end
    object cdsPartsCOST: TFloatField
      DisplayLabel = #1057#1090#1086#1080#1084#1086#1089#1090#1100
      FieldName = 'COST'
      Origin = 'PARTS.COST'
    end
    object cdsPartsLISTPRICE: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'LISTPRICE'
      Origin = 'PARTS.LISTPRICE'
    end
  end
  object cdsVendors: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVendors'
    RemoteServer = Secondary
    AfterScroll = cdsVendorsAfterScroll
    Left = 256
    Top = 56
    object cdsVendorsVENDORNAME: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      FieldName = 'VENDORNAME'
      Origin = 'VENDORS.VENDORNAME'
      Size = 30
    end
    object cdsVendorsADDRESS1: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      FieldName = 'ADDRESS1'
      Origin = 'VENDORS.ADDRESS1'
      Size = 30
    end
    object cdsVendorsCITY: TStringField
      DisplayLabel = #1043#1086#1088#1086#1076
      FieldName = 'CITY'
      Origin = 'VENDORS.CITY'
    end
    object cdsVendorsCOUNTRY: TStringField
      DisplayLabel = #1057#1090#1088#1072#1085#1072
      FieldName = 'COUNTRY'
      Origin = 'VENDORS.COUNTRY'
      Size = 15
    end
    object cdsVendorsPHONE: TStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      FieldName = 'PHONE'
      Origin = 'VENDORS.PHONE'
      Size = 15
    end
    object cdsVendorsFAX: TStringField
      DisplayLabel = #1060#1072#1082#1089
      FieldName = 'FAX'
      Origin = 'VENDORS.FAX'
      Size = 15
    end
    object cdsVendorstblParts: TDataSetField
      FieldName = 'tblParts'
      Visible = False
    end
  end
  object dsVendors: TDataSource
    DataSet = cdsVendors
    Left = 312
    Top = 56
  end
  object cdsEmployees: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmployees'
    RemoteServer = SrvrCon
    Left = 72
    Top = 56
  end
  object cdsCustomers: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCustomers'
    RemoteServer = SrvrCon
    Left = 128
    Top = 56
  end
  object dsOrders: TDataSource
    DataSet = cdsOrders
    Left = 128
    Top = 8
  end
  object cdsOrders: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    IndexFieldNames = 'CustNo;OrderNo'
    Params = <>
    ProviderName = 'dspOrders'
    RemoteServer = SrvrCon
    Left = 72
    Top = 8
    object cdsOrdersOrderNo: TFloatField
      FieldName = 'OrderNo'
      Visible = False
    end
    object cdsOrdersCustName: TStringField
      DisplayLabel = #1047#1072#1082#1072#1079#1095#1080#1082
      FieldKind = fkLookup
      FieldName = 'CustName'
      LookupDataSet = cdsCustomers
      LookupKeyFields = 'CustNo'
      LookupResultField = 'Company'
      KeyFields = 'CustNo'
      Lookup = True
    end
    object cdsOrdersCustNo: TFloatField
      FieldName = 'CustNo'
      Required = True
      Visible = False
    end
    object cdsOrdersSaleDate: TDateTimeField
      DisplayLabel = #1055#1088#1086#1076#1072#1078#1072
      DisplayWidth = 10
      FieldName = 'SaleDate'
    end
    object cdsOrdersShipDate: TDateTimeField
      DisplayLabel = #1054#1090#1087#1088#1072#1074#1082#1072
      DisplayWidth = 10
      FieldName = 'ShipDate'
    end
    object cdsOrdersEmpName: TStringField
      DisplayLabel = #1055#1088#1086#1076#1072#1074#1077#1094
      FieldKind = fkLookup
      FieldName = 'EmpName'
      LookupDataSet = cdsEmployees
      LookupKeyFields = 'EmpNo'
      LookupResultField = 'LastName'
      KeyFields = 'EmpNo'
      Lookup = True
    end
    object cdsOrdersEmpNo: TIntegerField
      FieldName = 'EmpNo'
      Required = True
      Visible = False
    end
    object cdsOrdersPaymentMethod: TStringField
      DisplayLabel = #1055#1083#1072#1090#1077#1078
      FieldName = 'PaymentMethod'
      Size = 7
    end
    object cdsOrdersItemsTotal: TCurrencyField
      DisplayLabel = #1050' '#1086#1087#1083#1072#1090#1077
      FieldName = 'ItemsTotal'
    end
    object cdsOrdersAmountPaid: TCurrencyField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1086
      FieldName = 'AmountPaid'
    end
    object cdsOrdersPaidSum: TAggregateField
      FieldName = 'PaidSum'
      Visible = True
      Active = True
      currency = True
      Expression = 'SUM(AmountPaid)'
    end
  end
  object Secondary: TSharedConnection
    ParentConnection = SrvrCon
    ChildName = 'Secondary'
    Left = 200
    Top = 8
  end
  object SrvrCon: TDCOMConnection
    ServerGUID = '{DB6A6463-5F61-485F-8F23-EC6622091908}'
    ServerName = 'SimpleAppSrvr.SimpleRDM'
    AfterConnect = SrvrConAfterConnect
    BeforeDisconnect = SrvrConBeforeDisconnect
    Left = 16
    Top = 8
  end
end
