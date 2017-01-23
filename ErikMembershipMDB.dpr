program ErikMembershipMDB;

uses
  Vcl.Forms,
  fMainU in 'fMainU.pas' {fMain},
  globals in '..\Globals\globals.pas',
  dmoConnectionU in 'dmoConnectionU.pas' {dmoConnection: TDataModule},
  dmoMemMaintU in 'dmoMemMaintU.pas' {dmoMemMaint: TDataModule},
  fCardMaintU in 'fCardMaintU.pas' {fCardMaint},
  dmoCategoryU in 'dmoCategoryU.pas' {dmoCategory: TDataModule},
  fCatMaintU in 'fCatMaintU.pas' {fCatMaint},
  dmoCardComU in 'dmoCardComU.pas' {dmoCardCom: TDataModule},
  fCardCommU in 'fCardCommU.pas' {fCardComm},
  fReportRangesU in 'fReportRangesU.pas' {fReportRanges},
  fCardReportU in 'fCardReportU.pas' {fCardReport},
  dmoItemU in 'dmoItemU.pas' {dmoItem: TDataModule},
  fItemU in 'fItemU.pas' {fItem},
  dmoInvoiceU in 'dmoInvoiceU.pas' {dmoInvoice: TDataModule},
  fInvoiceU in 'fInvoiceU.pas' {fInvoice},
  fMemMaintU in 'fMemMaintU.pas' {fMemMaint};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TdmoConnection, dmoConnection);
  Application.Run;
end.
