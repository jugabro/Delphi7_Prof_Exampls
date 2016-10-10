unit uPiThread;

interface

uses
  Classes;

type
  TPiThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

 var
 GlobalPi : Extended;
 GlobalCounter : Int64;

implementation

uses uMain;

{ Important: Methods and properties of objects in VCL or CLX can only be used
  in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TPiThread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ TPiThread }

const
 //better to choose odd value, to avoid monotonic increase/decrease ef-fect
 UpdatePeriod = 999999;

procedure TPiThread.Execute;
var sign : Integer;
  PiValue, PrevValue : Extended;
  i : Int64;
begin
 { Place thread code here }
 PiValue := 4;
 sign := -1;
 i := 0;
 repeat
  Inc(i);
  PrevValue := PiValue;
  PiValue := PiValue + sign * 4 / (2*i+1);
  sign := -sign;
  if i mod UpdatePeriod = 0 then
   begin
    GlobalPi := PiValue;
    GlobalCounter := i;
    Synchronize( fmMain.UpdatePi );
   end;
 until Terminated or
 (Abs(PiValue - PrevValue)<1E-19) ;
end;

end.
