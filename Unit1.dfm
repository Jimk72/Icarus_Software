object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Icarus Mod Manager'
  ClientHeight = 797
  ClientWidth = 1184
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    1184
    797)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 7
    Top = 4
    Width = 106
    Height = 16
    Caption = 'Extracted Mods:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 928
    Top = 285
    Width = 93
    Height = 13
    Caption = 'Icarus mods folder:'
  end
  object Button1: TButton
    Left = 942
    Top = 164
    Width = 218
    Height = 25
    Hint = 'This allows you to merge 2 extracted mods into one.'
    Caption = 'Merge Extracted Mods'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = Button1Click
  end
  object Log: TMemo
    Left = 0
    Top = 648
    Width = 1176
    Height = 145
    Anchors = [akLeft, akRight, akBottom]
    Lines.Strings = (
      'Log:')
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Memo1: TMemo
    Left = 39
    Top = 480
    Width = 218
    Height = 153
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 3
    Visible = False
  end
  object TempListBox1: TListBox
    Left = 55
    Top = 432
    Width = 186
    Height = 186
    ItemHeight = 13
    TabOrder = 4
    Visible = False
  end
  object TempListBox2: TListBox
    Left = 88
    Top = 424
    Width = 169
    Height = 186
    ItemHeight = 13
    TabOrder = 5
    Visible = False
  end
  object FileListBox1: TFileListBox
    Left = 0
    Top = 22
    Width = 185
    Height = 620
    ItemHeight = 13
    Mask = '*.EXMod'
    TabOrder = 6
    OnClick = FileListBox1Click
  end
  object Button2: TButton
    Left = 942
    Top = 254
    Width = 218
    Height = 25
    Hint = 'Removes all mods from the games mods folder.'
    Caption = 'Remove All Mods From Game'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 942
    Top = 102
    Width = 218
    Height = 25
    Hint = 
      'Updates all mods in the games mods folder. Must have an extracte' +
      'd mod with same name!'
    Caption = 'Update Current Mods'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = Button3Click
  end
  object FileListBox2: TFileListBox
    Left = 928
    Top = 304
    Width = 248
    Height = 338
    ItemHeight = 13
    Mask = '*.pak'
    TabOrder = 9
  end
  object Button5: TButton
    Left = 942
    Top = 8
    Width = 218
    Height = 25
    Hint = 'Used to add unPAKed mods to the extracted format.'
    Caption = 'Extract Mod from Folder'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 942
    Top = 39
    Width = 218
    Height = 25
    Hint = 'Imports a PAKed mod and extracts changes. '
    Caption = 'Extract Mod from PAK File'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 942
    Top = 71
    Width = 218
    Height = 25
    Hint = 
      'This will extract the data folder from game. Must be done each t' +
      'ime there is an update for game.'
    Caption = 'Update data folder'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnClick = Button7Click
  end
  object Panel1: TPanel
    Left = 191
    Top = 0
    Width = 731
    Height = 642
    BevelInner = bvLowered
    BevelKind = bkFlat
    BevelOuter = bvLowered
    BorderStyle = bsSingle
    ParentBackground = False
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 87
      Height = 16
      Caption = 'Selected Mod'
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 30
      Width = 31
      Height = 13
      Caption = 'Name:'
    end
    object Label4: TLabel
      Left = 8
      Top = 48
      Width = 25
      Height = 13
      Caption = 'Files:'
    end
    object Label7: TLabel
      Left = 45
      Top = 30
      Width = 3
      Height = 13
      Color = clMaroon
      ParentColor = False
    end
    object Label5: TLabel
      Left = 256
      Top = 48
      Width = 47
      Height = 13
      Caption = 'Mod Info:'
    end
    object ListBox1: TListBox
      Left = 8
      Top = 67
      Width = 234
      Height = 562
      BorderStyle = bsNone
      Color = clBtnFace
      ItemHeight = 13
      TabOrder = 0
    end
    object Button4: TButton
      Left = 608
      Top = 5
      Width = 107
      Height = 25
      Hint = 
        'Turns extracted mods into updated mods and places the PAK file i' +
        'n the games mods folder.'
      Caption = 'Add Mod to Game'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = Button4Click
    end
    object Memo2: TMemo
      Left = 248
      Top = 67
      Width = 473
      Height = 562
      BorderStyle = bsNone
      Color = clBtnFace
      TabOrder = 2
    end
  end
  object Button8: TButton
    Left = 942
    Top = 133
    Width = 218
    Height = 25
    Hint = 
      'Creates updated mod folders and PAK files for ALL extracted mods' +
      '.'
    Caption = 'Update All Extracted Mods'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    OnClick = Button8Click
  end
  object MainMenu1: TMainMenu
    Left = 736
    Top = 176
    object File1: TMenuItem
      Caption = 'File'
      object AddCreateExtractedMod1: TMenuItem
        Caption = 'Import Mod Folder'
        OnClick = Button5Click
      end
      object ImportmodPAKfile1: TMenuItem
        Caption = 'Import mod PAK file'
        OnClick = Button6Click
      end
    end
    object Edit1: TMenuItem
      Caption = 'Edit'
      object Settings1: TMenuItem
        Caption = 'Settings'
        OnClick = Settings1Click
      end
      object MergeMods1: TMenuItem
        Caption = 'Merge Mods'
        OnClick = MergeMods1Click
      end
      object Updatedatafolder1: TMenuItem
        Caption = 'Update data folder'
        OnClick = Updatedatafolder1Click
      end
    end
  end
end
