unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.IOUtils,
  Vcl.ComCtrls,
  Vcl.Imaging.pngimage, tiaonImageButton;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit3: TEdit;
    tiaonImageButton2: TtiaonImageButton;
    tiaonImageButton1: TtiaonImageButton;
    procedure tiaonImageButton2Click(Sender: TObject);
    procedure tiaonImageButton1Click(Sender: TObject);
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

procedure TForm4.tiaonImageButton1Click(Sender: TObject);
begin
  if DirectoryExists(Edit1.Text) then
    form1.ImportModSelected(Edit1.Text, Edit3.Text);
end;

procedure TForm4.tiaonImageButton2Click(Sender: TObject);
begin
  with TFileOpenDialog.Create(nil) do
    try
      Title := 'Select Mod folder.';
      Options := [fdoPickFolders];
      if Execute then
        Edit1.Text := Filename;
      Edit3.Text := ExtractFileName(Filename);
    finally
      Free;
    end;
end;

end.
