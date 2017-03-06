unit dmoInvoiceU;

interface

uses
  System.SysUtils,
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
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ReOpenDstCustomer;
    procedure FillInvObj(InvObj: TInvClass);
    procedure RecordInvLine(InvLineObj: TInvLineClass);
    procedure RecordInv(InvObj: TInvClass);
    procedure FindItem(iID: Integer);
    Function  FindItemID(sItemCode: String):Integer;
    Function  CustAddress(LineNo: Integer): String;
    Function  CustShipTo(LineNo: Integer): String;
    Function  GetNextInvID:Integer;
  private
    { Private declarations }
    sCustCommand: String;
    sCustOrderBy: String;
    procedure SetDstCustCommand;
  public
    { Public declarations }
  End;

var
  dmoInvoice: TdmoInvoice;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

uses dmoConnectionU;

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


procedure TdmoInvoice.FindItem(iID: Integer);
begin
//  dstItem.Active:= False;
//  dstItem.CommandText:= 'Select * FROM Item where ItemID = ' + IntToStr(iID);
//  dstItem.Active:= True;
end;


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
  s1, s2: String;
begin
//  dstInvoice.Active := False;
//  dstInvoice.CommandText :=
//    'Select Top 1 InvID FROM Invoice Order By InvID DESC';
//  dstInvoice.Active := True;
//  if dstInvoice.RecordCount < 1 then
//  Begin
//    iNN:= 1;
//  End
//  Else
//  Begin
//    iNN := dstInvoice.FieldByName('InvID').AsInteger + 1;
//  End;
//  iCardID:=dstCustomer.FieldByName('Card.CardID').AsInteger;
//  s1:= 'Insert into Invoice (InvID, ' +
//        'InvNumber, CardID, ' +
//        'DelivSurname, DelivFirstname, ' +
//        'Deliv1, Deliv2, ' +
//        'DelivCity, DelivState, ' +
//        'DelivPostCode) VALUES (' +
//         IntToStr(iNN) + ', ' + IntToStr(0) + ', ' +
//         IntToStr(iCardID) + ', ';
//  s2:= dstCustomer.FieldByName('SurName').AsString;
//  if Length(s2) < 1 then
//    s2:= ' ';
//  s1:= s1 + QuotedStr(s2) + ', ';
//  s2:= dstCustomer.FieldByName('FirstName').AsString;
//  if Length(s2) < 1 then
//    s2:= ' ';
//  s1:= s1 + QuotedStr(s2) + ', ';
//  s2:= dstCustomer.FieldByName('Deliv1').AsString;
//  if Length(s2) < 1 then
//    s2:= ' ';
//  s1:= s1 + QuotedStr(s2) + ', ';
//  s2:= dstCustomer.FieldByName('Deliv2').AsString;
//  if Length(s2) < 1 then
//    s2:= ' ';
//  s1:= s1 + QuotedStr(s2) + ', ';
//  s2:= dstCustomer.FieldByName('DelivCity').AsString;
//  if Length(s2) < 1 then
//    s2:= ' ';
//  s1:= s1 + QuotedStr(s2) + ', ';
//  s2:= dstCustomer.FieldByName('DelivState').AsString;
//  if Length(s2) < 1 then
//    s2:= ' ';
//  s1:= s1 + QuotedStr(s2) + ', ';
//  s2:= dstCustomer.FieldByName('DelivPostCode').AsString;
//  if Length(s2) < 1 then
//    s2:= ' ';
//  s1:= s1 + QuotedStr(s2) + ')';
//  ADOCommand1.CommandText:= s1;
//  ADOCommand1.Execute;

  s1:= InvObj.InvNumber;
//  s1:= 'Update Invoice SET [InvNumber] = InvObj. ,
//    [Freight] = [Freight] * 1.03
//WHERE [ShipCountryRegion] = 'US''
//  AdoCommand1.CommandText:= s1;
//  ADOCommand1.Execute;
end;


procedure TdmoInvoice.RecordInvLine(InvLineObj: TInvLineClass);
Var
  s1: String;
begin
  s1:= 'Insert into  ';
  AdoCommand1.CommandText:= 'Insert INTO InvLine (InvID) VALUES (' + IntToStr(InvLineObj.InvID)+ ')';
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

procedure TdmoInvoice.FillInvObj(InvObj: TInvClass);
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
      Begin
        s1 := dstCustomer.FieldByName('FirstName').AsString;
        s1 := s1 + ' ' + dstCustomer.FieldByName('SurName').AsString;
        Result := s1;
      End;
    2:
      Result := dstCustomer.FieldByName('Deliv1').AsString;
    3:
      Result := dstCustomer.FieldByName('Deliv2').AsString;
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
