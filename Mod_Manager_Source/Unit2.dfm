object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Mod Merger'
  ClientHeight = 819
  ClientWidth = 1321
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    1321
    819)
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 8
    Top = 8
    Width = 108
    Height = 13
    Caption = 'Mod 1 Extracted data:'
  end
  object Label8: TLabel
    Left = 8
    Top = 64
    Width = 108
    Height = 13
    Caption = 'Mod 2 Extracted data:'
  end
  object Label9: TLabel
    Left = 480
    Top = 8
    Width = 93
    Height = 13
    Caption = 'Merged Mod Name:'
  end
  object Label1: TLabel
    Left = 672
    Top = 32
    Width = 96
    Height = 16
    Caption = 'Resulting json:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 736
    Top = 13
    Width = 31
    Height = 13
    Caption = 'Label2'
    Visible = False
  end
  object Edit1: TEdit
    Left = 8
    Top = 27
    Width = 425
    Height = 21
    TabOrder = 0
    Text = 'F:\Mods\Extracted Mods\Floof_ModPack.JKMod'
  end
  object Button3: TButton
    Left = 433
    Top = 25
    Width = 25
    Height = 25
    Caption = '...'
    TabOrder = 1
    OnClick = Button3Click
  end
  object Edit2: TEdit
    Left = 8
    Top = 83
    Width = 425
    Height = 21
    TabOrder = 2
    Text = 'F:\Mods\Extracted Mods\CritFail_FHCOMPLETE.JKMod'
  end
  object Button4: TButton
    Left = 433
    Top = 81
    Width = 25
    Height = 25
    Caption = '...'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 480
    Top = 64
    Width = 161
    Height = 42
    Caption = 'START'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 4
    OnClick = Button5Click
  end
  object Mod2Files: TListBox
    Left = 816
    Top = 198
    Width = 153
    Height = 0
    Anchors = [akLeft, akTop, akBottom]
    ItemHeight = 13
    TabOrder = 5
    Visible = False
  end
  object Mod2Items: TListBox
    Left = 744
    Top = 312
    Width = 130
    Height = 0
    Anchors = [akLeft, akTop, akBottom]
    ItemHeight = 13
    TabOrder = 6
    Visible = False
  end
  object Memo3: TMemo
    Left = 8
    Top = 112
    Width = 643
    Height = 697
    Lines.Strings = (
      'Messages:')
    ScrollBars = ssVertical
    TabOrder = 7
  end
  object Edit3: TEdit
    Left = 480
    Top = 27
    Width = 171
    Height = 21
    TabOrder = 8
    Text = 'MergedMod'
  end
  object Memo4: TMemo
    Left = 657
    Top = 54
    Width = 656
    Height = 755
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssVertical
    TabOrder = 9
  end
  object Button1: TButton
    Left = 1160
    Top = 25
    Width = 139
    Height = 25
    Caption = 'Create PAK file'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 10
    OnClick = Button1Click
  end
end
