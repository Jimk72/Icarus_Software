unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Menus,
  System.JSON, inifiles, Math,
  System.IOUtils, StrUtils, Vcl.ComCtrls, ClipBrd, ShellApi;

type
  TForm2 = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    function GetChoice(Original,New,CurrentMod,CurrentItem,CurrentValue,CurrentFile:string): String;
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure Memo1MouseEnter(Sender: TObject);
    procedure Memo2MouseEnter(Sender: TObject);
    procedure Memo2MouseLeave(Sender: TObject);
    procedure Memo1MouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    MouseOver: String;
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Unit1;
procedure TForm2.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin

    if WheelDelta > 0 then
    begin
      Memo1.Perform(EM_LINESCROLL, 0, -1);
      Memo2.Perform(EM_LINESCROLL, 0, -1);
    end;
    if WheelDelta < 0 then
    begin
      Memo1.Perform(EM_LINESCROLL, 0, 1);
      Memo2.Perform(EM_LINESCROLL, 0, 1);
    end;

end;

function TForm2.GetChoice(Original,New,CurrentMod,CurrentItem,CurrentValue,CurrentFile:string): String;
begin
label6.Caption:=CurrentMod;
label7.Caption:=CurrentFile;
label8.Caption:=CurrentItem;
label10.Caption:=CurrentValue;
Memo1.text:=Form1.JSONFormat(Original);
Memo2.text:=Form1.JSONFormat(New);
form2.show;
 with TTaskDialog.Create(self) do
  begin
  MouseCapture:=true;
  Flags := [tfUseHiconMain, tfAllowDialogCancellation];
        try
        Title := 'Item: '+CurrentItem;
        Caption := 'Conflict Found!';
        Text := 'Value: '+CurrentValue;
        CommonButtons := [];
        with TTaskDialogButtonItem(Buttons.Add) do
        begin
          Caption := 'Add Current Value';
          ModalResult := mrNone;
        end;
        with TTaskDialogButtonItem(Buttons.Add) do
        begin
          Caption := 'Add New Value';
          ModalResult := mrYes;
        end;
        with TTaskDialogButtonItem(Buttons.Add) do
        begin
          Caption := 'Turn Off choice';
          ModalResult := mrNo;
        end;
        MainIcon := tdiInformation;

        if Execute then
          if ModalResult = mrYes then
            result:=New;
          if ModalResult = mrNone then
            result:=Original;
          if ModalResult = mrNo then
          begin
            result:=New;
          Form1.Choice:=False;
          end;
      finally
        Free;
      end
    end;
form2.hide;
    end;
procedure TForm2.Memo1MouseEnter(Sender: TObject);
begin
  MouseOver := 'Memo1';
end;

procedure TForm2.Memo1MouseLeave(Sender: TObject);
begin
MouseOver := '';
end;

procedure TForm2.Memo2MouseEnter(Sender: TObject);
begin
MouseOver := 'Memo1';
end;

procedure TForm2.Memo2MouseLeave(Sender: TObject);
begin
MouseOver := '';
end;

end.
