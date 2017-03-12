unit dmoInvoiceU;

interface

uses
  System.SysUtils,
  strUtils,
  System.Classes,
  Data.DB,
  Data.Win.ADODB,
  Datasnap.DBClient,
  InvClass;

type
 TdmoInvoice = class(TDataModule)
    qryInvoice: TADOQuery;
    qryInvLine: TADOQuery;
    dstCustomer: TADODataSet;
    dstInvoice: TADODataSet;
    dstItem: TADODataSet;
    qryInvLineTMP: TADOQuery;
    ADOCommand1: TADOCommand;
    dstInvLine: TADODataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ReOpenDstCustomer;
    procedure FillInvObj(VAR InvObj: TInvClass);
    procedure RecordInvLine(InvLineObj: TInvLineClass);
    procedure RecordInv(InvObj: TInvClass);
    procedure RecordInvTotal(InvObj: TInvClass);
    Function  FindItemID(sItemCode: String):Integer;
    Procedure SelectItems;
    Function  CustAddress(LineNo: Integer): String;
    Function  CustShipTo(LineNo: Integer): String;
    Function  GetNextInvID:Integer;
  private
    { Private declarations }
    sCustCommand: String;
    sCustOrderBy: String;
    procedure SetDstCustCommand;
    Function  GetNextInvLineID:Integer;
  public
    { Public declarations }
  End;

var
  dmoInvoice: TdmoInvoice;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

uses dmoConnectionU, globals;

{$R *.dfm}

procedure TdmoInvoice.DataModuleCreate(Sender: TObject);
Var
  iNN: Integer;
begin
  SetDstCustCommand;
  qryInvoice.Active := True;
  qryInvLine.Active := True;

  dstInvoice.Active:= True;

  dstItem.Active:= True;
  dstCustomer.Active := True;
  dstCustomer.First;
End;

procedure TdmoInvoice.DataModuleDestroy(Sender: TObject);
begin
  qryInvoice.Active := False;
  qryInvLine.Active := False;
  dstInvoice.Active:= False;
  qryInvLineTMP.Active:= False;
  dstItem.Active:= False;
  dstCustomer.Active := False;
End;


procedure TdmoInvoice.SelectItems;
begin
  dstItem.Active:= False;
  dstItem.CommandText:= 'Select * FROM Item where IsInactive = False';
  dstItem.Active:= True;
end;


Function TdmoInvoice.FindItemID(sItemCode: String): Integer;
Begin
  dstItem.Active:= False;
  dstItem.CommandText:= 'Select * FROM Item where ItemCode = ' + QuotedStr(sItemCode)
                    + ' AND IsInactive = False';
  dstItem.Active:= True;
  if dstItem.RecordCount = 1 then
    Result:= dstItem.FieldByName('ItemID').AsInteger
  Else
    Result:= 0;
End;


function TdmoInvoice.GetNextInvID: Integer;
Var
  inn: Integer;
begin
  dstInvoice.Active:= False;
  dstInvoice.CommandText:= 'Select Top 1 InvID from Invoice Order by InvID Desc';
  dstInvoice.Active:= True;
  if dstInvoice.RecordCount = 1 then
  Begin
    iNN:= dstInvoice.FieldByName('InvID').AsInteger;
    result:= iNN + 1;
  End
  Else
  Begin
    result:= 1;
  End;
end;


procedure TdmoInvoice.ReOpenDstCustomer;
begin
  dstCustomer.Active := False;
  dstCustomer.CommandText := sCustCommand + sCustOrderBy;
  dstCustomer.Active := True;
  dstCustomer.First;
End;


procedure TdmoInvoice.RecordInv(InvObj: TInvClass);
Var
  iNN: Integer;
  aDD, aMM, aYYYY: Word;
  s1, s2, sDD, sMM, sYYYY: String;
begin
  DecodeDate(InvObj.InvDate, aYYYY, aMM, aDD);
  sDD:= AnsiRightStr('00' + FloatTostr(aDD), 2);
  sMM:= AnsiRightStr('00' + FloatTostr(aMM), 2);
  sYYYY:= FloatToStr(aYYYY);
  s2:= sMM + '/' + sDD + '/' + sYYYY;
  s1:= 'Insert into Invoice (InvID, ' +
        'InvNumber, CardID, ' +
        'CustPONumber, InvDate, ' +
        'DelivSurname, DelivFirstname, ' +
        'Deliv1, Deliv2, ' +
        'DelivCity, DelivState, ' +
        'DelivPostCode, InvTotal) '
        + 'VALUES ('
        + IntToStr(InvObj.InvID) + ', '
        + QuotedStr(InvObj.InvNumber) + ', '
        + IntToStr(InvObj.CardID) + ', '
        + QuotedStr(InvObj.CustPONumber) + ', '
        + '#' + s2 + '#' + ', '
        + QuotedStr(InvObj.DelivSurname) + ', '
        + QuotedStr(InvObj.DelivFirstName) + ', '
        + QuotedStr(InvObj.Deliv1) + ', '
        + QuotedStr(InvObj.Deliv2) + ', '
        + QuotedStr(InvObj.DelivCity) + ', '
        + QuotedStr(InvObj.DelivState) + ', '
        + QuotedStr(InvObj.DelivPostCode) + ', '
        + FloatToStr(InvObj.InvTotal)
        + ')';
  ADOCommand1.CommandText:= s1;
//  ADOCommand1.Parameters.ParamByName('p1').Value:= InvObj.InvDate;
  Try
    ADOCommand1.Execute;
  Except
    On E : Exception Do
    Begin
      Error('Exception class name = '+E.ClassName);
      Error('Exception message = '+E.Message);
    End;
  End;
//  qryInvoice.Active:= False;
//  qryInvoice.Active:= True;
end;


function TdmoInvoice.GetNextInvLineID: Integer;
begin
  dstInvLine.Active:= False;
  dstInvLine.CommandText:= 'Select Top 1 InvLineID FROM InvLine Order by InvLineID DESC';
  dstInvLine.Active:= True;
  if dstInvLine.RecordCount = 0 then
    Result:= 1
  Else
    Result:= dstInvLine.FieldByName('InvLineID').AsInteger + 1;
end;


procedure TdmoInvoice.RecordInvLine(InvLineObj: TInvLineClass);
Var
  iInvLineID: Integer;
  s1: String;
begin
  iInvLineID:= GetNextInvLineID;
//  s1:= 'InvLineID = ' + IntToStr(iInvLineID) + CRLF
//            + 'InvID = ' + IntToStr(InvLineObj.InvID) + CRLF
//            + 'LineNumber = ' + IntToStr(InvLineObj.LineNumber) + CRLF
//            + 'ItemID = ' + IntToStr(InvLineObj.ItemID) + CRLF
//            + 'Item Code = ' + QuotedStr(InvLineObj.ItemCode) + CRLF
//            + 'Description = ' + QuotedStr(InvLineObj.Description) + CRLF
//            + 'Quantity = ' + FloatToStr(InvLineObj.Quantity) + CRLF
//            + 'Unit Price = ' + FloatToStr(InvLineObj.TaxIncUnitPrice) + CRLF
//            + 'Line Total Inc GST = ' + FloatToStr(InvLineObj.TaxIncTotal);
//  Information(s1);
  s1:= 'Insert INTO InvLine (InvLineID, InvID, LineNumber, ItemID, '
            + 'Description, Quantity, TaxIncUnitPrice, TaxIncTotal) '
            + 'VALUES ('
            + IntToStr(iInvLineID) +', '
            + IntToStr(InvLineObj.InvID) +', '
            + IntToStr(InvLineObj.LineNumber) +', '
            + IntToStr(InvLineObj.ItemID) +', '
            + QuotedStr(InvLineObj.Description) +', '
            + FloatToStr(InvLineObj.Quantity) +', '
            + FloatToStr(InvLineObj.TaxIncUnitPrice) +', '
            + FloatToStr(InvLineObj.TaxIncTotal) + ')';
  AdoCommand1.CommandText:= s1;
  ADOCommand1.Execute;
End;

procedure TdmoInvoice.RecordInvTotal(InvObj: TInvClass);
begin
  ADOCommand1.CommandText:= 'Update Invoice SET InvTotal = '
        + FloatToStr(InvObj.InvTotal)
        + ' WHERE InvID = '
        + IntToStr(InvObj.InvID);
  ADOCommand1.Execute;
end;


procedure TdmoInvoice.SetDstCustCommand;
begin
  sCustCommand :=
    'SELECT Card.CardID, Member.CardID, Card.FirstName, Card.SurName, ' +
    'Card.Post1, Card.Post2, Card.PostCity, Card.PostState, Card.PostPostCode, '
    + 'Card.SurName + " " + Card.FirstName + " " + Card.PostCity AS CustAbbrev, '
    + 'Deliv1, Deliv2, DelivCity, DelivState, DelivPostCode ' +
    'FROM Card INNER JOIN Member ON Card.CardID = Member.CardID';
  sCustOrderBy := ' ORDER BY [SurName] +" " + [FirstName] + " " + [PostCity]';
End;


procedure TdmoInvoice.FillInvObj(VAR InvObj: TInvClass);
var
  iNN, iCardID: Integer;
  s1, s2 : String;
begin
  InvObj.InvID:= 0;
  InvObj.InvNumber:= '0';
  InvObj.CardID:= dstCustomer.FieldByName('Card.CardID').AsInteger;
  InvObj.CustPONumber:= '';
  InvObj.InvDate:= Date;
  InvObj.InvNumber:= '0';
  InvObj.DelivSurname:= dstCustomer.FieldByName('Surname').AsString;
  InvObj.DelivFirstName:= dstCustomer.FieldByName('FirstName').AsString;
  InvObj.Deliv1:= dstCustomer.FieldByName('Deliv1').AsString;
  InvObj.Deliv2:= dstCustomer.FieldByName('Deliv2').AsString;
  InvObj.DelivCity:= dstCustomer.FieldByName('DelivCity').AsString;
  InvObj.DelivState:= dstCustomer.FieldByName('DelivState').AsString;
  InvObj.DelivPostCode:= dstCustomer.FieldByName('DelivPostCode').AsString;
  InvObj.InvTotal:= 0.00;
  InvObj.Recorded:= False;
End;


function TdmoInvoice.CustAddress(LineNo: Integer): String;
var
  s1, s2, s3: String;
begin
  case LineNo of
    1:
      Begin
        s1 := dstCustomer.FieldByName('FirstName').AsString;
        s1 := s1 + ' ' + dstCustomer.FieldByName('SurName').AsString;
        Result := s1;
      End;
    2:
      Result := dstCustomer.FieldByName('Post1').AsString;
    3:
      Result := dstCustomer.FieldByName('Post2').AsString;
  Else
    Begin
      s1 := dstCustomer.FieldByName('PostCity').AsString + '  ';
      s2 := dstCustomer.FieldByName('PostState').AsString + '  ';
      s3 := dstCustomer.FieldByName('PostPostCode').AsString;
      Result := s1 + s2 + s3;
    End;
  end;
End;


function TdmoInvoice.CustShipTo(LineNo: Integer): String;
var
  s1, s2, s3: String;
begin
  case LineNo of
    1:
      Result:= dstCustomer.FieldByName('SurName').AsString;
    2:
      Result:= dstCustomer.FieldByName('FirstName').AsString;
    3:
      Result := dstCustomer.FieldByName('Deliv1').AsString;
    4:
      Result := dstCustomer.FieldByName('Deliv2').AsString;
    5:
      Result := dstCustomer.FieldByName('DelivCity').AsString;
    6:
      Result := dstCustomer.FieldByName('DelivState').AsString;
    7:
      Result := dstCustomer.FieldByName('DelivPostCode').AsString;
  Else
    Begin
      s1 := dstCustomer.FieldByName('DelivCity').AsString + '  ';
      s2 := dstCustomer.FieldByName('DelivState').AsString + '  ';
      s3 := dstCustomer.FieldByName('DelivPostCode').AsString;
      Result := s1 + s2 + s3;
    End;
  end;
end;

End.
