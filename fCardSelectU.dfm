object fCardSelect: TfCardSelect
  Left = 0
  Top = 0
  Caption = 'Select a card'
  ClientHeight = 301
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 634
    Height = 301
    Align = alClient
    DataSource = dst1
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
        FieldName = 'SurName'
        Width = 118
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
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PostMobile1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IsInactive'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CardCode'
        Width = 100
        Visible = True
      end>
  end
  object dst1: TDataSource
    DataSet = dmoMemMaint.dstCardSearch
    Left = 520
    Top = 80
  end
end
