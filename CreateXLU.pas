unit CreateXLU ;

interface
uses ComObj,
     SysUtils,
     strUtils;

implementation


{3. Code by Reinhard Schatzl }
// Hilfsfunktion für StringGridToExcelSheet
// Helper function for StringGridToExcelSheet
function RefToCell(RowID, ColID: Integer): string;
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
function StringGridToExcelSheet(Grid: TStringGrid; SheetName, FileName: string;
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

end.
