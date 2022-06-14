unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,System.IOUtils, Vcl.ComCtrls;

type
  TForm4 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Button2: TButton;
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses Unit1, Unit5;

procedure TForm4.Button1Click(Sender: TObject);
begin
if DirectoryExists(edit1.Text) then
   begin
   Form1.log.Lines.Append('Creating Extracted mod');
   form5.ProgressBar1.Position:=0;
   form5.show;
   TDirectory.Copy(edit1.Text,ExtractFilePath(Application.ExeName)+edit3.Text);
   if DirectoryExists(edit1.Text+'\data') then
   form1.ExtractModData(edit1.Text+'\data',edit3.text,form1.OrigDataFolder,ExtractFilePath(Application.ExeName)+'Extracted Mods' )
   else
   form1.ExtractModData(edit1.Text,edit3.text,form1.OrigDataFolder,ExtractFilePath(Application.ExeName)+'Extracted Mods' );
   Sleep(3000);
   form1.FileListBox1.Update;
   form5.close;
   close;
   end;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
with TFileOpenDialog.Create(nil) do
  try
    Title:='Select Mod folder.';
    Options := [fdoPickFolders];
    if Execute then
    edit1.text:=Filename;

  finally
    Free;
  end;
end;

end.
