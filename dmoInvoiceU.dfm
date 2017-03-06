object dmoInvoice: TdmoInvoice
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 322
  Width = 695
  object qryInvoice: TADOQuery
    Connection = dmoConnection.conMembership
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * FROM Invoice')
    Left = 64
    Top = 64
  end
  object qryInvLine: TADOQuery
    Connection = dmoConnection.conMembership
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * FROM InvLine')
    Left = 192
    Top = 64
  end
  object dstCustomer: TADODataSet
    Connection = dmoConnection.conMembership
    CursorType = ctStatic
    CommandText = 
      'SELECT Card.CardID, Member.CardID, FirstName, SurName, Card.Post' +
      '1, Card.Post2, Card.PostCity, Card.PostState, Card.PostPostCode,' +
      ' [SurName]+" "+[FirstName]+" "+[PostCity] AS CustAbbrev, '#13#10'Deliv' +
      '1, Deliv2, DelivCity, DelivState, DelivPostCode'#13#10'FROM Card INNER' +
      ' JOIN Member ON Card.CardID = Member.CardID'#13#10'ORDER BY [SurName]+' +
      '" "+[FirstName]+" "+[PostCity]'
    Parameters = <>
    Left = 192
    Top = 144
  end
  object dstInvoice: TADODataSet
    Connection = dmoConnection.conMembership
    CommandText = 'Select * From Invoice'
    Parameters = <>
    Left = 64
    Top = 152
  end
  object dstItem: TADODataSet
    Connection = dmoConnection.conMembership
    CommandText = 'Select ItemID, ItemCode, IsInactive, Description FROM Item'
    Parameters = <>
    Left = 320
    Top = 144
  end
  object qryInvLineTMP: TADOQuery
    Connection = dmoConnection.conMembership
    Parameters = <>
    SQL.Strings = (
      'Select TOP 1 InvID FROM InvLineTmp Order by InvID Desc')
    Left = 320
    Top = 64
  end
  object ADOCommand1: TADOCommand
    Connection = dmoConnection.conMembership
    Parameters = <>
    Left = 72
    Top = 232
  end
end
