unit fCardSelectU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfCardSelect = class(TForm)
    dst1: TDataSource;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fTop: Integer;
    fLeft: Integer;
  end;

var
  fCardSelect: TfCardSelect;

implementation

{$R *.dfm}

uses dmoMemMaintU;

procedure TfCardSelect.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult:= mrOK;
end;

procedure TfCardSelect.FormShow(Sender: TObject);
begin
  dmoMemMaint.OpenCardSearch;
  ModalResult:= mrCancel;
end;

end.
