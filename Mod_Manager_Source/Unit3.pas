unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, inifiles, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, tiaonImageButton,ShellApi;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Edit3: TEdit;
    tiaonImageButton1: TtiaonImageButton;
    tiaonImageButton2: TtiaonImageButton;
    tiaonImageButton3: TtiaonImageButton;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    CheckBox2: TCheckBox;
    Label4: TLabel;
    CheckBox3: TCheckBox;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tiaonImageButton1Click(Sender: TObject);
    procedure tiaonImageButton2Click(Sender: TObject);
    procedure tiaonImageButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    needsRestart:boolean;
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses Unit1;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
var
AppName:PChar;
begin
 if needsRestart then
 begin
 AppName := PChar(Application.ExeName) ;
ShellExecute(Handle,'open', AppName, nil, nil, SW_SHOWNORMAL) ;
Application.Terminate;
 end;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  if form1.IcarusContentFolder <> '' then
    Edit1.text := form1.IcarusContentFolder;
  if form1.UE4PAKFile <> '' then
    Edit3.text := form1.UE4PAKFile;
   if form1.IcarusContentFolder = '' then
   begin
   needsRestart:=true;
   form3.show;
   end;
end;

procedure TForm3.tiaonImageButton1Click(Sender: TObject);
var
  appINI: TIniFile;
begin
if (edit1.Text<>'') and (edit3.Text<>'') then
begin

  appINI := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  try
    appINI.WriteString('Folder', 'IcarusContent', Edit1.text);
    form1.IcarusContentFolder := Edit1.text;
    form1.IcarusDataPAK := form1.IcarusContentFolder + '\Data\data.pak';
    form1.IcarusModsFolder := form1.IcarusContentFolder + '\Paks\mods';
    appINI.WriteString('File', 'UE4PakEXE', Edit3.text);
    form1.UE4PAKFile := Edit3.text;

  finally
    appINI.Free;
  end;
end else ShowMessage('Please make sure both settings are correct!');

end;

procedure TForm3.tiaonImageButton2Click(Sender: TObject);
begin
  with TFileOpenDialog.Create(nil) do
    try
      Title := 'Select Icarus game contents folder.';
      Options := [fdoPickFolders];
      if Execute then
        if FileExists(FileName + '\Data\data.pak') then
        begin
        Edit1.text := FileName;
        Form1.IcarusContentFolder:=FileName;
        Form1.IcarusDataPAK := FileName + '\Data\data.pak';
        Form1.IcarusModsFolder := FileName + '\Paks\mods';
        end else ShowMessage('Not the correct folder!!');

    finally
      Free;
    end;
end;

procedure TForm3.tiaonImageButton3Click(Sender: TObject);
begin
  with TFileOpenDialog.Create(nil) do
    try
      Title := 'Select UnrealPak.exe file for creating MOD pak file.';
      FileTypes.Add.FileMask := 'UnrealPak.exe';
      if Execute then
      if ExtractFileName(Filename) = 'UnrealPak.exe' then
       begin
        Edit3.text := FileName;
        Form1.UE4PAKFile:=FileName;
       end else ShowMessage('File Doesnt Match! Please select UnrealPak.exe');
    finally
      Free;
    end;

end;

end.
