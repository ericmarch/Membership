object fCatMaint: TfCatMaint
  Left = 0
  Top = 0
  Caption = 'Category Maintenance'
  ClientHeight = 411
  ClientWidth = 474
  Color = clBtnFace
  Constraints.MaxHeight = 450
  Constraints.MaxWidth = 490
  Constraints.MinHeight = 450
  Constraints.MinWidth = 490
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object spdBtncatExit: TSpeedButton
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
    OnClick = spdBtncatExitClick
  end
  object spdBtnCatSave: TSpeedButton
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
    OnClick = spdBtnCatSaveClick
  end
  object spdBtnCatDelete: TSpeedButton
    Left = 250
    Top = 5
    Width = 100
    Height = 47
    Caption = 'Delete'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = [seBorder]
    OnClick = spdBtnCatDeleteClick
  end
  object spdBtnCatAdd: TSpeedButton
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
    OnClick = spdBtnCatAddClick
  end
  object Label1: TLabel
    Left = 8
    Top = 58
    Width = 27
    Height = 13
    Caption = 'Name'
  end
  object Label2: TLabel
    Left = 128
    Top = 58
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object Label3: TLabel
    Left = 400
    Top = 58
    Width = 43
    Height = 13
    Caption = 'Obsolete'
  end
  object dbgCategory: TDBGrid
    Left = 6
    Top = 104
    Width = 460
    Height = 225
    TabStop = False
    Constraints.MaxHeight = 225
    Constraints.MaxWidth = 460
    Constraints.MinHeight = 225
    Constraints.MinWidth = 460
    DataSource = dscCatGrid
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Code'
        Title.Caption = 'Name'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 277
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Obsolete'
        Width = 50
        Visible = True
      end>
  end
  object dbeCarName: TDBEdit
    Left = 8
    Top = 77
    Width = 108
    Height = 21
    DataField = 'Code'
    DataSource = dscCatGrid
    TabOrder = 1
  end
  object dbeCatDescription: TDBEdit
    Left = 128
    Top = 77
    Width = 266
    Height = 21
    DataField = 'Description'
    DataSource = dscCatGrid
    TabOrder = 2
  end
  object DBCheckBox1: TDBCheckBox
    Left = 418
    Top = 77
    Width = 20
    Height = 17
    DataField = 'Obsolete'
    DataSource = dscCatGrid
    TabOrder = 3
  end
  object dscCatGrid: TDataSource
    DataSet = dmoCategory.qryCategory
    Left = 184
    Top = 144
  end
end
