object fMemMaint: TfMemMaint
  Left = 0
  Top = 0
  ClientHeight = 301
  ClientWidth = 754
  Color = clBtnFace
  Constraints.MaxHeight = 340
  Constraints.MaxWidth = 770
  Constraints.MinWidth = 770
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
  object spdBtnMemMaintExit: TSpeedButton
    Left = 368
    Top = 8
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
    OnClick = spdBtnMemMaintExitClick
  end
  object spdBtnMemMaintCancel: TSpeedButton
    Left = 250
    Top = 8
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
    OnClick = spdBtnMemMaintCancelClick
  end
  object spdBtnMemMaintSave: TSpeedButton
    Left = 128
    Top = 8
    Width = 100
    Height = 47
    Caption = 'Save'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = [seBorder]
    OnClick = spdBtnMemMaintSaveClick
  end
  object spdBtnMemMaintAdd: TSpeedButton
    Left = 8
    Top = 8
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
    OnClick = spdBtnMemMaintAddClick
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 88
    Width = 770
    Height = 330
    Constraints.MaxHeight = 330
    Constraints.MaxWidth = 770
    Constraints.MinHeight = 330
    Constraints.MinWidth = 770
    DataSource = dscGrid
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'IsInactive'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SurName'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PreferredName'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PostCity'
        Title.Caption = 'City'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PostState'
        Title.Caption = 'State'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MemType.Description'
        Title.Caption = 'Membership Type'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MemStatus.Description'
        Title.Caption = 'Status'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MemGender.Description'
        Title.Caption = 'Gender'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Accepted'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOB'
        Width = 70
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 61
    Width = 754
    Height = 240
    Align = alBottom
    Constraints.MaxHeight = 240
    Constraints.MinHeight = 240
    TabOrder = 1
    Visible = False
    object Label1: TLabel
      Left = 82
      Top = 19
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Accepted'
    end
    object Label2: TLabel
      Left = 79
      Top = 46
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = 'Birth Date'
      Transparent = False
    end
    object Label3: TLabel
      Left = 103
      Top = 73
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Type'
      Transparent = False
    end
    object Label4: TLabel
      Left = 96
      Top = 99
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Status'
      Transparent = False
    end
    object Label5: TLabel
      Left = 72
      Top = 128
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'Occupation'
      Transparent = False
    end
    object Label6: TLabel
      Left = 43
      Top = 154
      Width = 84
      Height = 13
      Alignment = taRightJustify
      Caption = 'Occupation Detail'
      Transparent = False
    end
    object dbtPreferredName: TDBText
      Left = 321
      Top = 19
      Width = 65
      Height = 17
      Alignment = taRightJustify
      DataField = 'PreferredName'
      DataSource = dsc1
    end
    object dbtSurname: TDBText
      Left = 401
      Top = 19
      Width = 65
      Height = 17
      DataField = 'SurName'
      DataSource = dsc1
    end
    object dbtPost1: TDBText
      Left = 368
      Top = 38
      Width = 145
      Height = 17
      DataField = 'Post1'
      DataSource = dsc1
    end
    object dbtCity: TDBText
      Left = 368
      Top = 57
      Width = 150
      Height = 17
      DataField = 'PostCity'
      DataSource = dsc1
    end
    object DBText1: TDBText
      Left = 368
      Top = 76
      Width = 145
      Height = 17
      DataField = 'PostMobile1'
      DataSource = dsc1
    end
    object Label7: TLabel
      Left = 91
      Top = 179
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Gender'
      Transparent = False
    end
    object DateTimePickerJoined: TDateTimePicker
      Left = 152
      Top = 16
      Width = 76
      Height = 21
      Date = 17199.000000000000000000
      Time = 17199.000000000000000000
      TabOrder = 0
    end
    object DateTimePickerDOB: TDateTimePicker
      Left = 152
      Top = 43
      Width = 76
      Height = 21
      Date = 42754.000000000000000000
      Time = 42754.000000000000000000
      TabOrder = 1
    end
    object dblucbType: TDBLookupComboBox
      Left = 152
      Top = 70
      Width = 145
      Height = 21
      DataField = 'MemberType'
      DataSource = dscqryUpdate
      KeyField = 'ID'
      ListField = 'Description'
      ListSource = dscMemType
      TabOrder = 2
    end
    object dblucbStatus: TDBLookupComboBox
      Left = 152
      Top = 97
      Width = 145
      Height = 21
      DataField = 'Status'
      DataSource = dscqryUpdate
      KeyField = 'ID'
      ListField = 'Description'
      ListSource = dscMemStatus
      TabOrder = 3
    end
    object DBEdit1: TDBEdit
      Left = 152
      Top = 151
      Width = 425
      Height = 21
      DataField = 'OccupationDetail'
      DataSource = dscqryUpdate
      TabOrder = 4
    end
    object dblucbOccupation: TDBLookupComboBox
      Left = 152
      Top = 124
      Width = 145
      Height = 21
      DataField = 'Occupation'
      DataSource = dscqryUpdate
      KeyField = 'ID'
      ListField = 'Description'
      ListSource = dscMemOccupation
      TabOrder = 5
    end
    object dblucbGender: TDBLookupComboBox
      Left = 152
      Top = 178
      Width = 145
      Height = 21
      DataField = 'Gender'
      DataSource = dscqryUpdate
      KeyField = 'ID'
      ListField = 'Description'
      ListSource = dscGender
      TabOrder = 6
    end
  end
  object dscGrid: TDataSource
    DataSet = dmoMemMaint.dstMembership
    Left = 528
    Top = 27
  end
  object dscqryUpdate: TDataSource
    DataSet = dmoMemMaint.qryMembership
    Left = 536
    Top = 88
  end
  object dscMemType: TDataSource
    DataSet = dmoMemMaint.dstMemType
    Left = 272
    Top = 121
  end
  object dscMemStatus: TDataSource
    DataSet = dmoMemMaint.dstMemStatus
    Left = 320
    Top = 169
  end
  object dscMemOccupation: TDataSource
    DataSet = dmoMemMaint.dstMemOccupation
    Left = 392
    Top = 185
  end
  object dscGender: TDataSource
    DataSet = dmoMemMaint.dstMemGender
    Left = 376
    Top = 233
  end
  object dsc1: TDataSource
    DataSet = dmoMemMaint.dstCardSearch
    Left = 680
    Top = 113
  end
end
