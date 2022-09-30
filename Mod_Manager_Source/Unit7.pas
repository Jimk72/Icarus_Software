unit Unit7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,System.JSON;

type
  TForm7 = class(TForm)
    ListBox1: TListBox;
    Label1: TLabel;
    ListBox2: TListBox;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Memo1: TMemo;
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CurrentPOS:Integer;
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}

procedure TForm7.Button1Click(Sender: TObject);
var
  ModJSONObject: TJSonValue;
  ModCurFilename: String;
  i: integer;
  ModNameString, readmestring: String;
begin
  ListBox1.Items.clear;
  ListBox2.Items.clear;
  try
    ModJSONObject := TJSONObject.ParseJSONValue(memo1.Text);
    // Get Mod Names
    ModNameString := (ModJSONObject as TJSONObject).GetValue('ModName').value;
    // if (ModJSONObject as TJSONObject).FindValue('Readme')<>nil then
    // memo2.lines.Append((ModJSONObject as TJSONObject).FindValue('Readme').value)
    // else memo2.lines.Append('None avail.');

    Label5.Caption := 'Current Mod Name:'+ModNameString;

    // Get File arrays
    // ModFilearr := (ModJSONObject as TJSONObject).GetValue('Rows') as TJSONArray;
    // for ModFileJSonValue in TJSONArray(ModFilearr) do
    for i := 0 to ((ModJSONObject as TJSONObject).GetValue('Rows') as TJSONArray).Count - 1 do
    begin
      ModCurFilename := (((ModJSONObject as TJSONObject).GetValue('Rows') as TJSONArray)[i] as TJSONObject).GetValue('CurrentFile').value;

      if ModCurFilename <> 'EndOfMod' then
      begin
        ModCurFilename := ModCurFilename.Replace('-', '\');
        ListBox1.Items.Append(ModCurFilename);
      end;

    end;

  finally
    ModJSONObject.free;
  end;

end;

procedure TForm7.Button2Click(Sender: TObject);
begin
memo1.lines.SaveToFile(label4.Caption);
end;

procedure TForm7.Button3Click(Sender: TObject);
begin
if FileExists(label4.Caption) then memo1.lines.LoadFromFile(label4.caption);
button1.Click;
end;

procedure TForm7.ListBox1Click(Sender: TObject);
var

   ModJSONObject: TJSonValue;
   ModCurFilename: String;
   i,valuepos,L,x: integer;
  ModNameString, readmestring: String;
begin

  ModCurFilename:=Listbox1.Items[Listbox1.ItemIndex];
  ModCurFilename := ModCurFilename.Replace('\', '-');
  valuepos:= Pos(ModCurFilename, Memo1.Text);
  if valuepos > 0 then
  begin
    L := SendMessage(Memo1.Handle, EM_LINEFROMCHAR, valuepos - 1, 0);
    CurrentPOS:=valuepos;
    Memo1.SelStart := valuepos - 1;
    Memo1.SelLength := Length(ModCurFilename);
    Memo1.SetFocus;
  end;
 ListBox2.Items.clear;
  try
    ModJSONObject := TJSONObject.ParseJSONValue(memo1.Text);
    // Get Mod Names
    ModNameString := (ModJSONObject as TJSONObject).GetValue('ModName').value;
    // if (ModJSONObject as TJSONObject).FindValue('Readme')<>nil then
    // memo2.lines.Append((ModJSONObject as TJSONObject).FindValue('Readme').value)
    // else memo2.lines.Append('None avail.');

    Label5.Caption := ModNameString;

    // Get File arrays
    // ModFilearr := (ModJSONObject as TJSONObject).GetValue('Rows') as TJSONArray;
    // for ModFileJSonValue in TJSONArray(ModFilearr) do
    for i := 0 to ((ModJSONObject as TJSONObject).GetValue('Rows') as TJSONArray).Count - 1 do
    begin
    if ModCurFilename =  (((ModJSONObject as TJSONObject).GetValue('Rows') as TJSONArray)[i] as TJSONObject).GetValue('CurrentFile').value then
      begin
      for x := 0 to ((((ModJSONObject as TJSONObject).FindValue('Rows') as TJSONArray)[i] as TJSONObject).FindValue('File_Items') as TJSONArray).Count - 1 do
      ListBox2.Items.Append((((((ModJSONObject as TJSONObject).FindValue('Rows') as TJSONArray)[i] as TJSONObject).FindValue('File_Items') as TJSONArray)[x] as TJSONObject).FindValue('Name').value);
      end;
    end;

  finally
    ModJSONObject.free;
  end;

end;

procedure TForm7.ListBox2Click(Sender: TObject);
var
  valuepos, L: Integer;
  tempstring:string;
begin
tempstring:='"Name": "'+Listbox2.Items[Listbox2.ItemIndex]+'",';
valuepos:= Pos(tempstring, Memo1.Text,CurrentPOS);
  if valuepos > 0 then
  begin
    L := SendMessage(Memo1.Handle, EM_LINEFROMCHAR, valuepos - 1, 0);
    Memo1.SelStart := valuepos - 1;
    Memo1.SelLength := Length(tempstring);
    Memo1.SetFocus;
  end
  else
  begin
    tempstring:='"Name":"'+Listbox2.Items[Listbox2.ItemIndex]+'",';
   valuepos:= Pos(tempstring, Memo1.Text,CurrentPOS);
  if valuepos > 0 then
    begin
    L := SendMessage(Memo1.Handle, EM_LINEFROMCHAR, valuepos - 1, 0);
    Memo1.SelStart := valuepos - 1;
    Memo1.SelLength := Length(tempstring);
    Memo1.SetFocus;
    end
    else
    begin
    tempstring:='"Name": "'+Listbox2.Items[Listbox2.ItemIndex]+'"';
    valuepos:= Pos(tempstring, Memo1.Text,CurrentPOS);
    if valuepos > 0 then
      begin
      L := SendMessage(Memo1.Handle, EM_LINEFROMCHAR, valuepos - 1, 0);
      Memo1.SelStart := valuepos - 1;
      Memo1.SelLength := Length(tempstring);
      Memo1.SetFocus;
      end
      else
      begin
      tempstring:='"Name":"'+Listbox2.Items[Listbox2.ItemIndex]+'"';
      valuepos:= Pos(tempstring, Memo1.Text,CurrentPOS);
      if valuepos > 0 then
        begin
        L := SendMessage(Memo1.Handle, EM_LINEFROMCHAR, valuepos - 1, 0);
        Memo1.SelStart := valuepos - 1;
        Memo1.SelLength := Length(tempstring);
        Memo1.SetFocus;
        end;
      end;
    end;
  end;
end;

end.
