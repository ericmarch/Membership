unit dmoCategoryU;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  Data.Win.ADODB;

type
  TdmoCategory = class(TDataModule)
    qryCategory: TADOQuery;
    cmdCategory: TADOCommand;
    dst1: TADODataSet;
    Procedure AddCat;
    Function  DeleteCat:Boolean;
    procedure CatDatRefreshCategory;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    Function  GetLastCatID:Integer;
    Function  CatUsed(iCatID: Integer):Boolean;
  public
    { Public declarations }
  end;

var
  dmoCategory: TdmoCategory;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses dmoConnectionU;

{$R *.dfm}

{ TdmoCategory }

procedure TdmoCategory.CatDatRefreshCategory;
begin
  qryCategory.Active:= False;
  qryCategory.Active:= True;
end;

function TdmoCategory.GetLastCatID: Integer;
begin
  dst1.Active:= False;
  dst1.CommandText:= 'Select TOP 1 CatID From Category Order by CatID Desc';
  dst1.Active:= True;
  Result := dst1.FieldByName('CatID').AsInteger;
end;


function TdmoCategory.CatUsed(iCatID: Integer): Boolean;
begin
  dst1.Active:= False;
  dst1.CommandText:= 'select CatID from CardCat where CatID = ' + IntToStr(iCatID);
  dst1.Active:= True;
  If dst1.RecordCount = 0 Then
    Result:= False
  Else
    Result:= True;
end;

procedure TdmoCategory.DataModuleCreate(Sender: TObject);
begin
  qryCategory.Active:= True;
end;

Function  TdmoCategory.DeleteCat:Boolean;
Var
  iCatID: Integer;
begin
  iCatID:= qryCategory.FieldByName('CatID').AsInteger;
  if NOT (CatUsed(iCatID)) then
  Begin
    cmdCategory.CommandText:= 'Delete from Category Where CatID = ' + IntToStr(iCatID);
    cmdCategory.Execute;
    CatDatRefreshCategory;
    Result:= True;
  End
  Else
  Begin
    Result:= False;
  End;
End;

procedure TdmoCategory.AddCat;
Var
  s1: string;
begin
  s1:= qryCategory.SQL.Strings[0];
  qryCategory.Append;
  qryCategory.FieldByName('catID').AsInteger:= GetLastCatID + 1;
end;

End.
