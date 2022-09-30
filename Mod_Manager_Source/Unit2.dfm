object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Selection'
  ClientHeight = 861
  ClientWidth = 1309
  Color = 2368807
  Font.Charset = DEFAULT_CHARSET
  Font.Color = 2143487
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  OnMouseWheel = FormMouseWheel
  DesignSize = (
    1309
    861)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 1
    Top = 105
    Width = 653
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = 'Current Value'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 2143487
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 654
    Top = 105
    Width = 653
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = 'New Value'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 2143487
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 60
    Top = 8
    Width = 141
    Height = 17
    Alignment = taCenter
    Caption = 'Currently Merging Mod:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 2143487
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 372
    Top = 8
    Width = 69
    Height = 17
    Alignment = taCenter
    Caption = 'Current File:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 2143487
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 702
    Top = 8
    Width = 75
    Height = 17
    Alignment = taCenter
    Caption = 'Current Item:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 2143487
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 1
    Top = 35
    Width = 248
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 2143487
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 273
    Top = 35
    Width = 289
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 2143487
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 568
    Top = 35
    Width = 337
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 2143487
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 1064
    Top = 8
    Width = 81
    Height = 17
    Alignment = taCenter
    Caption = 'Current Value:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 2143487
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 932
    Top = 35
    Width = 369
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 2143487
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 1
    Top = 136
    Width = 653
    Height = 725
    Anchors = [akLeft, akTop, akBottom]
    Color = clMedGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
    OnMouseEnter = Memo1MouseEnter
    OnMouseLeave = Memo1MouseLeave
  end
  object Memo2: TMemo
    Left = 654
    Top = 136
    Width = 653
    Height = 725
    Anchors = [akLeft, akTop, akBottom]
    Color = clMedGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
    OnMouseEnter = Memo2MouseEnter
    OnMouseLeave = Memo2MouseLeave
  end
end
