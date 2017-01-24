object fInvoice: TfInvoice
  Left = 0
  Top = 0
  ClientHeight = 480
  ClientWidth = 947
  Color = clBtnFace
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
  object Label1: TLabel
    Left = 32
    Top = 60
    Width = 46
    Height = 13
    Caption = 'Customer'
  end
  object lblPostAddr: TLabel
    Left = 39
    Top = 88
    Width = 39
    Height = 13
    Caption = 'Address'
  end
  object lblShipTo: TLabel
    Left = 303
    Top = 88
    Width = 35
    Height = 13
    Caption = 'Ship To'
  end
  object spdBtnInvExit: TSpeedButton
    Left = 252
    Top = 2
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
    OnClick = spdBtnInvExitClick
  end
  object spdBtnInvCancel: TSpeedButton
    Left = 130
    Top = 2
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
    OnClick = spdBtnInvCancelClick
  end
  object spdBtnInvRecord: TSpeedButton
    Left = 8
    Top = 2
    Width = 100
    Height = 47
    Caption = 'Record'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = [seBorder]
  end
  object dblucbCustomer: TDBLookupComboBox
    Left = 84
    Top = 57
    Width = 217
    Height = 21
    DataField = 'CardID'
    DataSource = dscInvoice
    KeyField = 'Card.CardID'
    ListField = 'CustAbbrev'
    ListSource = dscCustomer
    TabOrder = 0
    OnExit = dblucbCustomerExit
  end
  object lbledtInvNumber: TLabeledEdit
    Left = 744
    Top = 24
    Width = 121
    Height = 27
    Ctl3D = True
    EditLabel.Width = 138
    EditLabel.Height = 19
    EditLabel.Caption = 'Invoice Number  '
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -16
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    LabelPosition = lpLeft
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    Text = 'Not Recorded'
  end
  object ListBoxAddress: TListBox
    Left = 84
    Top = 88
    Width = 189
    Height = 97
    ItemHeight = 13
    TabOrder = 2
  end
  object ListBoxShipTo: TListBox
    Left = 344
    Top = 88
    Width = 189
    Height = 97
    ItemHeight = 13
    TabOrder = 3
  end
  object dscCustomer: TDataSource
    DataSet = dmoInvoice.dstCustomer
    Left = 664
    Top = 40
  end
  object dscInvoice: TDataSource
    DataSet = dmoInvoice.qryInvoice
    Left = 472
    Top = 16
  end
end
