object dmoCardCom: TdmoCardCom
  OldCreateOrder = False
  Height = 314
  Width = 772
  object dstCard: TADODataSet
    Connection = dmoConnection.conMembership
    CursorType = ctStatic
    CommandText = 'Select * From Card'
    Parameters = <>
    Left = 208
    Top = 64
  end
end
