unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, inifiles,Vcl.StdCtrls;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Edit3: TEdit;
    Button4: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses Unit1;

procedure TForm3.Button1Click(Sender: TObject);
begin
with TFileOpenDialog.Create(nil) do
  try
    Title:='Select Icarus game contents folder.';
    Options := [fdoPickFolders];
    if Execute then
      edit1.text:=FileName;

  finally
    Free;
  end;

end;
procedure TForm3.Button3Click(Sender: TObject);
var
  appINI: TIniFile;
begin
  appINI := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  try
    appINI.WriteString('Folder', 'IcarusContent', edit1.Text);
    form1.IcarusContentFolder:=edit1.Text;
    form1.IcarusDataPAK:=form1.IcarusContentFolder+'\Data\data.pak';
    form1.IcarusModsFolder:=form1.IcarusContentFolder+'\Paks\mods';
    appINI.WriteString('File', 'UE4PakEXE', edit3.text);
    form1.UE4PAKFile:=edit3.text;

  finally
    appINI.free;
  end;

end;

procedure TForm3.Button4Click(Sender: TObject);
begin
with TFileOpenDialog.Create(nil) do
  try
    title:='Select UnrealPak.exe file for creating MOD pak file.';
    FileTypes.Add.FileMask:= 'UnrealPak.exe';
    if Execute then
      edit3.text:=FileName;

  finally
    Free;
  end;

end;

procedure TForm3.FormCreate(Sender: TObject);
begin
if form1.IcarusContentFolder<>'' then edit1.text:=form1.IcarusContentFolder;
if form1.UE4PAKFile<>'' then edit3.text:=form1.UE4PAKFile;

end;

end.
