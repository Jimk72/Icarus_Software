object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Icarus Mod Manager'
  ClientHeight = 797
  ClientWidth = 1510
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
    1510
    797)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
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
    Left = 1254
    Top = 285
    Width = 93
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Icarus mods folder:'
  end
  object Label8: TLabel
    Left = 240
    Top = 8
    Width = 101
    Height = 16
    Caption = 'Mods to Install:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 1268
    Top = 164
    Width = 218
    Height = 25
    Hint = 'This allows you to merge 2 extracted mods into one.'
    Anchors = [akTop, akRight]
    Caption = 'Merge Extracted Mods'
    Enabled = False
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
    Width = 1502
    Height = 145
    Anchors = [akLeft, akTop, akRight, akBottom]
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
    Top = 30
    Width = 220
    Height = 612
    Hint = 'Double Click to add to Install List!'
    ItemHeight = 13
    Mask = '*.EXMod'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = FileListBox1Click
    OnDblClick = FileListBox1DblClick
  end
  object Button2: TButton
    Left = 1268
    Top = 254
    Width = 218
    Height = 25
    Hint = 'Removes all mods from the games mods folder.'
    Anchors = [akTop, akRight]
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
    Left = 1268
    Top = 102
    Width = 218
    Height = 25
    Hint = 
      'Updates all mods in the games mods folder. Must have an extracte' +
      'd mod with same name!'
    Anchors = [akTop, akRight]
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
    Left = 1254
    Top = 304
    Width = 248
    Height = 338
    Anchors = [akTop, akRight]
    ItemHeight = 13
    Mask = '*.pak'
    TabOrder = 9
  end
  object Button5: TButton
    Left = 1268
    Top = 8
    Width = 218
    Height = 25
    Hint = 'Used to add unPAKed mods to the extracted format.'
    Anchors = [akTop, akRight]
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
    Left = 1268
    Top = 39
    Width = 218
    Height = 25
    Hint = 'Imports a PAKed mod and extracts changes. '
    Anchors = [akTop, akRight]
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
    Left = 1268
    Top = 71
    Width = 218
    Height = 25
    Hint = 
      'This will extract the data folder from game. Must be done each t' +
      'ime there is an update for game.'
    Anchors = [akTop, akRight]
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
    Left = 452
    Top = 0
    Width = 796
    Height = 642
    Anchors = [akLeft, akTop, akRight]
    BevelInner = bvLowered
    BevelKind = bkFlat
    BevelOuter = bvLowered
    BorderStyle = bsSingle
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      788
      634)
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
      Width = 40
      Height = 16
      Caption = 'Name:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 48
      Width = 32
      Height = 16
      Caption = 'Files:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 56
      Top = 30
      Width = 4
      Height = 16
      Color = clMaroon
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label5: TLabel
      Left = 256
      Top = 48
      Width = 62
      Height = 16
      Caption = 'Mod Info:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ListBox1: TListBox
      Left = 16
      Top = 67
      Width = 218
      Height = 562
      BorderStyle = bsNone
      Color = clBtnFace
      ItemHeight = 13
      TabOrder = 0
    end
    object Button4: TButton
      Left = 672
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
      Left = 240
      Top = 67
      Width = 545
      Height = 562
      Anchors = [akLeft, akTop, akRight]
      BorderStyle = bsNone
      Color = clBtnFace
      ScrollBars = ssVertical
      TabOrder = 2
    end
  end
  object Button8: TButton
    Left = 1268
    Top = 133
    Width = 218
    Height = 25
    Hint = 
      'Creates updated mod folders and PAK files for ALL extracted mods' +
      '.'
    Anchors = [akTop, akRight]
    Caption = 'Update All Extracted Mods'
    Enabled = False
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
  object ListBox2: TListBox
    Left = 226
    Top = 61
    Width = 220
    Height = 581
    ItemHeight = 13
    TabOrder = 14
  end
  object Button9: TButton
    Left = 226
    Top = 30
    Width = 75
    Height = 25
    Hint = 'Clear Mods list below.'
    Caption = 'Clear List'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 307
    Top = 30
    Width = 139
    Height = 25
    Hint = 'This creates a single mod from all mods listed below.'
    Caption = 'Install All Listed Mods'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
    OnClick = Button10Click
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
