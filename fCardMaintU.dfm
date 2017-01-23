object fCardMaint: TfCardMaint
  Left = 0
  Top = 0
  Caption = 'Maintain Membership'
  ClientHeight = 631
  ClientWidth = 1124
  Color = clBtnFace
  Constraints.MinHeight = 670
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
  object spdBtnMemAdd: TSpeedButton
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
    OnClick = spdBtnMemAddClick
  end
  object spdBtnmemCancel: TSpeedButton
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
    OnClick = spdBtnmemCancelClick
  end
  object spdBtnmemExit: TSpeedButton
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
    OnClick = spdBtnmemExitClick
  end
  object spdBtnMemSave: TSpeedButton
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
    OnClick = spdBtnMemSaveClick
  end
  object Label1: TLabel
    Left = 66
    Top = 97
    Width = 42
    Height = 13
    Caption = 'Surname'
  end
  object Label2: TLabel
    Left = 57
    Top = 127
    Width = 51
    Height = 13
    Caption = 'First Name'
  end
  object Label3: TLabel
    Left = 83
    Top = 67
    Width = 25
    Height = 13
    Caption = 'Code'
  end
  object Label6: TLabel
    Left = 414
    Top = 89
    Width = 267
    Height = 54
    Caption = 
      'If adding or changing Name, please save and then select to edit ' +
      'detail.  Else cancel out'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object edtCode: TEdit
    Left = 128
    Top = 64
    Width = 100
    Height = 21
    TabStop = False
    Enabled = False
    TabOrder = 0
    OnKeyUp = edtCodeKeyUp
  end
  object edtSurname: TEdit
    Left = 128
    Top = 97
    Width = 240
    Height = 21
    TabOrder = 1
    OnExit = edtSurnameExit
    OnKeyUp = edtSurnameKeyUp
  end
  object edtFirstName: TEdit
    Left = 128
    Top = 124
    Width = 240
    Height = 21
    TabOrder = 2
    OnExit = edtFirstNameExit
  end
  object dbgSearch: TDBGrid
    Left = 0
    Top = 151
    Width = 1101
    Height = 480
    DataSource = dscCardSearch
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbgSearchDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CardCode'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SurName'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FirstName'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PostCity'
        Title.Caption = 'City'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PostMobile1'
        Title.Caption = 'Main Mobile'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CardID'
        Visible = False
      end>
  end
  object pnlDataEntry: TPanel
    Left = 0
    Top = 151
    Width = 1124
    Height = 480
    Align = alBottom
    TabOrder = 4
    Visible = False
    object Label07: TLabel
      Left = 25
      Top = 41
      Width = 86
      Height = 13
      Caption = 'Emergency Phone'
    end
    object Label08: TLabel
      Left = 17
      Top = 70
      Width = 94
      Height = 13
      Caption = 'Emergency Contact'
    end
    object Label10: TLabel
      Left = 65
      Top = 95
      Width = 111
      Height = 18
      Caption = 'Postal Address'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 368
      Top = 96
      Width = 128
      Height = 18
      Caption = 'Delivery Address'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object label12: TLabel
      Left = 8
      Top = 124
      Width = 39
      Height = 13
      Caption = 'Street 1'
    end
    object label13: TLabel
      Left = 8
      Top = 154
      Width = 39
      Height = 13
      Caption = 'Street 2'
    end
    object Label15: TLabel
      Left = 23
      Top = 214
      Width = 26
      Height = 13
      Caption = 'State'
    end
    object Label14: TLabel
      Left = 28
      Top = 184
      Width = 19
      Height = 13
      Caption = 'City'
    end
    object Label16: TLabel
      Left = 113
      Top = 214
      Width = 46
      Height = 13
      Caption = 'PostCode'
    end
    object Label17: TLabel
      Left = 8
      Top = 274
      Width = 39
      Height = 13
      Caption = 'Mobile 1'
    end
    object Label18: TLabel
      Left = 25
      Top = 304
      Width = 22
      Height = 13
      Caption = 'Who'
    end
    object LabelPostPhone: TLabel
      Left = 65
      Top = 245
      Width = 117
      Height = 18
      Caption = 'Phone Numbers'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelDelivPhone: TLabel
      Left = 368
      Top = 245
      Width = 185
      Height = 18
      Caption = 'Delivery Phone Numbers'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label20: TLabel
      Left = 25
      Top = 364
      Width = 22
      Height = 13
      Caption = 'Who'
    end
    object Label19: TLabel
      Left = 8
      Top = 334
      Width = 39
      Height = 13
      Caption = 'Mobile 2'
    end
    object Label21: TLabel
      Left = 2
      Top = 394
      Width = 45
      Height = 13
      Caption = 'Land Line'
    end
    object Label22: TLabel
      Left = 2
      Top = 421
      Width = 69
      Height = 13
      Caption = 'Email at Postal'
    end
    object Label23: TLabel
      Left = 2
      Top = 450
      Width = 79
      Height = 13
      Caption = 'Email at Delivery'
    end
    object Label09: TLabel
      Left = 696
      Top = 4
      Width = 160
      Height = 13
      Caption = 'Double Click Category to delete it'
    end
    object Label24: TLabel
      Left = 649
      Top = 104
      Width = 120
      Height = 13
      Caption = 'Select Drop Down to Add'
    end
    object dbtCustomFld1Name: TDBText
      Left = 645
      Top = 134
      Width = 104
      Height = 17
      Alignment = taRightJustify
      DataField = '1Description'
      DataSource = dscCustomFldNames
    end
    object dbtCustomFld2Name: TDBText
      Left = 645
      Top = 161
      Width = 104
      Height = 17
      Alignment = taRightJustify
      DataField = '2Description'
      DataSource = dscCustomFldNames
    end
    object dbtCustomFld3Name: TDBText
      Left = 645
      Top = 190
      Width = 104
      Height = 17
      Alignment = taRightJustify
      DataField = '3Description'
      DataSource = dscCustomFldNames
    end
    object Label5: TLabel
      Left = 32
      Top = 13
      Width = 76
      Height = 13
      Caption = 'Preferred Name'
    end
    object lblPhoneWarning: TLabel
      Left = 183
      Top = 268
      Width = 163
      Height = 26
      Caption = 'Must exit a phone number before you can save a record'
      Visible = False
      WordWrap = True
    end
    object dbCheckIsPerson: TDBCheckBox
      Left = 251
      Top = 12
      Width = 78
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Is Person'
      DataField = 'IsPerson'
      DataSource = dscCard
      TabOrder = 1
    end
    object dbCheckIsInactive: TDBCheckBox
      Left = 354
      Top = 12
      Width = 78
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Is Inactive'
      DataField = 'IsInactive'
      DataSource = dscCard
      TabOrder = 2
    end
    object dbeEmergencyPhone: TDBEdit
      Left = 128
      Top = 38
      Width = 110
      Height = 21
      DataField = 'EmergencyPhone'
      DataSource = dscCard
      TabOrder = 4
      OnEnter = dbeEmergencyPhoneEnter
      OnExit = dbeEmergencyPhoneExit
    end
    object dbeEmergencyCont: TDBEdit
      Left = 128
      Top = 67
      Width = 110
      Height = 21
      DataField = 'EmergencyContact'
      DataSource = dscCard
      TabOrder = 5
    end
    object dbRichCardNote: TDBRichEdit
      Left = 640
      Top = 213
      Width = 446
      Height = 254
      Align = alCustom
      DataField = 'CardNote'
      DataSource = dscCard
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TabOrder = 29
      Zoom = 100
    end
    object dbePost1: TDBEdit
      Left = 53
      Top = 122
      Width = 280
      Height = 21
      DataField = 'Post1'
      DataSource = dscCard
      TabOrder = 6
    end
    object dbePost2: TDBEdit
      Left = 53
      Top = 150
      Width = 280
      Height = 21
      DataField = 'Post2'
      DataSource = dscCard
      TabOrder = 7
    end
    object dbePostState: TDBEdit
      Left = 53
      Top = 210
      Width = 42
      Height = 21
      DataField = 'PostState'
      DataSource = dscCard
      TabOrder = 9
    end
    object dbePostPostCode: TDBEdit
      Left = 168
      Top = 210
      Width = 107
      Height = 21
      DataField = 'PostPostCode'
      DataSource = dscCard
      TabOrder = 10
    end
    object dbeDelivPostCode: TDBEdit
      Left = 469
      Top = 210
      Width = 107
      Height = 21
      DataField = 'DelivPostCode'
      DataSource = dscCard
      TabOrder = 22
    end
    object dbeDelivState: TDBEdit
      Left = 354
      Top = 210
      Width = 42
      Height = 21
      DataField = 'DelivState'
      DataSource = dscCard
      TabOrder = 21
    end
    object dbeDeliv2: TDBEdit
      Left = 354
      Top = 150
      Width = 280
      Height = 21
      DataField = 'Deliv2'
      DataSource = dscCard
      TabOrder = 19
    end
    object dbeDeliv1: TDBEdit
      Left = 354
      Top = 120
      Width = 280
      Height = 21
      DataField = 'Deliv1'
      DataSource = dscCard
      TabOrder = 18
    end
    object dbePostCity: TDBEdit
      Left = 53
      Top = 180
      Width = 280
      Height = 21
      DataField = 'PostCity'
      DataSource = dscCard
      TabOrder = 8
    end
    object dbeDelivCity: TDBEdit
      Left = 354
      Top = 180
      Width = 280
      Height = 21
      DataField = 'DelivCity'
      DataSource = dscCard
      TabOrder = 20
    end
    object dbePostMobil1Who: TDBEdit
      Left = 53
      Top = 300
      Width = 280
      Height = 21
      DataField = 'PostMobile1Who'
      DataSource = dscCard
      TabOrder = 12
    end
    object dbePostMobile1: TDBEdit
      Left = 53
      Top = 269
      Width = 107
      Height = 21
      DataField = 'PostMobile1'
      DataSource = dscCard
      TabOrder = 11
      OnEnter = dbePostMobile1Enter
      OnExit = dbePostMobile1Exit
    end
    object dbeDelivMobile1: TDBEdit
      Left = 354
      Top = 269
      Width = 107
      Height = 21
      DataField = 'DelivMobile1'
      DataSource = dscCard
      TabOrder = 23
      OnEnter = dbeDelivMobile1Enter
      OnExit = dbeDelivMobile1Exit
    end
    object dbeDelivMobile1Who: TDBEdit
      Left = 354
      Top = 300
      Width = 280
      Height = 21
      DataField = 'DelivMobile1Who'
      DataSource = dscCard
      TabOrder = 24
    end
    object dbePostMobile2: TDBEdit
      Left = 53
      Top = 330
      Width = 107
      Height = 21
      DataField = 'PostMobile2'
      DataSource = dscCard
      TabOrder = 13
      OnEnter = dbePostMobile2Enter
      OnExit = dbePostMobile2Exit
    end
    object dbePostMobile2Who: TDBEdit
      Left = 53
      Top = 360
      Width = 280
      Height = 21
      DataField = 'PostMobile2Who'
      DataSource = dscCard
      TabOrder = 14
    end
    object dbeDelivMobile2: TDBEdit
      Left = 354
      Top = 330
      Width = 107
      Height = 21
      DataField = 'DelivMobile2'
      DataSource = dscCard
      TabOrder = 25
      OnEnter = dbeDelivMobile2Enter
      OnExit = dbeDelivMobile2Exit
    end
    object dbeDelivMobile2Who: TDBEdit
      Left = 354
      Top = 360
      Width = 280
      Height = 21
      DataField = 'DelivMobile2Who'
      DataSource = dscCard
      TabOrder = 26
    end
    object dbeDelivLandLine: TDBEdit
      Left = 354
      Top = 390
      Width = 107
      Height = 21
      DataField = 'DelivLandLine'
      DataSource = dscCard
      TabOrder = 27
      OnEnter = dbeDelivLandLineEnter
      OnExit = dbeDelivLandLineExit
    end
    object dbePostLandLine: TDBEdit
      Left = 53
      Top = 390
      Width = 107
      Height = 21
      DataField = 'PostLandLine'
      DataSource = dscCard
      TabOrder = 15
      OnEnter = dbePostLandLineEnter
      OnExit = dbePostLandLineExit
    end
    object dbePostEmail: TDBEdit
      Left = 89
      Top = 417
      Width = 545
      Height = 21
      DataField = 'PostEmail'
      DataSource = dscCard
      TabOrder = 16
    end
    object dbeDelivEmail: TDBEdit
      Left = 89
      Top = 446
      Width = 545
      Height = 21
      DataField = 'DelivEmail'
      DataSource = dscCard
      TabOrder = 17
    end
    object DBLookupComboBoxMemCategory: TDBLookupComboBox
      Left = 788
      Top = 100
      Width = 233
      Height = 21
      KeyField = 'CatID'
      ListField = 'Description'
      ListSource = dscCategory
      TabOrder = 28
      OnClick = DBLookupComboBoxMemCategoryClick
    end
    object DBLookupListBox1: TDBLookupListBox
      Left = 755
      Top = 26
      Width = 329
      Height = 69
      KeyField = 'CatID'
      ListField = 'Description'
      ListSource = dscMemCat
      TabOrder = 31
      TabStop = False
      OnDblClick = DBLookupListBox1DblClick
    end
    object StaticText1: TStaticText
      Left = 339
      Top = 93
      Width = 17
      Height = 23
      Caption = '>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 30
      TabStop = True
      OnClick = StaticText1Click
    end
    object cbxMobile: TCheckBox
      Left = 245
      Top = 40
      Width = 49
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Mobile'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object dbeCustomField1: TDBEdit
      Left = 755
      Top = 129
      Width = 330
      Height = 21
      DataField = 'CustomField1'
      DataSource = dscCard
      TabOrder = 32
    end
    object dbeCustomField2: TDBEdit
      Left = 755
      Top = 157
      Width = 330
      Height = 21
      DataField = 'CustomField2'
      DataSource = dscCard
      TabOrder = 33
    end
    object dbeCustomField3: TDBEdit
      Left = 755
      Top = 184
      Width = 330
      Height = 21
      DataField = 'CustomField3'
      DataSource = dscCard
      TabOrder = 34
    end
    object dbePreferredName: TDBEdit
      Left = 128
      Top = 10
      Width = 110
      Height = 21
      DataField = 'PreferredName'
      DataSource = dscCard
      TabOrder = 0
    end
  end
  object cbxShowInactive: TCheckBox
    Left = 250
    Top = 64
    Width = 175
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Include Inactive Cards in search'
    TabOrder = 5
    OnClick = cbxShowInactiveClick
  end
  object dscMemCat: TDataSource
    DataSet = dmoMemMaint.dstMemCat
    Left = 773
    Top = 65535
  end
  object dscCard: TDataSource
    DataSet = dmoMemMaint.qryCard
    Left = 520
  end
  object dscCategory: TDataSource
    DataSet = dmoMemMaint.dstCategory
    Left = 680
  end
  object dscCustomFldNames: TDataSource
    DataSet = dmoMemMaint.dstCustomFieldnames
    Left = 712
    Top = 424
  end
  object dscCardSearch: TDataSource
    DataSet = dmoMemMaint.dstCardSearch
    Left = 592
  end
end
