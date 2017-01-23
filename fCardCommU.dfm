object fCardComm: TfCardComm
  Left = 0
  Top = 0
  Caption = 'Card Communications'
  ClientHeight = 541
  ClientWidth = 884
  Color = clBtnFace
  Constraints.MaxHeight = 580
  Constraints.MaxWidth = 900
  Constraints.MinHeight = 580
  Constraints.MinWidth = 900
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
  object spdBtnComEmail: TSpeedButton
    Left = 129
    Top = 205
    Width = 100
    Height = 47
    Caption = 'Email'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = [seBorder]
    OnClick = spdBtnComEmailClick
  end
  object spdBtnComSMS: TSpeedButton
    Left = 129
    Top = 130
    Width = 100
    Height = 47
    Caption = 'SMS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = [seBorder]
    OnClick = spdBtnComSMSClick
  end
  object spdBtnComExit: TSpeedButton
    Left = 129
    Top = 55
    Width = 100
    Height = 45
    Constraints.MinHeight = 17
    Caption = 'Exit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = [seBorder]
    OnClick = spdBtnComExitClick
  end
  object spdBtnSingleSMS: TSpeedButton
    Left = 129
    Top = 385
    Width = 100
    Height = 47
    Caption = 'Single SMS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = [seBorder]
    OnClick = spdBtnSingleSMSClick
  end
  object spdBtnSendMessage: TSpeedButton
    Left = 129
    Top = 469
    Width = 100
    Height = 47
    Caption = 'Send'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = [seBorder]
    OnClick = spdBtnSendMessageClick
  end
  object edtModifySelection: TEdit
    Left = 265
    Top = 29
    Width = 495
    Height = 27
    TabStop = False
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Text = 'Modify the selection'
  end
  object DBGrid1: TDBGrid
    Left = 265
    Top = 55
    Width = 495
    Height = 377
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IsSelected'
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'CardID'
        Title.Alignment = taRightJustify
        Width = 50
        Visible = True
      end>
  end
  object edtMessage: TEdit
    Left = 265
    Top = 468
    Width = 495
    Height = 68
    Constraints.MinHeight = 68
    TabOrder = 2
    OnKeyUp = edtMessageKeyUp
  end
  object edtNumber: TEdit
    Left = 500
    Top = 440
    Width = 121
    Height = 21
    TabOrder = 3
    Visible = False
    OnKeyUp = edtNumberKeyUp
  end
  object txtMessage: TStaticText
    Left = 272
    Top = 444
    Width = 162
    Height = 17
    Caption = 'Enter Message     Max Chars 160'
    TabOrder = 4
  end
  object txtCharCount: TStaticText
    Left = 464
    Top = 442
    Width = 4
    Height = 4
    Alignment = taRightJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object txtMobileNumber: TStaticText
    Left = 640
    Top = 444
    Width = 122
    Height = 17
    Caption = '<-- Enter Mobile Number'
    TabOrder = 6
    Visible = False
  end
  object txtSingleSMSClicked: TStaticText
    Left = 32
    Top = 399
    Width = 14
    Height = 17
    Caption = #39'0'#39
    TabOrder = 7
    Visible = False
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 336
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 184
    Top = 336
  end
end
