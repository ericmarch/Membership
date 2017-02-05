unit fInvoiceU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls,
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
  private
    { Private declarations }
    InvLineObj: TInvLineClass;
    procedure FormReset;
    procedure ItemPickList;
    procedure ItemDropDown;
  public
    { Public declarations }
    fTop: Integer;
    fLeft: Integer;
  end;

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
  s1, sComboBoxText: String;
  sList: tStringList;
begin
  //-----------DBGrid version ---------------------
  sList:= tStringList.Create;
  dmoInvoice.dstItem.First;
  while NOT dmoInvoice.dstItem.EOF do
  Begin
    s1:= dmoInvoice.dstItem.FieldByName('IteMCode').AsString;
    if dmoInvoice.dstItem.FieldByName('IsInactive').AsBoolean = False then
    Begin
      sList.Add(s1);
    End;
    dmoInvoice.dstItem.Next;
  End;
//  DBGrid1.Columns[1].PickList:= sList;
  dmoInvoice.dstItem.First;
  sList.Free;

  //-----------StringGrid version -----------------
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
  dmoInvoice.dstItem.First;
  ComboBox1.Visible:= False;
  stgInvLine.DefaultRowHeight:= ComboBox1.Height;
  iNN:= 1;
  while NOT dmoInvoice.dstItem.EOF do
  Begin
    s1:= dmoInvoice.dstItem.FieldByName('IteMCode').AsString;
    if dmoInvoice.dstItem.FieldByName('IsInactive').AsBoolean = False then
    Begin
      ComboBox1.Items.Add(s1);
      if iNN = 1 then
        ComboBox1.Text:= s1;
      iNN:= iNN + 1;
    End;
    dmoInvoice.dstItem.Next;
  End;
  dmoInvoice.dstItem.First;

end;

procedure TfInvoice.FormCreate(Sender: TObject);
var
  Rec: LongRec;
begin
  Rec := LongRec(GetFileVersion(Application.ExeName));
  Caption := 'Invoice   '
              + ExtractFileName(Application.ExeName)
              + '  v' + Format('%d.%d', [Rec.Hi, Rec.Lo]);
  dmoInvoice:= TdmoInvoice.Create(Self);
  InvLineObj:= TInvLineClass.Create(dmoInvoice.GetNextInvID);
  ItemPickList;
End;

procedure TfInvoice.FormDestroy(Sender: TObject);
begin
  FreeAndNil(dmoInvoice);
  InvLineObj.Destroy;
end;

procedure TfInvoice.FormReset;
begin
  dmoInvoice.ReOpenDstCustomer;
  dblucbCustomer.KeyValue:= dmoInvoice.dstCustomer.FieldByName('Card.CardID').AsInteger;
  dblucbCustomer.SetFocus;
end;

procedure TfInvoice.FormShow(Sender: TObject);
begin
  Top:= fTop;
  Left:= fLeft;
  FormReset;
end;

procedure TfInvoice.spdBtnInvCancelClick(Sender: TObject);
begin
  FormReset;
end;

procedure TfInvoice.spdBtnInvExitClick(Sender: TObject);
begin
  Close;
end;


procedure TfInvoice.ItemDropDown;
Var
  iCol, iRow: Integer;
begin
  iCol:= stgInvLine.Col;
  iRow:= stgInvLine.Row;
  stgInvLine.Cells[iCol, iRow]:=ComboBox1.Items[ComboBox1.ItemIndex];
  ComboBox1.Visible:= False;
  stgInvLine.SetFocus;
end;

procedure TfInvoice.ComboBox1Exit(Sender: TObject);
begin
  if ComboBox1.ItemIndex < 0 then
    ComboBox1.ItemIndex:= 0;
  ItemDropDown;
end;

procedure TfInvoice.ComboBox1Change(Sender: TObject);
begin
  ItemDropDown;
end;

procedure TfInvoice.stgInvLineSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
Var
  R: TRect;
begin
  if ((StrToIntDef(stgInvLine.Cells[0, aRow], 0) < 1) AND (ARow <> 0)) then
  begin
    if aRow > 1 then
    Begin
      dmoInvoice.SaveCellsToInvLineTMP(InvLineObj);
    End;
    stgInvLine.Cells[0, aRow]:= IntToStr(ARow);  // Put InvLineNumber in Column 0
  end;
  if ((ACol = 1) AND (ARow <> 0)) then
  begin
    {Width and position ComboBox should correspond
    To cell StringGrid}
    R:= stgInvLine.CellRect (ACol, ARow);
    R.Left:= R.Left + stgInvLine.Left;
    R.Right:= R.Right + stgInvLine.Left;
    R.Top:= R.Top + stgInvLine.Top;
    R.Bottom:= R.Bottom + stgInvLine.Top;
    ComboBox1.Left:= R.Left + 1;
    ComboBox1.Top:= R.Top + 1;
    ComboBox1.Width:= (R.Right + 1) - R.Left;
    ComboBox1.Height:= (R.Bottom + 1) - R.Top;
    {We show combobox}
    ComboBox1.Visible:= True;
    ComboBox1.SetFocus;
    end;
    CanSelect:= True;
  end;

End.
