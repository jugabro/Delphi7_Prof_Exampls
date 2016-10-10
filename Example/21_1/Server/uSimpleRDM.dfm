object SimpleRDM: TSimpleRDM
  OldCreateOrder = False
  Left = 192
  Top = 107
  Height = 183
  Width = 277
  object dbMastApp: TDatabase
    AliasName = 'DBDEMOS'
    DatabaseName = 'MastApp'
    KeepConnection = False
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=SYSDBA'
      'PASSWORD=masterkey')
    SessionName = 'Default'
    Left = 24
    Top = 8
  end
  object tblEmplyees: TTable
    DatabaseName = 'MastApp'
    TableName = 'employee.db'
    Left = 112
    Top = 8
  end
  object dspEmployees: TDataSetProvider
    DataSet = tblEmplyees
    Constraints = True
    Left = 192
    Top = 8
  end
  object tblOrders: TTable
    DatabaseName = 'MastApp'
    IndexName = 'CustNo'
    MasterFields = 'CustNo'
    TableName = 'orders.db'
    Left = 112
    Top = 104
  end
  object dspOrders: TDataSetProvider
    DataSet = tblOrders
    Constraints = True
    Left = 192
    Top = 104
  end
  object dspCustomers: TDataSetProvider
    DataSet = tblCustomers
    Constraints = True
    Left = 192
    Top = 56
  end
  object tblCustomers: TTable
    DatabaseName = 'MastApp'
    TableName = 'customer.db'
    Left = 112
    Top = 56
  end
end
