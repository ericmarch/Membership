unit fCardReportU;

interface

Uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  frxClass,
  frxDBSet,
  Vcl.Buttons,
  Vcl.Imaging.jpeg,
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  Vcl.Menus,
  Vcl.StdCtrls,
  ComObj,
  Vcl.DBCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Datasnap.DBClient,
  dmoMemMaintU;

Type
  TfCardReport = class(TForm)
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    dscPrintCard: TDataSource;
    spdBtnmemExit: TSpeedButton;
    spdBtnCardAllInfo: TSpeedButton;
    imgCardAll: TImage;
    spdBtnEmergency: TSpeedButton;
    spdBtnContact: TSpeedButton;
    spdBtnAddress: TSpeedButton;
    imgEmergency: TImage;
    dscCategories: TDataSource;
    frxDBDataset2: TfrxDBDataset;
    imgContact: TImage;
    PopupMenu1: TPopupMenu;
    Labels1: TMenuItem;
    MailMergefile1: TMenuItem;
    Sidebyside1: TMenuItem;
    Cancel1: TMenuItem;
    ExporttoXL1: TMenuItem;
    StringGrid1: TStringGrid;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    Procedure FormCreate(Sender: TObject);
    Procedure spdBtnmemExitClick(Sender: TObject);
    Procedure spdBtnCardAllInfoClick(Sender: TObject);
    Procedure spdBtnCardAllInfoMouseEnter(Sender: TObject);
    Procedure spdBtnCardAllInfoMouseLeave(Sender: TObject);
    Procedure spdBtnEmergencyClick(Sender: TObject);
    Procedure spdBtnEmergencyMouseEnter(Sender: TObject);
    procedure spdBtnEmergencyMouseLeave(Sender: TObject);
    procedure spdBtnContactClick(Sender: TObject);
    procedure spdBtnContactMouseEnter(Sender: TObject);
    procedure spdBtnContactMouseLeave(Sender: TObject);
    procedure Labels1Click(Sender: TObject);
    procedure Sidebyside1Click(Sender: TObject);
    procedure spdBtnAddressClick(Sender: TObject);
    procedure MailMergefile1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Cancel1Click(Sender: TObject);
    procedure ExporttoXL1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  Private
    { Private declarations }
    function  RefToCell(RowID, ColID: Integer): string;
    function  StringGridToExcelSheet(Grid: TStringGrid; SheetName, FileName: string;
                      ShowExcel: Boolean): Boolean;
    procedure PopulateStrinGrid(Grid: TStringGrid);
  Public
    { Public declarations }
  End;

Var
  fCardReport: TfCardReport;
  MergeFile: TextFile;
  dmoMemMaint: TdmoMemMaint;

Implementation

{$R *.dfm}

Uses globals, MyGlobals, fReportRangesU;

procedure TfCardReport.Cancel1Click(Sender: TObject);
begin
  Close;
end;

Procedure TfCardReport.FormCreate(Sender: TObject);
Var
  s1: String;
Begin
  Top:= 200;
  Left:= 200;
  dmoMemMaint:= TdmoMemMaint.Create(Self);
End;


procedure TfCardReport.FormDestroy(Sender: TObject);
begin
  FreeAndNil(dmoMemMaint);
end;

procedure TfCardReport.FormShow(Sender: TObject);
Var
  fCardRR: TfReportRanges;
begin
  gPopMenuItem:= 0;
  fCardRR:= TfReportRanges.Create(Self);
  fCardRR.ShowModal;
  FreeAndNil(fCardRR);
  dmoMemMaint.SetCardsSelected;
End;

procedure TfCardReport.Labels1Click(Sender: TObject);
begin
  ShowMessagePos('You have selected Labels', 600, 450);      //  ERIC FIX
end;


procedure TfCardReport.MailMergefile1Click(Sender: TObject);
begin
  dmoMemMaint.dstReportCard.Active:= True;
  frxReport1.LoadFromFile('frf\rptCard1.fr3');      //  ERIC FIX
  frxReport1.ShowReport;
  dmoMemMaint.dstReportCard.Active:= False;
end;

procedure TfCardReport.Sidebyside1Click(Sender: TObject);
begin
  dmoMemMaint.dstReportCard.Active:= True;
  frxReport1.LoadFromFile('frf\rptAddress.fr3');      //  ERIC FIX
  frxReport1.ShowReport;
  dmoMemMaint.dstReportCard.Active:= False;
end;

procedure TfCardReport.spdBtnAddressClick(Sender: TObject);
var
  pnt: TPoint;
begin
  if GetCursorPos(pnt) then
  Begin
    PopupMenu1.Popup(pnt.X + 70, pnt.Y);
  End
  Else
  Begin
    PopupMenu1.Popup(160, 160);
  End;
End;

Procedure TfCardReport.spdBtnCardAllInfoClick(Sender: TObject);
Begin
  dmoMemMaint.dstReportCard.Active:= True;
  frxReport1.LoadFromFile('frf\rptCard1.fr3');
  frxReport1.ShowReport;
  dmoMemMaint.dstReportCard.Active:= False;
End;

Procedure TfCardReport.spdBtnEmergencyClick(Sender: TObject);
Begin
  dmoMemMaint.dstReportCard.Active:= True;
  frxReport1.LoadFromFile('frf\rptEmergency.fr3');
  frxReport1.ShowReport;
  dmoMemMaint.dstReportCard.Active:= False;
End;

Procedure TfCardReport.spdBtnCardAllInfoMouseEnter(Sender: TObject);
Begin
  imgCardAll.Visible:= True;
End;

Procedure TfCardReport.spdBtnCardAllInfoMouseLeave(Sender: TObject);
Begin
  imgCardAll.Visible:= false;
End;

procedure TfCardReport.spdBtnContactClick(Sender: TObject);
begin
  dmoMemMaint.dstReportCard.Active:= True;
  frxReport1.LoadFromFile('frf\rptContact.fr3');
  frxReport1.ShowReport;
  dmoMemMaint.dstReportCard.Active:= False;
end;

procedure TfCardReport.spdBtnContactMouseEnter(Sender: TObject);
begin
  imgContact.Visible:= True;
end;

procedure TfCardReport.spdBtnContactMouseLeave(Sender: TObject);
begin
  imgContact.Visible:= False;
end;

Procedure TfCardReport.spdBtnEmergencyMouseEnter(Sender: TObject);
Begin
  imgEmergency.Visible:= True;
End;

procedure TfCardReport.spdBtnEmergencyMouseLeave(Sender: TObject);
begin
  imgEmergency.Visible:= false;
end;

Procedure TfCardReport.spdBtnmemExitClick(Sender: TObject);
Begin
  Close;
End;


// ------------------------------- Export to Excel ----------------------


procedure TfCardReport.PopulateStrinGrid(Grid: TStringGrid);
Var
  iRow, iCol, iCurrentRow: Integer;
begin
  Grid.RowCount:= dmoMemMaint.dstReportCard.RecordCount;
//  Grid.ColCount:= dmoMemMaint.dstReprtCard.RecordCount;
  Grid.ColCount:= 10;
  iCurrentRow:= 0;
  While NOT dmoMemMaint.dstReportCard.EOF do
  Begin
    Grid.Cells[0, iCurrentRow]:=
            dmoMemMaint.dstReportCard.FieldByName('Surname').AsString;
    Grid.Cells[1, iCurrentRow]:=
            dmoMemMaint.dstReportCard.FieldByName('Firstname').AsString;
    Grid.Cells[2, iCurrentRow]:=
            dmoMemMaint.dstReportCard.FieldByName('PostMobile1').AsString;
    Grid.Cells[3, iCurrentRow]:=
            dmoMemMaint.dstReportCard.FieldByName('PostLandLine').AsString;
    Grid.Cells[4, iCurrentRow]:=
            dmoMemMaint.dstReportCard.FieldByName('PostEmail').AsString;
    Grid.Cells[5, iCurrentRow]:=
            dmoMemMaint.dstReportCard.FieldByName('Post1').AsString;
    Grid.Cells[6, iCurrentRow]:=
            dmoMemMaint.dstReportCard.FieldByName('Post2').AsString;
    Grid.Cells[7, iCurrentRow]:=
            dmoMemMaint.dstReportCard.FieldByName('PostCity').AsString;
    Grid.Cells[8, iCurrentRow]:=
            dmoMemMaint.dstReportCard.FieldByName('PostState').AsString;
    Grid.Cells[9, iCurrentRow]:=
            dmoMemMaint.dstReportCard.FieldByName('PostPostCode').AsString;
    dmoMemMaint.dstReportCard.Next;
    iCurrentRow:= iCurrentRow + 1;
  End;
  dmoMemMaint.dstReportCard.First;
End;

procedure TfCardReport.ExporttoXL1Click(Sender: TObject);
Var
  bShowExcel: Boolean;
begin
  bShowExcel:= Question('Show Excel');
  PopulateStrinGrid(StringGrid1);
  gPopMenuItem:= PopupMenu1.Items.IndexOf(ExportToXL1);    // =4 index zerobased
  StringGridToExcelSheet(StringGrid1, 'Stringgrid Print', 'c:\ErikViking\ExcelFile.xls', bShowExcel);
end;

{3. Code by Reinhard Schatzl }
// Hilfsfunktion für StringGridToExcelSheet
// Helper function for StringGridToExcelSheet
function TfCardReport.RefToCell(RowID, ColID: Integer): string;
var
  ACount, APos: Integer;
begin
  ACount := ColID div 26;
  APos := ColID mod 26;
  if APos = 0 then
  begin
    ACount := ACount - 1;
    APos := 26;
  end;

  if ACount = 0 then
    Result := Chr(Ord('A') + ColID - 1) + IntToStr(RowID);

  if ACount = 1 then
    Result := 'A' + Chr(Ord('A') + APos - 1) + IntToStr(RowID);

  if ACount > 1 then
    Result := Chr(Ord('A') + ACount - 1) + Chr(Ord('A') + APos - 1) + IntToStr(RowID);
end;

// StringGrid Inhalt in Excel exportieren
// Export StringGrid contents to Excel
function TfCardReport.StringGridToExcelSheet(Grid: TStringGrid; SheetName, FileName: string;
  ShowExcel: Boolean): Boolean;
const
  xlWBATWorksheet = -4167;
var
  SheetCount, SheetColCount, SheetRowCount, BookCount: Integer;
  XLApp, Sheet, Data: OLEVariant;
  I, J, N, M: Integer;
  SaveFileName: string;
begin
  //notwendige Sheetanzahl feststellen
  SheetCount := (Grid.ColCount div 256) + 1;
  if Grid.ColCount mod 256 = 0 then
    SheetCount := SheetCount - 1;
  //notwendige Bookanzahl feststellen
  BookCount := (Grid.RowCount div 65536) + 1;
  if Grid.RowCount mod 65536 = 0 then
    BookCount := BookCount - 1;

  //Create Excel-OLE Object
  Result := False;
  XLApp  := CreateOleObject('Excel.Application');
  try
    //Excelsheet anzeigen
    if ShowExcel = False then
      XLApp.Visible := False
    else
      XLApp.Visible := True;
    //Workbook hinzufügen
    for M := 1 to BookCount do
    begin
      XLApp.Workbooks.Add(xlWBATWorksheet);
      //Sheets anlegen
      for N := 1 to SheetCount - 1 do
      begin
        XLApp.Worksheets.Add;
      end;
    end;
    //Sheet ColAnzahl feststellen
    if Grid.ColCount <= 256 then
      SheetColCount := Grid.ColCount
    else
      SheetColCount := 256;
    //Sheet RowAnzahl feststellen
    if Grid.RowCount <= 65536 then
      SheetRowCount := Grid.RowCount
    else
      SheetRowCount := 65536;

    //Sheets befüllen
    for M := 1 to BookCount do
    begin
      for N := 1 to SheetCount do
      begin
        //Daten aus Grid holen
        Data := VarArrayCreate([1, Grid.RowCount, 1, SheetColCount], varVariant);
        for I := 0 to SheetColCount - 1 do
          for J := 0 to SheetRowCount - 1 do
            if ((I + 256 * (N - 1)) <= Grid.ColCount) and
              ((J + 65536 * (M - 1)) <= Grid.RowCount) then
              Data[J + 1, I + 1] := Grid.Cells[I + 256 * (N - 1), J + 65536 * (M - 1)];
        //-------------------------
        XLApp.Worksheets[N].Select;
        XLApp.Workbooks[M].Worksheets[N].Name := SheetName + IntToStr(N);
        //Zellen als String Formatieren
        XLApp.Workbooks[M].Worksheets[N].Range[RefToCell(1, 1),
          RefToCell(SheetRowCount, SheetColCount)].Select;
        XLApp.Selection.NumberFormat := '@';
        XLApp.Workbooks[M].Worksheets[N].Range['A1'].Select;
        //Daten dem Excelsheet übergeben
        Sheet := XLApp.Workbooks[M].WorkSheets[N];
        Sheet.Range[RefToCell(1, 1), RefToCell(SheetRowCount, SheetColCount)].Value :=
          Data;
      end;
    end;
    //Save Excel Worksheet
    try
      for M := 1 to BookCount do
      begin
        SaveFileName := Copy(FileName, 1,Pos('.', FileName) - 1) + IntToStr(M) +
          Copy(FileName, Pos('.', FileName),
          Length(FileName) - Pos('.', FileName) + 1);
        XLApp.Workbooks[M].SaveAs(SaveFileName);
      end;
      Result := True;
    except
      // Error ?
    end;
  finally
    //Excel Beenden
    if (not VarIsEmpty(XLApp)) and (ShowExcel = False) then
    begin
      XLApp.DisplayAlerts := False;
      XLApp.Quit;
      XLAPP := Unassigned;
      Sheet := Unassigned;
    end;
  end;
end;

End.
