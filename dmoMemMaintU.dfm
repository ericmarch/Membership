object dmoMemMaint: TdmoMemMaint
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 316
  Width = 716
  object dstMemCat: TADODataSet
    Connection = dmoConnection.conMembership
    CursorType = ctStatic
    CommandText = 
      'SELECT Card.CardID, CardCat.CardID AS CatCardID, Category.CatID,' +
      ' Category.Obsolete, Category.Code, Category.Description FROM car' +
      'd INNER JOIN CardCat ON card.CardID = CardCat.CardID INNER JOIN ' +
      'Category ON CardCat.CatID = Category.CatID WHERE (card.CardID = ' +
      '1)  AND (Category.Obsolete ='#39'N'#39') ORDER BY Category.Description'
    Parameters = <>
    Left = 207
    Top = 352
  end
  object dst1: TADODataSet
    Connection = dmoConnection.conMembership
    CursorType = ctStatic
    CommandText = 
      'Select PreferredName, Surname, IsInactive, Post1, PostCity, Post' +
      'Mobile1 FROM card'
    Parameters = <>
    Left = 559
    Top = 32
  end
  object dstCategory: TADODataSet
    Connection = dmoConnection.conMembership
    CursorType = ctStatic
    CommandText = 'Select * from Category Order By Description'
    Parameters = <>
    Left = 224
    Top = 32
  end
  object cmd1: TADOCommand
    Connection = dmoConnection.conMembership
    Parameters = <>
    Left = 616
    Top = 32
  end
  object qryMemCat: TADOQuery
    Connection = dmoConnection.conMembership
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT Card.CardID, Category.CatID, Category.Obsolete, Category.' +
        'Code, Category.Description FROM Card INNER JOIN (Category INNER ' +
        'JOIN CardCat ON Category.CatID = CardCat.CatID) ON Card.CardID =' +
        ' CardCat.CardID Order by Category.Code')
    Left = 144
    Top = 32
  end
  object dstReportCard: TADODataSet
    Connection = dmoConnection.conMembership
    CursorType = ctStatic
    AfterScroll = dstReportCardAfterScroll
    CommandText = 
      'SELECT Card.*, CustomFieldNames.*'#13#10'FROM CustomFieldNames INNER J' +
      'OIN Card ON CustomFieldNames.ID = Card.CustFieldNameKey '#13#10'Order ' +
      'By Surname, FirstName'
    Parameters = <>
    Left = 432
    Top = 32
  end
  object dstCustomFieldnames: TADODataSet
    Connection = dmoConnection.conMembership
    CursorType = ctStatic
    CommandText = 'select * From CustomFieldNames'
    Parameters = <>
    Left = 328
    Top = 32
  end
  object dstReportCardCat: TADODataSet
    Connection = dmoConnection.conMembership
    CursorType = ctStatic
    CommandText = 'Select * from qCardCats'
    Parameters = <>
    Left = 432
    Top = 96
  end
  object dstCardSearch: TADODataSet
    Connection = dmoConnection.conMembership
    CursorType = ctStatic
    CommandText = 
      'SELECT CardCode, SurName, FirstName, PreferredName, Post1, PostC' +
      'ity, PostMobile1, IsInactive,  CardID  '#13#10'FROM Card '#13#10'WHERE Card.' +
      'IsInactive = False '#13#10'ORDER BY SurName, FirstName '
    Parameters = <>
    Left = 128
    Top = 96
  end
  object qryCard: TADOQuery
    Active = True
    Connection = dmoConnection.conMembership
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select IsInactive, * FROM Card '
      'WHERE IsInactive = False')
    Left = 48
    Top = 24
  end
  object dstSelectCat1: TADODataSet
    Connection = dmoConnection.conMembership
    CursorType = ctStatic
    CommandText = 
      'SELECT Card.CardID, Category.CatID, Category.Obsolete, Category.' +
      'Code, Category.Description'#13#10'FROM Category INNER JOIN (Card INNER' +
      ' JOIN CardCat ON Card.CardID = CardCat.CardID) ON Category.CatID' +
      ' = CardCat.CatID'#13#10'WHERE (((Category.Obsolete)=False)) '#13#10'ORDER BY' +
      ' Category.Code'
    Parameters = <>
    Left = 232
    Top = 96
  end
  object dstSelectCat2: TADODataSet
    Connection = dmoConnection.conMembership
    CursorType = ctStatic
    CommandText = 
      'SELECT Card.CardID, Category.CatID, Category.Obsolete, Category.' +
      'Code, Category.Description'#13#10'FROM Category INNER JOIN (Card INNER' +
      ' JOIN CardCat ON Card.CardID = CardCat.CardID) ON Category.CatID' +
      ' = CardCat.CatID'#13#10'WHERE (((Category.Obsolete)=False)) '#13#10'ORDER BY' +
      ' Category.Code'
    Parameters = <>
    Left = 328
    Top = 96
  end
  object cds1: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CardID'
        DataType = ftInteger
      end
      item
        Name = 'isSelected'
        DataType = ftInteger
      end
      item
        Name = 'Surname'
        DataType = ftString
        Size = 52
      end
      item
        Name = 'FirstName'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PostCity'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'PostPostCode'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 48
    Top = 96
  end
  object qryMembership: TADOQuery
    Connection = dmoConnection.conMembership
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * From Member')
    Left = 56
    Top = 208
  end
  object dstMembership: TADODataSet
    Connection = dmoConnection.conMembership
    CursorType = ctStatic
    CommandText = 
      'SELECT Member.CardID, Card.CardCode, Card.SurName, Card.Preferre' +
      'dName, Card.IsInactive, Card.PostCity, Card.PostState, MemType.D' +
      'escription, MemStatus.Description, MemGender.Description, MemOcc' +
      'upation.Description, Member.OccupationDetail, Member.Accepted, M' +
      'ember.DOB, Member.MemberType, Member.Status, Member.Gender, Memb' +
      'er.Occupation FROM MemOccupation INNER JOIN (MemGender INNER JOI' +
      'N (MemStatus INNER JOIN (MemType INNER JOIN (Card INNER JOIN Mem' +
      'ber ON Card.CardID = Member.CardID) ON MemType.ID = Member.Membe' +
      'rType) ON MemStatus.ID = Member.Status) ON MemGender.ID = Member' +
      '.Gender) ON MemOccupation.ID = Member.Occupation'
    Parameters = <>
    Left = 152
    Top = 208
  end
  object dstMemType: TADODataSet
    Connection = dmoConnection.conMembership
    CursorType = ctStatic
    CommandText = 'Select * FROM MemType'
    Parameters = <>
    Left = 240
    Top = 208
  end
  object dstMemStatus: TADODataSet
    Connection = dmoConnection.conMembership
    CursorType = ctStatic
    CommandText = 'Select * FROM MemStatus'
    Parameters = <>
    Left = 320
    Top = 208
  end
  object dstMemOccupation: TADODataSet
    Connection = dmoConnection.conMembership
    CursorType = ctStatic
    CommandText = 'Select * From MemOccupation'
    Parameters = <>
    Left = 424
    Top = 208
  end
  object dstMemGender: TADODataSet
    Connection = dmoConnection.conMembership
    CursorType = ctStatic
    CommandText = 'Select * From MemGender'
    Parameters = <>
    Left = 536
    Top = 208
  end
end
