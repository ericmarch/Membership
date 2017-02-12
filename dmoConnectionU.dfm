object dmoConnection: TdmoConnection
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 116
  Width = 179
  object conMembership: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\Er' +
      'ikViking\ErikData.mdb;Mode=Share Deny None;Persist Security Info' +
      '=False;Jet OLEDB:System database="";Jet OLEDB:Registry Path="";J' +
      'et OLEDB:Database Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:' +
      'Database Locking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet ' +
      'OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Database Password' +
      '="";Jet OLEDB:Create System Database=False;Jet OLEDB:Encrypt Dat' +
      'abase=False;Jet OLEDB:Don'#39't Copy Locale on Compact=False;Jet OLE' +
      'DB:Compact Without Replica Repair=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    BeforeConnect = conMembershipBeforeConnect
    Left = 72
    Top = 32
  end
end
