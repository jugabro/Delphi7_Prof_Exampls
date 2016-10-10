unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, mxgrid, ExtCtrls, mxpivsrc, mxDB, Db, DBTables, mxtables, mxstore,
  TeeProcs, TeEngine, Chart, mxgraph, ComCtrls, Series;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DecisionCube1: TDecisionCube;
    DecisionSource1: TDecisionSource;
    DecisionPivot1: TDecisionPivot;
    DecisionGrid1: TDecisionGrid;
    DecisionGraph1: TDecisionGraph;
    DecisionQuery1: TDecisionQuery;
    Database1: TDatabase;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

end.
