unit fCatMaintU;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Buttons,
  Data.DB,
  Vcl.StdCtrls,
  Vcl.DBCtrls,
  Vcl.Mask,
  dmoCategoryU;

type
  TfCatMaint = class(TForm)
    dbgCategory: TDBGrid;
    spdBtncatExit: TSpeedButton;
    spdBtnCatSave: TSpeedButton;
    spdBtnCatDelete: TSpeedButton;
    dscCatGrid: TDataSource;
    spdBtnCatAdd: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbeCarName: TDBEdit;
    dbeCatDescription: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure spdBtncatExitClick(Sender: TObject);
    procedure spdBtnCatDeleteClick(Sender: TObject);
    procedure spdBtnCatSaveClick(Sender: TObject);
    procedure spdBtnCatAddClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fTop: Integer;
    fLeft: Integer;
  end;

var
  fCatMaint: TfCatMaint;
  dmoCategory: TdmoCategory;

implementation

{$R *.dfm}

uses MyGlobals, globals;

procedure TfCatMaint.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmoCategory.qryCategory.Active:= False;
end;

procedure TfCatMaint.FormCreate(Sender: TObject);
begin
  Top:= 100;
  Left:= 100;
  dmoCategory:= TdmoCategory.Create(Self);
end;

procedure TfCatMaint.FormDestroy(Sender: TObject);
begin
  FreeAndNil(dmoCategory);
end;

procedure TfCatMaint.FormShow(Sender: TObject);
begin
  Top:= fTop;
  Left:= fLeft;
  dmoCategory.CatDatRefreshCategory;
end;

procedure TfCatMaint.spdBtnCatAddClick(Sender: TObject);
begin
  gAddSelected:= True;
  dmoCategory.AddCat;
end;

procedure TfCatMaint.spdBtnCatDeleteClick(Sender: TObject);
Var
  s1: String;
begin
  If (dmoCategory.DeleteCat = False) Then
  Begin
    s1:= 'Category has been used - Cannot delete'
                  + CRLF
                  + 'Remove category from cards and try again';
    ShowMessagePos(s1, 200, 200);
  End;
end;

procedure TfCatMaint.spdBtncatExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfCatMaint.spdBtnCatSaveClick(Sender: TObject);
begin
  dmoCategory.qryCategory.Post;
  dmoCategory.CatDatRefreshCategory;
  gAddSelected:= False;
End;



End.
