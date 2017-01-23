unit dmoConnectionU;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  Data.Win.ADODB;

type
  TdmoConnection = class(TDataModule)
    conMembership: TADOConnection;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure conMembershipBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmoConnection: TdmoConnection;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmoConnection.conMembershipBeforeConnect(Sender: TObject);
var
  vDatasource:TStringList;
begin
  if fileexists('C:\Erik\evConfig.txt') then begin
    vDataSource:=TStringList.Create;
    vDataSource.LoadFromFile('evConfig.txt');
    conMembership.ConnectionString:=vDataSource.Strings[0];
    freeandnil(vDataSource);
  end;
end;

procedure TdmoConnection.DataModuleCreate(Sender: TObject);
begin
  conMembership.Connected:= True;
end;

procedure TdmoConnection.DataModuleDestroy(Sender: TObject);
begin
  conMembership.Connected:= False;
end;

end.
