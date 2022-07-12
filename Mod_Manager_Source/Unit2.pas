unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Menus,System.JSON, inifiles, Math,
  System.IOUtils, StrUtils, Vcl.ComCtrls, ClipBrd,ShellApi;

type
  TForm2 = class(TForm)
    Label7: TLabel;
    Edit1: TEdit;
    Button3: TButton;
    Label8: TLabel;
    Edit2: TEdit;
    Button4: TButton;
    Button5: TButton;
    Mod2Files: TListBox;
    Mod2Items: TListBox;
    Memo3: TMemo;
    Label9: TLabel;
    Edit3: TEdit;
    Memo4: TMemo;
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    procedure Button5Click(Sender: TObject);
    procedure CompareFile(CurFilename: String);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    function MergeMod(Mod1File: String;Mod2File: String;ModName: String): Boolean;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Unit1;

procedure TForm2.Button1Click(Sender: TObject);
begin
Form1.ImportMod(label2.Caption,'',Form1.IcarusModsFolder,False);
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
with TOpenDialog.Create(nil) do
  try
    InitialDir:=ExtractFilePath(Application.ExeName)+'Extracted Mods';
    Filter := 'Extracted Mod files (*.EXMod)|*.EXMod';
    if Execute then
      edit1.text:=FileName;

  finally
    Free;
  end;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
with TOpenDialog.Create(nil) do
  try
  InitialDir:=ExtractFilePath(Application.ExeName)+'Extracted Mods';
  Filter := 'Extracted Mod files (*.EXMod)|*.EXMod';
  if Execute then
  edit2.text:=FileName;

  finally
  Free;
  end;
end;

function TForm2.MergeMod(Mod1File: String;Mod2File: String;ModName: String): Boolean;
var
   Mod1JSONObject,Mod2JSONObject : TJSONObject;
   Mod1CurFilename,Mod2CurFilename,jsontext, selectedItem, ItemName: String;
   Mod1Filearr,Mod2Filearr,Mod1Itemarr, Mod2Itemarr: TJSONArray;
   Mod1DefaultJSonValue,Mod2DefaultJSonValue,Mod1FileJSonValue,Mod2FileJSonValue,Mod2ItemJSonValue, Mod1ItemJSonValue,Mod1NameItemJSonValue,Mod2NameItemJSonValue: TJSonValue;
   TempjsonString,Mod1NameString,Mod2NameString,Mod1jsontextString, Mod2jsontextString,Mod1ItemNameString,Mod2ItemNameString: String;
   i,ItemIndex:Integer;
   FileFound,ItemsFound:Boolean;

begin
result:=False;
if (FileExists(Mod1File)) and (FileExists(Mod2File)) and (ModName<>'') then
   begin
   //Setup
   Mod2Files.Items.Clear;
   Mod2Items.Items.Clear;
   memo3.lines.Clear;
   memo4.lines.Clear;
   // Create new mod folder
   CreateDir(ExtractFilePath(ExtractFilePath(Application.ExeName)+ModName));
   // Start of mod file
   TempjsonString:='{"ModName":"'+ModName+'","Rows":[';
   try
   //Read json for mod1
   Mod1JSONObject := TJSONObject.ParseJSONValue(TFile.ReadAllText(Mod1File))
      as TJSONObject;
   //Read json for mod2
   Mod2JSONObject := TJSONObject.ParseJSONValue(TFile.ReadAllText(Mod2File))
      as TJSONObject;
    // Get Mod Names
    Mod1NameString:=Mod1JSONObject.GetValue('ModName').value;
    memo3.Lines.Append('Mod 1 Mod Name:'+Mod1NameString);
    Mod2NameString:=Mod2JSONObject.GetValue('ModName').value;
    memo3.Lines.Append('Mod 2 Mod Name:'+Mod2NameString);
    // Get File arrays
    Mod1Filearr := Mod1JSONObject.GetValue('Rows') as TJSONArray;
    memo3.Lines.Append('Mod 1 File Count:'+inttostr(Mod1Filearr.Count-1));
    Mod2Filearr := Mod2JSONObject.GetValue('Rows') as TJSONArray;
    memo3.Lines.Append('Mod 2 File Count:'+inttostr(Mod2Filearr.Count-1));
    // Loop through each file from mod1
    ///////// Mod 1 File loop ////////////
    for Mod1FileJSonValue in TJSONArray(Mod1Filearr) do
      begin
      ////////////////Main Loop////////////////////
      FileFound:=false;
      // Get current folder/file name
      Mod1CurFilename := (Mod1FileJSonValue as TJSONObject).GetValue('CurrentFile').value;
      // Make sure its not the end of file
      if Mod1CurFilename<>'EndOfMod' then
        begin
        memo3.Lines.Append('Mod 1 Current Filename:'+Mod1CurFilename);
        ///////// Mod 2 File loop ////////////
        for Mod2FileJSonValue in TJSONArray(Mod2Filearr) do
          begin
          Mod2CurFilename := (Mod2FileJSonValue as TJSONObject).GetValue('CurrentFile').value;
          if Mod2CurFilename<>'EndOfMod' then
            begin
            // Get mod2 folder/file name
            // Compare current files
            if Mod1CurFilename=Mod2CurFilename then
              begin
              /////////// Filename Match found! ///////////
              Mod2Items.Items.Clear;
              // Build Header
              TempjsonString:=TempjsonString+'{"CurrentFile":"'+Mod1CurFilename+'","File_Items":[';
              FileFound:=true;
              Mod2files.Items.Append(Mod2CurFilename);
              // Get items arrays
              Mod1Itemarr := (Mod1FileJSonValue as TJSONObject).GetValue('File_Items') as TJSONArray;
              memo3.Lines.Append('Mod 1 File Items Count:'+inttostr(Mod1Itemarr.Count));
              Mod2Itemarr := (Mod2FileJSonValue as TJSONObject).GetValue('File_Items') as TJSONArray;
              memo3.Lines.Append('Mod 2 File Items Count:'+inttostr(Mod2Itemarr.Count));
              // compare Defaults
              Mod1DefaultJSonValue:= (Mod1FileJSonValue as TJSONObject).GetValue('Defaults');
              Mod2DefaultJSonValue:= (Mod2FileJSonValue as TJSONObject).GetValue('Defaults');
              if (Mod1DefaultJSonValue<>nil) or (Mod1DefaultJSonValue<>nil) then
                begin
                if Mod2DefaultJSonValue<>nil then
                  begin
                  TempjsonString:=TempjsonString+'"Defaults":'+Mod2DefaultJSonValue.ToString+',';
                  end
                  else
                  begin
                  TempjsonString:=TempjsonString+'"Defaults":'+Mod1DefaultJSonValue.ToString+',';
                  memo4.lines.Append('"Defaults":'+Mod1DefaultJSonValue.ToString+',');
                  end;
                end;
              // Compare Items
              ////////// Loop through mod1 items  ///////////
              for Mod1ItemJSonValue in TJSONArray(Mod1Itemarr) do
                begin
                ItemsFound:=false;
                Mod1ItemNameString := (Mod1ItemJSonValue as TJSONObject).GetValue('Name').value;
                ////////// Loop through mod2 items  ///////////
                for Mod2ItemJSonValue in TJSONArray(Mod2Itemarr) do
                  begin
                  Mod2ItemNameString := (Mod2ItemJSonValue as TJSONObject).GetValue('Name').value;
                  // Compare current Item
                  if Mod1ItemNameString=Mod2ItemNameString then
                    begin
                    // Item Match found
                    ItemsFound:=True;
                    Mod2Items.Items.Append(Mod2ItemNameString);
                    //memo1.Lines.Append(form1.JSONFormat(Mod1ItemJSonValue.Value));
                    //memo2.Lines.Append(form1.JSONFormat(Mod2ItemJSonValue.Value));
                    {td.Execute;
                    if td.ModalResult = 100 then
                    TempjsonString:=TempjsonString+Mod1ItemJSonValue.Value
                    else if td.ModalResult = 101 then
                    TempjsonString:=TempjsonString+Mod2ItemJSonValue.Value; }
                    TempjsonString:=TempjsonString+Mod2ItemJSonValue.ToString+',';
                    break;
                    end;

                  end;
                if ItemsFound=false then
                    begin
                    TempjsonString:=TempjsonString+Mod1ItemJSonValue.tostring+',';
                    end;
                end;
              // Add items from mod2 that didnt match
              for Mod2ItemJSonValue in TJSONArray(Mod2Itemarr) do
                begin
                Mod2ItemNameString := (Mod2ItemJSonValue as TJSONObject).GetValue('Name').value;
                if Mod2Items.Items.IndexOf(Mod2ItemNameString) = -1 then
                  begin
                  TempjsonString:=TempjsonString+Mod2ItemJSonValue.ToString+',';
                  end;
                end;

              Delete(TempjsonString,length(TempjsonString),1);
              TempjsonString:=TempjsonString+']},';
              break;
              end;
            end;
         end;
         if FileFound=false then
              begin
              Mod1Itemarr := (Mod1FileJSonValue as TJSONObject).GetValue('File_Items') as TJSONArray;
              memo3.Lines.Append('Mod 1 File Items Count:'+inttostr(Mod1Itemarr.Count));
              TempjsonString:=TempjsonString+Mod1FileJSonValue.ToString+',';
              end;
        end
       else
       begin
       // Add files from Mod2 that didnt match!
       for Mod2FileJSonValue in TJSONArray(Mod2Filearr) do
          begin
          Mod2CurFilename := (Mod2FileJSonValue as TJSONObject).GetValue('CurrentFile').value;
          if Mod2CurFilename<>'EndOfMod' then
            begin
            if Mod2Files.Items.IndexOf(Mod2CurFilename) = -1 then
              begin
              memo3.Lines.Append('Mod 2 Current Filename: '+Mod2CurFilename);
              Mod2Itemarr := (Mod2FileJSonValue as TJSONObject).GetValue('File_Items') as TJSONArray;
              memo3.Lines.Append('Mod 2 File Items Count:'+inttostr(Mod2Itemarr.Count));
              TempjsonString:=TempjsonString+Mod2FileJSonValue.ToString+',';
              end;
            end;
          end;
        TempjsonString:=TempjsonString+'{"CurrentFile":"EndOfMod"}]}';
       //Delete(TempjsonString,length(TempjsonString),1);
       //TempjsonString:=TempjsonString+']}';
       end;
      end;
    memo4.Lines.Text:=form1.JSONFormat(TempjsonString);
    memo3.Lines.Append('New Extracted Mod saved to:');
    memo3.Lines.Append(ExtractFilePath(Application.ExeName)+'Extracted Mods\'+ModName+'.EXMod');
    memo4.lines.SaveToFile(ExtractFilePath(Application.ExeName)+'Extracted Mods\'+ModName+'.EXMod');
    label2.Caption:=ExtractFilePath(Application.ExeName)+'Extracted Mods\'+ModName+'.EXMod';
    result:=True;
    button1.Enabled:=true;
    finally
      Mod1JSONObject.free;
      Mod2JSONObject.free;
   end;
  end;
end;


procedure TForm2.Button5Click(Sender: TObject);
begin
if (edit1.text<>'') and (edit2.text<>'') and (edit3.text<>'') then
if MergeMod(edit1.text,edit2.text,edit3.text) then
ShowMessage(edit3.text+' Succesfully Created!');
end;

procedure TForm2.CompareFile(CurFilename: String);
var
   Mod1JSON,Mod2JSON : TJSonValue;
   //Mod1arr, Mod2arr: TJSONArray;
   //Mod2Item, Mod1Item,Mod1NameItem,Mod2NameItem: TJSonValue;
  Mod1jsontext, Mod2jsontext,Mod1ItemName,Mod2ItemName: String;
  match, modified: Boolean;
  x,y:integer;
begin
    if FileExists(edit1.text + '\' + CurFilename) then
  begin
  Mod1JSON := TJSONObject.ParseJSONValue(TFile.ReadAllText(edit1.text + '\' + CurFilename));
  if FileExists(edit2.text + '\' + CurFilename) then
    begin
    Mod2JSON := TJSONObject.ParseJSONValue(TFile.ReadAllText(edit2.text + '\' + CurFilename));
    end
    else
    begin
    //ShowMessage(edit2.text + '\' + CurFilename +' does not exist!');
    exit;
    end;
   try
    //Mod1arr := (Mod1JSON as TJSONObject).GetValue('Rows') as TJSONArray;
    //Mod2arr := (Mod2JSON as TJSONObject).GetValue('Rows') as TJSONArray;
    //for Mod1Item in TJSONArray(Mod1arr) do
    for x:= 0 to ((Mod1JSON as TJSONObject).GetValue('Rows') as TJSONArray).count-1 do
    begin
      match := false;
      modified := false;
      //Mod1NameItem := (((Mod1JSON as TJSONObject).GetValue('Rows') as TJSONArray)[x] as TJSONObject).GetValue('Name').value;
      Mod1ItemName := (((Mod1JSON as TJSONObject).GetValue('Rows') as TJSONArray)[x] as TJSONObject).GetValue('Name').value;
      //for Mod2Item in TJSONArray(Mod2arr) do
      for y:= 0 to ((Mod2JSON as TJSONObject).GetValue('Rows') as TJSONArray).count-1 do
      begin
      //Mod2NameItem := (Mod2Item as TJSONObject).GetValue('Name');
      Mod2ItemName := (((Mod2JSON as TJSONObject).GetValue('Rows') as TJSONArray)[y] as TJSONObject).GetValue('Name').value;
      if Mod1ItemName = Mod2ItemName then
        begin
          match := true;
          Mod1jsontext := (((Mod1JSON as TJSONObject).GetValue('Rows') as TJSONArray)[x] as TJSONObject).ToString;
          Mod2jsontext := (((Mod2JSON as TJSONObject).GetValue('Rows') as TJSONArray)[y] as TJSONObject).ToString;

          if AnsiCompareStr(Mod1jsontext, Mod2jsontext) = 0 then
          begin
            break;
          end
          else
          begin
            modified := true;
            break;
          end;
        end;
      end;
      if match = false then
      begin
        //Mod1NameItem := (Mod1Item as TJSONObject).GetValue('Name');
        //Mod1Items.Items.Append(Mod1NameItem.value);
        //Mod1Files.Items.Append(CurFilename);
      end
      else if modified = true then
      begin
        //Mod1NameItem := (Mod1Item as TJSONObject).GetValue('Name');
        //Mod1Items.Items.Append(Mod1NameItem.value);
        //Mod1Files.Items.Append(CurFilename);
      end;

    end;

   finally

   end;

  end
  else
  begin
       //ShowMessage(edit1.text + '\' + CurFilename +' does not exist!');
  exit;
  end;
end;

end.
