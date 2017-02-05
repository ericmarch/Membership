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
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = [seBorder]
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
    Top = 28
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
  end
  object dbeSurname: TDBEdit
    Left = 643
    Top = 68
    Width = 232
    Height = 21
    DataField = 'DelivSurname'
    DataSource = dscInvoice
    TabOrder = 4
    Visible = False
  end
  object dbeFirstName: TDBEdit
    Left = 643
    Top = 88
    Width = 232
    Height = 21
    DataField = 'DelivFirstName'
    DataSource = dscInvoice
    TabOrder = 5
    Visible = False
  end
  object dbeDeliv1: TDBEdit
    Left = 643
    Top = 107
    Width = 232
    Height = 21
    DataField = 'Deliv1'
    DataSource = dscInvoice
    TabOrder = 6
    Visible = False
  end
  object dbeDeliv2: TDBEdit
    Left = 643
    Top = 127
    Width = 232
    Height = 21
    DataField = 'Deliv2'
    DataSource = dscInvoice
    TabOrder = 7
    Visible = False
  end
  object DBEdit1: TDBEdit
    Left = 643
    Top = 147
    Width = 232
    Height = 21
    DataField = 'DelivCity'
    DataSource = dscInvoice
    TabOrder = 8
    Visible = False
  end
  object DBEdit2: TDBEdit
    Left = 643
    Top = 167
    Width = 48
    Height = 21
    DataField = 'DelivState'
    DataSource = dscInvoice
    TabOrder = 9
    Visible = False
  end
  object DBEdit3: TDBEdit
    Left = 722
    Top = 167
    Width = 56
    Height = 21
    DataField = 'DelivPostCode'
    DataSource = dscInvoice
    TabOrder = 10
    Visible = False
  end
  object DateTimePicker1: TDateTimePicker
    Left = 643
    Top = 28
    Width = 78
    Height = 21
    Date = 42761.871474814810000000
    Time = 42761.871474814810000000
    TabOrder = 11
  end
  object Panel1: TPanel
    Left = 0
    Top = 201
    Width = 984
    Height = 280
    Align = alBottom
    TabOrder = 12
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
    object ComboBox1: TComboBox
      Left = 106
      Top = 32
      Width = 102
      Height = 21
      TabOrder = 1
      Text = 'ComboBox1'
      OnChange = ComboBox1Change
      OnExit = ComboBox1Exit
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
    TabOrder = 13
  end
  object dscCustomer: TDataSource
    DataSet = dmoInvoice.dstCustomer
    Left = 560
    Top = 16
  end
  object dscInvoice: TDataSource
    DataSet = dmoInvoice.qryInvoice
    Left = 472
    Top = 16
  end
end
