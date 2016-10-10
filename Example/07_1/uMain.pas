unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TMainForm = class(TForm)
    ListBtn: TBitBtn;
    ClearBtn: TBitBtn;
    DelBtn: TBitBtn;
    SortBtn: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ListBtnClick(Sender: TObject);
    procedure ClearBtnClick(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
    procedure SortBtnClick(Sender: TObject);
  private
    PixList: TList;
    PixNum: Integer;
  public
    { Public declarations }
  end;

  TMyPixel = class(TObject)
    FX:     Integer;
    FY:     Integer;
    FText:  Integer;
    constructor Create(X, Y, Num: Integer);
    procedure SetPixel;
  end;


var
  MainForm: TMainForm;

implementation

{$R *.dfm}

const PixColor = clRed;

var CurPixel: TMyPixel;

constructor TMyPixel.Create(X, Y, Num: Integer);
begin
 inherited Create;
 FX := X;
 FY := Y;
 FText := Num;
 SetPixel;
end;

procedure TMyPixel.SetPixel;
begin
 MainForm.Canvas.PolyLine([Point(FX, FY), Point(FX, FY)]);
 MainForm.Canvas.TextOut(FX + 1, FY + 1, IntToStr(FText));
end;

function PixCompare(Item1, Item2: Pointer): Integer;
var Pix1, Pix2: TMyPixel;
begin
 Pix1 := Item1;
 Pix2 := Item2;
 Result := Pix1.FX - Pix2.FX;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
 PixList := TList.Create;
 PixNum := 1;                  {Счетчик точек}
 Canvas.Pen.Color := PixColor; {Цвет точки}
 Canvas.Pen.Width := 3;        {Размер точки}
 Canvas.Brush.Color := Color;  {Цвет фора текста равен цвету формы}
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 PixList.Free;
end;

procedure TMainForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 PixList.Add(TMyPixel.Create(X, Y, PixNum));
 Inc(PixNum);
end;

procedure TMainForm.ListBtnClick(Sender: TObject);
var i: Integer;
begin
 with PixList do
 for i := 0 to Count - 1 do
 begin
  CurPixel := Items[i];
  CurPixel.SetPixel;
 end;
end;

procedure TMainForm.ClearBtnClick(Sender: TObject);
begin
 Canvas.FillRect(Rect(0, 0, Width, Height));
end;

procedure TMainForm.DelBtnClick(Sender: TObject);
begin
 PixList.Clear;
 PixNum := 1;
end;

procedure TMainForm.SortBtnClick(Sender: TObject);
var i: Integer;
begin
 PixList.Sort(PixCompare);
 with PixList do
  for i := 0 to Count - 1 do TMyPixel(Items[i]).FText := i + 1;
end;

end.
