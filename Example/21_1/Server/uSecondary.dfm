object Secondary: TSecondary
  OldCreateOrder = False
  Left = 446
  Top = 283
  Height = 165
  Width = 304
  object dbMastApp: TIBDatabase
    DatabaseName = 'C:\Program Files\Common Files\Borland Shared\Data\Mastsql.gdb'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = MastAppTrans
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    Left = 32
    Top = 16
  end
  object MastAppTrans: TIBTransaction
    Active = False
    AutoStopAction = saNone
    Left = 32
    Top = 64
  end
  object tblVendors: TIBTable
    Database = dbMastApp
    Transaction = MastAppTrans
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'VENDORNO'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'VENDORNAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ADDRESS1'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ADDRESS2'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CITY'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'STATE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ZIP'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'COUNTRY'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'PHONE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'FAX'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'PREFERRED'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY4'
        Fields = 'VENDORNO'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'VENDORS'
    Left = 120
    Top = 16
  end
  object tblParts: TIBTable
    Database = dbMastApp
    Transaction = MastAppTrans
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'PARTNO'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'VENDORNO'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'DESCRIPTION'
        Attributes = [faRequired]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONHAND'
        DataType = ftFloat
      end
      item
        Name = 'ONORDER'
        DataType = ftFloat
      end
      item
        Name = 'COST'
        DataType = ftFloat
      end
      item
        Name = 'LISTPRICE'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY23'
        Fields = 'PARTNO'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN35'
        Fields = 'VENDORNO'
      end
      item
        Name = 'VENDORNO'
        Fields = 'VENDORNO'
      end
      item
        Name = 'DESCRIPTION'
        Fields = 'DESCRIPTION'
      end>
    IndexFieldNames = 'VENDORNO'
    MasterFields = 'VENDORNO'
    MasterSource = dsVendors
    StoreDefs = True
    TableName = 'PARTS'
    Left = 120
    Top = 64
  end
  object dsVendors: TDataSource
    DataSet = tblVendors
    Left = 232
    Top = 16
  end
  object dspVendors: TDataSetProvider
    DataSet = tblVendors
    Constraints = True
    Left = 176
    Top = 16
  end
  object dspParts: TDataSetProvider
    DataSet = tblParts
    Constraints = True
    Left = 176
    Top = 64
  end
end
