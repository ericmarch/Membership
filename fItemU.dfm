object fItem: TfItem
  Left = 0
  Top = 0
  Caption = 'Items'
  ClientHeight = 481
  ClientWidth = 814
  Color = clBtnFace
  Constraints.MaxHeight = 520
  Constraints.MaxWidth = 830
  Constraints.MinHeight = 520
  Constraints.MinWidth = 830
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object spdBtnItemExit: TSpeedButton
    Left = 368
    Top = 5
    Width = 100
    Height = 47
    Caption = 'Exit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = [seBorder]
    OnClick = spdBtnItemExitClick
  end
  object spdBtnItemCancel: TSpeedButton
    Left = 250
    Top = 5
    Width = 100
    Height = 47
    Caption = 'Cancel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = [seBorder]
    OnClick = spdBtnItemCancelClick
  end
  object spdBtnItemSave: TSpeedButton
    Left = 128
    Top = 5
    Width = 100
    Height = 47
    Caption = 'Save'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = [seBorder]
    OnClick = spdBtnItemSaveClick
  end
  object spdBtnItemAdd: TSpeedButton
    Left = 8
    Top = 5
    Width = 100
    Height = 47
    Caption = 'Add'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = [seBorder]
    OnClick = spdBtnItemAddClick
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 80
    Width = 1097
    Height = 393
    DataSource = dscGrid
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 80
    Width = 814
    Height = 401
    Align = alBottom
    TabOrder = 1
    Visible = False
    object Label1: TLabel
      Left = 72
      Top = 34
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'Code'
    end
    object Label2: TLabel
      Left = 44
      Top = 74
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Description'
    end
    object Label3: TLabel
      Left = 56
      Top = 194
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sell Cost'
    end
    object Label4: TLabel
      Left = 54
      Top = 234
      Width = 43
      Height = 13
      Alignment = taRightJustify
      Caption = 'Buy Cost'
    end
    object DBEdit1: TDBEdit
      Left = 128
      Top = 30
      Width = 121
      Height = 21
      DataField = 'ItemCode'
      DataSource = dscItem
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 128
      Top = 70
      Width = 492
      Height = 21
      DataField = 'Description'
      DataSource = dscItem
      TabOrder = 1
    end
    object DBCheckBox1: TDBCheckBox
      Left = 270
      Top = 30
      Width = 97
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Is Inactive'
      DataField = 'IsInactive'
      DataSource = dscItem
      TabOrder = 2
    end
    object DBCheckBox2: TDBCheckBox
      Left = 44
      Top = 110
      Width = 97
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Is Sold'
      DataField = 'IsSold'
      DataSource = dscItem
      TabOrder = 3
    end
    object DBCheckBox3: TDBCheckBox
      Left = 44
      Top = 150
      Width = 97
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Is Bought'
      DataField = 'IsBought'
      DataSource = dscItem
      TabOrder = 4
    end
    object DBEdit3: TDBEdit
      Left = 128
      Top = 190
      Width = 121
      Height = 21
      DataField = 'SellCost'
      DataSource = dscItem
      TabOrder = 5
    end
    object DBEdit4: TDBEdit
      Left = 128
      Top = 230
      Width = 121
      Height = 21
      DataField = 'BuyCost'
      DataSource = dscItem
      TabOrder = 6
    end
  end
  object dscGrid: TDataSource
    DataSet = dmoItem.dstGrid
    Left = 528
    Top = 24
  end
  object dscItem: TDataSource
    DataSet = dmoItem.qryItem
    Left = 528
    Top = 80
  end
end
