unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Menus,System.JSON, inifiles, Math,
  System.IOUtils, StrUtils, Vcl.ComCtrls, ClipBrd,ShellApi, Vcl.FileCtrl,System.Generics.Collections;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Log: TMemo;
    Memo1: TMemo;
    TempListBox1: TListBox;
    TempListBox2: TListBox;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Edit1: TMenuItem;
    Settings1: TMenuItem;
    FileListBox1: TFileListBox;
    MergeMods1: TMenuItem;
    Button2: TButton;
    Button3: TButton;
    FileListBox2: TFileListBox;
    Label6: TLabel;
    Label7: TLabel;
    ListBox1: TListBox;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Updatedatafolder1: TMenuItem;
    AddCreateExtractedMod1: TMenuItem;
    ImportmodPAKfile1: TMenuItem;
    Memo2: TMemo;
    Label5: TLabel;
    Button8: TButton;
    function UnpackFile(Filename:String;Location:String):Boolean;
    function RepackFile(FolderName:String;Location:String):Boolean;
    function CompareModFile(ModFilename,OrigFilename,CurFile: String):String;
    procedure GetDirectories(const Strings: TStrings; Directory: string;
      CurDirectory: string; IncludeFiles: Boolean);
    function getSpaces(aQuantity: integer): string;
    function InsertLineBreaks(const aInput: string): string;
    function RemoveEmptyLines(const aInput: string): string;
    function RemoveWhiteSpace(const aInput: string): string;
    function JSONFormat(const aInput: string): string;
    function GetFiles(const StartDir: String; const List: TStrings): Boolean;
    function LoadItemJSON(const ItemName: String;const Filename: String): string;
    function ImportMod(ModFile: String; Location: String; PakfileLocation:String): Boolean;
    function ExtractModData(ModFolder: String; ModName :String; OrigFolder :String; SaveFolder:String): Boolean;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Settings1Click(Sender: TObject);
    procedure FileListBox1Click(Sender: TObject);
    procedure MergeMods1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DeleteDirectory(const DirName: string);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    function GetFolders(PAKfilename: string): string;
    procedure Updatedatafolder1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
   public
    { Public declarations }
   UE4PAKFile:string;
    IcarusContentFolder:string;
    IcarusDataPAK:string;
    OrigDataFolder:string;
    IcarusModsFolder:String;
    CurSelectedMod:String;
    IcarusdataFolderDate:String;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2, Unit3, Unit4, Unit5;


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

function TForm1.LoadItemJSON(const ItemName: String;const Filename: String): string;
var
  CurrentJSON: TJSONObject;
  //myarr: TJSONArray;
  //RowItem, NameValue: TJSonValue;
  Found,i: integer;
begin
  Found:=0;
  try
  CurrentJSON := TJSONObject.Create;
    if FileExists(Filename) then
    begin
      CurrentJSON := TJSONObject.ParseJSONValue(TFile.ReadAllText(Filename)) as TJSONObject;
      //myarr := CurrentJSON.GetValue('Rows') as TJSONArray;
      for i:=0 to  (CurrentJSON.GetValue('Rows') as TJSONArray).Count-1 do
      begin
          //NameValue := ((CurrentJSON.GetValue('Rows') as TJSONArray)[i] as TJSONObject).GetValue('Name');
          if ((CurrentJSON.GetValue('Rows') as TJSONArray)[i] as TJSONObject).GetValue('Name').value = ItemName then
        begin
           result:= ((CurrentJSON.GetValue('Rows') as TJSONArray)[i] as TJSONObject).ToString;
           Found:=1;
           break;
        end;
      end;
      if found=0 then
      begin
      ShowMessage(ItemName+' not found in '+Filename);
      result:='';
      end;
    end
    else
    begin
      ShowMessage('Cannot find '+Filename+' in your mods items folder!');
      result:='';
    end;
  finally
    CurrentJSON.free;
  end;

end;

procedure TForm1.DeleteDirectory(const DirName: string);
var
  FileOp: TSHFileOpStruct;
begin
  FillChar(FileOp, SizeOf(FileOp), 0);
  FileOp.wFunc := FO_DELETE;
  FileOp.pFrom := PChar(DirName+#0);//double zero-terminated
  FileOp.fFlags := FOF_SILENT or FOF_NOERRORUI or FOF_NOCONFIRMATION;
  SHFileOperation(FileOp);
end;

procedure TForm1.MergeMods1Click(Sender: TObject);
begin
Form2.Show;
end;

function TForm1.RepackFile(FolderName:String;Location:String):Boolean;
var
 // iRes: Integer;
 parameters,ModName:string;
 MyText: TStringlist;
begin
Result:=false;
log.Lines.Append('Attempting to Re-PAK:'+FolderName+' to '+Location);
if (System.SysUtils.DirectoryExists(FolderName)) and (System.SysUtils.DirectoryExists(Location)) then
   begin
     try
     MyText:= TStringlist.create;
     MyText.Add('"'+FolderName+'\*.*" "..\..\..\Icarus\Content\*.*"');
     MyText.SaveToFile((ExtractFilePath(Application.ExeName)+'ModFolderDetails.txt'));
     finally
     MyText.Free
     end; {try}
   ModName:= Copy(FolderName,FolderName.LastIndexOf('\')+2);
   parameters := '"'+Location+'\'+ModName+'_P.pak" -platform="Windows" -create="'+ExtractFilePath(Application.ExeName)+'ModFolderDetails.txt';
      try
      ShellExecute(Handle,'open',PChar(UE4PAKFile), PChar(parameters), '', SW_SHOWNORMAL);
      finally
        result:=True;
        log.Lines.Append('Succesfully Created '+Location+ModName+' _P.pak');
      end;
   end else ShowMessage('Unable to locate needed folders!');
end;

procedure TForm1.Settings1Click(Sender: TObject);
begin
Form3.show;
end;

procedure TForm1.FileListBox1Click(Sender: TObject);
var
 ModJSONObject : TJSonValue;
   ModCurFilename: String;
   i:integer;
   ModNameString,readmestring: String;
begin
listbox1.Items.clear;
memo2.Clear;
CurSelectedMod:=Filelistbox1.Directory+'\'+FileListBox1.Items[Filelistbox1.ItemIndex];
   try
   ModJSONObject := TJSONObject.ParseJSONValue(TFile.ReadAllText(Filelistbox1.Directory+'\'+FileListBox1.Items[Filelistbox1.ItemIndex]));
   // Get Mod Names
   ModNameString:=(ModJSONObject as TJSONObject).GetValue('ModName').value;
   if (ModJSONObject as TJSONObject).FindValue('Readme')<>nil then
   memo2.lines.Append((ModJSONObject as TJSONObject).FindValue('Readme').value)
   else memo2.lines.Append('None avail.');
   Label7.Caption:= ModNameString;
   button4.Enabled:=true;
   // Get File arrays
   //ModFilearr := (ModJSONObject as TJSONObject).GetValue('Rows') as TJSONArray;
   //for ModFileJSonValue in TJSONArray(ModFilearr) do
   for i := 0 to ((ModJSONObject as TJSONObject).GetValue('Rows') as TJSONArray).Count-1 do
      begin
      ModCurFilename := (((ModJSONObject as TJSONObject).GetValue('Rows') as TJSONArray)[i] as TJSONObject).GetValue('CurrentFile').value;

      if ModCurFilename<>'EndOfMod' then
        begin
        ModCurFilename := ModCurFilename.Replace('-', '\');
        listbox1.Items.Append(ModCurFilename);
        end;

      end;


   finally
    ModJSONObject.free;
   end;
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
  dataDate,GamedataDate:string;
  //dlg: TOpenDialog;
begin
ReportMemoryLeaksOnShutdown := True;
Application.HintHidePause := 6000;
log.Lines.Append('Loading Options Data...');
  appINI := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  try
    IcarusContentFolder := appINI.ReadString('Folder', 'IcarusContent', '');
    if IcarusContentFolder='' then ShowMessage('Please goto settings and update them!');
    IcarusDataPAK:=IcarusContentFolder+'\Data\data.pak';
    IcarusModsFolder:=IcarusContentFolder+'\Paks\mods';
    UE4PAKFile := appINI.ReadString('File', 'UE4PakEXE', '');
    IcarusdataFolderDate :=appINI.ReadString('TimeStamp', 'IcarusData', '');
    if fileexists(IcarusDataPAK) then
    if IcarusdataFolderDate<>DateTimeToStr(System.IOUtils.TFile.GetCreationTime(IcarusDataPAK)) then ShowMessage('Current data folder outdated! Please reload it.');
    if System.SysUtils.DirectoryExists(ExtractFilePath(Application.ExeName)+'data') then
    OrigDataFolder:= ExtractFilePath(Application.ExeName)+'data'
    else
    if fileexists(IcarusDataPAK) then
     begin
     UnpackFile(IcarusDataPAK,ExtractFilePath(Application.ExeName)+'data');
     IcarusdataFolderDate:=DateTimeToStr(System.IOUtils.TFile.GetCreationTime(IcarusDataPAK));
     end;
    if not System.SysUtils.DirectoryExists(ExtractFilePath(Application.ExeName)+'Extracted Mods') then
    CreateDir(ExtractFilePath(Application.ExeName)+'Extracted Mods');
    FileListBox1.Directory := ExtractFilePath(Application.ExeName)+'Extracted Mods';
    if IcarusModsFolder<>'' then
    begin
    if not System.SysUtils.DirectoryExists(IcarusModsFolder) then
    CreateDir(IcarusModsFolder);
    FileListBox2.Directory := IcarusModsFolder;
    end;

  finally
  log.Lines.Append('Options Data Loaded.');
    appINI.free;
  end;
end;

function TForm1.ImportMod(ModFile: String; Location: String; PakfileLocation:String): Boolean;
var
  selectedFile: TFileName;
  Icarusjson,Fulljson: Tjsonvalue;
  //ItemName,jFileName,OrigName,ModName,ModItemName,CurFile,curDir,Tempjson: String;
  jFileName,tempjson:String;
  i,x,y,z,w,ItemIndex:Integer;
  Found:Boolean;
begin
if FileExists(ModFile) then
   begin
   if System.SysUtils.DirectoryExists(ExtractFilePath(Application.ExeName)+'data') then
   begin
   if Location='' then Location:=ExtractFilePath(Application.ExeName);

   Log.lines.Append('Attempting to Import '+ModFile);
   TempListBox1.Clear;
    //listbox19.Clear;
   memo1.lines.Clear;
   selectedFile := ModFile;
   try
    Fulljson := TJSONObject.ParseJSONValue(TFile.ReadAllText(selectedFile));
      // Get Mod Name
    //ModName:=Fulljson.GetValue('ModName').value;
      // Create Mod/data folders
    Log.lines.Append('Creating Mod Folders.');
    CreateDir(Location+(Fulljson as TJSONObject).FindValue('ModName').value);
    CreateDir(Location+(Fulljson as TJSONObject).FindValue('ModName').value+'\data');
      // Get File array from mod
      //Filearr := Fulljson.GetValue('Rows') as TJSONArray;
      // Loop through each file from mod
      //for ModRowItem in Fulljson.GetValue('Rows') as TJSONArray do
    for x:=0 to ((Fulljson as TJSONObject).FindValue('Rows') as TJSONArray).Count-1 do
      begin
      // get current folder/file name
      jFileName := (((Fulljson as TJSONObject).FindValue('Rows') as TJSONArray)[x] as TJSONObject).FindValue('CurrentFile').value;
      // get mod items array for file
      //Itemarr := (ModRowItem as TJSONObject).GetValue('File_Items') as TJSONArray;
      // Make sure it not the end of file
      if jFileName<>'EndOfMod' then
        begin
          // Clear up items
          Tempjson:='';
          //Memo15.Lines.Clear;
          // Fix folder/filename
          jFileName := jFileName.Replace('-', '\');
          //listbox13.Items.Append(jFileName);
          // Create current mod files folder
          Log.lines.Append('Creating Mods data folder.');
          //curDir:=ExtractFilePath(Application.ExeName)+Fulljson.GetValue('ModName').value+'\data\';
          CreateDir(ExtractFilePath(Location+(Fulljson as TJSONObject).GetValue('ModName').value+'\data\'+jFileName));
          Log.lines.Append(ExtractFilePath(jFileName)+' folder created.');
          //Origarr:=Icarusjson.GetValue('Rows') as TJSONArray;
          // Load Original json data
         try
          Icarusjson := TJSONObject.ParseJSONValue(TFile.ReadAllText(ExtractFilePath(Application.ExeName)+'data'+'\'+jFileName));
          // Start header  json
          Log.lines.Append('Comparing File Header.');
          Tempjson:='{';
          for i := 0 to (Icarusjson as TJSONObject).count-2 do
           begin
            if (((Fulljson as TJSONObject).FindValue('Rows') as TJSONArray)[x] as TJSONObject).FindValue('Defaults')<>nil then
             begin
             if (Icarusjson as TJSONObject).Pairs[i].JsonString.Value='Defaults' then
             Tempjson:=Tempjson+'"Defaults":'+(((Fulljson as TJSONObject).FindValue('Rows') as TJSONArray)[x] as TJSONObject).FindValue('Defaults').ToString+','
             else Tempjson:=Tempjson+(Icarusjson as TJSONObject).pairs[i].ToString+',';
             end else Tempjson:=Tempjson+(Icarusjson as TJSONObject).pairs[i].ToString+',';

           end;
          Tempjson:=Tempjson+'"Rows":[';
          // Start to compare and add Items from json to array
          //for RowItem in Icarusjson.GetValue('Rows') as TJSONArray do
          for y:=0 to ((Icarusjson as TJSONObject).FindValue('Rows') as TJSONArray).Count-1 do
           begin
           // Original json loop
           Found:=False;
           //OrigName:=((Icarusjson.GetValue('Rows') as TJSONArray)[y] as TJSONObject).GetValue('Name').Value;
           //For FileItem in (ModRowItem as TJSONObject).GetValue('File_Items') as TJSONArray do
           for z:=0 to ((((Fulljson as TJSONObject).FindValue('Rows') as TJSONArray)[x] as TJSONObject).FindValue('File_Items') as TJSONArray).Count-1 do
             // Mod json loop
              begin
                 Found:=False;
                 //ModItemName:=((((Fulljson.GetValue('Rows') as TJSONArray)[x] as TJSONObject).GetValue('File_Items') as TJSONArray)[z] as TJSONObject).GetValue('Name').Value;
                 if (((((Fulljson as TJSONObject).FindValue('Rows') as TJSONArray)[x] as TJSONObject).FindValue('File_Items') as TJSONArray)[z] as TJSONObject).FindValue('Name').Value=(((Icarusjson as TJSONObject).FindValue('Rows') as TJSONArray)[y] as TJSONObject).FindValue('Name').Value then
                   begin
                   TempListBox1.Items.Append((((((Fulljson as TJSONObject).FindValue('Rows') as TJSONArray)[x] as TJSONObject).FindValue('File_Items') as TJSONArray)[z] as TJSONObject).FindValue('Name').Value);
                   Found:=true;
                   break;
                   end;
              end;
           // add the modded or original json into array
           if Found=True then Tempjson:=Tempjson+(((((Fulljson as TJSONObject).FindValue('Rows') as TJSONArray)[x] as TJSONObject).FindValue('File_Items') as TJSONArray)[z] as TJSONObject).ToString+','
           else
           Tempjson:=Tempjson+(((Icarusjson as TJSONObject).FindValue('Rows') as TJSONArray)[y] as TJSONObject).ToString+',';
           end;
           // Add the new items from modfile
           //For FileItem2 in (ModRowItem as TJSONObject).GetValue('File_Items') as TJSONArray do
           for w:=0 to ((((Fulljson as TJSONObject).FindValue('Rows') as TJSONArray)[x] as TJSONObject).FindValue('File_Items') as TJSONArray).Count-1 do
              begin
                 if TempListBox1.Items.IndexOf((((((Fulljson as TJSONObject).FindValue('Rows') as TJSONArray)[x] as TJSONObject).FindValue('File_Items') as TJSONArray)[w] as TJSONObject).GetValue('Name').Value) = -1 then
                 begin
                 Tempjson:=Tempjson+(((((Fulljson as TJSONObject).FindValue('Rows') as TJSONArray)[x] as TJSONObject).FindValue('File_Items') as TJSONArray)[w] as TJSONObject).ToString+',';
                 TempListBox2.Items.Append((((((Fulljson as TJSONObject).FindValue('Rows') as TJSONArray)[x] as TJSONObject).FindValue('File_Items') as TJSONArray)[w] as TJSONObject).FindValue('Name').Value);
                 end;

              end;
          Delete(Tempjson,length(Tempjson),1);
          Tempjson:=Tempjson+']}';
          Log.lines.Append('Imported - '+jFileName);
          Memo1.Lines.Text:=JSONFormat(Tempjson);
          Memo1.lines.SaveToFile(Location+(Fulljson as TJSONObject).GetValue('ModName').value+'\data\'+jFileName);
          Log.lines.Append('Saved - '+jFileName);
         finally
         Tempjson:='';
         FreeAndNil(Icarusjson);
         end;
        end;

      end;
      Log.lines.Append((Fulljson as TJSONObject).FindValue('ModName').value+' has been succesfully Imported.');
      Log.lines.Append('Re-PAKing '+(Fulljson as TJSONObject).FindValue('ModName').value);
      if PakfileLocation='' then PakfileLocation:=IcarusModsFolder;
      if RepackFile(Location+(Fulljson as TJSONObject).GetValue('ModName').value,PakfileLocation) then
      begin
      Log.lines.Append((Fulljson as TJSONObject).GetValue('ModName').value+' Mod was Created.');
      //ShowMessage(ModName+' Mod was Created.');
      end;
    finally
      Fulljson.free;
    end;
  end
  else
  ShowMessage('data folder has not been unPAKed!');
 end
 else
 ShowMessage(ModFile+' does not exist!');
end;

function TForm1.ExtractModData(ModFolder: String; ModName :String; OrigFolder :String; SaveFolder:String): Boolean;
var
I: integer;
ModJson:String;
CurrentFile:string;
begin
log.Lines.Append('Attempting to Extract custom data from '+ModFolder);
TempListBox1.Clear;
TempListBox2.Clear;
memo1.Lines.Clear;
GetDirectories(TempListBox1.Items, ModFolder, '', true);
form5.ProgressBar1.StepIt;
memo1.Lines.Append('{"ModName":"'+ModName+'","Rows":[');
for I:= 0 to TempListBox1.Items.Count - 1 do
  begin
  CurrentFile:=TempListBox1.Items[I];
  if CurrentFile[1]='\' then  delete(CurrentFile,1,1);
  if ExtractFileExt(ModFolder+'\'+ CurrentFile)='.json' then
    begin
    form5.ProgressBar1.StepIt;
    log.Lines.Append('Extracting json from '+ TempListBox1.Items[I]);
    ModJson:=(CompareModFile(ModFolder+'\'+ CurrentFile,OrigFolder+'\'+ CurrentFile,CurrentFile));
    if ModJson<>'none' then
      begin
      delete(ModJson,length(ModJson),1);
      memo1.Lines.Append(ModJson+']},');
      end;
    end;
  end;
memo1.lines.Append('{"CurrentFile":"EndOfMod"}]}');
form5.ProgressBar1.Position:=10;
log.Lines.Append('Extraction complete!');
ModJson:=memo1.text;
memo1.Lines.Clear;
memo1.lines.Append(JSONFormat(ModJson));
log.Lines.Append('Saved Extracted data to '+SaveFolder+'\'+ModName+'.EXMod');
memo1.lines.SaveToFile(SaveFolder+'\'+ModName+'.EXMod');
result:=true;
end;




procedure TForm1.Button1Click(Sender: TObject);
begin
Form2.Show;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
if System.SysUtils.DirectoryExists(IcarusModsFolder) then
DeleteDirectory(IcarusModsFolder);
CreateDir(IcarusModsFolder);
FileListBox2.Directory:=IcarusModsFolder;
FileListBox2.Update;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
i:integer;
modsname:string;
begin
if fileexists(IcarusDataPAK) then UnpackFile(IcarusDataPAK,ExtractFilePath(Application.ExeName)+'data')
else
  begin
  ShowMessage('Icarus contents folder not set in setting!');
  Form3.show;
  end;
for i:= 0 to filelistbox2.Items.count-1 do
  begin
  modsname:=filelistbox2.Items[i];
  modsname:=stringreplace(modsname, ' _p.pak', '',[rfReplaceAll, rfIgnoreCase]);
  modsname:=stringreplace(modsname, '_p.pak', '',[rfReplaceAll, rfIgnoreCase]);
  if FileExists(ExtractFilePath(Application.ExeName)+'Extracted Mods\'+modsname+'.EXmod') then
    begin
    if ImportMod(ExtractFilePath(Application.ExeName)+'Extracted Mods\'+modsname+'.EXmod','','') then
    log.lines.Append(modsname+' Mod has been Updated!');
    end
    else
    ShowMessage(modsname+'.EXmod does not exist in extracted folder!');
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
if fileexists(CurSelectedMod) then
if ImportMod(CurSelectedMod,'','') then
ShowMessage('Mod has been added!');
FileListBox2.Update;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
Form4.show;
end;

procedure TForm1.Button6Click(Sender: TObject);
var
modsname:string;
modFolders:string;
begin
with TFileOpenDialog.Create(nil) do
  try
    title:='Select Mod PAK file for Importing.';
    FileTypes.Add.FileMask:= '*.pak';
    if Execute then
    begin
    form5.show;
    form5.ProgressBar1.Position:=1;
    modFolders:=GetFolders(filename);
    modFolders:=stringreplace( modFolders, '../../../Icarus/Content', '',[rfReplaceAll, rfIgnoreCase]);
    modFolders:=stringreplace( modFolders, '/', '\',[rfReplaceAll, rfIgnoreCase]);
    //ShowMessage(modFolders);
    modsname:=extractfilename(filename);
    modsname:=stringreplace(modsname, ' _p.pak', '',[rfReplaceAll, rfIgnoreCase]);
    modsname:=stringreplace(modsname, '_p.pak', '',[rfReplaceAll, rfIgnoreCase]);
    log.Lines.Append('Creating '+modsname);
    if not System.SysUtils.DirectoryExists(ExtractFilePath(Application.ExeName)+modsname) then
    //CreateDir(ExtractFilePath(Application.ExeName)+modsname);
    log.lines.Append('Unpacking: '+filename+','+ExtractFilePath(Application.ExeName)+modsname+modFolders);
    UnpackFile(filename,ExtractFilePath(Application.ExeName)+modsname+modFolders);
    Sleep(3000);
    form5.ProgressBar1.Position:=5;
    ExtractModData(ExtractFilePath(Application.ExeName)+modsname+'\data',modsname,OrigDataFolder,ExtractFilePath(Application.ExeName)+'Extracted Mods' );
    form5.ProgressBar1.Position:=10;
    Sleep(3000);
    FileListBox1.Update;
    form5.Hide;
    end;

  finally
    Free;
  end;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
if fileexists(IcarusDataPAK) then
  begin
  Log.Lines.Append('UnPAKing '+IcarusDataPAK+' to '+ExtractFilePath(Application.ExeName)+'data');
  UnpackFile(IcarusDataPAK,ExtractFilePath(Application.ExeName)+'data');
  IcarusdataFolderDate:=DateTimeToStr(System.IOUtils.TFile.GetCreationTime(IcarusDataPAK));
  end
  else
  begin
  ShowMessage('Icarus contents folder not set in setting!');
  Form3.show;
  end;
end;
procedure TForm1.Button8Click(Sender: TObject);
var
i:integer;
modsname:string;
SaveLocation:string;
begin
if fileexists(IcarusDataPAK) then
begin
if IcarusdataFolderDate<>DateTimeToStr(System.IOUtils.TFile.GetCreationTime(IcarusDataPAK)) then UnpackFile(IcarusDataPAK,ExtractFilePath(Application.ExeName)+'data');
end
else
  begin
  ShowMessage('Icarus contents folder not set in setting!');
  Form3.show;
  end;
 with TFileOpenDialog.Create(nil) do
  try
    Title:='Select folder to save updated mods to.';
    Options := [fdoPickFolders];
    if Execute then
    SaveLocation:=Filename;

  finally
    Free;
  end;
for i:= 0 to filelistbox1.Items.count-1 do
  begin
  modsname:=filelistbox1.Items[i];
  if FileExists(ExtractFilePath(Application.ExeName)+'Extracted Mods\'+modsname) then
    begin
    if ImportMod(ExtractFilePath(Application.ExeName)+'Extracted Mods\'+modsname,SaveLocation+'\',SaveLocation+'\') then
    log.lines.Append(modsname+' Mod has been Updated!');
    end
    else
    ShowMessage(modsname+'.EXmod does not exist in extracted folder!');
  end;
end;

function TForm1.GetFolders(PAKfilename: string): string;
var
sl:Tstringlist;
line:string;
position:integer;
begin
 try
 sl := TStringList.Create;
 sl.LoadFromFile(PAKfilename);
 for line in sl do
   begin
   position:= Pos('../../../Icarus', line);
   if position<>0 then
     begin
     result:=Copy(line, position, length(line)-position);
     break;
     end;
   end;
 finally
 sl.Free;
 end;
end;

function TForm1.CompareModFile(ModFilename,OrigFilename,CurFile: String):String;
var
   jsontext: String;
   //OrigItem, MergeItem,NameItem,NameItem2: TJSonValue;
   Origjsontext,Modjsontext,Default,OrigName, MergeName: String;
  match, modified: Boolean;
  MergeJSON: TJSonValue;
  DefaultJSON: TJSonValue;
  i,x:integer;
begin
   try
     if FileExists(ModFilename) then
     begin
      MergeJSON := TJSONObject.ParseJSONValue(TFile.ReadAllText(ModFilename));
      if FileExists(OrigFilename) then
      begin
      DefaultJSON := TJSONObject.ParseJSONValue(TFile.ReadAllText(OrigFilename));
      end
      else
      begin
        ShowMessage(OrigFilename +' does not exist!');
        exit;
      end;
       Origjsontext:=(DefaultJSON as TJSONObject).GetValue('Defaults').ToString;
       Modjsontext:=(MergeJSON as TJSONObject).GetValue('Defaults').ToString;
       //Origjsontext := OrigItem.ToString;
       //Modjsontext := MergeItem.ToString;
       if AnsiCompareStr(Modjsontext, Origjsontext) <> 0 then
       Default:='"Defaults":'+Modjsontext+',' else Default:='';
       //jsontext:='{"CurrentFile":"'+CurFile+'","File_Items":[';
       //Origarr := DefaultJSON.GetValue('Rows') as TJSONArray;
       //Mergearr := MergeJSON.GetValue('Rows') as TJSONArray;
       //for MergeItem in TJSONArray(Mergearr) do
         //for MergeItem in (MergeJSON.GetValue('Rows') as TJSONArray) do
         for i :=0 to ((MergeJSON as TJSONObject).GetValue('Rows') as TJSONArray).Count-1 do
         begin
          match := false;
          modified := false;
          //NameItem := (MergeItem as TJSONObject).GetValue('Name');
          MergeName :=(((MergeJSON as TJSONObject).GetValue('Rows') as TJSONArray)[i] as TJSONObject).GetValue('Name').Value;
          //MergeName := NameItem.value;
          //for OrigItem in TJSONArray(Origarr) do
          //for OrigItem in (DefaultJSON.GetValue('Rows') as TJSONArray) do
          for x:= 0 to  ((DefaultJSON as TJSONObject).GetValue('Rows') as TJSONArray).Count-1 do
            begin
             //NameItem2 := (OrigItem as TJSONObject).GetValue('Name');
             OrigName := (((DefaultJSON as TJSONObject).GetValue('Rows') as TJSONArray)[x] as TJSONObject).GetValue('Name').Value;
             if OrigName = MergeName then
               begin
               match := true;
               //Origjsontext := OrigItem.ToString;
               Origjsontext := (((DefaultJSON as TJSONObject).GetValue('Rows') as TJSONArray)[x] as TJSONObject).ToString;
               //Modjsontext := MergeItem.ToString;
               Modjsontext := (((MergeJSON as TJSONObject).GetValue('Rows') as TJSONArray)[i] as TJSONObject).ToString;
               if AnsiCompareStr(Modjsontext, Origjsontext) = 0 then
                 begin
                 break;
                 end
                 else
                 begin
                 modified := true;
                 break;
                 end;
               end;
            //NameItem2.free;
            //OrigItem.free;
            end;
          if match = false then
           begin
            //NameItem := (MergeItem as TJSONObject).GetValue('Name');
           // Modjsontext := MergeItem.ToString;
            //delete(Modjsontext,length(Modjsontext),1);
            jsontext:=jsontext+(((MergeJSON as TJSONObject).GetValue('Rows') as TJSONArray)[i] as TJSONObject).ToString+',';
            //ListBox15.Items.Append(NameItem.value);
            //ListBox16.Items.Append(curfile);
           end
           else if modified = true then
           begin
           //NameItem := (MergeItem as TJSONObject).GetValue('Name');
           //Modjsontext := MergeItem.ToString;
           // delete(Modjsontext,length(Modjsontext),1);
           jsontext:=jsontext+(((MergeJSON as TJSONObject).GetValue('Rows') as TJSONArray)[i] as TJSONObject).ToString+',';
           //ListBox18.Items.Append(NameItem.value);
           //ListBox17.Items.Append(curfile);
           end;
        end;
        CurFile := CurFile.Replace('\', '-');
         if jsontext<> '' then result:='{"CurrentFile":"'+CurFile+'",'+Default+'"File_Items":['+jsontext
         else result:='none';

       end else
      begin
       ShowMessage(ModFilename +' does not exist!');
       exit;
      end;
   finally
   MergeJSON.free;
   DefaultJSON.free;
   end;
//FreeAndNil(NameItem2);
//FreeAndNil(OrigItem);
end;


function TForm1.UnpackFile(Filename:String;Location:String):Boolean;
var
 parameters:String;
 //iRes: Integer;
begin
if fileexists(Filename) then
  begin
  if FileExists(UE4PAKFile) then
    begin
    parameters := '"'+Filename+'" -extract "'+Location+'"';
      try
      ShellExecute(Handle,'open',PChar(UE4PAKFile), PChar(parameters), '', SW_SHOWNORMAL);
      result:=true;
      finally
      //ShowMessage(Filename+' was UnPAKed!');
      end;
    end
    else
      begin
      ShowMessage('UnrealPak.exe has not been set!');
      form3.show;
      end;
  end
  else
  begin
  ShowMessage(Filename+' Does not Exist!');
  result:=false;
  end;
end;

procedure TForm1.Updatedatafolder1Click(Sender: TObject);
begin
if fileexists(IcarusDataPAK) then
  begin
  UnpackFile(IcarusDataPAK,ExtractFilePath(Application.ExeName)+'data');
  IcarusdataFolderDate:=DateTimeToStr(System.IOUtils.TFile.GetCreationTime(IcarusDataPAK));
  end
else
  begin
  ShowMessage('Icarus contents folder not set in setting!');
  Form3.show;
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
  s: string;
begin
  s := '';
  i := 1;
  insideString := false;
  while i <= Length(aInput) do
  begin
    if insideString then
    begin
      s := s + aInput[i];
      if aInput[i] = '\' then
      begin
        s := s + aInput[i + 1];
        inc(i, 2);
      end;
      if aInput[i] = '"' then
        insideString := false;
      inc(i);
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
        // '"':
        // begin
        // s := s + aInput[i];
        // insideString := not insideString;
        // inc(i);
        // end;
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
            else
            begin
              s := s + sLineBreak + aInput[i] + sLineBreak;
              inc(i);
            end;
          end;
        '}', ']':
          begin
            if (Length(aInput) > i) and (aInput[i + 1] = ',') then
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
              s := s + aInput[i];
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


procedure TForm1.GetDirectories(const Strings: TStrings; Directory: string;
  CurDirectory: string; IncludeFiles: Boolean);
var
  SearchRec: TSearchRec;
  ItemTemp: String;
begin
  ItemTemp := CurDirectory;
  if Directory[Length(Directory)] <> '\' then
    Directory := Directory + '\';
  if FindFirst(Directory + '*.*', faDirectory, SearchRec) = 0 then
  begin
    repeat
      if (SearchRec.Attr and faDirectory = faDirectory) and
        (SearchRec.Name[1] <> '.') then
      begin
        if (SearchRec.Attr and faDirectory > 0) then
          if CurDirectory <> '' then
            ItemTemp := CurDirectory + '\' + SearchRec.Name
          else
            ItemTemp := SearchRec.Name;
        GetDirectories(Strings, Directory + SearchRec.Name, ItemTemp,
          IncludeFiles);
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
  SRec: TSearchRec;
  Res: integer;
begin
  if not Assigned(List) then
  begin
    result := false;
    Exit;
  end;
  Res := FindFirst(StartDir + '*.json', faAnyfile, SRec);
  if Res = 0 then
    try
      while Res = 0 do
      begin
        if (SRec.Attr and faDirectory <> faDirectory) then
          // If you want filename only, remove "StartDir +"
          // from next line
          if not (ContainsText(SRec.Name , '.bak')) then
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
  while i <= Length(aInput) do
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
