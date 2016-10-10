object fmMain: TfmMain
  Left = 267
  Top = 165
  Width = 323
  Height = 302
  Caption = 'DemoReports'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 96
    Height = 13
    Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  end
  object Label2: TLabel
    Left = 8
    Top = 44
    Width = 38
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100
  end
  object rgReports: TRadioGroup
    Left = 8
    Top = 72
    Width = 297
    Height = 153
    Caption = #1054#1090#1095#1077#1090#1099
    ItemIndex = 0
    Items.Strings = (
      #1055#1088#1086#1089#1090#1086#1081' '#1090#1072#1073#1083#1080#1095#1085#1099#1081' '#1086#1090#1095#1077#1090
      #1054#1090#1095#1077#1090' "'#1086#1076#1080#1085' '#1082#1086' '#1084#1085#1086#1075#1080#1084'"'
      #1057#1083#1086#1078#1085#1099#1081' '#1086#1090#1095#1077#1090' "'#1086#1076#1080#1085' '#1082#1086' '#1084#1085#1086#1075#1080#1084'"'
      #1054#1090#1095#1077#1090' '#1089' '#1075#1088#1091#1087#1087#1080#1088#1086#1074#1082#1086#1081)
    TabOrder = 1
    OnClick = rgReportsClick
  end
  object bbPrint: TBitBtn
    Left = 8
    Top = 240
    Width = 297
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100
    TabOrder = 0
    OnClick = bbPrintClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
      8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
      8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
      8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
  end
  object edUserName: TEdit
    Left = 128
    Top = 8
    Width = 177
    Height = 21
    TabOrder = 2
    Text = 'Test'
  end
  object edPassword: TEdit
    Left = 128
    Top = 40
    Width = 177
    Height = 21
    TabOrder = 3
    Text = 'Test'
  end
  object rpReport: TRvProject
    Engine = rsSystem
    Left = 56
    Top = 32
  end
  object rcCountry: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = tCountry
    Left = 264
    Top = 88
  end
  object tCountry: TADOTable
    Connection = DBDemos
    TableName = 'country'
    Left = 232
    Top = 88
  end
  object DBDemos: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 200
    Top = 88
  end
  object rsSystem: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 88
    Top = 32
  end
  object tCustomer: TADOTable
    Connection = DBDemos
    TableName = 'customer'
    Left = 232
    Top = 120
  end
  object tOrders: TADOTable
    Connection = DBDemos
    TableName = 'orders'
    Left = 232
    Top = 152
  end
  object rcCustomers: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = tCustomer
    Left = 264
    Top = 120
  end
  object rcOrders: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = tOrders
    Left = 264
    Top = 152
  end
  object rcItems: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = quItems
    Left = 264
    Top = 184
  end
  object quItems: TADOQuery
    Connection = DBDemos
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT I.*, P.Description'
      'FROM Items I, Parts P'
      'WHERE I.PartNo = P.PartNo')
    Left = 232
    Top = 184
  end
  object quVendorsParts: TADOQuery
    Connection = DBDemos
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT V.VendorNo, V.VendorName, V.Country, V.City, P.PartNo, P.' +
        'Description, P.Cost'
      'FROM Vendors V, Parts P'
      'WHERE V.VendorNo = P.VendorNo')
    Left = 232
    Top = 216
  end
  object rcVendorsParts: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = quVendorsParts
    Left = 264
    Top = 216
  end
end
