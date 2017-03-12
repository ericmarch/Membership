   unit fInvoiceU;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  strUtils,
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
  InvClass,
  dmoInvoiceU;

type
  TfInvoice = class(TForm)
    dscCustomer: TDataSource;
    dblucbCustomer: TDBLookupComboBox;
    lblCustomer: TLabel;
    lblPostAddr: TLabel;
    lblShipTo: TLabel;
    spdBtnInvExit: TSpeedButton;
    spdBtnInvCancel: TSpeedButton;
    spdBtnInvRecord: TSpeedButton;
    lbledtInvNumber: TLabeledEdit;
    ListBoxAddress: TListBox;
    ListBoxShipTo: TListBox;
    lblShipTo1: TLabel;
    lblFirstName: TLabel;
    lblDelivAddress: TLabel;
    DateTimePicker1: TDateTimePicker;
    Panel1: TPanel;
    cbxGST: TCheckBox;
    stgInvLine: TStringGrid;
    cbxItemCode: TComboBox;
    stgEditDescription: TEdit;
    stgEditQty: TEdit;
    stgEditTotal: TEdit;
    stgEditPrice: TEdit;
    edtDelivSurname: TEdit;
    edtDelivFirstName: TEdit;
    edtDeliv1: TEdit;
    edtDeliv2: TEdit;
    edtDelivCity: TEdit;
    edtDelivState: TEdit;
    edtDelivPostCode: TEdit;
    Procedure FormShow(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure FormDestroy(Sender: TObject);
    Procedure spdBtnInvExitClick(Sender: TObject);
    Procedure spdBtnInvCancelClick(Sender: TObject);
    Procedure dblucbCustomerExit(Sender: TObject);
    Procedure stgInvLineSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure cbxItemCodeEnter(Sender: TObject);
    Procedure cbxItemCodeExit(Sender: TObject);
    Procedure spdBtnInvRecordClick(Sender: TObject);
    Procedure stgEditDescriptionChange(Sender: TObject);
    Procedure stgEditQtyKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure stgEditQtyExit(Sender: TObject);
    Procedure stgEditPriceExit(Sender: TObject);
    Procedure stgEditTotalExit(Sender: TObject);
    Procedure ListBoxShipToEnter(Sender: TObject);
  private
    { Private declarations }
    InvLineObj: TInvLineClass;
    InvObj: TinvClass;
    iRow: Integer;
    Procedure FormReset;
    Procedure StrGridHeadings;
    Procedure HideStgDataBoxes(TF: Boolean);
    Procedure ItemPickList;
    Procedure ItemSelected;
    Procedure CalcPrices;
    Procedure LoadInvLine;
    Function  fourDecimalPlaces(str: String):String;
    Function  ItemInList(sItemCode: String):Boolean;
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

uses globals;



Procedure TfInvoice.dblucbCustomerExit(Sender: TObject);
Var
  iNN: Integer;
  s1: String;
Begin
  stgInvLine.Enabled:= True;
  dmoInvoice.FillInvObj(InvObj);
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

  edtDelivSurname.Text:= dmoInvoice.CustShipTo(1);
  edtDelivFirstName.Text:= dmoInvoice.CustShipTo(2);
  edtDeliv1.Text:= dmoInvoice.CustShipTo(3);
  s1:= dmoInvoice.CustShipTo(4);
  if s1 > '' then
  Begin
    edtDeliv2.Text:= s1;
  End;
  edtDelivCity.Text:= dmoInvoice.CustShipTo(5);
  edtDelivState.Text:= dmoInvoice.CustShipTo(6);
  edtDelivPostCode.Text:= dmoInvoice.CustShipTo(7);

  ListBoxShipTo.Items[0]:= edtDelivFirstName.Text + ' ' + edtDelivSurname.Text;
  ListBoxShipTo.Items[1]:= edtDeliv1.Text;
  iNN:= 2;
  if edtDeliv2.Text > '' then
  Begin
    ListBoxShipTo.Items[iNN]:= edtDeliv2.Text;
    iNN:= iNN + 1;
  End;
  ListBoxShipTo.Items[iNN]:= edtDelivCity.Text + '    '
        + edtDelivState.Text + '    '
        + edtDelivPostCode.Text;
;
End;


Function TfInvoice.ItemInList(sItemCode: String): Boolean;
Var
  iNN: Integer;
Begin
  Result:= False;
  If cbxItemCode.Items.Count > -1 then
  Begin
    For iNN := 0 to  cbxItemCode.Items.Count -1 do
    Begin
      If cbxItemCode.Items[iNN] = sItemCode then
      Begin
        Result:= True;
      End;
    End;
  End;
End;


Procedure TfInvoice.ItemPickList;
  //----------- Add ItemCode to ComboBoxItemCode ----------
Var
  iNN: Integer;
  s1: String;
Begin
  iNN:= 1;
  dmoInvoice.SelectItems;
  dmoInvoice.dstItem.First;
  while NOT dmoInvoice.dstItem.EOF do
  Begin
    s1:= dmoInvoice.dstItem.FieldByName('ItemCode').AsString;
    cbxItemCode.Items.Add(s1);
    if iNN = 1 then
      cbxItemCode.Text:= s1;
    iNN:= iNN + 1;
    dmoInvoice.dstItem.Next;
  End;
End;


Procedure TfInvoice.StrGridHeadings;
Begin
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


Procedure TfInvoice.FormCreate(Sender: TObject);
var
  Rec: LongRec;
  iNN: Integer;
Begin
  Rec := LongRec(GetFileVersion(Application.ExeName));
  Caption := 'Invoice   '
              + ExtractFileName(Application.ExeName)
              + '  v' + Format('%d.%d', [Rec.Hi, Rec.Lo]);
  dmoInvoice:= TdmoInvoice.Create(Self);
  iNN:= dmoInvoice.GetNextInvID;
  InvObj:= TInvClass.Create(iNN);  // This invid will be replaced with latest invid when invoice is recorded
  InvLineObj:= TInvLineClass.Create(iNN);
  StrGridHeadings;
  ItemPickList;
End;


Procedure TfInvoice.FormDestroy(Sender: TObject);
Begin
  // Save last Invoice Line
  // Write out Last Invoice to permanent tables = Invoice & InvLine
  // Delete the row in InvLineTmp that contains the InvLineObj.InvID
  //  FIX THIS  dmoInvoice.DeleteTmpInvLineRecord(InvLineObj.InvID);
  // Free Objects and StringLists
  FreeAndNil(dmoInvoice);
  InvLineObj.Destroy;
End;


Procedure TfInvoice.FormReset;
Begin
  dmoInvoice.ReOpenDstCustomer;
  dblucbCustomer.KeyValue:= dmoInvoice.dstCustomer.FieldByName('Card.CardID').AsInteger;
  DateTimePicker1.Date:= date;
  dblucbCustomer.SetFocus;
  spdBtnInvRecord.Enabled:= False;
End;


Procedure TfInvoice.FormShow(Sender: TObject);
Begin
  Top:= fTop;
  Left:= fLeft;
  FormReset;
End;


Procedure TfInvoice.HideStgDataBoxes(TF: Boolean);
Begin
  cbxItemCode.Visible:= TF;
  stgEditDescription.Visible:= TF;
  stgEditQty.Visible:= TF;
  stgEditPrice.Visible:= TF;
  stgEditTotal.Visible:= TF;
end;


Procedure TfInvoice.spdBtnInvCancelClick(Sender: TObject);
Begin
  HideStgDataBoxes(True);
  FormReset;
End;


Procedure TfInvoice.spdBtnInvExitClick(Sender: TObject);
Begin
  Close;
End;


Procedure TfInvoice.LoadInvLine;
var
  d1, d2, d3: Double;
Begin
  d1:= StrToFloatDEF(AnsiReplaceStr(MyStripout(stgEditQty.Text),'$', ''), 0);
  if (d1 > 0) then
  Begin
    stgInvLine.Cells[3, iRow]:= stgEditQty.Text;
    d2:= StrToFloatDEF(AnsiReplaceStr(MyStripout(stgEditPrice.Text), '$', ''), 0);
    stgInvLine.Cells[4, iRow]:= stgEditPrice.Text;
    d3:= StrToFloatDEF(AnsiReplaceStr(MyStripout(stgEditTotal.Text), '$', ''), 0);
    stgInvLine.Cells[5, iRow]:= stgEditTotal.Text;
    stgInvLine.Row:= iRow;
    InvLineObj.InvID:= InvObj.InvID;
    InvLineObj.LineNumber:= iRow;
    InvLineObj.ItemCode:= cbxItemCode.Text;
    stgInvLine.Cells[1, iRow]:= stgEditTotal.Text;
    InvLineObj.ItemID:= dmoInvoice.FindItemID(InvLineObj.ItemCode);
    InvLineObj.Description:= stgEditDescription.Text;
    stgInvLine.Cells[2, iRow]:= stgEditDescription.Text;
    InvLineObj.Quantity:= d1;
    InvLineObj.TaxIncUnitPrice:= d2;
    InvLineObj.TaxIncTotal:= d3;
  End;
End;


Procedure TfInvoice.spdBtnInvRecordClick(Sender: TObject);
Var
  iNN: Integer;
Begin
  InvObj.InvID:= dmoInvoice.GetNextInvID;
  InvObj.InvNumber:= IntToStr(InvObj.InvID);
  InvObj.CardID:= dblucbCustomer.KeyValue;
  InvObj.CustPONumber:= 'N/A';
  InvObj.InvDate:= DateTimePicker1.Date;
  InvObj.DelivSurname:= edtDelivSurname.Text;      // In Case delivery details have been changed
  InvObj.DelivFirstName:= edtDelivFirstName.Text;
  InvObj.Deliv1:= edtDeliv1.Text;
  InvObj.Deliv2:= edtDeliv2.Text;
  InvObj.DelivCity:= edtDelivCity.Text;
  InvObj.DelivState:= edtDelivState.Text;
  InvObj.DelivPostCode:= edtDelivPostCode.Text;
  InvObj.InvTotal:= 0.00;


  dmoInvoice.RecordInv(InvObj);
  InvObj.Recorded:= True;
  for iNN  := 1 to iRow do
  Begin
    If AnsiReplaceStr(MyStripout(stgInvLine.Cells[3, iRow]),'$', '') <> '0.00' Then
    Begin
      LoadInvLine;
      dmoInvoice.RecordInvLine(InvLineObj);
      InvObj.InvTotal:= InvObj.InvTotal + InvLineObj.TaxIncTotal;
    End;
  End;
  HideStgDataBoxes(True);
  FormReset;
  spdBtnInvRecord.Enabled:= False;
end;


Procedure TfInvoice.stgInvLineSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
Var
  R: TRect;
Begin
  if (stgInvLine.Cells[0, aRow] < '1') then
  Begin
    iRow:= ARow;
    {Width and position ComboBox should correspond
    To cell StringGrid}

      {Place Drop Down Box on Item Code cell}
    R:= stgInvLine.CellRect (1, ARow);
    R.Left:= R.Left + stgInvLine.Left;
    R.Right:= R.Right + stgInvLine.Left;
    R.Top:= R.Top + stgInvLine.Top;
    R.Bottom:= R.Bottom + stgInvLine.Top;
    cbxItemCode.Left:= R.Left + 1;
    cbxItemCode.Top:= R.Top + 3;
    cbxItemCode.Width:= (R.Right + 1) - R.Left;
    cbxItemCode.Height:= (R.Bottom + 1) - R.Top;
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
    cbxItemCode.Visible:= True;
    cbxItemCode.SetFocus;
  End;
  CanSelect:= True;
  stgInvLine.Enabled:= False;

  If edtDelivSurname.Visible = True Then
  Begin
    edtDelivSurname.Visible:= False;
    edtDelivFirstName.Visible:= False;
    edtDeliv1.Visible:= False;
    edtDeliv2.Visible:= False;
    edtDelivCity.Visible:= False;
    edtDelivState.Visible:= False;
    edtDelivPostCode.Visible:= False;
    lblShipTo1.Visible:= False;
    lblFirstName.Visible:= False;
    lblDelivAddress.Visible:= False;
  End;
End;


Procedure TfInvoice.ItemSelected;
Var
  iCol, iItemID: Integer;
  aQty: Double;
  aSell, aItemTotal: Currency;
Begin
  if spdBtnInvRecord.Enabled = False then
    spdBtnInvRecord.Enabled:= True;
  iItemID:= dmoInvoice.FindItemID(cbxItemCode.Text);
  aSell:= dmoInvoice.dstItem.FieldByName('SellCost').AsCurrency;

  stgEditDescription.Text:= dmoInvoice.dstItem.FieldByName('Description').AsString;
  aQty:= StrToFloatDEF(stgEditQty.Text, 0);
  stgEditPrice.Text:= FloatToStrF(aSell, ffCurrency, 8, 4);
  aItemTotal:= Round((aQty*aSell*100))/100;
  stgEditTotal.Text:= FloatToStrF(aItemTotal, ffCurrency, 10, 2);

  iCol:= 1;             // ItemCode
  stgInvLine.Cells[iCol, iRow]:= cbxItemCode.Text;
  iCol:= 2;             // Item Description
  stgInvLine.Cells[iCol, iRow]:= stgEditDescription.Text;
  iCol:= 3;             // Item Qty
  stgInvLine.Cells[iCol, iRow]:= stgEditQty.Text;
  iCol:= 4;             // Item Price
  stgInvLine.Cells[iCol, iRow]:= FloatToStrF(aSell, ffCurrency, 8, 4);
  iCol:= 5;             // Item Totoal Cost
  stgInvLine.Cells[iCol, iRow]:= FloatToStrF(aItemTotal, ffCurrency, 10, 2);
End;


Procedure TfInvoice.stgEditDescriptionChange(Sender: TObject);
Begin
  if stgEditDescription.Text > '' then
    stgInvLine.Cells[2, iRow]:= stgEditDescription.Text
  else
    stgEditDescription.Text:= stgInvLine.Cells[2, iRow];
end;


Procedure TfInvoice.stgEditQtyKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
  MyFloat: Double;
Begin
  if NOT (TryStrToFloat(stgEditQty.Text, MyFloat)) then
  Begin
    ShowMessage('Invalid quantity - No commas, letters or spaces' + #13+#10 + '99.1234 OK');
  End;
End;


Function TfInvoice.fourDecimalPlaces(str: String): String;
Var
  iDecPt, iNN: Integer;
  dNN: Double;
  LeftPart, RightPart: String;
Begin
  str:= MyStripOut(str);
  iDecPt:= AnsiPos('.', str);
  if iDecPt = 0 then
  Begin
    LeftPart:= str;
    RightPart:= '0000';
  End
  Else
  Begin
    LeftPart:= Copy(str, 1, iDecPt-1);
    If Length(str) > iDecPt Then
    Begin
      RightPart:= Copy(Copy(str, iDecPt + 1, (Length(str) - iDecPt))+ '00000', 1, 5);
    End
    Else
    Begin
      RightPart:= '0000';
    End;
  End;

  iNN:=Length(LeftPart);
  if iNN > 6 then
  Begin
    Insert(',', LeftPart, iNN - 2);
    Insert(',', LeftPart, iNN - 5);
  End
  Else
  Begin
    if iNN > 3 then
     Begin
       Insert(',', LeftPart, iNN - 2);
     End;
  End;

  Result:= LeftPart+'.'+RightPart;
End;


Procedure TfInvoice.CalcPrices;
Var
  iCol, iNN: Integer;
  s1: String;
  dQty, dPrice, dTotal: Double;
Begin
  dQty:= StrToFloatDEF(stgEditQty.Text, 0);
  if dQty > 0 then
  Begin
    iCol:= 3;
    stgInvLine.Cells[iCol, iRow]:= stgEditQty.Text;
    dQty:= StrToFloat(stgEditQty.Text);
    stgEditQty.Text:= fourDecimalPlaces(stgEditQty.Text);

    // Format Price
    s1:= stgInvLine.Cells[4, iRow];
    s1:= AnsiReplaceStr(s1, '$', '');
    s1:= MyStripOut(s1);
    dPrice:= StrToFloatDEF(s1, 0);
    s1:= '$' + fourDecimalPlaces(s1);
    stgInvLine.Cells[4, iRow]:= s1;
    stgEditPrice.Text:= s1;

    dTotal:= (Round(dQty * dPrice * 100)/100);
    s1:= '$' + fourDecimalPlaces(FloatToStr(dTotal));
    iNN:= Length(s1);
    s1:= copy(s1, 1, iNN - 2);
    stgEditTotal.Text:= s1;
    stgInvLine.Cells[5, iRow]:= s1;
    stgInvLine.Refresh;
  End;
End;


Procedure TfInvoice.stgEditQtyExit(Sender: TObject);
Begin
  stgInvLine.Cells[3, stgInvLine.Row]:= stgEditQty.Text;
  CalcPrices;
End;


Procedure TfInvoice.stgEditPriceExit(Sender: TObject);
Begin
  stgInvLine.Cells[4, stgInvLine.Row]:= stgEditPrice.Text;
  CalcPrices;
End;


Procedure TfInvoice.stgEditTotalExit(Sender: TObject);
Var
  dPrice, dTotal: Double;
  s1: String;
Begin
  stgInvLine.Cells[5, iRow]:= stgEditTotal.Text;
  s1:= MyStripOut(stgEditTotal.Text);
  s1:= AnsiReplaceStr(s1, '$', '');
  dTotal:= StrToFloat(s1);
  dPrice:= dTotal / strToFloat(s1);
  stgInvLine.Enabled:= True;
  stgEditQty.Text:= '1';
  CalcPrices;
  iRow:= iRow + 1;
  stgInvLine.RowCount:= stgInvLine.RowCount + 1;
//  PostKeyEx32(VK_DOWN,[], False);    // See Globals
End;



procedure TfInvoice.cbxItemCodeEnter(Sender: TObject);
begin
  stgInvLine.Cells[0, iRow]:= IntToStr(iRow);
  stgEditQty.Text:= '0';
  ItemSelected;
end;


Procedure TfInvoice.cbxItemCodeExit(Sender: TObject);
Begin
  stgEditQty.Text:= '1';
  ItemSelected;
End;


Procedure TfInvoice.ListBoxShipToEnter(Sender: TObject);
Begin
  edtDelivSurname.Visible:= True;
  edtDelivFirstName.Visible:= True;
  edtDeliv1.Visible:= True;
  edtDeliv2.Visible:= True;
  edtDelivCity.Visible:= True;
  edtDelivState.Visible:= True;
  edtDelivPostCode.Visible:= True;
  lblShipTo1.Visible:= True;
  lblFirstName.Visible:= True;
  lblDelivAddress.Visible:= True;
End;


End.
