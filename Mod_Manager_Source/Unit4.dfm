object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Add/Create Extracted mod'
  ClientHeight = 198
  ClientWidth = 791
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 13
    Width = 119
    Height = 16
    Caption = 'Select Mod Folder:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 80
    Width = 71
    Height = 16
    Caption = 'Mod Name:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 648
    Top = 144
    Width = 101
    Height = 33
    Caption = 'Add/Create'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 35
    Width = 741
    Height = 21
    TabOrder = 1
  end
  object Button2: TButton
    Left = 749
    Top = 35
    Width = 27
    Height = 21
    Caption = '...'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edit3: TEdit
    Left = 8
    Top = 103
    Width = 741
    Height = 21
    TabOrder = 3
  end
end
