object dmoItem: TdmoItem
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 150
  Width = 215
  object qryItem: TADOQuery
    Connection = dmoConnection.conMembership
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Item')
    Left = 32
    Top = 32
    object qryItemItemID: TIntegerField
      FieldName = 'ItemID'
    end
    object qryItemItemCode: TWideStringField
      FieldName = 'ItemCode'
      Size = 50
    end
    object qryItemIsInactive: TBooleanField
      FieldName = 'IsInactive'
    end
    object qryItemDescription: TWideStringField
      FieldName = 'Description'
      Size = 150
    end
    object qryItemIsSold: TBooleanField
      FieldName = 'IsSold'
    end
    object qryItemIsBought: TBooleanField
      FieldName = 'IsBought'
    end
    object qryItemIsInventoried: TBooleanField
      FieldName = 'IsInventoried'
    end
    object qryItemSellCost: TBCDField
      FieldName = 'SellCost'
      currency = True
      Precision = 19
    end
    object qryItemBuyCost: TBCDField
      FieldName = 'BuyCost'
      currency = True
      Precision = 19
    end
  end
  object dstGrid: TADODataSet
    Connection = dmoConnection.conMembership
    CursorType = ctStatic
    CommandText = 'Select * From Item'
    Parameters = <>
    Left = 128
    Top = 32
    object dstGridItemID: TIntegerField
      FieldName = 'ItemID'
    end
    object dstGridItemCode: TWideStringField
      FieldName = 'ItemCode'
      Size = 50
    end
    object dstGridIsInactive: TBooleanField
      FieldName = 'IsInactive'
    end
    object dstGridDescription: TWideStringField
      FieldName = 'Description'
      Size = 150
    end
    object dstGridIsSold: TBooleanField
      FieldName = 'IsSold'
    end
    object dstGridIsBought: TBooleanField
      FieldName = 'IsBought'
    end
    object dstGridIsInventoried: TBooleanField
      FieldName = 'IsInventoried'
    end
    object dstGridSellCost: TBCDField
      FieldName = 'SellCost'
      currency = True
      Precision = 19
    end
    object dstGridBuyCost: TBCDField
      FieldName = 'BuyCost'
      currency = True
      Precision = 19
    end
  end
end
