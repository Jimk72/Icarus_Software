object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Settings'
  ClientHeight = 207
  ClientWidth = 794
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 13
    Width = 155
    Height = 16
    Caption = 'Icarus Contents folder: '
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
    Width = 119
    Height = 16
    Caption = 'UnrealPak.exe file:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 191
    Top = 16
    Width = 341
    Height = 13
    Caption = 
      '\Program Files (x86)\Steam\steamapps\common\Icarus\Icarus\Conten' +
      't'
  end
  object Label7: TLabel
    Left = 151
    Top = 84
    Width = 296
    Height = 13
    Caption = 'DRGPacker2\UnrealPak\Engine\Binaries\Win64\UnrealPak.exe'
  end
  object Edit1: TEdit
    Left = 8
    Top = 35
    Width = 741
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 749
    Top = 35
    Width = 27
    Height = 21
    Caption = '...'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit3: TEdit
    Left = 8
    Top = 103
    Width = 741
    Height = 21
    TabOrder = 2
  end
  object Button4: TButton
    Left = 749
    Top = 103
    Width = 27
    Height = 21
    Caption = '...'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button3: TButton
    Left = 344
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 4
    OnClick = Button3Click
  end
end
