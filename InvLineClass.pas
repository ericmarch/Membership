unit InvLineClass;

interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils;

type
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

end.
