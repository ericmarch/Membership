   unit fInvoiceU;

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
  Data.DB,
  Vcl.DBCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.Mask,
  Vcl.ComCtrls,
  Vcl.Grids,
  InvLineClass,
  dmoInvoiceU;

type
  TfInvoice = class(TForm)
    dscCustomer: TDataSource;
    dblucbCustomer: TDBLookupComboBox;
    dscInvoice: TDataSource;
    lblCustomer: TLabel;
    lblPostAddr: TLabel;
    lblShipTo: TLabel;
    spdBtnInvExit: TSpeedButton;
    spdBtnInvCancel: TSpeedButton;
    spdBtnInvRecord: TSpeedButton;
    lbledtInvNumber: TLabeledEdit;
    ListBoxAddress: TListBox;
    ListBoxShipTo: TListBox;
    dbeSurname: TDBEdit;
    lblShipTo1: TLabel;
    dbeFirstName: TDBEdit;
    lblFirstName: TLabel;
    lblDelivAddress: TLabel;
    dbeDeliv1: TDBEdit;
    dbeDeliv2: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DateTimePicker1: TDateTimePicker;
    Panel1: TPanel;
    cbxGST: TCheckBox;
    stgInvLine: TStringGrid;
    ComboBox1: TComboBox;
    stgEditDescription: TEdit;
    stgEditQty: TEdit;
    stgEditTotal: TEdit;
    stgEditPrice: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure spdBtnInvExitClick(Sender: TObject);
    procedure spdBtnInvCancelClick(Sender: TObject);
    procedure dblucbCustomerExit(Sender: TObject);
    procedure stgInvLineSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure spdBtnInvRecordClick(Sender: TObject);
    procedure stgEditDescriptionChange(Sender: TObject);
    procedure stgEditQtyKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure stgEditQtyExit(Sender: TObject);
    procedure stgEditPriceExit(Sender: TObject);
    procedure stgEditTotalExit(Sender: TObject);
  private
    { Private declarations }
    InvLineObj: TInvLineClass;
    sListID, sListCode, sListDescription: tStringList;
    procedure FormReset;
    procedure StrGridHeadings;
    procedure HideStgDataBoxes(TF: Boolean);
    procedure ItemPickList;
    procedure ItemSelected;
    Procedure StorePrices;
    Function  fourDecimalPlaces(str: String):String;
  public
    { Public declarations }
    fTop: Integer;
    fLeft: Integer;
  End;

var
  fInvoice: TfInvoice;
  dmoInvoice: TdmoInvoice;

implementation

{$R *.dfm}



procedure TfInvoice.dblucbCustomerExit(Sender: TObject);
Var
  iNN: Integer;
  s1: String;
begin
  dmoInvoice.SetQryCutomer;
  ListBoxAddress.Items[0]:= dmoInvoice.CustAddress(1);
  ListBoxAddress.Items[1]:= dmoInvoice.CustAddress(2);
  iNN:= 2;
  s1:= dmoInvoice.CustAddress(3);
  if s1 > '' then
  Begin
    ListBoxAddress.Items[iNN]:= s1;
    iNN:= iNN + 1;
  End;
  ListBoxAddress.Items[iNN]:= dmoInvoice.CustAddress(4);

  ListBoxShipTo.Items[0]:= dmoInvoice.CustShipTo(1);
  ListBoxShipTo.Items[1]:= dmoInvoice.CustShipTo(2);
  iNN:= 2;
  s1:= dmoInvoice.CustShipTo(3);
  if s1 > '' then
  Begin
    ListBoxShipTo.Items[iNN]:= s1;
    iNN:= iNN + 1;
  End;
  ListBoxShipTo.Items[iNN]:= dmoInvoice.CustShipTo(4);
End;


procedure TfInvoice.ItemPickList;
Var
  iNN: Integer;
  s1, s2, s3, sComboBoxText: String;
begin
  //----------- Fill Item StringLists ---------------------
  sListID:= tStringList.Create;
  sListCode:= tStringList.Create;
  sListDescription:= tStringList.Create;
  iNN:= 1;
  ComboBox1.Visible:= False;
  dmoInvoice.dstItem.First;
  while NOT dmoInvoice.dstItem.EOF do
  Begin
    s1:= IntToStr(dmoInvoice.dstItem.FieldByName('ItemID').AsInteger);
    s2:= dmoInvoice.dstItem.FieldByName('ItemCode').AsString;
    s3:= dmoInvoice.dstItem.FieldByName('Description').AsString;
    if dmoInvoice.dstItem.FieldByName('IsInactive').AsBoolean = False then
    Begin
      sListID.Add(s1);
      sListCode.Add(s2);
      sListDescription.Add(s3);
      ComboBox1.Items.Add(s2);
      if iNN = 1 then
        ComboBox1.Text:= s2;
      iNN:= iNN + 1;
    End;
    dmoInvoice.dstItem.Next;
  End;
  dmoInvoice.dstItem.First;
End;


procedure TfInvoice.StrGridHeadings;
begin
  //---------------- StringGrid setup ----------------------
  stgInvLine.Cells[0, 0]:= 'Row';
  stgInvLine.Cells[1, 0]:= 'Item';
  stgInvLine.Cells[2, 0]:= 'Description';
  stgInvLine.Cells[3, 0]:= 'Qty';
  stgInvLine.Cells[4, 0]:= 'Price';
  stgInvLine.Cells[5, 0]:= 'Total';
  stgInvLine.ColWidths[0]:= 50;
  stgInvLine.ColWidths[1]:= 150;
  stgInvLine.ColWidths[2]:= 400;
  stgInvLine.ColWidths[3]:= 100;
  stgInvLine.ColWidths[4]:= 100;
  stgInvLine.ColWidths[5]:= 150;
End;


procedure TfInvoice.FormCreate(Sender: TObject);
var
  Rec: LongRec;
  iNN: Integer;
begin
  Rec := LongRec(GetFileVersion(Application.ExeName));
  Caption := 'Invoice   '
              + ExtractFileName(Application.ExeName)
              + '  v' + Format('%d.%d', [Rec.Hi, Rec.Lo]);
  dmoInvoice:= TdmoInvoice.Create(Self);
  iNN:= dmoInvoice.GetNextTempInvID;
  dmoInvoice.CreateTmpInvLineRecord(iNN);
  InvLineObj:= TInvLineClass.Create(iNN);
  sListID:= tStringList.Create;
  sListCode:= tStringList.Create;
  sListDescription:= tStringList.Create;
  StrGridHeadings;
  ItemPickList;
End;


procedure TfInvoice.FormDestroy(Sender: TObject);
begin
  // Save last Invoice Line
  // Write out Last Invoice to permanent tables = Invoice & InvLine
  // Delete the row in InvLineTmp that contains the InvLineObj.InvID
//  FIX THIS  dmoInvoice.DeleteTmpInvLineRecord(InvLineObj.InvID);
  // Free Objects and StringLists
  FreeAndNil(dmoInvoice);
  InvLineObj.Destroy;
  sListID.Destroy;
  sListCode.Destroy;
  sListDescription.Destroy;
End;


procedure TfInvoice.FormReset;
begin
  dmoInvoice.ReOpenDstCustomer;
  dblucbCustomer.KeyValue:= dmoInvoice.dstCustomer.FieldByName('Card.CardID').AsInteger;
  dblucbCustomer.SetFocus;
End;


procedure TfInvoice.FormShow(Sender: TObject);
begin
  Top:= fTop;
  Left:= fLeft;
  FormReset;
End;


procedure TfInvoice.HideStgDataBoxes(TF: Boolean);
begin
  ComboBox1.Visible:= TF;
  stgEditDescription.Visible:= TF;
  stgEditQty.Visible:= TF;
  stgEditPrice.Visible:= TF;
  stgEditTotal.Visible:= TF;
end;


procedure TfInvoice.spdBtnInvCancelClick(Sender: TObject);
begin
  HideStgDataBoxes(True);
  FormReset;
End;


procedure TfInvoice.spdBtnInvExitClick(Sender: TObject);
begin
  Close;
End;


procedure TfInvoice.spdBtnInvRecordClick(Sender: TObject);
begin
  HideStgDataBoxes(True);
end;


procedure TfInvoice.stgInvLineSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
Var
  R: TRect;
begin
  HideStgDataBoxes(True);
  if ((StrToIntDef(stgInvLine.Cells[0, aRow], 0) < 1) AND (ARow <> 0)) then
  begin
    if aRow > 1 then
    Begin
      dmoInvoice.SaveCellsToInvLineTMP(InvLineObj);
    End;
    stgInvLine.Cells[0, aRow]:= IntToStr(ARow);  // Put InvLineNumber in Column 0
  End;
  if ((ACol = 1) AND (ARow <> 0)) then
  begin
    stgEditDescription.Text:= '';
    stgInvLine.Cells[2, aRow]:= '';
    stgEditQty.Text:= '1.0000';
    stgInvLine.Cells[3, aRow]:= '1.0000';
    stgEditPrice.Text:= '1.0000';
    stgInvLine.Cells[4, aRow]:= '1.0000';
    stgEditTotal.Text:= '1.0000';
    stgInvLine.Cells[5, aRow]:= '1.0000';
    {Width and position ComboBox should correspond
    To cell StringGrid}
    R:= stgInvLine.CellRect (ACol, ARow);
    R.Left:= R.Left + stgInvLine.Left;
    R.Right:= R.Right + stgInvLine.Left;
    R.Top:= R.Top + stgInvLine.Top;
    R.Bottom:= R.Bottom + stgInvLine.Top;
    ComboBox1.Left:= R.Left + 1;
    ComboBox1.Top:= R.Top + 3;
    ComboBox1.Width:= (R.Right + 1) - R.Left;
    ComboBox1.Height:= (R.Bottom + 1) - R.Top;
      {Now do description column}
    R:= stgInvLine.CellRect(2, aRow);
    R.Left:= R.Left + stgInvLine.Left;
    R.Right:= R.Right + stgInvLine.Left;
    R.Top:= R.Top + stgInvLine.Top;
    R.Bottom:= R.Bottom + stgInvLine.Top;
    stgEditDescription.Left:= R.Left + 1;
    stgEditDescription.Top:= R.Top + 3;
    stgEditDescription.Width:= (R.Right + 1) - R.Left;
    stgEditDescription.Height:= (R.Bottom + 1) - R.Top;
    stgEditDescription.Visible:= True;
      {Now do quantity column}
    R:= stgInvLine.CellRect(3, aRow);
    R:= stgInvLine.CellRect (3, ARow);
    R.Left:= R.Left + stgInvLine.Left;
    R.Right:= R.Right + stgInvLine.Left;
    R.Top:= R.Top + stgInvLine.Top;
    R.Bottom:= R.Bottom + stgInvLine.Top;
    stgEditQty.Left:= R.Left + 1;
    stgEditQty.Top:= R.Top + 3;
    stgEditQty.Width:= (R.Right + 1) - R.Left;
    stgEditQty.Height:= (R.Bottom + 1) - R.Top;
    stgEditQty.Visible:= True;
      {Now do price column}
    R:= stgInvLine.CellRect(4, aRow);
    R:= stgInvLine.CellRect (4, ARow);
    R.Left:= R.Left + stgInvLine.Left;
    R.Right:= R.Right + stgInvLine.Left;
    R.Top:= R.Top + stgInvLine.Top;
    R.Bottom:= R.Bottom + stgInvLine.Top;
    stgEditPrice.Left:= R.Left + 1;
    stgEditPrice.Top:= R.Top + 3;
    stgEditPrice.Width:= (R.Right + 1) - R.Left;
    stgEditPrice.Height:= (R.Bottom + 1) - R.Top;
    stgEditPrice.Visible:= True;
      {Now do Total Cost column}
    R:= stgInvLine.CellRect(5, aRow);
    R:= stgInvLine.CellRect (5, ARow);
    R.Left:= R.Left + stgInvLine.Left;
    R.Right:= R.Right + stgInvLine.Left;
    R.Top:= R.Top + stgInvLine.Top;
    R.Bottom:= R.Bottom + stgInvLine.Top;
    stgEditTotal.Left:= R.Left + 1;
    stgEditTotal.Top:= R.Top + 3;
    stgEditTotal.Width:= (R.Right + 1) - R.Left;
    stgEditTotal.Height:= (R.Bottom + 1) - R.Top;
    stgEditTotal.Visible:= True;
      {Now we show combobox}
    ComboBox1.Visible:= True;
    ComboBox1.SetFocus;
  End;
  CanSelect:= True;
  HideStgDataBoxes(False);
End;


procedure TfInvoice.ItemSelected;
Var
  iCol, iRow, iRowCount: Integer;
  aQty: Double;
  aSell, aItemTotal: Currency;
begin
  iCol:= stgInvLine.Col;
  iRow:= stgInvLine.Row;
  iRowCount:= stgInvLine.RowCount;
  if ComboBox1.ItemIndex < 0 then
    ComboBox1.ItemIndex:= 0;
  dmoInvoice.FindItem(strToInt(sListID[ComboBox1.ItemIndex]));
  stgInvLine.Cells[iCol, iRow]:= ComboBox1.Items[ComboBox1.ItemIndex];
  ComboBox1.Visible:= False;
  stgInvLine.Cells[2, iRow]:= sListDescription[ComboBox1.ItemIndex];
  stgEditDescription.Text:= sListDescription[ComboBox1.ItemIndex];
  stgInvLine.Cells[3, iRow]:= '1.0000';
  aQty:= StrToFloat(stgInvLine.Cells[3, iRow]);
  stgEditQty.Text:= stgInvLine.Cells[3, iRow];
  aSell:= dmoInvoice.dstItem.FieldByName('SellCost').AsCurrency;
  stgInvLine.Cells[4, iRow]:= FloatToStrF(aSell, ffCurrency, 8, 4);
  stgEditPrice.Text:= FloatToStrF(aSell, ffCurrency, 8, 4);
  aItemTotal:= Round((aQty*aSell*100))/100;
  stgInvLine.Cells[5, iRow]:= FloatToStrF(aItemTotal, ffCurrency, 10, 2);
  stgEditTotal.Text:= FloatToStrF(aItemTotal, ffCurrency, 10, 2);
  stgInvLine.SetFocus;
  If (stgInvLine.Cells[1, (stgInvLine.RowCount -1)] > ' ') Then
    stgInvLine.RowCount:= stgInvLine.RowCount + 1;
//  ShowMessage('Line 287');
End;


procedure TfInvoice.ComboBox1Exit(Sender: TObject);
begin
  ItemSelected;
End;


procedure TfInvoice.ComboBox1Change(Sender: TObject);
begin
  ItemSelected;
End;


procedure TfInvoice.stgEditDescriptionChange(Sender: TObject);
Var
  iCol, iRow: Integer;
begin
  iCol:= stgInvLine.Col;
  iRow:= stgInvLine.Row;
  if stgEditDescription.Text > '' then
    stgInvLine.Cells[2, iRow]:= stgEditDescription.Text
  else
    stgEditDescription.Text:= stgInvLine.Cells[2, iRow];
end;


procedure TfInvoice.stgEditQtyKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
  MyFloat: Double;
begin
  if NOT (TryStrToFloat(stgEditQty.Text, MyFloat)) then
  Begin
    ShowMessage('Invalid quantity - No commas, letters or spaces' + #13+#10 + '99.1234 OK');
  End;
End;


function TfInvoice.fourDecimalPlaces(str: String): String;
Var
  iDecPt: Integer;
  dNN: Double;
  LeftPart, RightPart: String;
begin
  iDecPt:= AnsiPos('.', str);
  if iDecPt > 0 then
  Begin
    LeftPart:= Copy(str, 1, iDecPt-1);
    If Length(str) > iDecPt Then
    Begin
      RightPart:= '0.' + Copy(Copy(str, iDecPt + 1, (Length(str) - iDecPt))+ '00000', 1, 5);
      dNN:= StrToFloat(RightPart)* 10000;
      RightPart:= IntToStr(Round(dNN));
    End
    Else
    Begin
      RightPart:= '0000';
    End;
    Result:= LeftPart+'.'+RightPart;
  End
  Else
  Begin
    Result:= str+'.0000';
  End;
end;


procedure TfInvoice.StorePrices;
Var
  iCol, iRow, iNN: Integer;
  dQty, dPrice, dTotal: Double;
begin
  iCol:= 3;
  iRow:= stgInvLine.Row;
  if stgEditQty.Text > '' then
  begin
    stgInvLine.Cells[iCol, iRow]:= stgEditQty.Text;
  end
  else
  begin
    stgEditQty.Text:= stgInvLine.Cells[iCol, iRow];
  end;
  stgEditQty.Text:= fourDecimalPlaces(stgEditQty.Text);
  dQty:= StrToFloat(stgEditQty.Text);
  iNN:= Length(stgInvLine.Cells[4, iRow]);
  dPrice:= StrToFloat(Copy(stgInvLine.Cells[4, iRow], 2, iNN-2));
  dTotal:= (Round(dQty * dPrice * 100)/100);
  stgEditTotal.Text:= FloatToStrf(dTotal, ffFixed, Length(stgEditTotal.Text)+2, 2);
  stgInvLine.Cells[5, iRow]:= '$'+stgEditTotal.Text;
  stgInvLine.Refresh;
End;


procedure TfInvoice.stgEditQtyExit(Sender: TObject);
begin
  StorePrices;
End;


procedure TfInvoice.stgEditPriceExit(Sender: TObject);
begin
  stgInvLine.Cells[4, stgInvLine.Row]:= stgEditPrice.Text;
  StorePrices;
End;

procedure TfInvoice.stgEditTotalExit(Sender: TObject);
Var
  dPrice, dTotal: Double;
begin
  stgInvLine.Cells[5, stgInvLine.Row]:= stgEditTotal.Text;
  dTotal:= StrToFloat(stgEditTotal.Text);
  dPrice:= dTotal / (strToFloat(stgInvLine.Cells[5, stgInvLine.Row]));
  StorePrices;
End;



End.
