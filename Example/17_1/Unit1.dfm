object fmDemoDBX: TfmDemoDBX
  Left = 240
  Top = 233
  Width = 699
  Height = 362
  Caption = 'Demo dbExpress'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 336
    Top = 8
    Width = 9
    Height = 321
    Shape = bsLeftLine
  end
  object Label1: TLabel
    Left = 120
    Top = 8
    Width = 39
    Height = 13
    Caption = 'Vendors'
  end
  object Label2: TLabel
    Left = 472
    Top = 16
    Width = 49
    Height = 13
    Caption = 'Customers'
  end
  object Label3: TLabel
    Left = 8
    Top = 56
    Width = 74
    Height = 13
    Caption = 'Vendor Number'
  end
  object Label4: TLabel
    Left = 8
    Top = 88
    Width = 65
    Height = 13
    Caption = 'Vendor Name'
  end
  object Label5: TLabel
    Left = 8
    Top = 120
    Width = 81
    Height = 13
    Caption = 'Vendor Address1'
  end
  object Label6: TLabel
    Left = 8
    Top = 152
    Width = 54
    Height = 13
    Caption = 'Vendor City'
  end
  object Label7: TLabel
    Left = 8
    Top = 184
    Width = 68
    Height = 13
    Caption = 'Vendor Phone'
  end
  object sbFirst: TSpeedButton
    Left = 64
    Top = 224
    Width = 65
    Height = 25
    Caption = 'First'
    NumGlyphs = 2
    OnClick = sbCancelClick
  end
  object sbNext: TSpeedButton
    Left = 128
    Top = 224
    Width = 65
    Height = 25
    Caption = 'Next'
    NumGlyphs = 2
    OnClick = sbNextClick
  end
  object sbPost: TSpeedButton
    Left = 192
    Top = 224
    Width = 65
    Height = 25
    Caption = 'Post'
    NumGlyphs = 2
    OnClick = sbPostClick
  end
  object edVenNo: TEdit
    Left = 104
    Top = 48
    Width = 89
    Height = 21
    TabOrder = 0
    Text = 'edVenNo'
  end
  object edVenName: TEdit
    Left = 104
    Top = 80
    Width = 209
    Height = 21
    TabOrder = 1
    Text = 'edVenName'
  end
  object edVenAdr: TEdit
    Left = 104
    Top = 112
    Width = 209
    Height = 21
    TabOrder = 2
    Text = 'edVenAdr'
  end
  object edVenCity: TEdit
    Left = 104
    Top = 144
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'edVenCity'
  end
  object edVenPhone: TEdit
    Left = 104
    Top = 176
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'edVenPhone'
  end
  object dbgCusts: TDBGrid
    Left = 352
    Top = 48
    Width = 313
    Height = 201
    DataSource = dsCusts
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object cnMast: TSQLConnection
    ConnectionName = 'IBLocal'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    KeepConnection = False
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'BlobSize=-1'
      'CommitRetain=False'
      'Database=mastsql.gdb'
      'DriverName=Interbase'
      'ErrorResourceFile='
      'LocaleCode=0x0000'
      'Password=masterkey'
      'RoleName=RoleName'
      'ServerCharSet='
      'SQLDialect=1'
      'Interbase TransIsolation=ReadCommited'
      'User_Name=sysdba'
      'WaitOnLocks=True')
    VendorLib = 'GDS32.DLL'
    Left = 8
  end
  object tblVens: TSQLTable
    AfterScroll = tblVensAfterScroll
    MaxBlobSize = -1
    SQLConnection = cnMast
    TableName = 'VENDORS'
    Left = 80
    Top = 256
  end
  object dsVens: TDataSource
    DataSet = tblVens
    Left = 120
    Top = 256
  end
  object dsCusts: TDataSource
    DataSet = sdsCusts
    Left = 488
    Top = 256
  end
  object quUpdate: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'No'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Adr'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'City'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Phone'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Idx'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'UPDATE VENDORS'
      'SET VendorNo = :No,'
      '        VendorName = :Name,'
      '        Address1 = :Adr,'
      '        City = :City,'
      '        Phone = :Phone'
      'WHERE VendorNo = :Idx ')
    SQLConnection = cnMast
    Left = 80
    Top = 288
  end
  object sdsCusts: TSimpleDataSet
    Aggregates = <>
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 456
    Top = 256
  end
end
