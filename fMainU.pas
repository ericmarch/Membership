unit fMainU;

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
  Vcl.StdCtrls,
  Vcl.Imaging.jpeg,
  Vcl.ExtCtrls,
  Vcl.Buttons;

type
  TfMain = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    spdBtnContUpd: TSpeedButton;
    spdBtnCatUpd: TSpeedButton;
    spdBtnMemberUpdate: TSpeedButton;
    spdBtnInv: TSpeedButton;
    spdBtnMemberReport: TSpeedButton;
    Image1: TImage;
    Edit5: TEdit;
    Edit6: TEdit;
    spdBtnExit: TSpeedButton;
    spdBtnSubs: TSpeedButton;
    spdBtnContactReport: TSpeedButton;
    spdBtnCardComm: TSpeedButton;
    lblSelectHelp: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure spdBtnExitClick(Sender: TObject);
    procedure spdBtnCatUpdClick(Sender: TObject);
    procedure spdBtnCardUpdClick(Sender: TObject);
    procedure spdBtnCardReportClick(Sender: TObject);
    procedure spdBtnCardCommClick(Sender: TObject);
    procedure spdBtnCardCommMouseEnter(Sender: TObject);
    procedure spdBtnCardCommMouseLeave(Sender: TObject);
    procedure spdBtnSubsClick(Sender: TObject);
    procedure spdBtnMemberUpdateClick(Sender: TObject);
    procedure spdBtnInvClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

uses
     MyGlobals,
     fCardMaintU,
     fReportRangesU,
     fCardReportU,
     fCardCommU,
     fCatMaintU,
     fInvoiceU,
     fItemU,
     fMemMaintU;

procedure TfMain.FormCreate(Sender: TObject);
var
  Rec: LongRec;
begin
  Rec := LongRec(GetFileVersion(Application.ExeName));
  Caption := ExtractFileName(Application.ExeName) + '  v' + Format('%d.%d', [Rec.Hi, Rec.Lo]);
  Top:= 50;
  Left:= 50;
end;

procedure TfMain.spdBtnCardUpdClick(Sender: TObject);
Var
  fCardMaint: TfCardMaint;
begin
  fCardMaint:= TfCardMaint.Create(Self);
  fCardMaint.fTop:= Top + 100;
  fCardMaint.fLeft:= Left;
  fCardMaint.ShowModal;
  FreeAndNil(fCardMaint);
end;

procedure TfMain.spdBtnCardCommClick(Sender: TObject);
Var
  fReportRanges: TfReportRanges;
  fCardComm: TfCardComm;
begin
  fReportRanges:= TfReportRanges.Create(Self);
//  fReportRanges.fTop:= Top + 100;
//  fReportRanges.fLeft:= Left + 335;
  fReportRanges.ShowModal;
  fCardComm:= TfCardComm.Create(Self);
  fCardComm.fTop:= Top + 100;
  fCardComm.fLeft:= Left + 335;
  fCardComm.ShowModal;
  FreeAndNil(fReportRanges);
  FreeAndNil(fCardComm);
end;

procedure TfMain.spdBtnCardCommMouseEnter(Sender: TObject);
begin
  lblSelectHelp.Visible := True;
end;

procedure TfMain.spdBtnCardCommMouseLeave(Sender: TObject);
begin
  lblSelectHelp.Visible := False;
end;

procedure TfMain.spdBtnCatUpdClick(Sender: TObject);
Var
  fCatMaint: TfCatMaint;
begin
  fCatMaint:= TfCatMaint.Create(Self);
  fCatMaint.fTop:= Top + 100;
  fCatMaint.fLeft:= Left + 295;
  fCatMaint.ShowModal;
  FreeAndNil(fCatMaint);
end;

procedure TfMain.spdBtnCardReportClick(Sender: TObject);
Var
  fCardR: TfCardReport;
begin
  fCardR:= TfCardReport.Create(Self);
  fCardR.ShowModal;
  FreeAndNil(fCardR);
End;

procedure TfMain.spdBtnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfMain.spdBtnInvClick(Sender: TObject);
Var
  fInvoice: TfInvoice;
begin
  fInvoice:= TfInvoice.Create(Self);
  fInvoice.fTop:= Top + 100;
  fInvoice.fLeft:= Left;
  fInvoice.ShowModal;
  FreeAndNil(fInvoice);
end;

procedure TfMain.spdBtnMemberUpdateClick(Sender: TObject);
Var
  fMemMaint: TfMemMaint;
begin
  fMemMaint:= TfMemMaint.Create(Self);
  fMemMaint.fTop:= Top + 100;
  fMemMaint.fLeft:= Left;
  fMemMaint.ShowModal;
  FreeAndNil(fMemMaint);
end;

procedure TfMain.spdBtnSubsClick(Sender: TObject);
var
  fItem: TfItem;
begin
  fItem:= TfItem.Create(Self);
  fItem.fTop:= Top + 100;
  fItem.fLeft:= Left;
  fItem.ShowModal;
  FreeAndNil(fItem);
end;

end.
