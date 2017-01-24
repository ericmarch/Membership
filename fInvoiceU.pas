unit fInvoiceU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, dmoInvoiceU,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfInvoice = class(TForm)
    dscCustomer: TDataSource;
    dblucbCustomer: TDBLookupComboBox;
    dscInvoice: TDataSource;
    Label1: TLabel;
    lblPostAddr: TLabel;
    lblShipTo: TLabel;
    spdBtnInvExit: TSpeedButton;
    spdBtnInvCancel: TSpeedButton;
    spdBtnInvRecord: TSpeedButton;
    lbledtInvNumber: TLabeledEdit;
    ListBoxAddress: TListBox;
    ListBoxShipTo: TListBox;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure spdBtnInvExitClick(Sender: TObject);
    procedure spdBtnInvCancelClick(Sender: TObject);
    procedure dblucbCustomerExit(Sender: TObject);
  private
    { Private declarations }
    procedure FormReset;
  public
    { Public declarations }
    fTop: Integer;
    fLeft: Integer;
  end;

var
  fInvoice: TfInvoice;
  dmoInvoice: TdmoInvoice;

implementation

{$R *.dfm}


procedure TfInvoice.dblucbCustomerExit(Sender: TObject);
Var
  iNN: Integer;
  s1: String;
begin
  dmoInvoice.SetQryCutomer;
  ListBoxAddress.Items[0]:= dmoInvoice.CustAddress(1);
  ListBoxAddress.Items[1]:= dmoInvoice.CustAddress(2);
  iNN:= 2;
  s1:= dmoInvoice.CustAddress(3);
  if s1 > '' then
  Begin
    ListBoxAddress.Items[iNN]:= s1;
    iNN:= iNN + 1;
  End;
  ListBoxAddress.Items[iNN]:= dmoInvoice.CustAddress(4);
End;

procedure TfInvoice.FormCreate(Sender: TObject);
var
  Rec: LongRec;
begin
  Rec := LongRec(GetFileVersion(Application.ExeName));
  Caption := 'Invoice   '
              + ExtractFileName(Application.ExeName)
              + '  v' + Format('%d.%d', [Rec.Hi, Rec.Lo]);
  dmoInvoice:= TdmoInvoice.Create(Self);
end;

procedure TfInvoice.FormDestroy(Sender: TObject);
begin
  FreeAndNil(dmoInvoice);
end;

procedure TfInvoice.FormReset;
begin
  dmoInvoice.ReOpenDstCustomer;
  dblucbCustomer.KeyValue:= dmoInvoice.dstCustomer.FieldByName('Card.CardID').AsInteger;
  dblucbCustomer.SetFocus;
end;

procedure TfInvoice.FormShow(Sender: TObject);
begin
  Top:= fTop;
  Left:= fLeft;
  FormReset;
end;

procedure TfInvoice.spdBtnInvCancelClick(Sender: TObject);
begin
  FormReset;
end;

procedure TfInvoice.spdBtnInvExitClick(Sender: TObject);
begin
  Close;
end;

end.
