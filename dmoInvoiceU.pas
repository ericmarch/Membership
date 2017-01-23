unit dmoInvoiceU;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmoInvoice = class(TDataModule)
    qryInvoice: TADOQuery;
    qryInvLine: TADOQuery;
    dstCustomer: TADODataSet;
    dstInvoice: TADODataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ReOpenDstCustomer;
    procedure SetQryCutomer;
    Function  CustAddress(LineNo: Integer):String;
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

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses dmoConnectionU;

{$R *.dfm}

function TdmoInvoice.CustAddress(LineNo: Integer): String;
Const
  CRLF = #13#10;
var
  s1, s2, s3, s4, s5, s6 :String;
begin
  s1:= dstCustomer.FieldByName('FirstName').AsString;
  s1:= s1 + ' ' + dstCustomer.FieldByName('SurName').AsString;
  s2:= dstCustomer.FieldByName('Post1').AsString;
  s3:= dstCustomer.FieldByName('Post2').AsString;
  s4:= dstCustomer.FieldByName('PostCity').AsString + '  ';
  s5:= dstCustomer.FieldByName('PostState').AsString + '  ';
  s6:= dstCustomer.FieldByName('PostPostCode').AsString;
  case LineNo of
    1: Result := s1;
    2: Result := s2;
    3: Result := s3;
  Else
    Result:= s4 + s5 + s6;
  end;
End;

procedure TdmoInvoice.DataModuleCreate(Sender: TObject);
begin
  SetDstCustCommand;
  qryInvoice.Active:= True;
  qryInvLine.Active:= True;
  dstCustomer.Active:= True;
  dstCustomer.First;
End;

procedure TdmoInvoice.DataModuleDestroy(Sender: TObject);
begin
  qryInvoice.Active:= False;
  qryInvLine.Active:= False;
  dstCustomer.Active:= False;
End;

procedure TdmoInvoice.ReOpenDstCustomer;
begin
  dstCustomer.Active:= False;
  dstCustomer.CommandText:= sCustCommand + sCustOrderBy;
  dstCustomer.Active:= True;
  dstCustomer.First;
End;

procedure TdmoInvoice.SetDstCustCommand;
begin
    sCustCommand:= 'SELECT Card.CardID, Member.CardID, Card.FirstName, Card.SurName, '
              + 'Card.Post1, Card.Post2, Card.PostCity, Card.PostState, Card.PostPostCode, '
              + 'Card.SurName + " " + Card.FirstName + " " + Card.PostCity AS CustAbbrev '
              + 'FROM Card INNER JOIN Member ON Card.CardID = Member.CardID';
    sCustOrderBy:= ' ORDER BY [SurName] +" " + [FirstName] + " " + [PostCity]';
End;

procedure TdmoInvoice.SetQryCutomer;
var
  iNN: Integer;
begin
  dstInvoice.Active:= False;
  dstInvoice.CommandText:= 'Select Top 1 InvID FROM Invoice Order By InvID DESC';
  dstInvoice.Active:= True;
  iNN:= dstInvoice.FieldByName('InvID').AsInteger + 1;
  qryInvoice.Insert;
  qryInvoice.FieldByName('InvID').AsInteger:= iNN;
  qryInvoice.FieldByName('InvNumber').AsInteger:= 0;
  iNN:= dstCustomer.FieldByName('Card.CardID').AsInteger;
  qryInvoice.FieldByName('CardID').AsInteger:= iNN;
End;

End.
