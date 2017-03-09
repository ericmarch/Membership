object fInvoice: TfInvoice
  Left = 0
  Top = 0
  ClientHeight = 481
  ClientWidth = 984
  Color = clBtnFace
  Constraints.MaxHeight = 520
  Constraints.MaxWidth = 1000
  Constraints.MinHeight = 520
  Constraints.MinWidth = 1000
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
  object lblCustomer: TLabel
    Left = 380
    Top = 7
    Width = 46
    Height = 13
    Caption = 'Customer'
  end
  object lblPostAddr: TLabel
    Left = 39
    Top = 68
    Width = 39
    Height = 13
    Caption = 'Address'
  end
  object lblShipTo: TLabel
    Left = 303
    Top = 68
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
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = [seBorder]
    OnClick = spdBtnInvRecordClick
  end
  object lblShipTo1: TLabel
    Left = 546
    Top = 71
    Width = 91
    Height = 13
    Caption = 'Surname/Company'
    Visible = False
  end
  object lblFirstName: TLabel
    Left = 546
    Top = 91
    Width = 51
    Height = 13
    Caption = 'First Name'
    Visible = False
  end
  object lblDelivAddress: TLabel
    Left = 546
    Top = 110
    Width = 48
    Height = 13
    Caption = 'Address 1'
    Visible = False
  end
  object dblucbCustomer: TDBLookupComboBox
    Left = 380
    Top = 26
    Width = 217
    Height = 21
    DataField = 'CardID'
    KeyField = 'Card.CardID'
    ListField = 'CustAbbrev'
    ListSource = dscCustomer
    TabOrder = 0
    OnExit = dblucbCustomerExit
  end
  object lbledtInvNumber: TLabeledEdit
    Left = 754
    Top = 22
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
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    Text = 'Not Recorded'
  end
  object ListBoxAddress: TListBox
    Left = 84
    Top = 68
    Width = 189
    Height = 97
    ItemHeight = 13
    TabOrder = 2
  end
  object ListBoxShipTo: TListBox
    Left = 344
    Top = 68
    Width = 189
    Height = 97
    ItemHeight = 13
    TabOrder = 3
    OnEnter = ListBoxShipToEnter
  end
  object DateTimePicker1: TDateTimePicker
    Left = 643
    Top = 28
    Width = 78
    Height = 21
    Date = 0.871474814812245400
    Time = 0.871474814812245400
    TabOrder = 4
  end
  object Panel1: TPanel
    Left = 0
    Top = 201
    Width = 984
    Height = 280
    Align = alBottom
    TabOrder = 5
    object stgInvLine: TStringGrid
      Left = 1
      Top = 1
      Width = 982
      Height = 278
      Align = alClient
      ColCount = 6
      DefaultColWidth = 100
      FixedCols = 0
      RowCount = 2
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs]
      ScrollBars = ssVertical
      TabOrder = 0
      OnSelectCell = stgInvLineSelectCell
      ColWidths = (
        100
        100
        100
        100
        100
        100)
      RowHeights = (
        24
        24)
    end
    object cbxItemCode: TComboBox
      Left = 106
      Top = 32
      Width = 102
      Height = 21
      TabOrder = 1
      Text = 'cbxItemCode'
      Visible = False
      OnChange = cbxItemCodeChange
      OnExit = cbxItemCodeExit
    end
    object stgEditDescription: TEdit
      Left = 252
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'stgEditDescription'
      Visible = False
      OnChange = stgEditDescriptionChange
    end
    object stgEditQty: TEdit
      Left = 412
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'stgEditQty'
      Visible = False
      OnExit = stgEditQtyExit
      OnKeyUp = stgEditQtyKeyUp
    end
    object stgEditTotal: TEdit
      Left = 706
      Top = 32
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 5
      Text = 'stgEditTotal'
      Visible = False
      OnExit = stgEditTotalExit
    end
    object stgEditPrice: TEdit
      Left = 570
      Top = 32
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 4
      Text = 'stgEditPrice'
      Visible = False
      OnExit = stgEditPriceExit
    end
  end
  object cbxGST: TCheckBox
    Left = 885
    Top = 177
    Width = 89
    Height = 17
    Caption = 'GST Inclusive'
    Checked = True
    State = cbChecked
    TabOrder = 6
  end
  object edtDelivSurname: TEdit
    Left = 643
    Top = 68
    Width = 232
    Height = 21
    TabOrder = 7
    Visible = False
  end
  object edtDelivFirstName: TEdit
    Left = 643
    Top = 88
    Width = 232
    Height = 21
    TabOrder = 8
    Visible = False
  end
  object edtDeliv1: TEdit
    Left = 643
    Top = 108
    Width = 232
    Height = 21
    TabOrder = 9
    Visible = False
  end
  object edtDeliv2: TEdit
    Left = 643
    Top = 128
    Width = 232
    Height = 21
    TabOrder = 10
    Visible = False
  end
  object edtDelivCity: TEdit
    Left = 643
    Top = 148
    Width = 232
    Height = 21
    TabOrder = 11
    Visible = False
  end
  object edtDelivState: TEdit
    Left = 643
    Top = 168
    Width = 56
    Height = 21
    TabOrder = 12
    Visible = False
  end
  object edtDelivPostCode: TEdit
    Left = 728
    Top = 168
    Width = 56
    Height = 21
    TabOrder = 13
    Visible = False
  end
  object dscCustomer: TDataSource
    DataSet = dmoInvoice.dstCustomer
    Left = 296
    Top = 104
  end
end
