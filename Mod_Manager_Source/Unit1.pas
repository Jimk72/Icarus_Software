unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Menus,
  System.JSON, inifiles, Math,
  System.IOUtils, StrUtils, Vcl.ComCtrls, ClipBrd, ShellApi, Vcl.FileCtrl,
  System.Generics.Collections,
  Vcl.Imaging.pngimage, Vcl.WinXCtrls,System.UITypes, System.ImageList, Vcl.ImgList,
  CommCtrl, Vcl.Buttons,  tiaonImageButton;

type
  TMouseWheelDirection = (mwdUp, mwdDown);

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Log: TMemo;
    Memo1: TMemo;
    TempListBox1: TListBox;
    TempListBox2: TListBox;
    FileListBox1: TFileListBox;
    FileListBox2: TFileListBox;
    Label6: TLabel;
    ListBox2: TListBox;
    Label8: TLabel;
    Memo2: TMemo;
    ListBox1: TListBox;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    ListBox3: TListBox;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    ListBox4: TListBox;
    tiaonImageButton1: TtiaonImageButton;
    tiaonImageButton2: TtiaonImageButton;
    tiaonImageButton3: TtiaonImageButton;
    tiaonImageButton4: TtiaonImageButton;
    tiaonImageButton5: TtiaonImageButton;
    tiaonImageButton6: TtiaonImageButton;
    tiaonImageButton7: TtiaonImageButton;
    tiaonImageButton8: TtiaonImageButton;
    tiaonImageButton9: TtiaonImageButton;
    tiaonImageButton10: TtiaonImageButton;
    tiaonImageButton12: TtiaonImageButton;
    PopupMenu1: TPopupMenu;
    RemoveMod1: TMenuItem;
    Label5: TLabel;
    Button14: TButton;
    TempListBox3: TListBox;
    Button13: TButton;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    Image5: TImage;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Image6: TImage;
    Button18: TButton;
    E1: TMenuItem;
    PopupMenu2: TPopupMenu;
    CreateSetupDebugFile1: TMenuItem;
    AddModtoGame1: TMenuItem;
    function UnpackFile(Filename: String; Location: String): Boolean;
    function RepackFile(FolderName: String; Location: String): Boolean;
    function CompareModFile2(ModFilename, OrigFilename, CurFile: String; ConfirmChange: Boolean): String;
    procedure GetDirectories(const Strings: TStrings; Directory: string; CurDirectory: string; IncludeFiles: Boolean);
    function getSpaces(aQuantity: integer): string;
    function CheckForDataFolder(DataFolder: String): Boolean;
    function GetExtractedModFolder(ModName: String): String;
    function InsertLineBreaks(const aInput: string): string;
    function RemoveEmptyLines(const aInput: string): string;
    function RemoveWhiteSpace(const aInput: string): string;
    function JSONFormat(const aInput: string): string;
    function GetFiles(const StartDir: String; const List: TStrings): Boolean;
    function LoadItemJSON(const ItemName: String; const Filename: String): string;
    function ImportMod2(ModFile: String; AsString: String; Location: String; PakfileLocation: String; IsMerge: Boolean): Boolean;
    function ImportModSelected(ModFile: String; Location: String): Boolean;
    function ExtractModData(ModFolder: String; ModName: String; OrigFolder: String; SaveFolder: String): Boolean;
    function GetMergedJson(Original:String; Merged:String; ModName,Params:String; Rank:Integer):String;
    function MergeJson(OriginalJSON,MergedJSON:TJSonValue; Params,ItemsFilename,ItemName,ModName:String):String;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Settings1Click(Sender: TObject);
    procedure MergeMods1Click(Sender: TObject);
    procedure DeleteDirectory(const DirName: string);
    function GetFolders(PAKfilename: string): string;
    procedure Updatedatafolder1Click(Sender: TObject);
    procedure FileListBox1Change(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure ListBox3DblClick(Sender: TObject);
    procedure ListBox3DrawItem(Control: TWinControl; Index: integer; Rect: TRect; State: TOwnerDrawState);
    procedure ListBox2DrawItem(Control: TWinControl; Index: integer; Rect: TRect; State: TOwnerDrawState);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: integer; MousePos: TPoint; var Handled: Boolean);
    procedure Memo2MouseEnter(Sender: TObject);
    procedure Memo2MouseLeave(Sender: TObject);
    procedure ListBox3MouseEnter(Sender: TObject);
    procedure ListBox3MouseLeave(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure Image4MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure Image4MouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
    procedure Image4MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure FileListBox2Change(Sender: TObject);
    procedure tiaonImageButton1Click(Sender: TObject);
    procedure tiaonImageButton2Click(Sender: TObject);
    procedure tiaonImageButton3Click(Sender: TObject);
    procedure tiaonImageButton4Click(Sender: TObject);
    procedure tiaonImageButton5Click(Sender: TObject);
    procedure tiaonImageButton6Click(Sender: TObject);
    procedure tiaonImageButton7Click(Sender: TObject);
    procedure tiaonImageButton8Click(Sender: TObject);
    procedure tiaonImageButton9Click(Sender: TObject);
    procedure tiaonImageButton10Click(Sender: TObject);
    procedure tiaonImageButton11Click(Sender: TObject);
    procedure tiaonImageButton12Click(Sender: TObject);
    procedure LogMouseEnter(Sender: TObject);
    procedure LogMouseLeave(Sender: TObject);
    procedure ListBox1DrawItem(Control: TWinControl; Index: integer; Rect: TRect; State: TOwnerDrawState);
    procedure RemoveMod1Click(Sender: TObject);
    procedure ListBox1MouseEnter(Sender: TObject);
    procedure ListBox1MouseLeave(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ListDir(Path: String; List: TListBox);
    procedure Button14Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Image1MouseEnter(Sender: TObject);
    procedure Image1MouseLeave(Sender: TObject);
    procedure Image5MouseEnter(Sender: TObject);
    procedure Image5MouseLeave(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure CreateSetupDebugFile1Click(Sender: TObject);
    procedure AddModtoGame1Click(Sender: TObject);
  private
    { Private declarations }
    FTableDragging: Boolean;
    FMouseDownLocation: TPoint;
    FButtonStartingLocation: TPoint;
    FListViewWndProc: TWndMethod;
    FListViewWndProc2: TWndMethod;
    procedure ListViewWndProc(var Msg: TMessage);
    procedure ListViewWndProc2(var Msg: TMessage);
  public
    { Public declarations }
    UE4PAKFile: string;
    IcarusContentFolder: string;
    IcarusDataPAK: string;
    OrigDataFolder: string;
    IcarusModsFolder: String;
    CurSelectedMod: String;
    IcarusdataFolderDate: String;
    MouseOver: String;
    ImagePosition: integer;
    DebugMode:Boolean;
    Choice:Boolean;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2, Unit3, Unit4, Unit5, Unit6, Unit7;




function TForm1.CheckForDataFolder(DataFolder: String): Boolean;
begin
  result := true;
  if not(FileExists(ExtractFilePath(Application.ExeName) + 'data\Items\D_ItemsStatic.json')) then
    result := false;
  if not(FileExists(ExtractFilePath(Application.ExeName) + 'data\Traits\D_Itemable.json')) then
    result := false;
  if not(FileExists(ExtractFilePath(Application.ExeName) + 'data\Traits\D_Equippable.json')) then
    result := false;
  if not(FileExists(ExtractFilePath(Application.ExeName) + 'data\Tools\D_ToolDamage.json')) then
    result := false;
  if not(FileExists(ExtractFilePath(Application.ExeName) + 'data\World\D_WorldData.json')) then
    result := false;

end;

procedure TForm1.ListViewWndProc(var Msg: TMessage);
begin
  ShowScrollBar(ListBox1.Handle, SB_VERT, false);
  FListViewWndProc(Msg); // process message*
end;

procedure TForm1.ListViewWndProc2(var Msg: TMessage);
begin
  ShowScrollBar(ListBox3.Handle, SB_VERT, false);
  FListViewWndProc2(Msg); // process message*
end;

function TForm1.ImportModSelected(ModFile: String; Location: String): Boolean;
begin
  Screen.Cursor := crHourGlass;
  Log.Lines.Append('Creating Extracted mod');
  form4.Hide;
  // Check if mod has been extracted already
  if FileExists(ExtractFilePath(Application.ExeName) + 'Extracted Mods\' + Location + '.EXMod') then
  begin
    Screen.Cursor := crDefault;
    case MessageDlg('Extracted Mod Already exists would you like to Replace it?', mtConfirmation, [mbYes, mbCancel], 0) of
      mrYes:
        begin
          // Write code here for pressing button OK
          Screen.Cursor := crHourGlass;
          DeleteFile(ExtractFilePath(Application.ExeName) + 'Extracted Mods\' + Location + '.EXMod');
          if System.SysUtils.DirectoryExists(ExtractFilePath(Application.ExeName) + Location) then
            DeleteDirectory(ExtractFilePath(Application.ExeName) + Location);
        end;
      mrCancel:
        begin
          // Write code here for pressing button Cancel
          Screen.Cursor := crDefault;
          exit;
        end;
    end;
  end;
  // Extract modified json data from files
  ExtractModData(ModFile, Location, OrigDataFolder, ExtractFilePath(Application.ExeName) + 'Extracted Mods');
  Sleep(500);
  Screen.Cursor := crDefault;
  FileListBox1.Update;
end;

function TForm1.RemoveEmptyLines(const aInput: string): string;
var
  sl: TStringList;
  i: integer;
begin
  sl := TStringList.Create;
  try
    sl.Text := aInput;
    for i := sl.Count - 1 downto 0 do
    begin
      if sl[i] = '' then
        sl.Delete(i);
    end;
    result := sl.Text;
  finally
    sl.free;
  end;
end;

procedure TForm1.RemoveMod1Click(Sender: TObject);
begin
  if ListBox3.ItemIndex = -1 then
    exit;

  if FileExists(FileListBox1.Directory + '\' + ListBox3.Items[ListBox3.ItemIndex] + '.EXMOD') then
  begin
    case MessageDlg('Are you sure you want to Delete ' + ListBox3.Items[ListBox3.ItemIndex] + ' Extracted Mod ?', mtConfirmation, [mbYes, mbCancel], 0) of
      mrYes:
        begin
          // Write code here for pressing button OK
          DeleteFile(FileListBox1.Directory + '\' + ListBox3.Items[ListBox3.ItemIndex] + '.EXMOD');
          if System.SysUtils.DirectoryExists(ExtractFilePath(Application.ExeName) + ListBox3.Items[ListBox3.ItemIndex]) then
            DeleteDirectory(ExtractFilePath(Application.ExeName) + ListBox3.Items[ListBox3.ItemIndex]);
          FileListBox1.Update;
        end;

      mrCancel:
        begin
          // Write code here for pressing button Cancel
          exit;
        end;
    end;
  end;

end;

procedure TForm1.ListBox1DrawItem(Control: TWinControl; Index: integer; Rect: TRect; State: TOwnerDrawState);
var
  ListBox: TListBox;
  Canvas: TCanvas;

begin
  ListBox := Control as TListBox;
  Canvas := ListBox.Canvas;
  Canvas.Brush.Style := bsSolid;
  Canvas.Brush.Color := $00242527;

  if ExtractFileExt(ListBox.Items[Index]) = '.uasset' then
    Canvas.Font.Color := $00DDA342
  else
    Canvas.Font.Color := $004FB7EE;
  Canvas.FillRect(Rect);
  Canvas.TextOut(Rect.Left + 8, Rect.Top, ListBox.Items[Index]);
end;

procedure TForm1.ListBox1MouseEnter(Sender: TObject);
begin
  MouseOver := 'Listbox1';
end;

procedure TForm1.ListBox1MouseLeave(Sender: TObject);
begin
  MouseOver := '';
end;

procedure TForm1.ListBox2DrawItem(Control: TWinControl; Index: integer; Rect: TRect; State: TOwnerDrawState);
var
  ListBox: TListBox;
  Canvas: TCanvas;
  ImageRect1: TRect;
begin
  ListBox := Control as TListBox;
  Canvas := ListBox.Canvas;
  if (odSelected in State) or (odFocused in State) then
  begin
    // Canvas.DrawFocusRect(Rect);
    ImageRect1.Left := 0;
    ImageRect1.Top := 0;
    ImageRect1.right := Image3.Picture.Bitmap.Width;
    ImageRect1.Bottom := Image3.Picture.Bitmap.Height;
    Canvas.Brush.Color := $00242527;
    Canvas.Font.Color := $004FB7EE;
    Canvas.FillRect(Rect);
    Canvas.CopyRect(Rect, Image3.Picture.Bitmap.Canvas, ImageRect1);
    Canvas.Brush.Style := bsClear;
    // Canvas.DrawFocusRect(Rect);
    Canvas.TextOut(Rect.Left + 8, Rect.Top, ListBox.Items[Index]);
  end
  else
  begin
    Canvas.Brush.Style := bsSolid;
    Canvas.Brush.Color := $00242527;
    Canvas.Font.Color := $004FB7EE;
    Canvas.FillRect(Rect);
    Canvas.TextOut(Rect.Left + 8, Rect.Top, ListBox.Items[Index]);
  end;
  if odFocused in State then
    // also check for styles if there's a possibility of using ..
    Canvas.DrawFocusRect(Rect);
end;

procedure TForm1.ListBox3Click(Sender: TObject);
var
  ModJSONObject: TJSonValue;
  ModCurFilename: String;
  i: integer;
  ModNameString, readmestring: String;
begin
  ListBox1.Items.clear;
  Memo2.clear;
  CurSelectedMod := FileListBox1.Directory + '\' + ListBox3.Items[ListBox3.ItemIndex] + '.EXMOD';
  //if FileExists(CurSelectedMod) then tiaonImageButton11.Enabled:=true;
  try
    ModJSONObject := TJSONObject.ParseJSONValue(TFile.ReadAllText(CurSelectedMod));
      if not Assigned(ModJSONObject) then
    raise Exception.Create(ExtractFileName(CurSelectedMod)+' Contains Invalid JSON!');
    // Get Mod Names
    ModNameString := (ModJSONObject as TJSONObject).GetValue('ModName').value;
    // if (ModJSONObject as TJSONObject).FindValue('Readme')<>nil then
    // memo2.lines.Append((ModJSONObject as TJSONObject).FindValue('Readme').value)
    // else memo2.lines.Append('None avail.');
    if FileExists(ExtractFilePath(Application.ExeName) + ModNameString + '\ImageOnly.png') then
    begin
      Image2.Visible := false;
      Image6.Visible := false;
      Memo2.Visible := false;
      Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + ModNameString + '\ImageOnly.png');
      ScrollBox1.Visible := true;
    end
    else if FileExists(ExtractFilePath(Application.ExeName) + ModNameString + '\Banner.png') then
    begin
      ScrollBox1.Visible := false;
      Image2.Visible := true;
      Image6.Visible := true;
      Memo2.Top := 170;
      Memo2.Height := 511;
      Memo2.Visible := true;
      Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + ModNameString + '\Banner.png');
    end
    else
    begin
      ScrollBox1.Visible := false;
      Image2.Visible := false;
      Memo2.Top := 70;
      Memo2.Height := 611;
      Memo2.Visible := true;
    end;
    if FileExists(ExtractFilePath(Application.ExeName) + ModNameString + '\readme.txt') then
      Memo2.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) + ModNameString + '\readme.txt')
    else
      Memo2.Lines.Append('');
    Label7.Caption := ModNameString;

    // Get File arrays
    // ModFilearr := (ModJSONObject as TJSONObject).GetValue('Rows') as TJSONArray;
    // for ModFileJSonValue in TJSONArray(ModFilearr) do
    for i := 0 to ((ModJSONObject as TJSONObject).GetValue('Rows') as TJSONArray).Count - 1 do
    begin
      ModCurFilename := (((ModJSONObject as TJSONObject).GetValue('Rows') as TJSONArray)[i] as TJSONObject).GetValue('CurrentFile').value;

      if ModCurFilename <> 'EndOfMod' then
      begin
        ModCurFilename := ModCurFilename.Replace('-', '\');
        ListBox1.Items.Append(ExtractFileName(ModCurFilename));
      end;

    end;
    TempListBox1.clear;
    GetDirectories(TempListBox1.Items, ExtractFilePath(Application.ExeName) + ModNameString, '', true);
    for i := 0 to TempListBox1.Count - 1 do
      if ExtractFileExt(TempListBox1.Items.Strings[i]) = '.uasset' then
        ListBox1.Items.Append(ExtractFileName(TempListBox1.Items.Strings[i]));
    TempListBox1.clear;
  finally
    ModJSONObject.free;
  end;
end;

procedure TForm1.ListBox3DblClick(Sender: TObject);
begin
  ListBox2.Items.Append(ListBox3.Items[ListBox3.ItemIndex]);
end;

procedure TForm1.ListBox3DrawItem(Control: TWinControl; Index: integer; Rect: TRect; State: TOwnerDrawState);
var
  ListBox: TListBox;
  Canvas: TCanvas;
  ImageRect1: TRect;
begin
  ListBox := Control as TListBox;
  Canvas := ListBox.Canvas;
  if (odSelected in State) or (odFocused in State) then
  begin
    // Canvas.DrawFocusRect(Rect);
    ImageRect1.Left := 0;
    ImageRect1.Top := 0;
    ImageRect1.right := Image3.Picture.Bitmap.Width;
    ImageRect1.Bottom := Image3.Picture.Bitmap.Height;
    Canvas.Brush.Color := $00242527;
    Canvas.Font.Color := $004FB7EE;
    Canvas.FillRect(Rect);
    Canvas.CopyRect(Rect, Image3.Picture.Bitmap.Canvas, ImageRect1);
    Canvas.Brush.Style := bsClear;
    // Canvas.DrawFocusRect(Rect);
    Canvas.TextOut(Rect.Left + 8, Rect.Top, ListBox.Items[Index]);
  end
  else
  begin
    Canvas.Brush.Style := bsSolid;
    Canvas.Brush.Color := $00242527;
    Canvas.Font.Color := $004FB7EE;
    Canvas.FillRect(Rect);
    Canvas.TextOut(Rect.Left + 8, Rect.Top, ListBox.Items[Index]);
  end;
  if odFocused in State then
    // also check for styles if there's a possibility of using ..
    Canvas.DrawFocusRect(Rect);
end;

procedure TForm1.ListBox3MouseEnter(Sender: TObject);
begin
  MouseOver := 'Listbox3';
end;

procedure TForm1.ListBox3MouseLeave(Sender: TObject);
begin
  MouseOver := '';
end;

function TForm1.LoadItemJSON(const ItemName: String; const Filename: String): string;
var
  CurrentJSON: TJSONObject;
  // myarr: TJSONArray;
  // RowItem, NameValue: TJSonValue;
  Found, i: integer;
begin
  Found := 0;
  try
    CurrentJSON := TJSONObject.Create;
    if FileExists(Filename) then
    begin
      CurrentJSON := TJSONObject.ParseJSONValue(TFile.ReadAllText(Filename)) as TJSONObject;
      // myarr := CurrentJSON.GetValue('Rows') as TJSONArray;
      for i := 0 to (CurrentJSON.GetValue('Rows') as TJSONArray).Count - 1 do
      begin
        // NameValue := ((CurrentJSON.GetValue('Rows') as TJSONArray)[i] as TJSONObject).GetValue('Name');
        if ((CurrentJSON.GetValue('Rows') as TJSONArray)[i] as TJSONObject).GetValue('Name').value = ItemName then
        begin
          result := ((CurrentJSON.GetValue('Rows') as TJSONArray)[i] as TJSONObject).ToString;
          Found := 1;
          break;
        end;
      end;
      if Found = 0 then
      begin
        ShowMessage(ItemName + ' not found in ' + Filename);
        result := '';
      end;
    end
    else
    begin
      ShowMessage('Cannot find ' + Filename + ' in your mods items folder!');
      result := '';
    end;
  finally
    CurrentJSON.free;
  end;

end;

procedure TForm1.LogMouseEnter(Sender: TObject);
begin
  MouseOver := 'Log';
end;

procedure TForm1.LogMouseLeave(Sender: TObject);
begin
  MouseOver := '';
end;

procedure TForm1.DeleteDirectory(const DirName: string);
var
  FileOp: TSHFileOpStruct;
begin
  FillChar(FileOp, SizeOf(FileOp), 0);
  FileOp.wFunc := FO_DELETE;
  FileOp.pFrom := PChar(DirName + #0); // double zero-terminated
  FileOp.fFlags := FOF_SILENT or FOF_NOERRORUI or FOF_NOCONFIRMATION;
  SHFileOperation(FileOp);
end;

procedure TForm1.Memo2MouseEnter(Sender: TObject);
begin
  MouseOver := 'memo2';
end;

procedure TForm1.Memo2MouseLeave(Sender: TObject);
begin
  MouseOver := '';
end;

procedure TForm1.MergeMods1Click(Sender: TObject);
begin
  Form2.Show;
end;

function TForm1.RepackFile(FolderName: String; Location: String): Boolean;
var
  // iRes: Integer;
  parameters, ModName: string;
  MyText: TStringList;
begin
  result := false;
  Log.Lines.Append('Attempting to Re-PAK:' + FolderName + ' to ' + Location);
  if (System.SysUtils.DirectoryExists(FolderName)) and (System.SysUtils.DirectoryExists(Location)) then
  begin
    try
      MyText := TStringList.Create;
      MyText.Add('"' + FolderName + '\*.*" "..\..\..\Icarus\Content\*.*"');
      MyText.SaveToFile((ExtractFilePath(Application.ExeName) + 'ModFolderDetails.txt'));
    finally
      MyText.free
    end; { try }
    ModName := Copy(FolderName, FolderName.LastIndexOf('\') + 2);
    parameters := '"' + Location + '\' + ModName + '_P.pak" -platform="Windows" -create="' + ExtractFilePath(Application.ExeName) + 'ModFolderDetails.txt';
    try
      ShellExecute(Handle, 'open', PChar(UE4PAKFile), PChar(parameters), '', SW_SHOWNORMAL);
    finally
      result := true;
      Log.Lines.Append('Succesfully Created ' + Location + ModName + ' _P.pak');
    end;
  end
  else
    ShowMessage('Unable to locate needed folders!');
end;

procedure TForm1.Settings1Click(Sender: TObject);
begin
  Form3.Show;
end;
procedure TForm1.tiaonImageButton10Click(Sender: TObject);
var
  //ModJSONObject: TJSonValue;
  currentMod, ModsList, CurrentFile: String;
  TempJSON,MergedMod,TempFilename,TempFolder: String;
  Index, i: integer;
begin
  if ListBox2.Items.Count = 0 then
  begin
  ShowMessage('No Mods Selected!');
  exit;
  end;
  if ListBox2.Items.Count = 1 then
  begin
  if FileExists(FileListBox1.Directory + '\' + ListBox2.Items[0] + '.EXMOD') then
    if ImportMod2(FileListBox1.Directory + '\' + ListBox2.Items[0] + '.EXMOD','', '', IcarusModsFolder, false) then
      ShowMessage('Mod has been added!');
  FileListBox2.Update;
  exit;
  end;
// delete temp mod folder //
if System.SysUtils.DirectoryExists((ExtractFilePath(Application.ExeName) + 'IMM_Merged_Mod')) then
  DeleteDirectory(ExtractFilePath(Application.ExeName) + 'IMM_Merged_Mod');
Log.Lines.Append('Creating IMM_Merged_Mod Folders.');
CreateDir(ExtractFilePath(Application.ExeName) + 'IMM_Merged_Mod');
CreateDir(ExtractFilePath(Application.ExeName) + 'IMM_Merged_Mod\data');
Memo2.Lines.clear;
Memo2.Lines.Append('Includes the following mods:');
TempJSON:='{"ModName":"IMM_Merged_Mod","Level2":"True","Rows":[{"CurrentFile":"EndOfMod"}]}';
for Index := 0 to ListBox2.Items.Count - 1 do
  begin
  currentMod := GetExtractedModFolder(ListBox2.Items[Index] + '.EXMOD');
  Memo2.Lines.Append(currentMod);
  if System.SysUtils.DirectoryExists(ExtractFilePath(Application.ExeName) + currentMod) then
    begin
    // mod contains data folder
    Log.Lines.Append('Copying files from ' + currentMod + ' to IMM_Merged_Mod folder');
    TempListBox3.clear;
    if System.SysUtils.DirectoryExists(ExtractFilePath(Application.ExeName) + currentMod) then
      begin
      ListDir(ExtractFilePath(Application.ExeName) + currentMod, TempListBox3);
      Log.Lines.Append(inttostr(TempListBox3.Items.Count)+' Files Found.');
      for i := 0 to TempListBox3.Items.Count - 1 do
        begin
        CurrentFile := ExtractFileName(TempListBox3.Items[i]);
        if (ExtractFileExt(CurrentFile) <> '') and (ExtractFileExt(CurrentFile) <> '.json') then
          begin
          TempFilename:=ExtractFileName(TempListBox3.Items[i]);
          TempFolder:=ExtractFilePath(TempListBox3.Items[i]);
          Log.Lines.Append('Copying:');
          Log.Lines.Append(TempListBox3.Items[i]);
          Log.Lines.Append('To');
          Log.Lines.Append(StringReplace(TempFolder, currentMod, 'IMM_Merged_Mod', [rfReplaceAll, rfIgnoreCase])+TempFilename);
          System.SysUtils.ForceDirectories(StringReplace(TempFolder, currentMod, 'IMM_Merged_Mod', [rfReplaceAll, rfIgnoreCase]));
          TFile.Copy(TempFolder+TempFilename, StringReplace(TempFolder, currentMod, 'IMM_Merged_Mod', [rfReplaceAll, rfIgnoreCase])+TempFilename, true);
          end;
        end;
      end;
    end;
  Log.Lines.Append('Importing json from ' + ListBox2.Items[Index] + '.EXMOD');
  MergedMod:=GetMergedJson(TempJSON,FileListBox1.Directory + '\' + ListBox2.Items[Index] + '.EXMOD',ListBox2.Items[Index],'',Index+1);
  TempJSON:=MergedMod;
  // form2.memo3.text:=( JSONFormat(TempJSON));
  // ImportMod2(FileListBox1.Directory + '\' + ListBox2.Items[Index] + '.EXMOD','', '', '', true);
  end;
form2.memo1.text:=(JSONFormat(TempJSON));
Form2.memo1.lines.SaveToFile(FileListBox1.Directory + '\' +'IMM_Merged_Mod' + '.EXMOD');
ImportMod2('IMM_Merged_Mod',TempJSON,'', IcarusModsFolder, true);
Log.Lines.Append('All json has been Imported to IMM_Merged_Mod folder!');
Log.Lines.Append('Saving list of added mods to the readme file in IMM_Merged_Mod folder.');
Memo2.Lines.SaveToFile(ExtractFilePath(Application.ExeName) + 'IMM_Merged_Mod\readme.txt');
Log.Lines.Append('Re-PAKing IMM_Merged_Mod');
if RepackFile(ExtractFilePath(Application.ExeName) + 'IMM_Merged_Mod', IcarusModsFolder) then
  begin
    Log.Lines.Append('IMM_Merged_Mod was Created.');
     sleep(200);
    ListBox4.clear;
    FileListBox2.Update;
    FileListBox2.Directory:=FileListBox2.Directory;
    FileListBox2.Update;
    sleep(200);
    ListBox4.clear;
   for i := 0 to FileListBox2.Items.Count - 1 do
  begin
    ListBox4.Items.Append(ChangeFileExt(FileListBox2.Items[i], ''));
  end;
  Listbox4.Repaint;
  end;

end;

procedure TForm1.tiaonImageButton11Click(Sender: TObject);
begin
  if CurSelectedMod<>'' then
  begin
  if FileExists(CurSelectedMod) then
  if ImportMod2(CurSelectedMod,'', '', IcarusModsFolder, false) then
  ShowMessage('Mod has been added!');
  FileListBox2.Update;
  end else ShowMessage('No Mod Selected!');
end;

procedure TForm1.tiaonImageButton12Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.tiaonImageButton1Click(Sender: TObject);
begin
  Form3.Show;
end;

procedure TForm1.tiaonImageButton2Click(Sender: TObject);
begin
  if CheckForDataFolder('data') then
    form4.Show
  else
    ShowMessage('There is an issue with your unpaked data folder! If this continues try manualy Unpaking the data folder!');
end;

procedure TForm1.tiaonImageButton3Click(Sender: TObject);
var
  modsname: string;
  modFolders: string;
  PPosition:integer;
begin
  if (CheckForDataFolder('data')) and (UE4PAKFile<>'') then
  begin
  with TFileOpenDialog.Create(nil) do
    try
      title := 'Select Mod PAK file for Importing.';
      FileTypes.Add.FileMask := '*.pak';
      if Execute then
      begin
        Screen.Cursor := crHourGlass;
        DeleteDirectory(ExtractFilePath(Application.ExeName) + 'tempMod');
        modFolders := GetFolders(Filename);
        modFolders := StringReplace(modFolders, '../../../Icarus/Content', '', [rfReplaceAll, rfIgnoreCase]);
        modFolders := StringReplace(modFolders, '/', '\', [rfReplaceAll, rfIgnoreCase]);
        log.Lines.Append('Getting PAK file data:');
        log.Lines.Append('Extract Folder Location: '+modFolders);
        modsname := ExtractFileName(Filename);
        modsname := StringReplace(modsname, ' _p.pak', '', [rfReplaceAll, rfIgnoreCase]);
        modsname := StringReplace(modsname, '_p.pak', '', [rfReplaceAll, rfIgnoreCase]);
        PPosition := pos('_p(',modsname);
        if PPosition > 0 then SetLength(modsname, PPosition - 1);
        PPosition := pos('_P(',modsname);
        if PPosition > 0 then SetLength(modsname, PPosition - 1);
        log.Lines.Append('Extract Mods Name: '+modsname);
        Log.Lines.Append('Creating ' + modsname);
        if not System.SysUtils.DirectoryExists(ExtractFilePath(Application.ExeName) + 'tempMod') then
          CreateDir(ExtractFilePath(Application.ExeName) + 'tempMod');
        Log.Lines.Append('Unpacking: ' + Filename);
        // Unpak mod file
        UnpackFile(Filename, ExtractFilePath(Application.ExeName) + 'tempMod\' + modsname + modFolders);
        Sleep(500);
        // Import unpacked mod folder from tempMod folder
        ImportModSelected(ExtractFilePath(Application.ExeName) + 'tempMod\' + modsname, modsname);
        Sleep(100);
        FileListBox1.Update;
        Sleep(100);
        Screen.Cursor := crDefault;
      end;

    finally
      free;
      Screen.Cursor := crDefault;
    end;

  end else if UE4PAKFile='' then ShowMessage('UnrealPak file not set in settings!') else
           ShowMessage('There is an issue with your unpaked data folder! If this continues try manualy Unpaking the data folder!');
end;

procedure TForm1.tiaonImageButton4Click(Sender: TObject);
begin
if UE4PAKFile<>'' then
  begin
  if IcarusDataPAK<>'' then
    begin
    if FileExists(IcarusDataPAK) then
      begin
      Log.Lines.Append('UnPAKing ' + IcarusDataPAK + ' to ' + ExtractFilePath(Application.ExeName) + 'data');
      UnpackFile(IcarusDataPAK, ExtractFilePath(Application.ExeName) + 'data');
      IcarusdataFolderDate := DateTimeToStr(System.IOUtils.TFile.GetCreationTime(IcarusDataPAK));
      if CheckForDataFolder(ExtractFilePath(Application.ExeName) + 'data') then
      exit
      else
      ShowMessage('There was a problem Unpaking the data folder! Please make sure you have the correct UnrealPak.exe file selected in the settings section!');
      end
      else
      begin
      ShowMessage('Icarus contents folder not set in setting!');
      Form3.Show;
      end;
    end else ShowMessage('Icarus Contents Folder not set in settings!');
  end else ShowMessage('UnrealPak file not set in settings!');
end;

procedure TForm1.tiaonImageButton5Click(Sender: TObject);
var
  i: integer;
  modsname: string;
begin
  if IcarusdataFolderDate <> DateTimeToStr(System.IOUtils.TFile.GetCreationTime(IcarusDataPAK)) then
    if FileExists(IcarusDataPAK) then
      UnpackFile(IcarusDataPAK, ExtractFilePath(Application.ExeName) + 'data')
    else
    begin
      ShowMessage('Icarus contents folder not set in setting!');
      Form3.Show;
    end;

  for i := 0 to FileListBox2.Items.Count - 1 do
  begin
    modsname := FileListBox2.Items[i];
    modsname := StringReplace(modsname, ' _p.pak', '', [rfReplaceAll, rfIgnoreCase]);
    modsname := StringReplace(modsname, '_p.pak', '', [rfReplaceAll, rfIgnoreCase]);
    if FileExists(ExtractFilePath(Application.ExeName) + 'Extracted Mods\' + modsname + '.EXmod') then
    begin
    Log.Lines.Append('Atempting to Update '+modsname);
    if ImportMod2(ExtractFilePath(Application.ExeName) + 'Extracted Mods\' + modsname + '.EXmod','', '', IcarusModsFolder, false) then
    Log.Lines.Append(modsname + ' Mod has been Updated!');
    end
    else
      ShowMessage(ExtractFileName(FileListBox2.Items[i]) + 'Was not installed with Mod Manager! Only Extracted Mods can be updated!');
  end;

end;

procedure TForm1.tiaonImageButton6Click(Sender: TObject);
var
  i: integer;
  modsname: string;
  SaveLocation: string;
begin
  if FileExists(IcarusDataPAK) then
  begin
    if IcarusdataFolderDate <> DateTimeToStr(System.IOUtils.TFile.GetCreationTime(IcarusDataPAK)) then
      UnpackFile(IcarusDataPAK, ExtractFilePath(Application.ExeName) + 'data');
  end
  else
  begin
    ShowMessage('Icarus contents folder not set in setting!');
    Form3.Show;
  end;
  with TFileOpenDialog.Create(nil) do
    try
      title := 'Select folder to save updated mods to.';
      Options := [fdoPickFolders];
      if Execute then
        SaveLocation := Filename;

    finally
      free;
    end;
  for i := 0 to FileListBox1.Items.Count - 1 do
  begin
    modsname := FileListBox1.Items[i];
    if FileExists(ExtractFilePath(Application.ExeName) + 'Extracted Mods\' + modsname) then
    begin
      if ImportMod2(ExtractFilePath(Application.ExeName) + 'Extracted Mods\' + modsname,'', SaveLocation + '\', SaveLocation + '\', false) then
        Log.Lines.Append(modsname + ' Mod has been Updated!');
    end
    else
      ShowMessage(modsname + '.EXmod does not exist in extracted folder!');
  end;

end;

procedure TForm1.tiaonImageButton7Click(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm1.tiaonImageButton8Click(Sender: TObject);
begin
  if System.SysUtils.DirectoryExists(IcarusModsFolder) then
    DeleteDirectory(IcarusModsFolder);
  CreateDir(IcarusModsFolder);
  FileListBox2.Directory := IcarusModsFolder;
  FileListBox2.Update;
end;

procedure TForm1.tiaonImageButton9Click(Sender: TObject);
begin
  ListBox2.clear;
end;

procedure TForm1.FileListBox1Change(Sender: TObject);
var
  i: integer;
begin
  ListBox3.clear;
  for i := 0 to FileListBox1.Items.Count - 1 do
  begin
    ListBox3.Items.Append(ChangeFileExt(FileListBox1.Items[i], ''));
  end;
  listbox3.Repaint;

end;

procedure TForm1.FileListBox2Change(Sender: TObject);
var
  i: integer;
begin
  ListBox4.clear;
  for i := 0 to FileListBox2.Items.Count - 1 do
  begin
    ListBox4.Items.Append(ChangeFileExt(FileListBox2.Items[i], ''));
  end;
  Listbox4.Repaint;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  appINI: TIniFile;
begin
  appINI := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  try
    appINI.WriteString('Folder', 'IcarusContent', IcarusContentFolder);
    appINI.WriteString('File', 'UE4PakEXE', UE4PAKFile);
    appINI.WriteString('TimeStamp', 'IcarusData', IcarusdataFolderDate);
  Finally
    appINI.free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  appINI: TIniFile;
  dataDate, GamedataDate: string;
  // dlg: TOpenDialog;
begin
if System.SysUtils.DirectoryExists(ExtractFilePath(Application.ExeName) + 'data') then
        OrigDataFolder := ExtractFilePath(Application.ExeName) + 'data';
  ImagePosition := 0;
  Debugmode:=false;
  ReportMemoryLeaksOnShutdown := true;
  Application.HintHidePause := 6000;
  FListViewWndProc := ListBox1.WindowProc; // save old window proc
  ListBox1.WindowProc := ListViewWndProc; // subclass
  FListViewWndProc2 := ListBox3.WindowProc; // save old window proc
  ListBox3.WindowProc := ListViewWndProc2; // subclass
  Log.Lines.Append('Loading Settings Data...');
  appINI := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  try
    if FileExists(ChangeFileExt(Application.ExeName, '.ini')) then
    begin
      if appINI.ReadString('Unlock', 'Changes', '') = 'YesPlease' then
      begin
        Button13.Visible := true;
        Button14.Visible := true;
        Button15.Visible := true;
        Button16.Visible := true;
        Button17.Visible := true;
        Button18.Visible := true;
        Debugmode:=true;
      end;
      IcarusContentFolder := appINI.ReadString('Folder', 'IcarusContent', '');
      if IcarusContentFolder = '' then
      ShowMessage('Please update Settings!')
      else
      begin
      IcarusDataPAK := IcarusContentFolder + '\Data\data.pak';
      IcarusModsFolder := IcarusContentFolder + '\Paks\mods';
      UE4PAKFile := appINI.ReadString('File', 'UE4PakEXE', '');
      IcarusdataFolderDate := appINI.ReadString('TimeStamp', 'IcarusData', '');
      if FileExists(IcarusDataPAK) then
        if IcarusdataFolderDate <> DateTimeToStr(System.IOUtils.TFile.GetCreationTime(IcarusDataPAK)) then
        begin
         if MessageDlg('Current data folder outdated! Would you like to update it now?',mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
          begin
          tiaonImageButton4.OnClick(Sender);
          end;


        end;
      if System.SysUtils.DirectoryExists(ExtractFilePath(Application.ExeName) + 'data') then
        OrigDataFolder := ExtractFilePath(Application.ExeName) + 'data'
      else if FileExists(IcarusDataPAK) then
      begin
        UnpackFile(IcarusDataPAK, ExtractFilePath(Application.ExeName) + 'data');
        IcarusdataFolderDate := DateTimeToStr(System.IOUtils.TFile.GetCreationTime(IcarusDataPAK));
      end;
      if not System.SysUtils.DirectoryExists(ExtractFilePath(Application.ExeName) + 'Extracted Mods') then
        CreateDir(ExtractFilePath(Application.ExeName) + 'Extracted Mods');
      FileListBox1.Directory := ExtractFilePath(Application.ExeName) + 'Extracted Mods';
      if IcarusModsFolder <> '' then
      begin
        if not System.SysUtils.DirectoryExists(IcarusModsFolder) then
          CreateDir(IcarusModsFolder);
        FileListBox2.Directory := IcarusModsFolder;
      end;
      Log.Lines.Append('Settings Data Loaded.');
      end;
    end
    else
    begin
      ShowMessage('Please Update Settings!');

    end;
  finally
    appINI.free;
  end;
FileListBox1.Update;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  ListBox1.WindowProc := FListViewWndProc; // restore window proc
  FListViewWndProc := nil;
  ListBox3.WindowProc := FListViewWndProc2; // restore window proc
  FListViewWndProc2 := nil;
end;

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  FTableDragging := true;
  FMouseDownLocation := Mouse.CursorPos;
  FButtonStartingLocation := TPoint.Create(Form1.Left, Form1.Top);
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
begin
  if FTableDragging then
  begin
    Form1.Left := FButtonStartingLocation.X + (Mouse.CursorPos.X - FMouseDownLocation.X);
    Form1.Top := FButtonStartingLocation.Y + (Mouse.CursorPos.Y - FMouseDownLocation.Y);
    Form1.Invalidate;
  end;
end;

procedure TForm1.FormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  FTableDragging := false;
end;

procedure TForm1.FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: integer; MousePos: TPoint; var Handled: Boolean);
begin
  if MouseOver = 'memo2' then
  begin
    if WheelDelta > 0 then
      Memo2.Perform(EM_LINESCROLL, 0, -1);
    if WheelDelta < 0 then
      Memo2.Perform(EM_LINESCROLL, 0, 1);
  end;
  if MouseOver = 'Listbox1' then
  begin
    if WheelDelta > 0 then
      ListBox1.Perform(WM_VSCROLL, SB_LINEUP, 0);
    if WheelDelta < 0 then
      ListBox1.Perform(WM_VSCROLL, SB_LINEDOWN, 0);
  end;
  if MouseOver = 'Listbox3' then
  begin
    if WheelDelta > 0 then
      ListBox3.Perform(WM_VSCROLL, SB_LINEUP, 0);
    if WheelDelta < 0 then
      ListBox3.Perform(WM_VSCROLL, SB_LINEDOWN, 0);
  end;
  if MouseOver = 'Image1' then
  begin
    if WheelDelta > 0 then
      if ImagePosition > 0 then
      begin
        LockWindowUpdate(Form1.Handle);
        ImagePosition := ImagePosition - 10;
        ScrollBox1.ScrollBy(0, 10);
        Image5.Top := Image5.Top - 10;
        LockWindowUpdate(0)
      end;
    if WheelDelta < 0 then
      if ImagePosition < Image1.Height - 590 then
      begin
        LockWindowUpdate(Form1.Handle);
        ImagePosition := ImagePosition + 10;
        ScrollBox1.ScrollBy(0, -10);
        Image5.Top := Image5.Top + 10;
        LockWindowUpdate(0)
      end;
  end;
  if MouseOver = 'Log' then
  begin
    if WheelDelta > 0 then
      Log.Perform(EM_LINESCROLL, 0, -1);
    if WheelDelta < 0 then
      Log.Perform(EM_LINESCROLL, 0, 1);
  end;
  Handled := true;
end;

procedure TForm1.Image1MouseEnter(Sender: TObject);
begin
  MouseOver := 'Image1';
end;

procedure TForm1.Image1MouseLeave(Sender: TObject);
begin
  MouseOver := '';
end;

procedure TForm1.Image4MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  FTableDragging := true;
  FMouseDownLocation := Mouse.CursorPos;
  FButtonStartingLocation := TPoint.Create(Form1.Left, Form1.Top);
end;

procedure TForm1.Image4MouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
begin
  if FTableDragging then
  begin
    Form1.Left := FButtonStartingLocation.X + (Mouse.CursorPos.X - FMouseDownLocation.X);
    Form1.Top := FButtonStartingLocation.Y + (Mouse.CursorPos.Y - FMouseDownLocation.Y);
    Form1.Invalidate;
  end;
end;

procedure TForm1.Image4MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  FTableDragging := false;
end;

procedure TForm1.Image5MouseEnter(Sender: TObject);
begin
  MouseOver := 'Image1';
end;

procedure TForm1.Image5MouseLeave(Sender: TObject);
begin
  MouseOver := '';
end;



function TForm1.MergeJson(OriginalJSON,MergedJSON:TJSonValue; Params,ItemsFilename,ItemName,ModName:String):String;
var
O,M :Integer;
ResultJSON,TempJSON:string;
ValueFound:boolean;
begin
if Params='Items' then
  begin
  // Merge json items
  if AnsiCompareStr(OriginalJSON.ToString, MergedJSON.ToString) = 0 then
  result:=MergedJSON.ToString
  else
    begin
    TempListBox3.Items.Clear;
    TempJSON:='{';
    for O := 0 to (OriginalJSON as TJSONObject).Count -1 do
      begin
      // Loop through Original Values
      ValueFound:=false;
      for M := 0 to (MergedJSON as TJSONObject).Count -1 do
        begin
        //Loop through Merged values
         if AnsiCompareStr((OriginalJSON as TJSONObject).Get(O).JsonString.ToString, (MergedJSON as TJSONObject).Get(M).JsonString.ToString) = 0 then
          begin
          if (Choice) and (AnsiCompareStr((OriginalJSON as TJSONObject).Get(O).ToString,(MergedJSON as TJSONObject).Get(M).ToString)<>0) then
            begin
            TempJSON:=TempJSON+Form2.GetChoice((OriginalJSON as TJSONObject).Get(O).ToString,(MergedJSON as TJSONObject).Get(M).ToString,ModName,ItemName,(OriginalJSON as TJSONObject).Get(O).JsonString.ToString,ItemsFilename)+',';
            end
            else
          TempJSON:=TempJSON+(MergedJSON as TJSONObject).Get(M).ToString+',';
          //form2.Memo2.Lines.Append((MergedJSON as TJSONObject).Get(M).ToString);
          TempListBox3.Items.Append((MergedJSON as TJSONObject).Get(M).JsonString.ToString);
          ValueFound:=true;
          end;
        end;
      if ValueFound=false then
        begin
        TempJSON:=TempJSON+(OriginalJSON as TJSONObject).Get(O).ToString+',';
        //form2.Memo2.Lines.Append('---------------------------Original----------------------------');
        //form2.Memo2.Lines.Append(( OriginalJSON as TJSONObject).Get(O).ToString);
        //form2.Memo2.Lines.Append('---------------------------Original----------------------------');
        end;
      end;
    for M := 0 to (MergedJSON as TJSONObject).Count -1 do
    if TempListBox3.Items.IndexOf((MergedJSON as TJSONObject).Get(M).JsonString.ToString) = -1 then
      begin
      TempJSON:=TempJSON+(MergedJSON as TJSONObject).Get(M).ToString+',';
      //form2.Memo2.Lines.Append((MergedJSON as TJSONObject).Get(M).ToString);
      end;
    Delete(tempjson, length(tempjson), 1);
    TempJSON:=TempJSON+'}';
    form6.Memo1.Lines.Append('---------------------------Item----------------------------');
    form6.Memo1.Lines.Append (TempJSON);
    result:=TempJSON;
    end;
  end
  else
  if Params='Defaults' then
  begin
  //form2.Memo1.Lines.Append(JSONFormat(OriginalJSON.ToString));
  //form2.Memo2.Lines.Append('------------Defaults---------------');
  //form2.Memo2.Lines.Append(JSONFormat(MergedJSON.ToString));
  result:=MergedJSON.ToString;
  end;
end;


function TForm1.GetMergedJson(Original:String; Merged:String; ModName,Params:String; Rank:Integer):String;
var
  jFileName, tempjson,DefaultJSON, ItemJSON, Level2tempjson,Choicejson: String;
  OrigFiles, MergeFiles, OrigItems, MergeItems, OrigValues, MergeValues, X, Y, z, w, ItemIndex,O,M: integer;
  ItemMatch, FileMatch, Level2, Level2Found, CustomFile,SkipChoice: Boolean;
  OriginalJSON,MergedJSON:TJSONValue;
begin
SkipChoice:=false;
TempListBox1.Clear;
TempListBox2.clear;
form2.memo2.lines.Clear;
if Form3.CheckBox2.Checked then Choice:=true;
// begin try/finally
  try
  // Fulljson = OriginalJSON
  // Icarusjson = MergeJSON
  OriginalJSON:=TJSONObject.ParseJSONValue(Original);
  MergedJSON := TJSONObject.ParseJSONValue(TFile.ReadAllText(Merged));
  if not Assigned(MergedJSON) then
    raise Exception.Create(ExtractFileName(Merged)+' Contains Invalid JSON!');
  tempjson := '{"ModName":"IMM_Merged_Mod","Level2":"True",';
  // add mods list to json
  if ((OriginalJSON as TJSONObject).FindValue('Mods') as TJSONArray) <> nil then
    begin
    tempjson := tempjson+'"Mods":[';
    for w:= 0 to ((OriginalJSON as TJSONObject).FindValue('Mods') as TJSONArray).Count - 1 do
    tempjson := tempjson+(((OriginalJSON as TJSONObject).FindValue('Mods') as TJSONArray)[w] as TJSONObject).ToString+',';
    tempjson := tempjson+'{"ModName":"'+ModName+'","Rank": '+inttostr(Rank)+'}],"Rows":['
    end
  else tempjson := tempjson+'"Mods":[{"ModName":"'+ModName+'","Rank": '+inttostr(Rank)+'}],"Rows":[';
  if DebugMode then form2.Memo1.Lines.Append('Begining Main Loop');
  // *********************************
  // Loop through Original mods files
  // *********************************
  TempListBox1.Clear;
  TempListBox1.Items.Append('EndOfMod');
  for OrigFiles := 0 to ((OriginalJSON as TJSONObject).FindValue('Rows') as TJSONArray).Count - 1 do
    begin
    FileMatch:=false;
    // get current folder/file name
    jFileName := (((OriginalJSON as TJSONObject).FindValue('Rows') as TJSONArray)[OrigFiles] as TJSONObject).FindValue('CurrentFile').value;
    if DebugMode then form2.Memo1.Lines.Append('Getting current filename:');
    if DebugMode then form2.Memo1.Lines.Append('jFilename='+jFileName);
    // Make sure it not the end of file
    if jFileName <> 'EndOfMod' then
      begin
      // *********************************
      // Loop through Merged Mods Files
      // *********************************
      for MergeFiles := 0 to ((MergedJSON as TJSONObject).FindValue('Rows') as TJSONArray).Count - 1 do
        begin
        if (((MergedJSON as TJSONObject).FindValue('Rows') as TJSONArray)[MergeFiles] as TJSONObject).FindValue('CurrentFile').value=jFileName then
          begin
          TempListBox1.Items.Append(jFileName);
          // **********************
          // Duplicate files found!
          //***********************
          FileMatch:=true;
          DefaultJSON:='';

          // File match found
          // ***************************
          // Compare json files Defaults
          // ***************************
          Log.Lines.Append('Mod: '+ModName+' Comparing File: '+ExtractFileName(jFileName.Replace('-', '\'))+' Header.');
          tempjson := tempjson + '{"CurrentFile":"'+jFileName+'",';
          if ((((OriginalJSON as TJSONObject).FindValue('Rows') as TJSONArray)[OrigFiles] as TJSONObject).FindValue('Defaults') <> nil) and
          ((((MergedJSON as TJSONObject).FindValue('Rows') as TJSONArray)[MergeFiles] as TJSONObject).FindValue('Defaults') <> nil) then
          DefaultJSON:=MergeJson((((OriginalJSON as TJSONObject).FindValue('Rows') as TJSONArray)[OrigFiles] as TJSONObject).FindValue('Defaults'),
          (((MergedJSON as TJSONObject).FindValue('Rows') as TJSONArray)[MergeFiles] as TJSONObject).FindValue('Defaults'),'Defaults',
          ExtractFileName(jFileName.Replace('-', '\')),'',ModName)
          else
          if (((OriginalJSON as TJSONObject).FindValue('Rows') as TJSONArray)[OrigFiles] as TJSONObject).FindValue('Defaults') <> nil then
          DefaultJSON:=(((OriginalJSON as TJSONObject).FindValue('Rows') as TJSONArray)[OrigFiles] as TJSONObject).FindValue('Defaults').ToString
          else
          if (((MergedJSON as TJSONObject).FindValue('Rows') as TJSONArray)[MergeFiles] as TJSONObject).FindValue('Defaults') <> nil then
          DefaultJSON:=(((MergedJSON as TJSONObject).FindValue('Rows') as TJSONArray)[MergeFiles] as TJSONObject).FindValue('Defaults').ToString;
          if DefaultJSON<>'' then tempjson := tempjson + '"Defaults":'+DefaultJSON+',';
          // *************
          // Defaults done
          //**************
          // Compare Items
          //**************
          TempListBox2.clear;
          tempjson := tempjson + '"File_Items":[';
          // Start to compare and add Items from json to array
          // Loop for Original Items in file
          Log.Lines.Append('Mod: '+ModName+' Comparing File: '+ExtractFileName(jFileName.Replace('-', '\'))+' Items.');
          for OrigItems := 0 to ((((OriginalJSON as TJSONObject).FindValue('Rows') as TJSONArray)[OrigFiles] as TJSONObject).FindValue('File_Items') as TJSONArray).Count - 1 do
            begin
            ItemJSON:='';
            // Loop for Merged Items in file
            for MergeItems := 0 to ((((MergedJSON as TJSONObject).FindValue('Rows') as TJSONArray)[MergeFiles] as TJSONObject).FindValue('File_Items') as TJSONArray).Count - 1 do
              begin
              if (((((OriginalJSON as TJSONObject).FindValue('Rows') as TJSONArray)[OrigFiles] as TJSONObject).FindValue('File_Items') as TJSONArray)[OrigItems] as TJSONObject).FindValue('Name').value
              = (((((MergedJSON as TJSONObject).FindValue('Rows') as TJSONArray)[MergeFiles] as TJSONObject).FindValue('File_Items') as TJSONArray)[MergeItems] as TJSONObject).FindValue('Name').value then
                begin
                // Found same items-- merge them
                //MergeJson(OriginalJSON,MergedJSON:TJSonValue; ASK:boolean; Params,ItemsFilename,ItemName,ModName:String):String;
                ItemJSON:=MergeJson(((((OriginalJSON as TJSONObject).FindValue('Rows') as TJSONArray)[OrigFiles] as TJSONObject).FindValue('File_Items') as TJSONArray)[OrigItems],
                ((((MergedJSON as TJSONObject).FindValue('Rows') as TJSONArray)[MergeFiles] as TJSONObject).FindValue('File_Items') as TJSONArray)[MergeItems],'Items',
                ExtractFileName(jFileName.Replace('-', '\')),
                (((((MergedJSON as TJSONObject).FindValue('Rows') as TJSONArray)[MergeFiles] as TJSONObject).FindValue('File_Items') as TJSONArray)[MergeItems] as TJSONObject).FindValue('Name').value,
                modname)+',';
                TempListBox2.Items.Append((((((MergedJSON as TJSONObject).FindValue('Rows') as TJSONArray)[MergeFiles] as TJSONObject).FindValue('File_Items') as TJSONArray)[MergeItems] as TJSONObject).FindValue('Name').value);
                break;
                end;
              end;
            // *****************************
            // End of Merged File items list
            // *****************************
            if ItemJSON='' then tempjson:=tempjson+((((OriginalJSON as TJSONObject).FindValue('Rows') as TJSONArray)[OrigFiles] as TJSONObject).FindValue('File_Items') as TJSONArray)[OrigItems].ToString+','
            else tempjson:=tempjson+ItemJSON;
            end;
          //  Add any items custom values from Merge Item
          Level2tempjson:='';
          for M := 0 to ((((MergedJSON as TJSONObject).FindValue('Rows') as TJSONArray)[MergeFiles] as TJSONObject).FindValue('File_Items') as TJSONArray).Count - 1 do
            begin
            if TempListBox2.Items.IndexOf((((((MergedJSON as TJSONObject).FindValue('Rows') as TJSONArray)[MergeFiles] as TJSONObject).FindValue('File_Items') as TJSONArray)[M] as TJSONObject).GetValue('Name').value) = -1 then
            tempjson := tempjson + (((((MergedJSON as TJSONObject).FindValue('Rows') as TJSONArray)[MergeFiles] as TJSONObject).FindValue('File_Items') as TJSONArray)[M] as TJSONObject).ToString + ',';
            end;
          Delete(tempjson, length(tempjson), 1);
          tempjson := tempjson +']},';
          end;
         end;
      if FileMatch=false then tempjson := tempjson + (((OriginalJSON as TJSONObject).FindValue('Rows') as TJSONArray)[OrigFiles] as TJSONObject).ToString+',';
      end;
    // end of first loop
    end;
  for M := 0 to ((MergedJSON as TJSONObject).FindValue('Rows') as TJSONArray).Count - 1 do
  if TempListBox1.Items.IndexOf((((MergedJSON as TJSONObject).FindValue('Rows') as TJSONArray)[M] as TJSONObject).FindValue('CurrentFile').value)= -1 then
  tempjson := tempjson +((MergedJSON as TJSONObject).FindValue('Rows') as TJSONArray)[M].ToString+',';
  //Delete(tempjson, length(tempjson), 1);
  tempjson := tempjson + '{"CurrentFile":"EndOfMod"}]}';
    result:= tempjson;
  //end of try
  finally
  OriginalJSON.free;
  MergedJSON.free;
  end;
end;

function TForm1.ImportMod2(ModFile: String; AsString: String; Location: String; PakfileLocation: String; IsMerge: Boolean): Boolean;
var
  selectedFile: TFileName;
  Icarusjson, Mergedjson: TJSonValue;
  jFileName, tempjson, Level2tempjson: String;
  i, X, Y, z, w, ItemIndex,O,M: integer;
  Found, Level2, Level2Found, CustomFile,SkipChoice: Boolean;
begin
SkipChoice:=false;
if ModFile='IMM_Merged_Mod' then SkipChoice:=true;
if DebugMode then
  begin
  form6.Memo1.Lines.Append('ImportMod2 function called with variables:');
  form6.Memo1.Lines.Append('ModFile:'+ModFile);
  form6.Memo1.Lines.Append('AsString:'+AsString);
  form6.Memo1.Lines.Append('Location:'+Location);
  form6.Memo1.Lines.Append('PakfileLocation:'+PakfileLocation);
  if IsMerge then form6.Memo1.Lines.Append('IsMerge:true')
  else
  form6.Memo1.Lines.Append('IsMerge:false');
  form6.Memo1.Lines.Append('');
  end;
  if AsString='' then
  if not FileExists(ModFile) then
  begin
    ShowMessage(ModFile + ' does not exist!');
    exit;
  end;
    if System.SysUtils.DirectoryExists(ExtractFilePath(Application.ExeName) + 'data') then
    begin
      if Location = '' then
        Location := ExtractFilePath(Application.ExeName);
      Log.Lines.Append('Attempting to create ' + ModFile);
      TempListBox1.clear;
      TempListBox2.clear;
      Memo1.Lines.clear;
      selectedFile := ModFile;
      try
        if AsString<>'' then Mergedjson := TJSONObject.ParseJSONValue(AsString)
        else Mergedjson := TJSONObject.ParseJSONValue(TFile.ReadAllText(selectedFile));
        if Mergedjson=nil then
        begin
        form6.Memo1.Lines.Append('ImportMod2 function called with variables:');
        form6.Memo1.Lines.Append('ModFile:'+ModFile);
        form6.Memo1.Lines.Append('AsString:'+AsString);
        form6.Memo1.Lines.Append('Location:'+Location);
        form6.Memo1.Lines.Append('PakfileLocation:'+PakfileLocation);
        if IsMerge then form6.Memo1.Lines.Append('IsMerge:true')
        else
        form6.Memo1.Lines.Append('IsMerge:false');
        form6.Memo1.Lines.Append('');
        if AsString<>'' then
        form6.Memo1.Lines.Append(JSONFormat(AsString));
        Form6.show;
        ShowMessage('There was an issue with Loading the json!');
        exit;
        end;

        if (Mergedjson as TJSONObject).FindValue('Level2') <> nil then
          if (Mergedjson as TJSONObject).FindValue('Level2').value = 'True' then
          begin
            Log.Lines.Append('Import set to Level 2!');
            Level2 := true;
          end;
        // Create Mod/data folders
        if IsMerge = false then
        Begin
          Log.Lines.Append('Creating Mod Folders.');
          if not System.SysUtils.DirectoryExists(Location + (Mergedjson as TJSONObject).FindValue('ModName').value) then CreateDir(Location + (Mergedjson as TJSONObject).FindValue('ModName').value);
          if not System.SysUtils.DirectoryExists(Location + (Mergedjson as TJSONObject).FindValue('ModName').value + '\data') then CreateDir(Location + (Mergedjson as TJSONObject).FindValue('ModName').value + '\data');
        End;
        // ********************************
        // Loop through each file from mod
        // *********************************
        for X := 0 to ((Mergedjson as TJSONObject).FindValue('Rows') as TJSONArray).Count - 1 do
        begin
          // get current folder/file name
          jFileName := (((Mergedjson as TJSONObject).FindValue('Rows') as TJSONArray)[X] as TJSONObject).FindValue('CurrentFile').value;
          // Make sure it not the end of file
          if jFileName <> 'EndOfMod' then
          begin
            // Clear up items
            tempjson := '';
            CustomFile := false;
            // Fix folder/filename
            jFileName := jFileName.Replace('-', '\');
            // Create current mod files folder
            Log.Lines.Append('Creating Mods json file ' + jFileName);
            if IsMerge = false then
              System.SysUtils.ForceDirectories(ExtractFilePath(Location + (Mergedjson as TJSONObject).GetValue('ModName').value + '\data\' + jFileName))
            else
              System.SysUtils.ForceDirectories(ExtractFilePath(Location + 'IMM_Merged_Mod\data\' + jFileName));
            Log.Lines.Append(ExtractFilePath(jFileName) + ' folder created.');

            // Load Original json data
            try
              if IsMerge = true then
              begin
                if FileExists(ExtractFilePath(Application.ExeName) + 'IMM_Merged_Mod\data' + '\' + jFileName) then
                  Icarusjson := TJSONObject.ParseJSONValue(TFile.ReadAllText(ExtractFilePath(Application.ExeName) + 'IMM_Merged_Mod\data' + '\' + jFileName))
                else
                if FileExists(ExtractFilePath(Application.ExeName) + 'data' + '\' + jFileName) then
                  Icarusjson := TJSONObject.ParseJSONValue(TFile.ReadAllText(ExtractFilePath(Application.ExeName) + 'data' + '\' + jFileName))
                else
                  CustomFile := true;
              end
              else if FileExists(ExtractFilePath(Application.ExeName) + 'data' + '\' + jFileName) then
                Icarusjson := TJSONObject.ParseJSONValue(TFile.ReadAllText(ExtractFilePath(Application.ExeName) + 'data' + '\' + jFileName))
              else
                CustomFile := true;
              // *******************************
              // Custom File, create entire File
              // *******************************
              if CustomFile then
              begin
                tempjson := (((Mergedjson as TJSONObject).FindValue('Rows') as TJSONArray)[X] as TJSONObject).FindValue('File_Items').ToString;
                if tempjson[1] = '[' then
                  Delete(tempjson, 1, 1);
                Log.Lines.Append('Created - ' + jFileName);
                Memo1.Lines.Text := JSONFormat(tempjson);
                Memo1.Lines.Delete(Memo1.Lines.Count - 1);
                Memo1.Lines.Text := Memo1.Lines.Text;
                if IsMerge = false then
                  Memo1.Lines.SaveToFile(Location + (Mergedjson as TJSONObject).FindValue('ModName').value + '\data\' + jFileName)
                else
                  Memo1.Lines.SaveToFile(Location + 'IMM_Merged_Mod\data\' + jFileName);
                Log.Lines.Append('Saved - ' + jFileName);
              end
              else
              begin
                // *************************
                // Compare json files header
                // *************************
                Log.Lines.Append('Comparing File Header.');
                tempjson := '{';
                for i := 0 to (Icarusjson as TJSONObject).Count - 2 do
                begin
                  if (((Mergedjson as TJSONObject).FindValue('Rows') as TJSONArray)[X] as TJSONObject).FindValue('Defaults') <> nil then
                  begin
                    if (Icarusjson as TJSONObject).Pairs[i].JsonString.value = 'Defaults' then
                      tempjson := tempjson + '"Defaults":' + (((Mergedjson as TJSONObject).FindValue('Rows') as TJSONArray)[X] as TJSONObject).FindValue('Defaults').ToString + ','
                    else
                      tempjson := tempjson + (Icarusjson as TJSONObject).Pairs[i].ToString + ',';
                  end
                  else
                    tempjson := tempjson + (Icarusjson as TJSONObject).Pairs[i].ToString + ',';

                end;
                // ************************************
                // Setup and compare items in json file
                // ************************************
                tempjson := tempjson + '"Rows":[';
                // Start to compare and add Items from json to array
                for Y := 0 to ((Icarusjson as TJSONObject).FindValue('Rows') as TJSONArray).Count - 1 do
                begin
                // Loop for Original File Items
                for z := 0 to ((((Mergedjson as TJSONObject).FindValue('Rows') as TJSONArray)[X] as TJSONObject).FindValue('File_Items') as TJSONArray).Count - 1 do
                // Mod json loop
                  begin
                  Found := false;
                  // Compare Items to see if they match
                  if (((((Mergedjson as TJSONObject).FindValue('Rows') as TJSONArray)[X] as TJSONObject).FindValue('File_Items') as TJSONArray)[z] as TJSONObject).FindValue('Name')
                  .value = (((Icarusjson as TJSONObject).FindValue('Rows') as TJSONArray)[Y] as TJSONObject).FindValue('Name').value then
                    begin
                    // Items match found!
                    TempListBox1.Items.Append((((((Mergedjson as TJSONObject).FindValue('Rows') as TJSONArray)[X] as TJSONObject).FindValue('File_Items') as TJSONArray)[z] as TJSONObject)
                    .FindValue('Name').value);
                    Found := true;
                    break;
                    end;
                  end;
                  // *********************************'***
                  // Items from original and modded match!
                  // *************************************
                  if Found = true then
                   begin
                   if Level2 then
                     begin
                     // ****************************
                     // Compare Level 2 items values
                     //*****************************
                     // Setup begining of item
                     Level2tempjson:='';
                      TempListBox2.clear;
                     // Loop through Original items values
                     for O := 0 to (((Icarusjson as TJSONObject).FindValue('Rows') as TJSONArray)[Y] as TJSONObject).count-1 do
                       begin
                       Level2Found:=false;
                       // Loop through mods items values
                       for M := 0 to (((((Mergedjson as TJSONObject).FindValue('Rows') as TJSONArray)[X] as TJSONObject).FindValue('File_Items') as TJSONArray)[z] as TJSONObject).count-1  do
                         begin
                         // Compare Items value name
                         if (((((Mergedjson as TJSONObject).FindValue('Rows') as TJSONArray)[X] as TJSONObject).FindValue('File_Items') as TJSONArray)[z] as TJSONObject).Get(M).JsonString.ToString=
                         (((Icarusjson as TJSONObject).FindValue('Rows') as TJSONArray)[Y] as TJSONObject).Get(O).JsonString.ToString then
                           begin
                           // Items Values Match!!
                           TempListBox2.Items.Append((((((Mergedjson as TJSONObject).FindValue('Rows') as TJSONArray)[X] as TJSONObject).FindValue('File_Items') as TJSONArray)[z] as TJSONObject).Get(M).JsonString.ToString);
                           Level2Found:=true;
                           if Level2tempjson='' then
                           Level2tempjson:=Level2tempjson+'{'+(((((Mergedjson as TJSONObject).FindValue('Rows') as TJSONArray)[X] as TJSONObject).FindValue('File_Items') as TJSONArray)[z] as TJSONObject).Get(M).ToString
                           else
                           Level2tempjson:=Level2tempjson+','+(((((Mergedjson as TJSONObject).FindValue('Rows') as TJSONArray)[X] as TJSONObject).FindValue('File_Items') as TJSONArray)[z] as TJSONObject).Get(M).ToString;
                           break;
                           end;

                         end;
                         if not Level2Found then
                         if Level2tempjson='' then
                         Level2tempjson:=Level2tempjson+'{'+(((Icarusjson as TJSONObject).FindValue('Rows') as TJSONArray)[Y] as TJSONObject).Get(O).ToString
                         else
                         Level2tempjson:=Level2tempjson+','+(((Icarusjson as TJSONObject).FindValue('Rows') as TJSONArray)[Y] as TJSONObject).Get(O).ToString;
                       end;
                     //  Add any items custom values
                     //  That were not added
                     for M := 0 to (((((Mergedjson as TJSONObject).FindValue('Rows') as TJSONArray)[X] as TJSONObject).FindValue('File_Items') as TJSONArray)[z] as TJSONObject).count-1  do
                     if TempListBox2.Items.IndexOf((((((Mergedjson as TJSONObject).FindValue('Rows') as TJSONArray)[X] as TJSONObject).FindValue('File_Items') as TJSONArray)[z] as TJSONObject).Get(M).JsonString.ToString) = -1
                     then Level2tempjson:=Level2tempjson+','+(((((Mergedjson as TJSONObject).FindValue('Rows') as TJSONArray)[X] as TJSONObject).FindValue('File_Items') as TJSONArray)[z] as TJSONObject).Get(M).ToString;
                     // Add items ending bracket
                     if Level2tempjson<>'' then Level2tempjson:=Level2tempjson+'},';
                     Form6.Memo1.Lines.Append('');
                     Form6.Memo1.Lines.Append(Level2tempjson);
                     tempjson := tempjson + Level2tempjson;
                     end
                   else
                   tempjson := tempjson + (((((Mergedjson as TJSONObject).FindValue('Rows') as TJSONArray)[X] as TJSONObject).FindValue('File_Items') as TJSONArray)[z] as TJSONObject).ToString + ',';
                   end
                   else
                    tempjson := tempjson + (((Icarusjson as TJSONObject).FindValue('Rows') as TJSONArray)[Y] as TJSONObject).ToString + ',';
                end;
                // Add the new items from modfile
                // For FileItem2 in (ModRowItem as TJSONObject).GetValue('File_Items') as TJSONArray do
                for w := 0 to ((((Mergedjson as TJSONObject).FindValue('Rows') as TJSONArray)[X] as TJSONObject).FindValue('File_Items') as TJSONArray).Count - 1 do
                begin
                  if TempListBox1.Items.IndexOf((((((Mergedjson as TJSONObject).FindValue('Rows') as TJSONArray)[X] as TJSONObject).FindValue('File_Items') as TJSONArray)[w] as TJSONObject)
                    .GetValue('Name').value) = -1 then
                  begin
                    tempjson := tempjson + (((((Mergedjson as TJSONObject).FindValue('Rows') as TJSONArray)[X] as TJSONObject).FindValue('File_Items') as TJSONArray)[w] as TJSONObject).ToString + ',';
                    //TempListBox2.Items.Append((((((Fulljson as TJSONObject).FindValue('Rows') as TJSONArray)[X] as TJSONObject).FindValue('File_Items') as TJSONArray)[w] as TJSONObject).FindValue('Name').value);
                  end;
                end;
                Delete(tempjson, length(tempjson), 1);
                tempjson := tempjson + ']}';
                Log.Lines.Append('Created - ' + jFileName);
                Memo1.Lines.Text := JSONFormat(tempjson);
                Memo1.Lines.Delete(Memo1.Lines.Count - 1);
                Memo1.Lines.Text := Memo1.Lines.Text + '}';
                if IsMerge = false then
                  Memo1.Lines.SaveToFile(Location + (Mergedjson as TJSONObject).FindValue('ModName').value + '\data\' + jFileName)
                else
                  Memo1.Lines.SaveToFile(Location + 'IMM_Merged_Mod\data\' + jFileName);
                Log.Lines.Append('Saved - ' + jFileName);
              end;
            finally
              tempjson := '';
              FreeAndNil(Icarusjson);
            end;
          end;

        end;
        if IsMerge = false then
        begin
          Log.Lines.Append((Mergedjson as TJSONObject).FindValue('ModName').value + ' has been succesfully Created.');
          Log.Lines.Append('Re-PAKing ' + (Mergedjson as TJSONObject).FindValue('ModName').value);
          if PakfileLocation = '' then
            PakfileLocation := IcarusModsFolder;
          if RepackFile(Location + (Mergedjson as TJSONObject).GetValue('ModName').value, PakfileLocation) then
          begin
            Log.Lines.Append((Mergedjson as TJSONObject).GetValue('ModName').value + ' Mod was PAKed.');
            // ShowMessage(ModName+' Mod was Created.');
          end;
        end
        else
          Log.Lines.Append((Mergedjson as TJSONObject).FindValue('ModName').value + ' has been succesfully Added.');
      finally
        Mergedjson.free;
      end;
    end
    else
      ShowMessage('data folder has not been unPAKed!');
end;

procedure TForm1.E1Click(Sender: TObject);
begin
 if ListBox3.ItemIndex = -1 then
    exit;

  if FileExists(FileListBox1.Directory + '\' + ListBox3.Items[ListBox3.ItemIndex] + '.EXMOD') then
  begin
  Form7.memo1.lines.loadfromfile(FileListBox1.Directory + '\' + ListBox3.Items[ListBox3.ItemIndex] + '.EXMOD');
  Form7.label3.Caption:=ExtractFileName(FileListBox1.Directory + '\' + ListBox3.Items[ListBox3.ItemIndex] + '.EXMOD');
  Form7.label4.Caption:=FileListBox1.Directory + '\' + ListBox3.Items[ListBox3.ItemIndex] + '.EXMOD';
  Form7.button1.Click;
  Form7.show;
  end;

end;

function TForm1.ExtractModData(ModFolder: String; ModName: String; OrigFolder: String; SaveFolder: String): Boolean;
var
  i, X: integer;
  ModJson: String;
  CurrentFile,TempmodFolder: string;
begin
if DebugMode then
begin
form6.Memo1.Lines.Append('ExtractModData function called with these variable:');
form6.Memo1.Lines.Append('ModFolder:'+ModFolder);
form6.Memo1.Lines.Append('ModName:'+ModName);
form6.Memo1.Lines.Append('OrigFolder:'+OrigFolder);
form6.Memo1.Lines.Append('SaveFolder:'+SaveFolder);
form6.Memo1.Lines.Append('');
end;
  Log.Lines.Append('Creating folders for ' + ModName);
  if not System.SysUtils.DirectoryExists(ExtractFilePath(Application.ExeName) + ModName) then
    CreateDir(ExtractFilePath(Application.ExeName) + ModName);
  if not System.SysUtils.DirectoryExists(ExtractFilePath(Application.ExeName) + ModName + '\data') then
    CreateDir(ExtractFilePath(Application.ExeName) + ModName + '\data');
  Log.Lines.Append('Attempting to Extract custom json from ' + ModFolder);
  if Form3.CheckBox1.Checked then
    Log.Lines.Append('Extraction set to Level 2.')
  else
    Log.Lines.Append('Extraction set to Level 1.');
  TempListBox1.clear;
  TempListBox2.clear;
  Memo1.Lines.clear;
  if DebugMode then form2.Memo1.Lines.Append('Getting List of files from:'+ModFolder);
  TempmodFolder:=ModFolder;
  if System.SysUtils.DirectoryExists(ModFolder) then
    ListDir(TempmodFolder, TempListBox1)
  else
  begin
    ShowMessage('Mod Folder: '+ModFolder + ' Does not exist, Please try again!!');
    exit;
  end;
  if OrigFolder='' then
  if System.SysUtils.DirectoryExists(ExtractFilePath(Application.ExeName) + 'data') then
        OrigFolder := ExtractFilePath(Application.ExeName) + 'data';
  OrigFolder:=OrigDataFolder;
  if System.SysUtils.DirectoryExists(OrigFolder) then
    ListDir(OrigFolder, TempListBox2)
  else
  begin
    ShowMessage('Extracted data folder Does not exist! This is needed to compare json data from! Please try to updata data folder.');
    exit;
  end;
  if Form3.CheckBox1.Checked then
    Memo1.Lines.Append('{"ModName":"' + ModName + '","Level2":"True","Rows":[')
  else
    Memo1.Lines.Append('{"ModName":"' + ModName + '","Rows":[');
  for i := 0 to TempListBox1.Items.Count - 1 do
  begin
    CurrentFile := ExtractFileName(TempListBox1.Items[i]);
    if ExtractFileExt(CurrentFile) = '.json' then
    begin
      for X := 0 to TempListBox2.Items.Count - 1 do
      begin
        If TempListBox2.Items[X].Contains(CurrentFile) then
        begin
          OrigFolder := StringReplace(StringReplace(TempListBox2.Items[X], ExtractFilePath(Application.ExeName), '', [rfReplaceAll, rfIgnoreCase]), CurrentFile, '', [rfReplaceAll, rfIgnoreCase]);
          break;
        end
        else
          OrigFolder := '';
      end;
      if CurrentFile = 'DataTableMetadata.json' then
        Log.Lines.Append('Skipping file DataTableMetadata.json!')
      else
      begin
        Log.Lines.Append('Extracting json from ' + CurrentFile + ' in relation to ' + OrigFolder + CurrentFile);
        if DebugMode then form2.Memo1.Lines.Append('Extracting json from ' + CurrentFile + ' in relation to ' + OrigFolder + CurrentFile);
        ModJson := (CompareModFile2(TempListBox1.Items[i], ExtractFilePath(Application.ExeName) + OrigFolder + CurrentFile, OrigFolder + CurrentFile,false));
        if ModJson <> 'none' then
        begin
          Delete(ModJson, length(ModJson), 1);
          Memo1.Lines.Append(ModJson + ']},');
        end;

      end;
    end
    else if (CurrentFile = 'Banner.png') or (CurrentFile = 'banner.png') or (CurrentFile = 'ImageOnly.png') or (CurrentFile = 'imageonly.png') then
    begin
      Log.Lines.Append('Copying ' + TempListBox1.Items[i] + ' to ' + ExtractFilePath(Application.ExeName) + ModName + '\' + CurrentFile);
      TFile.Copy(TempListBox1.Items[i], ExtractFilePath(Application.ExeName) + ModName + '\' + CurrentFile, true);
    end
    else if (CurrentFile = 'readme.txt') or (CurrentFile = 'Readme.txt') then
    begin
      Log.Lines.Append('Copying ' + TempListBox1.Items[i] + ' to ' + ExtractFilePath(Application.ExeName) + ModName + '\' + CurrentFile);
      TFile.Copy(TempListBox1.Items[i], ExtractFilePath(Application.ExeName) + ModName + '\' + CurrentFile, true);
    end
    else if ExtractFileExt(CurrentFile) = '.uasset' then
    begin
      Log.Lines.Append('Copying ' + TempListBox1.Items[i] + ' to ' + ExtractFilePath(Application.ExeName) + ModName + StringReplace(TempListBox1.Items[i], ModFolder, '',
        [rfReplaceAll, rfIgnoreCase]));
      System.SysUtils.ForceDirectories(ExtractFilePath(ExtractFilePath(Application.ExeName) + ModName + StringReplace(TempListBox1.Items[i], ModFolder, '', [rfReplaceAll, rfIgnoreCase])));
      TFile.Copy(TempListBox1.Items[i], ExtractFilePath(Application.ExeName) + ModName + StringReplace(TempListBox1.Items[i], ModFolder, '', [rfReplaceAll, rfIgnoreCase]), true);
    end
    else if ExtractFileExt(CurrentFile) = '.uexp' then
    begin
      Log.Lines.Append('Copying ' + TempListBox1.Items[i] + ' to ' + ExtractFilePath(Application.ExeName) + ModName + StringReplace(TempListBox1.Items[i], ModFolder, '',
        [rfReplaceAll, rfIgnoreCase]));
      System.SysUtils.ForceDirectories(ExtractFilePath(ExtractFilePath(Application.ExeName) + ModName + StringReplace(TempListBox1.Items[i], ModFolder, '', [rfReplaceAll, rfIgnoreCase])));
      TFile.Copy(TempListBox1.Items[i], ExtractFilePath(Application.ExeName) + ModName + StringReplace(TempListBox1.Items[i], ModFolder, '', [rfReplaceAll, rfIgnoreCase]), true);
    end
    else if ExtractFileExt(CurrentFile) = '.ubulk' then
    begin
      Log.Lines.Append('Copying ' + TempListBox1.Items[i] + ' to ' + ExtractFilePath(Application.ExeName) + ModName + StringReplace(TempListBox1.Items[i], ModFolder, '',
        [rfReplaceAll, rfIgnoreCase]));
      System.SysUtils.ForceDirectories(ExtractFilePath(ExtractFilePath(Application.ExeName) + ModName + StringReplace(TempListBox1.Items[i], ModFolder, '', [rfReplaceAll, rfIgnoreCase])));
      TFile.Copy(TempListBox1.Items[i], ExtractFilePath(Application.ExeName) + ModName + StringReplace(TempListBox1.Items[i], ModFolder, '', [rfReplaceAll, rfIgnoreCase]), true);
    end
    else if ExtractFileExt(CurrentFile) = '.bak' then
    begin
      // skip backup files

    end
    else if ExtractFileExt(CurrentFile) <> '' then
    begin
      case MessageDlg(CurrentFile + ' File not recognized, would you like to copy to Mod Folder?', mtConfirmation, [mbYes, mbNo], 0) of
        mrYes:
          begin
            System.SysUtils.ForceDirectories(ExtractFilePath(ExtractFilePath(ExtractFilePath(Application.ExeName)) + ModName + StringReplace(TempListBox1.Items[i], ModFolder, '', [rfReplaceAll, rfIgnoreCase])));
            TFile.Copy(TempListBox1.Items[i], ExtractFilePath(ExtractFilePath(Application.ExeName)) + ModName + StringReplace(TempListBox1.Items[i], ModFolder, '', [rfReplaceAll, rfIgnoreCase]));
          end;
        mrNo:
          begin
            // Write code here for pressing button Cancel
          end;
      end;
    end;
  end;
  Memo1.Lines.Append('{"CurrentFile":"EndOfMod"}]}');
  ModJson := Memo1.Text;
  Memo1.Lines.clear;
  Memo1.Lines.Append(JSONFormat(ModJson));
  Log.Lines.Append('Extraction complete!');
  Memo1.Lines.SaveToFile(SaveFolder + '\' + ModName + '.EXMod');
  Log.Lines.Append('Saved Extracted data to ' + SaveFolder + '\' + ModName + '.EXMod');
  TempListBox1.clear;
  TempListBox2.clear;
  Memo1.Lines.clear;
  result := true;
end;

function TForm1.GetExtractedModFolder(ModName: String): String;
var
  ModJSONObject: TJSonValue;
  ModNameString: String;
begin
  try
    ModJSONObject := TJSONObject.ParseJSONValue(TFile.ReadAllText(FileListBox1.Directory + '\' + ModName));
    // Get Mod Name
    ModNameString := (ModJSONObject as TJSONObject).GetValue('ModName').value;
    result := ModNameString;
  finally
    ModJSONObject.free;
  end;
end;

procedure TForm1.AddModtoGame1Click(Sender: TObject);
var
  ModCurFilename: String;
  i: integer;
begin

  ModCurFilename := FileListBox1.Directory + '\' + ListBox3.Items[ListBox3.ItemIndex] + '.EXMOD';
if FileExists(ModCurFilename) then
    if ImportMod2(ModCurFilename,'', '', IcarusModsFolder, false) then
      ShowMessage('Mod has been added!');
    sleep(200);
    ListBox4.clear;
    FileListBox2.Update;
    FileListBox2.Directory:=FileListBox2.Directory;
    FileListBox2.Update;
    sleep(200);
    ListBox4.clear;
   for i := 0 to FileListBox2.Items.Count - 1 do
  begin
    ListBox4.Items.Append(ChangeFileExt(FileListBox2.Items[i], ''));
  end;
  Listbox4.Repaint;
  exit;
end;

procedure TForm1.Button13Click(Sender: TObject);
var
  modsname: string;
  modFolders, Filename: string;
begin
  Filename := IcarusContentFolder + '\Data\data.pak';
  DeleteDirectory(ExtractFilePath(Application.ExeName) + 'tempMod');
  modFolders := GetFolders(Filename);
  modFolders := StringReplace(modFolders, '../../../Icarus/Content', '', [rfReplaceAll, rfIgnoreCase]);
  modFolders := StringReplace(modFolders, '/', '\', [rfReplaceAll, rfIgnoreCase]);
  modsname := 'This_Weeks_Changes';
  Log.Lines.Append('Creating ' + modsname);
  if not System.SysUtils.DirectoryExists(ExtractFilePath(Application.ExeName) + 'tempMod') then
    CreateDir(ExtractFilePath(Application.ExeName) + 'tempMod');
  Log.Lines.Append('Unpacking: ' + Filename);
  UnpackFile(Filename, ExtractFilePath(Application.ExeName) + 'tempMod\' + modsname + modFolders);
  Sleep(100);
  ImportModSelected(ExtractFilePath(Application.ExeName) + 'tempMod\' + modsname, modsname);
  Sleep(100);
  FileListBox1.Update;
  Sleep(100);
end;

procedure TForm1.Button14Click(Sender: TObject);

begin
  if System.SysUtils.DirectoryExists(ExtractFilePath(Application.ExeName) + 'tempMod') then
    DeleteDirectory(ExtractFilePath(Application.ExeName) + 'tempMod');
  CreateDir(ExtractFilePath(Application.ExeName) + 'tempMod');
  if ExtractModData(OrigDataFolder, 'TestExtraction', 'tempMod', ExtractFilePath(Application.ExeName) + 'Extracted Mods') then
    ShowMessage('Extraction test complete');

end;

procedure TForm1.Button16Click(Sender: TObject);
begin
Form6.Show;
end;

procedure TForm1.Button17Click(Sender: TObject);
var
  modsname: string;
  modFolders: string;
begin
  with TFileOpenDialog.Create(nil) do
    try
      title := 'Select Mod PAK file for Importing.';
      FileTypes.Add.FileMask := '*.pak';
      if Execute then
      begin
        Screen.Cursor := crHourGlass;
        DeleteDirectory(ExtractFilePath(Application.ExeName) + 'tempMod');
        modFolders := GetFolders(Filename);
        modFolders := StringReplace(modFolders, '../../../Icarus/Content', '', [rfReplaceAll, rfIgnoreCase]);
        modFolders := StringReplace(modFolders, '/', '\', [rfReplaceAll, rfIgnoreCase]);
        modsname := ExtractFileName(Filename);
        modsname := StringReplace(modsname, ' _p.pak', '', [rfReplaceAll, rfIgnoreCase]);
        modsname := StringReplace(modsname, '_p.pak', '', [rfReplaceAll, rfIgnoreCase]);
        Log.Lines.Append('Creating ' + modsname);
        if not System.SysUtils.DirectoryExists(ExtractFilePath(Application.ExeName) + 'tempMod') then
          CreateDir(ExtractFilePath(Application.ExeName) + 'tempMod');
        Log.Lines.Append('Unpacking: ' + Filename);
        // Unpak mod file
        UnpackFile(Filename, ExtractFilePath(Application.ExeName) + 'tempMod\' + modsname + modFolders);
        Sleep(300);
        // Import unpacked mod folder from tempMod folder
        ImportModSelected(ExtractFilePath(Application.ExeName) + 'tempMod\' + modsname, modsname);
        Sleep(100);
        FileListBox1.Update;
        Sleep(100);
        Screen.Cursor := crDefault;
      end;

    finally
      free;
      Screen.Cursor := crDefault;
    end;
    Form2.Memo1.Lines.Append('Attempting to Import file:');
    Form2.Memo1.Lines.Append(ExtractFilePath(Application.ExeName)+'Extracted Mods\'+modsname+'.EXMod');
   if FileExists(ExtractFilePath(Application.ExeName)+'Extracted Mods\'+modsname+'.EXMod') then
    if ImportMod2(ExtractFilePath(Application.ExeName)+'Extracted Mods\'+modsname+'.EXMod','', '', IcarusModsFolder, false) then
      ShowMessage('Mod has been added!');
  FileListBox2.Update;
end;


function TForm1.GetFolders(PAKfilename: string): string;
var
  sl: TStringList;
  line: string;
  position: integer;
begin
  try
    sl := TStringList.Create;
    sl.LoadFromFile(PAKfilename);
    for line in sl do
    begin
      position := Pos('../../../Icarus', line);
      if position <> 0 then
      begin
        result := Copy(line, position, length(line) - position);
        break;
      end;
    end;
  finally
    sl.free;
  end;
end;



function TForm1.CompareModFile2(ModFilename, OrigFilename, CurFile: String; ConfirmChange:Boolean): String;
var
  jsontext, Level2jsontext: String;
  Origjsontext, Modjsontext, Level2Origjsontext, Level2Modjsontext, Default, OrigName, MergeName, Level2OrigName, Level2MergeName: String;
  match, modified, Level2match, Level2modified, NotFirstMod: Boolean;
  MergedJSON: TJSonValue;
  DefaultJSON: TJSonValue;
  i, X, w, z: integer;
begin
NotFirstMod:=false;
if DebugMode then
  begin
  form6.Memo1.Lines.Append('CompareModeFile2 function called with these variables');
  form6.Memo1.Lines.Append('ModFilename:'+ModFilename);
  form6.Memo1.Lines.Append('OrigFilename:'+OrigFilename);
  form6.Memo1.Lines.Append('CurFile:'+CurFile);
  form6.Memo1.Lines.Append('');
  end;
  try
    if FileExists(ModFilename) then
    begin
      MergedJSON := TJSONObject.ParseJSONValue(TFile.ReadAllText(ModFilename));

      if MergedJSON=nil then
      begin
      form6.Memo1.Lines.Append('CompareModeFile2 function called with these variables');
      form6.Memo1.Lines.Append('ModFilename:'+ModFilename);
      form6.Memo1.Lines.Append('OrigFilename:'+OrigFilename);
      form6.Memo1.Lines.Append('CurFile:'+CurFile);
      form6.Memo1.Lines.Append('');
      form6.Memo1.Lines.Append(TFile.ReadAllText(ModFilename));
      form6.Show;
      ShowMessage('There was a problem parsing Mods json!');
      exit;
      end;

      if FileExists(OrigFilename) then
      begin
        DefaultJSON := TJSONObject.ParseJSONValue(TFile.ReadAllText(OrigFilename));
        if DefaultJSON=nil then
          begin
          form6.Memo1.Lines.Append('CompareModeFile2 function called with these variables');
          form6.Memo1.Lines.Append('ModFilename:'+ModFilename);
          form6.Memo1.Lines.Append('OrigFilename:'+OrigFilename);
          form6.Memo1.Lines.Append('CurFile:'+CurFile);
          form6.Memo1.Lines.Append('');
          form6.Memo1.Lines.Append(TFile.ReadAllText(ModFilename));
          form6.Show;
          ShowMessage('There was a problem parsing Original json!');
          exit;
          end;
      end
      else
      begin
        // Mod file does not exist so extract entire File!!!!
        Log.Lines.Append(CurFile + ' does not exist in json files! Extracting entire file!');
        jsontext := (MergedJSON as TJSONObject).ToString + '}';
        CurFile := StringReplace(CurFile, 'data\', '', [rfReplaceAll, rfIgnoreCase]);
        CurFile := CurFile.Replace('\', '-');
        // ShowMessage('Extracting from file: '+CurFile);
        if jsontext <> '' then
          result := '{"CurrentFile":"' + CurFile + '",' + Default +'"File_Items":[' + jsontext
        else
          result := 'none';
        exit;
      end;
      // Compare the defaults header at top of json file!!!
      Origjsontext := (DefaultJSON as TJSONObject).GetValue('Defaults').ToString;
      Modjsontext := (MergedJSON as TJSONObject).GetValue('Defaults').ToString;
      if AnsiCompareStr(Modjsontext, Origjsontext) <> 0 then
        Default := '"Defaults":' + Modjsontext + ','
      else
        Default := '';
      // ************************************
      // Begin current files Items comparison
      // ************************************

      // Loop for Original ROW Items
      for i := 0 to ((MergedJSON as TJSONObject).GetValue('Rows') as TJSONArray).Count - 1 do
      begin
        match := false;
        modified := false;
        MergeName := (((MergedJSON as TJSONObject).GetValue('Rows') as TJSONArray)[i] as TJSONObject).GetValue('Name').value;
        // Loop for Mods ROW Items
        for X := 0 to ((DefaultJSON as TJSONObject).GetValue('Rows') as TJSONArray).Count - 1 do
        begin
          OrigName := (((DefaultJSON as TJSONObject).GetValue('Rows') as TJSONArray)[X] as TJSONObject).GetValue('Name').value;
          if OrigName = MergeName then
          begin
            match := true;
            Origjsontext := (((DefaultJSON as TJSONObject).GetValue('Rows') as TJSONArray)[X] as TJSONObject).ToString;
            Modjsontext := (((MergedJSON as TJSONObject).GetValue('Rows') as TJSONArray)[i] as TJSONObject).ToString;
            if AnsiCompareStr(Modjsontext, Origjsontext) = 0 then
            begin
              break;
            end
            else
            begin
              modified := true;
              if DebugMode then form6.Memo1.Lines.Append('Current Item: '+MergeName);
              // Only do if Level 2 extraction selected!!
              // Experimental ********
              if Form3.CheckBox1.Checked then
              begin
                // Loop for Original Items Values
                if DebugMode then form6.Memo1.Lines.Append('Modified item Found:'+MergeName);
                for w := 0 to (((MergedJSON as TJSONObject).GetValue('Rows') as TJSONArray)[i] as TJSONObject).Count - 1 do
                begin
                  if DebugMode then form6.Memo1.Lines.Append('Checking Item Value:'+(((MergedJSON as TJSONObject).GetValue('Rows') as TJSONArray)[i] as TJSONObject).Get(w).JsonString.ToString);
                  Level2match := false;
                  Level2modified := false;
                  Level2MergeName := (((MergedJSON as TJSONObject).GetValue('Rows') as TJSONArray)[i] as TJSONObject).Get(w).JsonString.ToString;
                  // Loop for Mods Items Values
                  for z := 0 to (((DefaultJSON as TJSONObject).GetValue('Rows') as TJSONArray)[X] as TJSONObject).Count - 1 do
                  begin
                    Level2OrigName := (((DefaultJSON as TJSONObject).GetValue('Rows') as TJSONArray)[X] as TJSONObject).Get(z).JsonString.ToString;
                    if Level2MergeName = Level2OrigName then
                    begin
                      if DebugMode then form6.Memo1.Lines.Append('Item Value Match found.');
                      Level2match := true;
                      Level2Origjsontext := (((DefaultJSON as TJSONObject).GetValue('Rows') as TJSONArray)[X] as TJSONObject).Get(z).ToString;
                      Level2Modjsontext := (((MergedJSON as TJSONObject).GetValue('Rows') as TJSONArray)[i] as TJSONObject).Get(w).ToString;
                      if AnsiCompareStr(Level2Modjsontext, Level2Origjsontext) = 0 then
                      begin
                        break;
                      end
                      else
                      begin
                      if DebugMode then form6.Memo1.Lines.Append('');
                      if DebugMode then form6.Memo1.Lines.Append('Item Value in Mod is different!');
                      if DebugMode then form6.Memo1.Lines.Append('Mod value:'+Level2Modjsontext);
                      if DebugMode then form6.Memo1.Lines.Append('Original value:'+Level2Origjsontext);
                        Level2modified := true;
                        break;
                      end;
                    end;
                  end;
                  if (Level2match = false) or (Level2modified = true) then
                  begin
                  if DebugMode then form6.Memo1.Lines.Append('Adding '+(((MergedJSON as TJSONObject).GetValue('Rows') as TJSONArray)[i] as TJSONObject).Get(w).JsonString.ToString+' to Item');
                    if Level2jsontext <> '' then
                      Level2jsontext := Level2jsontext + ',' + (((MergedJSON as TJSONObject).GetValue('Rows') as TJSONArray)[i] as TJSONObject).Get(w).ToString
                    else
                      Level2jsontext := Level2jsontext + (((MergedJSON as TJSONObject).GetValue('Rows') as TJSONArray)[i] as TJSONObject).Get(w).ToString;
                  end
                end;
                if DebugMode then form2.Memo1.Lines.Append('Level2jsontext:');
                if DebugMode then form2.Memo1.Lines.Append(Level2jsontext);
              end;
              break;
            end;
          end;
        end;
        if match = false then
        begin
          if DebugMode then form6.Memo1.Lines.Append('No Match found for '+MergeName );
          if DebugMode then form6.Memo1.Lines.Append('Adding all json:');
          if DebugMode then form6.Memo1.Lines.Append((((MergedJSON as TJSONObject).GetValue('Rows') as TJSONArray)[i] as TJSONObject).ToString);
          jsontext := jsontext + (((MergedJSON as TJSONObject).GetValue('Rows') as TJSONArray)[i] as TJSONObject).ToString + ',';
        end
        else
        if modified = true then
        begin
          if Form3.CheckBox1.Checked then
          begin
            if Level2jsontext <> '' then
              jsontext := jsontext + '{"Name":"' + MergeName + '",' + Level2jsontext + '},';
            Level2jsontext := '';
          end
          else
            jsontext := jsontext + (((MergedJSON as TJSONObject).GetValue('Rows') as TJSONArray)[i] as TJSONObject).ToString + ',';
        end;
      end;
      CurFile := StringReplace(CurFile, 'data\', '', [rfReplaceAll, rfIgnoreCase]);
      CurFile := CurFile.Replace('\', '-');
      if jsontext <> '' then
        result := '{"CurrentFile":"' + CurFile + '",' + Default +'"File_Items":[' + jsontext
      else
        result := 'none';

    end
    else
    begin
      ShowMessage(ModFilename + ' does not exist! There is an issue with Extracted Mod Folder!');
      exit;
    end;

  finally
    MergedJSON.free;
    DefaultJSON.free;
  end;
end;

procedure TForm1.CreateSetupDebugFile1Click(Sender: TObject);
var i:integer;
begin
log.Lines.Append('Creating Setup Debug file!');
memo1.lines.Clear;
memo1.lines.Append('Icarus Mod Manager Ver 0.7');
memo1.lines.Append('');
memo1.lines.Append('Settings:');
memo1.lines.Append('Contents Folder:');
memo1.lines.Append(IcarusContentFolder);
memo1.lines.Append('Pak File:');
memo1.lines.Append(IcarusDataPAK);
memo1.lines.Append('Mods Folder:');
memo1.lines.Append(IcarusModsFolder);
memo1.lines.Append('Data Folder Date:');
memo1.lines.Append(IcarusdataFolderDate);
memo1.lines.Append('UnrealPak.exe File:');
memo1.lines.Append(UE4PAKFile);
memo1.lines.Append('Program Location:');
memo1.lines.Append(ExtractFilePath(Application.ExeName));
memo1.lines.Append('');
memo1.lines.Append('Mods Installed:');
for i:=0 to listbox3.count-1 do
memo1.lines.Append(listbox3.Items[i]);
TempListBox3.clear;
ListDir(ExtractFilePath(Application.ExeName) , TempListBox3);
memo1.lines.Append('');
memo1.lines.Append('Programs Directory:');
for i:=0 to TempListBox3.count-1 do
memo1.lines.Append(ExtractRelativePath(ExtractFilePath(Application.ExeName),  TempListBox3.Items[i]));

memo1.lines.SaveToFile(ExtractFilePath(Application.ExeName)+'Setup_Debug_File.txt');
log.Lines.Append('Setup_Debug_File.txt Created in Programs folder!');
end;

function TForm1.UnpackFile(Filename: String; Location: String): Boolean;
var
  parameters: String;
  // iRes: Integer;
begin
  if FileExists(Filename) then
  begin
    if FileExists(UE4PAKFile) then
    begin
      parameters := '"' + Filename + '" -extract "' + Location + '"';
      try
        ShellExecute(Handle, 'open', PChar(UE4PAKFile), PChar(parameters), '', SW_SHOWNORMAL);
        result := true;
      finally
        // ShowMessage(Filename+' was UnPAKed!');
      end;
    end
    else
    begin
      ShowMessage('UnrealPak.exe has not been set!');
      Form3.Show;
    end;
  end
  else
  begin
    ShowMessage(Filename + ' Does not Exist!');
    result := false;
  end;
end;

procedure TForm1.Updatedatafolder1Click(Sender: TObject);
begin
  if FileExists(IcarusDataPAK) then
  begin
    UnpackFile(IcarusDataPAK, ExtractFilePath(Application.ExeName) + 'data');
    IcarusdataFolderDate := DateTimeToStr(System.IOUtils.TFile.GetCreationTime(IcarusDataPAK));
  end
  else
  begin
    ShowMessage('Icarus contents folder not set in setting!');
    Form3.Show;
  end;
end;

function TForm1.getSpaces(aQuantity: integer): string;
begin
  result := '';
  while aQuantity > 0 do
  begin
    result := result + '  ';
    dec(aQuantity);
  end;
end;

function TForm1.InsertLineBreaks(const aInput: string): string;
var
  i: integer;
  insideString: Boolean;
  isdialog: Boolean;
  s: string;
begin
  s := '';
  i := 1;
  insideString := false;
  while i <= length(aInput) do
  begin
    if insideString then
    begin
      if (aInput[i] = '\') and (aInput[i + 1] = '/') then
      begin
        s := s + aInput[i + 1];
        inc(i);
        inc(i);
      end
      else
      begin
        s := s + aInput[i];
        if (aInput[i] = '\') and (aInput[i + 1] = '"') then
        begin
          s := s + aInput[i + 1];
          inc(i);
          inc(i);
        end
        else
        begin
          if aInput[i] = '"' then
            insideString := false;
          inc(i);
        end;
      end;
    end
    else
    begin
      case aInput[i] of
        '\':
          begin

            if aInput[i + 1] = '/' then
            begin
              s := s;
              inc(i);
            end
            else
            begin
              s := s + aInput[i];
              inc(i);
            end;
          end;
        '"':
          begin
            s := s + aInput[i];
            insideString := true;
            inc(i);
          end;
        '{':
          begin

            if aInput[i + 1] = '}' then
            begin
              s := s + '{}';
              inc(i, 2);
            end
            else if aInput[i - 1] = ':' then
            begin
              s := s + '{' + sLineBreak;
              inc(i);
            end
            else
            begin
              s := s + sLineBreak + aInput[i] + sLineBreak;
              inc(i);
            end;
          end;
        '[':
          begin

            if aInput[i + 1] = ']' then
            begin
              s := s + '[]';
              inc(i, 2);
            end
            else if aInput[i - 1] = ':' then
            begin
              s := s + '[' + sLineBreak;
              inc(i);
            end
            else if aInput[i - 1] = '"' then
            begin
              s := s + '[';
              inc(i);
            end
            else if aInput[i + 1] = '\' then
            begin
              s := s + '[';
              inc(i);
            end
            else
            begin
              s := s + sLineBreak + aInput[i] + sLineBreak;
              inc(i);
            end;
          end;
        '}', ']':
          begin

            if (length(aInput) > i) and (aInput[i + 1] = ',') then
            begin
              s := s + sLineBreak + aInput[i] + ',' + sLineBreak;
              inc(i, 2);
            end
            else
            begin
              s := s + sLineBreak + aInput[i] + sLineBreak;
              inc(i);
            end;
          end;
        ':':
          begin
            if aInput[i + 1] = ' ' then
              s := s + aInput[i]
            else
              s := s + aInput[i] + ' ';
            inc(i);
          end;
        ',':
          begin

            if aInput[i + 1] = '"' then
            begin
              s := s + aInput[i] + sLineBreak;
              inc(i);
            end
            else
            begin
              s := s + aInput[i] + sLineBreak;
              inc(i);
            end;
          end;
      else
        begin
          s := s + aInput[i];
          inc(i);
        end;
      end;
    end;
  end;
  result := s;
end;

procedure TForm1.ListDir(Path: String; List: TListBox);
var
  SearchRec: TsearchRec;
  result: integer;
  s: string; { Used to hold current directory, GetDir(0,s) }
begin
  try { Exception handler }
    ChDir(Path);
  except
    on EInOutError do
    begin
      MessageDlg('Error occurred by trying to change directory', mtWarning, [mbOK], 0);
      exit;
    end;
  end;
  if length(Path) <> 3 then
    Path := Path + '\'; { Checking if path is root, if not add }
  FindFirst(Path + '*.*', faAnyFile, SearchRec);
  { '\' at the end of the string }
  { and then add '*.*' for all file }
  Repeat
    if SearchRec.Attr = faDirectory then { if directory then }
    begin
      if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then { Ignore '.' and '..' }
      begin
        GetDir(0, s); { Get current dir of default drive }
        if length(s) <> 3 then
          s := s + '\'; { Checking if root }
        List.Items.Add(s + SearchRec.Name); { Adding to list }
        ListDir(s + SearchRec.Name, List); { ListDir found directory }
      end;
    end
    else { if not directory }
    begin
      GetDir(0, s); { Get current dir of default drive }
      if length(s) <> 3 then
        List.Items.Add(s + '\' + SearchRec.Name) { Checking if root }
      else
        List.Items.Add(s + SearchRec.Name); { Adding to list }
    end;
    result := FindNext(SearchRec);
    Application.ProcessMessages;
  until result <> 0; { Found all files, go out }
  GetDir(0, s);
  if length(s) <> 3 then
    ChDir('..'); { if not root then go back one level }
end;

procedure TForm1.GetDirectories(const Strings: TStrings; Directory: string; CurDirectory: string; IncludeFiles: Boolean);
var
  SearchRec: TsearchRec;
  ItemTemp: String;
begin
  ItemTemp := CurDirectory;
  if Directory[length(Directory)] <> '\' then
    Directory := Directory + '\';
  if FindFirst(Directory + '*.*', faDirectory, SearchRec) = 0 then
  begin
    repeat
      if (SearchRec.Attr and faDirectory = faDirectory) and (SearchRec.Name[1] <> '.') then
      begin
        if (SearchRec.Attr and faDirectory > 0) then
          if CurDirectory <> '' then
            ItemTemp := CurDirectory + '\' + SearchRec.Name
          else
            ItemTemp := SearchRec.Name;
        GetDirectories(Strings, Directory + SearchRec.Name, ItemTemp, IncludeFiles);
        // Item := ItemTemp;
      end
      else if IncludeFiles then
        if SearchRec.Name[1] <> '.' then
          Strings.Append(ItemTemp + '\' + SearchRec.Name);

    until FindNext(SearchRec) <> 0;
    FindClose(SearchRec);
  end;

end;

function TForm1.GetFiles(const StartDir: String; const List: TStrings): Boolean;
var
  SRec: TsearchRec;
  Res: integer;
begin
  if not Assigned(List) then
  begin
    result := false;
    exit;
  end;
  Res := FindFirst(StartDir + '*.json', faAnyFile, SRec);
  if Res = 0 then
    try
      while Res = 0 do
      begin
        if (SRec.Attr and faDirectory <> faDirectory) then
          // If you want filename only, remove "StartDir +"
          // from next line
          if not(ContainsText(SRec.Name, '.bak')) then
            List.Add(StartDir + SRec.Name);
        Res := FindNext(SRec);
      end;
    finally
      FindClose(SRec)
    end;
  result := (List.Count > 0);
end;

function TForm1.JSONFormat(const aInput: string): string;
var
  sl: TStringList;
  i: integer;
  lvl: integer;
begin
  result := aInput;
  // result := RemoveWhiteSpace(aInput);
  result := InsertLineBreaks(result);
  result := RemoveEmptyLines(result);
  lvl := 0;
  sl := TStringList.Create;
  try
    sl.Text := result;
    for i := 0 to sl.Count - 1 do
    begin
      if ContainsText(sl[i], '{') then
      begin
        sl[i] := getSpaces(lvl * 2) + sl[i];
        if not ContainsText(sl[i], '}') then
          inc(lvl);
      end
      else if ContainsText(sl[i], '[') then
      begin
        sl[i] := getSpaces(lvl * 2) + sl[i];
        if not ContainsText(sl[i], ']') then
          inc(lvl);
      end
      else if (ContainsText(sl[i], '}')) or (ContainsText(sl[i], ']')) then
      begin
        dec(lvl);
        lvl := max(lvl, 0);
        sl[i] := getSpaces(lvl * 2) + sl[i];
      end
      else
        sl[i] := getSpaces(lvl * 2) + sl[i];
    end;
    result := sl.Text;
  finally
    sl.free;
  end;
end;

function TForm1.RemoveWhiteSpace(const aInput: string): string;
const
  whitespace = [#0, #8, #9, #10, #12, #13, ' '];
var
  i: integer;
  insideString: Boolean;
begin
  i := 1;
  insideString := false;
  while i <= length(aInput) do
  begin
    if aInput[i] = '\' then
    begin
      result := result + aInput[i] + aInput[i + 1];
      inc(i, 2);
    end
    else if aInput[i] = '"' then
    begin
      result := result + aInput[i];
      insideString := not insideString;
      inc(i);
    end
    else if not insideString and CharInSet(aInput[i], whitespace) then
      inc(i)
    else
    begin
      result := result + aInput[i];
      inc(i);
    end;
  end;
end;

end.
