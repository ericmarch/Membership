unit dmoItemU;

interface

uses
  System.SysUtils, System.Classes, Data.Win.ADODB, Data.DB;

type
  TdmoItem = class(TDataModule)
    dstGrid: TADODataSet;
    dstGridItemID: TIntegerField;
    dstGridItemCode: TWideStringField;
    dstGridIsInactive: TBooleanField;
    dstGridDescription: TWideStringField;
    dstGridIsSold: TBooleanField;
    dstGridIsBought: TBooleanField;
    dstGridIsInventoried: TBooleanField;
    dstGridSellCost: TBCDField;
    dstGridBuyCost: TBCDField;
    qryItemItemID: TIntegerField;
    qryItemItemCode: TWideStringField;
    qryItemIsInactive: TBooleanField;
    qryItemDescription: TWideStringField;
    qryItemIsSold: TBooleanField;
    qryItemIsBought: TBooleanField;
    qryItemIsInventoried: TBooleanField;
    qryItemSellCost: TBCDField;
    qryItemBuyCost: TBCDField;
    qryItem: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure SelectItem;
    procedure SaveItem;
    procedure CancelItem;
    procedure NewItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmoItem: TdmoItem;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses dmoConnectionU;

{$R *.dfm}

procedure TdmoItem.DataModuleCreate(Sender: TObject);
begin
  dstGrid.Active:= True;
  qryItem.Active:= True;
end;

procedure TdmoItem.DataModuleDestroy(Sender: TObject);
begin
  dstGrid.Active:= False;
  qryItem.Active:= False;
end;

procedure TdmoItem.SelectItem;
Var
  iNN: Integer;
  s1: String;
begin
  iNN:= dstGrid.FieldByName('ItemID').AsInteger;
  qryItem.Active:= False;
  qryItem.SQL.Clear;
  s1:= 'Select * FROM Item Where ItemID = ' + IntToStr(iNN);
  qryItem.SQL.Add(s1);
  qryItem.Active:= True;
  qryItem.Edit;
end;

procedure TdmoItem.NewItem;
Var
  iNN: Integer;
  s1: String;
begin
  dstGrid.Active:= False;
  s1:= dstGrid.CommandText;
  dstGrid.CommandText:= 'Select Top 1 * From Item Order by ItemID DESC';
  dstGrid.Active:= True;
  iNN:= dstGrid.FieldByName('ItemID').AsInteger + 1;
  dstGrid.Active:= False;
  dstGrid.CommandText:= s1;
  dstGrid.Active:= True;
  qryItem.Insert;
  qryItem.FieldByName('ItemID').AsInteger:= iNN;
  qryItem.FieldByName('IsInactive').AsBoolean:= False;
  qryItem.FieldByName('IsSold').AsBoolean:= True;
  qryItem.FieldByName('IsBought').AsBoolean:= False;
  qryItem.FieldByName('IsInventoried').AsBoolean:= False;
end;

procedure TdmoItem.SaveItem;
begin
  If (qryItem.State in [dsInsert, dsEdit]) Then
    qryItem.Post;
  dstGrid.Active:= False;
  dstGrid.Active:= True;
end;

procedure TdmoItem.CancelItem;
begin
  qryItem.Cancel;
end;

end.
