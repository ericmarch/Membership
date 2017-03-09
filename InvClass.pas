unit InvClass;

interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils;

type
  TInvClass = Class
  private
    fInvID: Integer;
    fRecorded: Boolean;
    fInvNumber: String;
    fCardID: Integer;
    fCustPONumber: String;
    fInvDate: TDate;
    fDelivSurname: String;
    fDelivFirstname: String;
    fDeliv1: String;
    fDeliv2: String;
    fDelivCity: String;
    fDelivState: String;
    fDelivPostCode: String;
    fInvTotal: Double;
    procedure InvRecorded(const Value: Boolean);
  public
    constructor Create(aInvID: Integer);
    destructor Destroy; override;
    property InvID: Integer Read fInvID Write fInvID;
    property InvNumber: String Read fInvNumber Write fInvNumber;
    property CardID: Integer Read fCardID write fCardID;
    property CustPONumber: String Read fCustPONumber Write fCustPONumber;
    property InvDate: TDate Read fInvDate Write fInvDate;
    property DelivSurname: String Read fDelivSurname Write fDelivSurname;
    property DelivFirstname: String Read fDelivFirstname Write fDelivFirstname;
    property Deliv1: String Read fDeliv1 Write fDeliv1;
    property Deliv2: String Read fDeliv2 Write fDeliv2;
    property DelivCity: String Read fDelivCity Write fDelivCity;
    property DelivState: String Read fDelivState Write fDelivState;
    property DelivPostCode: String Read fDelivPostCode Write fDelivPostCode;
    property InvTotal: Double Read fInvTotal Write fInvTotal;
    property Recorded: Boolean Read fRecorded Write InvRecorded;
  End;
  TInvLineClass = class
  private
    fInvID: Integer;
    fLineNumber: Integer;
    fItemID: Integer;
    fItemCode: String;
    fDescription: String;
    fQuantity: Double;
    fTaxIncUnitPrice: Double;
    fTaxIncTotal: Double;
  public
    constructor Create(aInvID: Integer);
    destructor Destroy; override;
    property InvID: Integer Read fInvID Write fInvID;
    property LineNumber: Integer Read fLineNumber Write fLineNumber;
    property ItemID: Integer Read fItemID Write fItemID;
    property ItemCode: String Read fItemCode Write fItemCode;
    property Description: String Read fDescription Write fDescription;
    property Quantity: Double Read fQuantity Write fQuantity;
    property TaxIncUnitPrice: Double Read fTaxIncUnitPrice Write fTaxIncUnitPrice;
    property TaxIncTotal: Double Read fTaxIncTotal Write fTaxIncTotal;
  end;


implementation

{ TInvClass }
constructor TInvClass.Create(aInvID: Integer);
begin
  inherited Create;
  InvID:= aInvID;
 end;


destructor TInvClass.Destroy;
begin
  inherited Destroy;
end;



procedure TInvClass.InvRecorded(const Value: Boolean);
begin
  fRecorded := Value;
end;

{ TInvLineClass }

constructor TInvLineClass.Create(aInvID: Integer);
begin
  inherited Create;
  InvID:= aInvID;
 end;


destructor TInvLineClass.Destroy;
begin
  inherited Destroy;
end;


End.
