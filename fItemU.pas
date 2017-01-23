unit fItemU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,dmoItemU;

type
  TfItem = class(TForm)
    spdBtnItemExit: TSpeedButton;
    spdBtnItemCancel: TSpeedButton;
    spdBtnItemSave: TSpeedButton;
    spdBtnItemAdd: TSpeedButton;
    dscGrid: TDataSource;
    dscItem: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spdBtnItemExitClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure spdBtnItemCancelClick(Sender: TObject);
    procedure spdBtnItemSaveClick(Sender: TObject);
    procedure spdBtnItemAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fTop: Integer;
    fLeft: Integer;
  end;

var
  fItem: TfItem;
  dmoItem: TdmoItem;

implementation

{$R *.dfm}



procedure TfItem.FormCreate(Sender: TObject);
var
  Rec: LongRec;
begin
  Rec := LongRec(GetFileVersion(Application.ExeName));
  Caption := ' Item Maintenance   '
              + ExtractFileName(Application.ExeName)
              + '  v' + Format('%d.%d', [Rec.Hi, Rec.Lo]);
  dmoItem:= TdmoItem.Create(Self);
end;

procedure TfItem.FormDestroy(Sender: TObject);
begin
  FreeAndNil(dmoItem);
end;

procedure TfItem.FormShow(Sender: TObject);
begin
  Top:= fTop;
  Left:= fLeft;
  DBGrid1.Columns[0].Width:= 50;
  DBGrid1.Columns[1].Width:= 50;
  DBGrid1.Columns[2].Width:= 50;
  DBGrid1.Columns[3].Width:= 250;
  DBGrid1.Columns[4].Width:= 50;
  DBGrid1.Columns[5].Width:= 50;
  DBGrid1.Columns[6].Width:= 50;
  DBGrid1.Columns[7].Width:= 100;
  DBGrid1.Columns[8].Width:= 100;
end;


procedure TfItem.DBGrid1DblClick(Sender: TObject);
begin
  dmoItem.SelectItem;
  Panel1.Visible:= True;
end;

procedure TfItem.spdBtnItemAddClick(Sender: TObject);
begin
  dmoItem.NewItem;
  Panel1.Visible:= True;
end;

procedure TfItem.spdBtnItemCancelClick(Sender: TObject);
begin
  dmoItem.CancelItem ;
  Panel1.Visible:= False;
end;

procedure TfItem.spdBtnItemExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfItem.spdBtnItemSaveClick(Sender: TObject);
begin
  dmoItem.SaveItem;
  Panel1.Visible:= False;
end;

end.
