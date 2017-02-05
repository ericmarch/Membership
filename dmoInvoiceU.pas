unit dmoInvoiceU;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  Data.Win.ADODB,
  Datasnap.DBClient,
  InvLineClass;

type
 TdmoInvoice = class(TDataModule)
    qryInvoice: TADOQuery;
    qryInvLine: TADOQuery;
    dstCustomer: TADODataSet;
    dstInvoice: TADODataSet;
    dstItem: TADODataSet;
    qryInvLineTMP: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ReOpenDstCustomer;
    procedure SetQryCutomer;
    procedure SaveCellsToInvLineTMP(InvLineObj: TInvLineClass);
    Function CustAddress(LineNo: Integer): String;
    Function CustShipTo(LineNo: Integer): String;
    Function GetNextInvID:Integer;
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
begin
  SetDstCustCommand;
  qryInvoice.Active := True;
  qryInvLine.Active := True;
  dstInvoice.Active:= True;
  qryInvLineTMP.Active:= True;
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

function TdmoInvoice.GetNextInvID: Integer;
Var
  inn: Integer;
  s1: String;
begin
  qryInvLine.Active:= False;
  qryInvLine.Active:= True;
  if qryInvLineTMP.RecordCount = 1 then
  Begin
    iNN:= qryInvLineTMP.FieldByName('InvID').AsInteger;
    result:= iNN + 1;
  End
  Else
  Begin
    result:= 1;
  End;
  qryInvLine.Active:= False;
  s1:= qryInvLineTMP.SQL.Strings[0];
  qryInvLineTMP.SQL.Clear;
  qryInvLineTMP.SQL.Add('Insert INTO InvLineTMP InvID VALUES ' + IntToStr(result));
  qryInvLineTMP.Append;
  qryInvLine.Active:= True;

  qryInvLine.Active:= False;
  qryInvLineTMP.SQL.Clear;
  qryInvLineTMP.SQL.Add(s1);
end;

procedure TdmoInvoice.ReOpenDstCustomer;
begin
  dstCustomer.Active := False;
  dstCustomer.CommandText := sCustCommand + sCustOrderBy;
  dstCustomer.Active := True;
  dstCustomer.First;
End;

procedure TdmoInvoice.SaveCellsToInvLineTMP(InvLineObj: TInvLineClass);
begin
  //  ERIC do this
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

procedure TdmoInvoice.SetQryCutomer;
var
  iNN: Integer;
begin
  dstInvoice.Active := False;
  dstInvoice.CommandText :=
    'Select Top 1 InvID FROM Invoice Order By InvID DESC';
  dstInvoice.Active := True;
  if dstInvoice.RecordCount < 1 then
  Begin
    iNN:= 1;
  End
  Else
  Begin
    iNN := dstInvoice.FieldByName('InvID').AsInteger + 1;
  End;
  qryInvoice.Insert;
  qryInvoice.FieldByName('InvID').AsInteger := iNN;
  qryInvoice.FieldByName('InvNumber').AsInteger := 0;
  iNN := dstCustomer.FieldByName('Card.CardID').AsInteger;
  qryInvoice.FieldByName('DelivSurname').AsString := dstCustomer.FieldByName('SurName').AsString;
  qryInvoice.FieldByName('DelivFirstName').AsString := dstCustomer.FieldByName('FirstName').AsString;
  qryInvoice.FieldByName('Deliv1').AsString := dstCustomer.FieldByName('Deliv1').AsString;
  qryInvoice.FieldByName('Deliv2').AsString := dstCustomer.FieldByName('Deliv2').AsString;
  qryInvoice.FieldByName('DelivCity').AsString := dstCustomer.FieldByName('DelivCity').AsString;
  qryInvoice.FieldByName('DelivState').AsString := dstCustomer.FieldByName('DelivState').AsString;
  qryInvoice.FieldByName('DelivPostCode').AsString := dstCustomer.FieldByName('DelivPostCode').AsString;
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
