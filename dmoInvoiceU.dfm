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
    Left = 80
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
      'SELECT Card.CardID, Member.CardID, Card.FirstName, Card.SurName,' +
      ' Card.Post1, Card.Post2, Card.PostCity, Card.PostState, Card.Pos' +
      'tPostCode, [SurName]+" "+[FirstName]+" "+[PostCity] AS CustAbbre' +
      'v, '#13#10'Deliv1, Deliv2, DelivCity, DelivState, DelivPostCode'#13#10'FROM ' +
      'Card INNER JOIN Member ON Card.CardID = Member.CardID'#13#10'ORDER BY ' +
      '[SurName]+" "+[FirstName]+" "+[PostCity]'
    Parameters = <>
    Left = 192
    Top = 144
  end
  object dstInvoice: TADODataSet
    Connection = dmoConnection.conMembership
    Parameters = <>
    Left = 64
    Top = 152
  end
end
