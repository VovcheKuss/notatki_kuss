unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Clipbrd, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Name_Doc: TButton;
    Save_Doc: TButton;
    Copy_All: TButton;
    Insert_Text: TButton;
    Clear_All: TButton;
    Day_Mode: TButton;
    Dark_Mode: TButton;
    Memo1: TMemo;
    procedure Clear_AllClick(Sender: TObject);
    procedure Copy_AllClick(Sender: TObject);
    procedure Dark_ModeClick(Sender: TObject);
    procedure Day_ModeClick(Sender: TObject);
    procedure Insert_TextClick(Sender: TObject);
    procedure Name_DocClick(Sender: TObject);
    procedure Save_DocClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation  {$R *.lfm}

var myDate: TDateTime;
  FileName, DataFormated : String;    { \*/:?«<>|  don't use for filename }

procedure TForm1.Name_DocClick(Sender: TObject); //даєм нотатці назву з часом
begin
     myDate:=Now;
     DataFormated:=FormatDateTime('yyy-mm-dd_hh-nn-ss', myDate,[]);
     FileName:= 'Важна_нотатка_' + DataFormated + '.txt';
     Form1.Caption:=FileName;
     Save_Doc.Enabled:= true;
   end;

procedure TForm1.Insert_TextClick(Sender: TObject);  //вставляємо з буфера
begin
     Memo1.Lines.add(Clipboard.AsText);
     Form1.Caption:='Вставлено з буфера обміну';
end;

procedure TForm1.Save_DocClick(Sender: TObject);  // Зберігаємо швидко написане
begin
     Memo1.Lines.SaveToFile(ExtractFilePath(ParamStr(0)) + 'filename' );
     Form1.Caption:='Ця Нотатка-Кусь збережена';
     Save_Doc.Enabled:= false;
end;

procedure TForm1.Copy_AllClick(Sender: TObject);    // копіюємо все в буфер
begin
      Memo1.SelectAll;
      Memo1.CopyToClipboard;
      Form1.Caption:='Нотатка скопійована у буфер';
end;

procedure TForm1.Clear_AllClick(Sender: TObject);    //швидка очистка
begin
      Memo1.Clear;
      Form1.Caption:='Очищено ';
end;

procedure TForm1.Day_ModeClick(Sender: TObject);
var i:integer;
begin
  Day_Mode.enabled:= false;
  Dark_Mode.enabled:= true;

  Font.Color:=$00020202;
  Color:=$00ceeffb;
  Memo1.Font.Color:= $00010202;
  Memo1.Color:= $00e3f6fd;

    for i := 0 to ComponentCount-1 do
  if Components[i] is TButton then  begin
  TButton(Components[i]).Color:= $005dd189;
  TButton(Components[i]).Font.Color:= $00020202;
  end;
end;

procedure TForm1.Dark_ModeClick(Sender: TObject);      //default
var i:integer;
begin
   Dark_Mode.enabled:= false;
   Day_Mode.enabled:= true;

   Font.Color:=$00f5f5f5;
   Color:=$0035291c;
   Memo1.Font.Color:=$00f5f5f5;
   Memo1.Color:=$004a382b;

   for i := 0 to ComponentCount-1 do
  if Components[i] is TButton then  begin
  TButton(Components[i]).Color:=$00361a1a ;
  TButton(Components[i]).Font.Color:=$00f5f5f5;
  end;
end;

end.
