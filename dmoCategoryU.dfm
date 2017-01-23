object dmoCategory: TdmoCategory
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 276
  Width = 430
  object dst1: TADODataSet
    Connection = dmoConnection.conMembership
    CursorType = ctStatic
    LockType = ltPessimistic
    CommandText = 'Select CatID, Code, Description, Obsolete  From Category'
    Parameters = <>
    Left = 192
    Top = 112
  end
  object cmdCategory: TADOCommand
    Connection = dmoConnection.conMembership
    Parameters = <>
    Left = 264
    Top = 112
  end
  object qryCategory: TADOQuery
    Connection = dmoConnection.conMembership
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select CatID, Code, Description, Obsolete  From Category Order b' +
        'y Code')
    Left = 88
    Top = 112
  end
end
