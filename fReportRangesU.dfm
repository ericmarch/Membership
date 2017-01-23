object fReportRanges: TfReportRanges
  Left = 0
  Top = 0
  Caption = 'Report Data Ranges'
  ClientHeight = 480
  ClientWidth = 614
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object spdBtnRangeOK: TSpeedButton
    Left = 25
    Top = 16
    Width = 120
    Height = 47
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = [seBorder]
    OnClick = spdBtnRangeOKClick
  end
  object spdBtnmemExit: TSpeedButton
    Left = 183
    Top = 16
    Width = 100
    Height = 47
    Caption = 'Cancel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = [seBorder]
    OnClick = spdBtnmemExitClick
  end
  object Label1: TLabel
    Left = 25
    Top = 75
    Width = 198
    Height = 19
    Caption = 'Include following categories'
  end
  object Label2: TLabel
    Left = 25
    Top = 280
    Width = 200
    Height = 19
    Caption = 'Exclude following categories'
  end
  object Label3: TLabel
    Left = 329
    Top = 75
    Width = 85
    Height = 19
    Caption = 'Active cards'
  end
  object ListBoxExcludeCards: TListBox
    Left = 25
    Top = 305
    Width = 255
    Height = 145
    ItemHeight = 19
    MultiSelect = True
    TabOrder = 0
    OnClick = ListBoxExcludeCardsClick
  end
  object ListBoxIncludeCards: TListBox
    Left = 25
    Top = 100
    Width = 255
    Height = 145
    ItemHeight = 19
    MultiSelect = True
    TabOrder = 1
    OnClick = ListBoxIncludeCardsClick
    OnKeyUp = ListBoxIncludeCardsKeyUp
  end
  object ListBoxActiveCards: TListBox
    Left = 329
    Top = 100
    Width = 255
    Height = 81
    ItemHeight = 19
    TabOrder = 2
  end
end
