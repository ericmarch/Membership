unit fReportRangesU;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.StdCtrls,
  dmoMemMaintU;

type
  TfReportRanges = class(TForm)
    spdBtnRangeOK: TSpeedButton;
    spdBtnmemExit: TSpeedButton;
    ListBoxExcludeCards: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    ListBoxIncludeCards: TListBox;
    Label3: TLabel;
    ListBoxActiveCards: TListBox;
    procedure spdBtnRangeOKClick(Sender: TObject);
    procedure spdBtnmemExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBoxIncludeCardsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBoxIncludeCardsClick(Sender: TObject);
    procedure ListBoxExcludeCardsClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    Function  SelectedToArray(WhichOne: Integer):Boolean;
    Procedure  IncludeSelectionError;
  public
    { Public declarations }
  End;

var
  dmoMemMaint: TdmoMemMaint;
  fReportRanges: TfReportRanges;

implementation

{$R *.dfm}

uses MyGlobals, globals;

procedure TfReportRanges.FormCreate(Sender: TObject);
begin
  Height:= 520;
  Width:= 630;
  dmoMemMaint:= TdmoMemMaint.Create(Self);
end;

procedure TfReportRanges.FormDestroy(Sender: TObject);
begin
  FreeAndNil(dmoMemMaint);
end;

procedure TfReportRanges.FormShow(Sender: TObject);
Var
 iLn: Integer;
begin
  dmoMemMaint.SelectUsedCats;
  iLn:= dmoMemMaint.dstSelectCat1.RecordCount;

    // Set the length of the single dimension array
  SetLength(gArrCatInc, iLn + 1);
  SetLength(gArrCatIDInc, iLn + 1);
  SetLength(gArrCatIDIncSelected, iLN + 1);
  SetLength(gArrCatExc, iLn);
  SetLength(gArrCatIDExc, iLn);
  SetLength(gArrCatIDExcSelected, iLN);
  SetLength(gArrActiveCards, 3);

  ListBoxIncludeCards.Items.Clear;
  ListBoxIncludeCards.Items[0]:= 'All';
  iLn:= 1;
  while iLn < dmoMemMaint.dstSelectCat1.RecordCount + 1 do
  Begin
    ListBoxIncludeCards.Items[iLn]:= dmoMemMaint.dstSelectCat1.FieldByName('Description').AsString;
    gArrCatIDInc[iLn]:= dmoMemMaint.dstSelectCat1.FieldByName('CatID').AsInteger;
    gArrCatIDIncSelected[iLn]:= 0;
    iLn:= iLn + 1;
    dmoMemMaint.dstSelectCat1.Next;
  End;
  dmoMemMaint.dstSelectCat1.First;
  ListBoxExcludeCards.Items.Clear;
  iLn:= 0;
  while iLn < dmoMemMaint.dstSelectCat1.RecordCount do
  Begin
    ListBoxExcludeCards.Items[iLn]:= dmoMemMaint.dstSelectCat1.FieldByName('Description').AsString;
    gArrCatIDExc[iLn]:= dmoMemMaint.dstSelectCat1.FieldByName('CatID').AsInteger;
    gArrCatIDExcSelected[iLn]:= 0;
    iLn:= iLn + 1;
    dmoMemMaint.dstSelectCat1.Next;
  End;
  ListBoxActiveCards.Items[0]:= 'Active Cards';
  ListBoxActiveCards.Items[1]:= 'InActive Cards';
  ListBoxActiveCards.Items[2]:= 'Both';
  ListBoxIncludeCards.Selected[0]:= True;
  ListBoxActiveCards.Selected[0]:=  True;
End;

Procedure TfReportRanges.IncludeSelectionError;
Var
  iNN: Integer;
Begin
  If ListBoxIncludeCards.Selected[0] Then
  Begin
    for iNN := 1 to ListBoxIncludeCards.Items.Count - 1 do
    Begin
      ListBoxIncludeCards.Selected[0]:= False;     //  Unselect All
//      Error('Cannot select all categories '
//           + CRLF
//           + 'and then double select another category');
    End;
  End;
End;

procedure TfReportRanges.ListBoxExcludeCardsClick(Sender: TObject);
Var
  iNN: Integer;
begin
  If NOT ListBoxIncludeCards.Selected[0] Then
  Begin
    Error('Can only UNselect a category '
         + CRLF
         + 'when include all is selected above');
    for iNN := 1 to ListBoxExcludeCards.Items.Count - 1 do
    Begin
      ListBoxExcludeCards.Selected[iNN]:= False;
    End;
  End;
end;

Procedure TfReportRanges.ListBoxIncludeCardsClick(Sender: TObject);
Begin
  IncludeSelectionError;
End;

Procedure TfReportRanges.ListBoxIncludeCardsKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  IncludeSelectionError;
end;

function TfReportRanges.SelectedToArray(WhichOne: Integer): Boolean;
Var
  iNN: Integer;
begin
  Result:= False;
  Case WhichOne of
    1 : Begin
          for iNN := 0 to ListBoxIncludeCards.Items.Count - 1 do
          Begin
            if ListBoxIncludeCards.Selected[iNN] then
            Begin
              gArrCatIDIncSelected[iNN]:= 1;
              Result:= True;
            End
            Else
            Begin
              gArrCatIDIncSelected[iNN]:= 0;
            End;
          End;

        End;
    2 : Begin
          for iNN := 0 to ListBoxExcludeCards.Items.Count - 1 do
          Begin
            if ListBoxExcludeCards.Selected[iNN] then
            Begin
              gArrCatIDExcSelected[iNN]:= 1;
              Result:= True;
            End
            Else
            Begin
              gArrCatIDExcSelected[iNN]:= 0;
            End;
          End;
        End;
    3 : Begin
          for iNN := 0 to ListBoxActiveCards.Items.Count - 1 do
          Begin
            if ListBoxActiveCards.Selected[iNN] then
            Begin
              gArrActiveCards[iNN]:= ListBoxActiveCards.Items[iNN];
              Result:= True;
            End
            Else
            Begin
              gArrActiveCards[iNN]:= '';
            End;
          End;
        End;
  End;
End;

procedure TfReportRanges.spdBtnmemExitClick(Sender: TObject);
begin
  modalResult:= mrCancel;
End;

procedure TfReportRanges.spdBtnRangeOKClick(Sender: TObject);
var
  b1Selected, b2Selected: Boolean;
begin
  b1Selected:= SelectedToArray(1);
  if b1Selected then
  Begin
    b2Selected:= SelectedToArray(2);
    modalResult:= mrOK;
  End
  Else
  Begin
    Error('Must select something to include in reports');
  End;
  SelectedToArray(3);
End;

End.
