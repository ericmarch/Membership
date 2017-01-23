Unit dmoCardComU;

Interface

Uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  Data.Win.ADODB;

Type
  TdmoCardCom = class(TDataModule)
    dstCard: TADODataSet;
    Function  MobileNumber(iCardID: Integer): String;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Var
  dmoCardCom: TdmoCardCom;

Implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}


{$R *.dfm}

{ TdmoCardCom }

function TdmoCardCom.MobileNumber(iCardID: Integer): String;
begin
  dstCard.Active:= False;
  dstCard.CommandText:= 'Select cardID, PostMobile1 From Card where cardID = ' + IntToStr(iCardID);
  Try
    dstCard.Active:= True;
    Result:= dstCard.FieldByName('PostMobile1').AsString;
  Except
    On E : Exception Do
    Begin
      Result := E.Message;
//      Error('Exception class name = '+E.ClassName);
//      Error('Exception message = '+E.Message);
    End;
  End;
end;

End.
