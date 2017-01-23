unit fMemMaintU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ExtCtrls,
  Vcl.DBCtrls,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.Mask,
  fCardSelectU,
  dmoMemMaintU;

type
  TfMemMaint = class(TForm)
    spdBtnMemMaintExit: TSpeedButton;
    spdBtnMemMaintCancel: TSpeedButton;
    spdBtnMemMaintSave: TSpeedButton;
    spdBtnMemMaintAdd: TSpeedButton;
    dscGrid: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    dscqryUpdate: TDataSource;
    DateTimePickerJoined: TDateTimePicker;
    DateTimePickerDOB: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    dblucbType: TDBLookupComboBox;
    Label3: TLabel;
    dscMemType: TDataSource;
    dblucbStatus: TDBLookupComboBox;
    Label4: TLabel;
    dscMemStatus: TDataSource;
    dscMemOccupation: TDataSource;
    Label5: TLabel;
    dscGender: TDataSource;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    dblucbOccupation: TDBLookupComboBox;
    dsc1: TDataSource;
    dbtPreferredName: TDBText;
    dbtSurname: TDBText;
    dbtPost1: TDBText;
    dbtCity: TDBText;
    DBText1: TDBText;
    dblucbGender: TDBLookupComboBox;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spdBtnMemMaintExitClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure spdBtnMemMaintAddClick(Sender: TObject);
    procedure spdBtnMemMaintSaveClick(Sender: TObject);
    procedure spdBtnMemMaintCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fTop: Integer;
    fLeft: Integer;
    fCardSelect: TfCardSelect;
  End;

var
  fMemMaint: TfMemMaint;
  dmoMemMaint: TdmoMemMaint;

implementation

{$R *.dfm}


procedure TfMemMaint.FormCreate(Sender: TObject);
var
  Rec: LongRec;
begin
  Rec := LongRec(GetFileVersion(Application.ExeName));
  Caption := ExtractFileName(Application.ExeName) + '  v' + Format('%d.%d', [Rec.Hi, Rec.Lo]);
  dmoMemMaint:= TdmoMemMaint.Create(Self);

  fCardSelect:= TfCardSelect.Create(Self);
  fCardSelect.fTop:= Top + 50;
  fCardSelect.fLeft:= Left + 150;
End;

procedure TfMemMaint.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fCardSelect);
  dmoMemMaint.CloseMemberData;
  FreeAndNil(dmoMemMaint);
end;

procedure TfMemMaint.FormShow(Sender: TObject);
begin
  Top:= fTop;
  Left:= fLeft;
  dmoMemMaint.OpenMemberData;
End;

procedure TfMemMaint.spdBtnMemMaintExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfMemMaint.spdBtnMemMaintAddClick(Sender: TObject);
begin
  If fCardSelect.ShowModal = mrOK then
  Begin
    dmoMemMaint.NewMember;
    spdBtnMemMaintSave.Enabled:= True;
    Panel1.Visible:= True;
  End;
end;

procedure TfMemMaint.spdBtnMemMaintSaveClick(Sender: TObject);
begin
  dmoMemMaint.SaveMembership(DateTimePickerDOB.Date, DateTimePickerJoined.Date);
  spdBtnMemMaintAdd.Enabled:= True;
  Panel1.Visible:= False;
  spdBtnMemMaintSave.Enabled:= False;
end;

procedure TfMemMaint.spdBtnMemMaintCancelClick(Sender: TObject);
begin
  dmoMemMaint.qryMembershipCancel;
  spdBtnMemMaintAdd.Enabled:= True;
  Panel1.Visible:= False;
  spdBtnMemMaintSave.Enabled:= False;
end;

procedure TfMemMaint.DBGrid1DblClick(Sender: TObject);
begin
  spdBtnMemMaintAdd.Enabled:= False;
  spdBtnMemMaintSave.Enabled:= True;
  dmoMemMaint.SelectThisMember;
  Panel1.Visible:= True;
  DateTimePickerJoined.Date:= dmoMemMaint.qryMembership.FieldByName('Accepted').AsDateTime;
  DateTimePickerDOB.Date:= dmoMemMaint.qryMembership.FieldByName('DOB').AsDateTime;
End;

End.
