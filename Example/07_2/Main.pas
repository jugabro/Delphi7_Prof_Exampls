unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Spin, ImgList, ComCtrls, ToolWin;

type
  TMainForm = class(TForm)
    PersonsList: TListBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    FNameEdit: TEdit;
    LNameEdit: TEdit;
    DocEdit: TEdit;
    AddrEdit: TEdit;
    PhoneEdit: TEdit;
    AgeEdit: TSpinEdit;
    OpenDlg: TOpenDialog;
    SaveDlg: TSaveDialog;
    ToolBar1: TToolBar;
    AddBtn: TToolButton;
    EditBtn: TToolButton;
    RestBtn: TToolButton;
    DelBtn: TToolButton;
    ClearBtn: TToolButton;
    ToolButton6: TToolButton;
    OpenBtn: TToolButton;
    SaveBtn: TToolButton;
    ToolButton9: TToolButton;
    ImageList1: TImageList;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  THuman = class
    FirstName: String;
    LastName:  String;
    Age:       Integer;
    Document:  String;
    Address:    String;
    Phone:     String;
    constructor Create(AName: String);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

constructor THuman.Create(AName: String);
begin
 inherited Create;
 FirstName := AName;
end;

procedure TMainForm.ToolButton1Click(Sender: TObject);
begin
 PersonsList.Items.AddObject('Unknown', THuman.Create('Unknown'));
end;

procedure TMainForm.ToolButton2Click(Sender: TObject);
begin
 with PersonsList, PersonsList.Items do
 begin
  if ItemIndex = -1
   then Exit;
  if not Assigned(Objects[ItemIndex])
   then Objects[ItemIndex] := THuman.Create(Items[ItemIndex]);
  with Objects[ItemIndex] as THuman do
  begin
   FNameEdit.Text := FirstName;
   LNameEdit.Text := LastName;
   AgeEdit.Value := Age;
   DocEdit.Text := Document;
   AddrEdit.Text := Address;
   PhoneEdit.Text := Phone;
  end;
 end;
end;

procedure TMainForm.ToolButton3Click(Sender: TObject);
begin
 if PersonsList.ItemIndex = -1 then
 begin
  ShowMessage('Не выбран элемент');
  Exit;
 end;
 with PersonsList do
 with Items.Objects[ItemIndex] as THuman do
 begin
  FirstName := FNameEdit.Text;
  LastName := LNameEdit.Text;
  Age := AgeEdit.Value;
  Document := DocEdit.Text;
  Address := AddrEdit.Text;
  Phone := PhoneEdit.Text;
  Items[ItemIndex] := FirstName+' '+Copy(LastName,1,1);
 end;
 FNameEdit.Clear;
 LNameEdit.Clear;
 AgeEdit.Clear;
 DocEdit.Clear;
 AddrEdit.Clear;
 PhoneEdit.Clear;
end;

procedure TMainForm.ToolButton4Click(Sender: TObject);
begin
 with PersonsList do Items.Delete(ItemIndex);
end;

procedure TMainForm.ToolButton5Click(Sender: TObject);
begin
 PersonsList.Items.Clear;
end;

procedure TMainForm.ToolButton7Click(Sender: TObject);
var F: TextFile;
    i: Integer;
begin
 try
 with OpenDlg, PersonsList.Items do
 begin
  if Not Execute then Exit;
  LoadFromFile(FileName);
  AssignFile(F, Copy(FileName,1,Length(FileName)-4)+'.lso');
  Reset(F);
  i := 0;
  while Not EOF(F) do
  begin
   Objects[i] := THuman.Create('');
   Readln(F, (Objects[i] as THuman).FirstName);
   Readln(F, (Objects[i] as THuman).LastName);
   Readln(F, (Objects[i] as THuman).Age);
   Readln(F, (Objects[i] as THuman).Document);
   Readln(F, (Objects[i] as THuman).Address);
   Readln(F, (Objects[i] as THuman).Phone);
   Inc(i);
  end;
  CloseFile(F);
 end;
 except
  on E: EFOpenError do ShowMessage('Ошибка открытия файла');
 end;end;

procedure TMainForm.ToolButton8Click(Sender: TObject);
var F: TextFile;
    i: Integer;
begin
 try
 with SaveDlg, PersonsList.Items do
 begin
  if Not Execute then Exit;
  SaveToFile(FileName);
  AssignFile(F, Copy(FileName,1,Length(FileName)-4)+'.lso');
  Rewrite(F);
  for i := 0 to Count - 1 do
  if Objects[i] <> Nil then
  begin
   Writeln(F, (Objects[i] as THuman).FirstName);
   Writeln(F, (Objects[i] as THuman).LastName);
   Writeln(F, (Objects[i] as THuman).Age);
   Writeln(F, (Objects[i] as THuman).Document);
   Writeln(F, (Objects[i] as THuman).Address);
   Writeln(F, (Objects[i] as THuman).Phone);
  end;
  CloseFile(F);
 end;
 except
  on E: EFOpenError do ShowMessage('Ошибка открытия файла');
 end;
end;

procedure TMainForm.ToolButton9Click(Sender: TObject);
begin
 Close;
end;

end.
