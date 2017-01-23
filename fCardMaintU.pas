unit fCardMaintU;

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
  Data.DB,
  Vcl.StdCtrls,
  Vcl.DBCtrls,
  Vcl.Buttons,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ExtCtrls,
  Vcl.Mask,
  Vcl.ComCtrls,
  dmoMemMaintU;

type
  TfCardMaint = class(TForm)
    spdBtnMemAdd: TSpeedButton;
    spdBtnmemCancel: TSpeedButton;
    spdBtnmemExit: TSpeedButton;
    spdBtnMemSave: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtCode: TEdit;
    edtSurname: TEdit;
    edtFirstName: TEdit;
    dscMemCat: TDataSource;
    dscCard: TDataSource;
    dbgSearch: TDBGrid;
    pnlDataEntry: TPanel;
    Label07: TLabel;
    Label08: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    dbCheckIsPerson: TDBCheckBox;
    dbCheckIsInactive: TDBCheckBox;
    dbeEmergencyPhone: TDBEdit;
    dbeEmergencyCont: TDBEdit;
    dbRichCardNote: TDBRichEdit;
    label12: TLabel;
    label13: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    dbePost1: TDBEdit;
    dbePost2: TDBEdit;
    dbePostState: TDBEdit;
    dbePostPostCode: TDBEdit;
    Label16: TLabel;
    dbeDelivPostCode: TDBEdit;
    dbeDelivState: TDBEdit;
    dbeDeliv2: TDBEdit;
    dbeDeliv1: TDBEdit;
    dbePostCity: TDBEdit;
    dbeDelivCity: TDBEdit;
    Label17: TLabel;
    Label18: TLabel;
    dbePostMobil1Who: TDBEdit;
    dbePostMobile1: TDBEdit;
    dbeDelivMobile1: TDBEdit;
    dbeDelivMobile1Who: TDBEdit;
    LabelPostPhone: TLabel;
    LabelDelivPhone: TLabel;
    Label20: TLabel;
    Label19: TLabel;
    dbePostMobile2: TDBEdit;
    dbePostMobile2Who: TDBEdit;
    dbeDelivMobile2: TDBEdit;
    dbeDelivMobile2Who: TDBEdit;
    dbeDelivLandLine: TDBEdit;
    dbePostLandLine: TDBEdit;
    Label21: TLabel;
    Label22: TLabel;
    dbePostEmail: TDBEdit;
    dbeDelivEmail: TDBEdit;
    Label23: TLabel;
    DBLookupComboBoxMemCategory: TDBLookupComboBox;
    DBLookupListBox1: TDBLookupListBox;
    dscCategory: TDataSource;
    Label09: TLabel;
    Label24: TLabel;
    StaticText1: TStaticText;
    cbxShowInactive: TCheckBox;
    cbxMobile: TCheckBox;
    dbtCustomFld1Name: TDBText;
    dscCustomFldNames: TDataSource;
    dbtCustomFld2Name: TDBText;
    dbtCustomFld3Name: TDBText;
    dbeCustomField1: TDBEdit;
    dbeCustomField2: TDBEdit;
    dbeCustomField3: TDBEdit;
    dscCardSearch: TDataSource;
    dbePreferredName: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    lblPhoneWarning: TLabel;
    procedure FormShow(Sender: TObject);
    procedure dbgSearchDblClick(Sender: TObject);
    procedure spdBtnMemAddClick(Sender: TObject);
    procedure spdBtnmemCancelClick(Sender: TObject);
    procedure spdBtnMemSaveClick(Sender: TObject);
    procedure spdBtnmemExitClick(Sender: TObject);
    procedure edtCodeKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtFirstNameExit(Sender: TObject);
    procedure edtSurnameExit(Sender: TObject);
    procedure edtSurnameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupListBox1DblClick(Sender: TObject);
    procedure StaticText1Click(Sender: TObject);
    procedure dbePostMobile1Exit(Sender: TObject);
    procedure dbePostMobile2Exit(Sender: TObject);
    procedure dbeDelivMobile1Exit(Sender: TObject);
    procedure dbeDelivMobile2Exit(Sender: TObject);
    procedure dbeDelivLandLineExit(Sender: TObject);
    procedure dbePostLandLineExit(Sender: TObject);
    procedure dbeDelivLandLineEnter(Sender: TObject);
    procedure dbeDelivMobile1Enter(Sender: TObject);
    procedure dbeDelivMobile2Enter(Sender: TObject);
    procedure dbeEmergencyPhoneEnter(Sender: TObject);
    procedure dbeEmergencyPhoneExit(Sender: TObject);
    procedure dbePostLandLineEnter(Sender: TObject);
    procedure dbePostMobile1Enter(Sender: TObject);
    procedure dbePostMobile2Enter(Sender: TObject);
    procedure cbxShowInactiveClick(Sender: TObject);
    procedure DBLookupComboBoxMemCategoryClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    Procedure CheckCardNames;
    Procedure DoAfterCancel;
  public
    { Public declarations }
    fTop: Integer;
    fLeft: Integer;
    dmoMemMaintU: TDataModule;
  End;

var
  fCardMaint: TfCardMaint;

implementation

{$R *.dfm}

uses globals, MyGlobals;

procedure TfCardMaint.FormCreate(Sender: TObject);
begin
  dmoMemMaint := TdmoMemMaint.Create(Self);
end;

procedure TfCardMaint.FormDestroy(Sender: TObject);
begin
  FreeAndNil(dmoMemMaint);
end;

procedure TfCardMaint.FormShow(Sender: TObject);
begin
  Top := fTop;
  Left := fLeft;
  gAddSelected := False;
End;

procedure TfCardMaint.cbxShowInactiveClick(Sender: TObject);
begin
  DoAfterCancel;
  dmoMemMaint.RefreshData(cbxShowInactive.Checked);
end;

Procedure TfCardMaint.CheckCardNames;
Var
  iLnSurname, iLnFirstName: Integer;
  s1, s2: String;
begin
  gSurname := edtSurname.Text;
  gFirstName := edtFirstName.Text;
  s1 := MyStripout(gSurname);
  s2 := MyStripout(gFirstName);
  iLnSurname := Length(s1); // Cannot get here without a Surname
  iLnFirstName := Length(s2);
  if (iLnSurname + iLnFirstName) > 12 then
  Begin
    If (iLnSurname > 6) AND (iLnFirstName > 6) Then
    Begin
      s1 := Copy(s1, 1, 6);
      s2 := Copy(s2, 1, 6);
    End
    Else
    Begin
      if iLnFirstName > 6 then
      Begin
        s2 := Copy(s2, 1, (12 - iLnSurname));
      End
      Else
      Begin
        s1 := Copy(s1, 1, (12 - iLnFirstName));
      End;
    End;
  End;
  gCardCode := s1 + s2;
  if NOT(dmoMemMaint.qryCard.State in [dsEdit, dsInsert]) then
    dmoMemMaint.qryCard.Edit;
  edtCode.Text := gCardCode;
  dmoMemMaint.qryCard.FieldByName('CardCode').AsString := gCardCode;
  dmoMemMaint.qryCard.FieldByName('Surname').AsString := gSurname;
  dmoMemMaint.qryCard.FieldByName('Firstname').AsString := gFirstName;
End;

procedure TfCardMaint.dbeEmergencyPhoneEnter(Sender: TObject);
begin
  lblPhoneWarning.Left := 300;
  lblPhoneWarning.Top := dbeEmergencyPhone.Top - 6;
  lblPhoneWarning.Visible := True;
  spdBtnMemSave.Enabled := False;
end;

procedure TfCardMaint.dbeEmergencyPhoneExit(Sender: TObject);
Var
  s1: String;
begin
  spdBtnMemSave.Enabled := True;
  s1 := dmoMemMaint.qryCard.FieldByName('EmergencyPhone').AsString;
  if s1 > '' then
  Begin
    If cbxMobile.Checked then
      s1 := dmoMemMaint.CheckMobileNumber(s1)
    Else
      s1 := dmoMemMaint.CheckLandLineNumber(s1);
    if s1 = 'Error' then
    Begin
      showmessage('Invalid phone number');
    End
    Else
    Begin
      dmoMemMaint.qryCard.Edit;
      dmoMemMaint.qryCard.FieldByName('EmergencyPhone').AsString := s1;
    End;
  End;
end;

procedure TfCardMaint.dbeDelivMobile1Enter(Sender: TObject);
begin
  lblPhoneWarning.Left := 465;
  lblPhoneWarning.Top := dbeDelivMobile1.Top - 6;
  lblPhoneWarning.Visible := True;
  spdBtnMemSave.Enabled := False;
end;

procedure TfCardMaint.dbeDelivMobile1Exit(Sender: TObject);
Var
  s1: String;
begin
  lblPhoneWarning.Visible := False;
  spdBtnMemSave.Enabled := True;
  s1 := dmoMemMaint.qryCard.FieldByName('DelivMobile1').AsString;
  if s1 > '' then
  Begin
    s1 := dmoMemMaint.CheckMobileNumber(s1);
    if s1 = 'Error' then
      showmessage('Invalid phone number')
    else
      dmoMemMaint.qryCard.FieldByName('DelivMobile1').AsString := s1;
  End;
end;

procedure TfCardMaint.dbeDelivMobile2Enter(Sender: TObject);
begin
  lblPhoneWarning.Left := 465;
  lblPhoneWarning.Top := 325;
  lblPhoneWarning.Visible := True;
  spdBtnMemSave.Enabled := False;
end;

procedure TfCardMaint.dbeDelivMobile2Exit(Sender: TObject);
Var
  s1: String;
begin
  lblPhoneWarning.Visible := False;
  spdBtnMemSave.Enabled := True;
  s1 := dmoMemMaint.qryCard.FieldByName('DelivMobile2').AsString;
  s1 := dmoMemMaint.CheckMobileNumber(s1);
  if s1 > '' then
  Begin
    if s1 = 'Error' then
      showmessage('Invalid phone number')
    else
      dmoMemMaint.qryCard.FieldByName('DelivMobile2').AsString := s1;
  End;
end;

procedure TfCardMaint.dbePostMobile1Enter(Sender: TObject);
begin
  lblPhoneWarning.Left := 165;
  lblPhoneWarning.Top := dbePostMobile1.Top - 6;
  lblPhoneWarning.Visible := True;
  spdBtnMemSave.Enabled := False;
end;

procedure TfCardMaint.dbePostMobile1Exit(Sender: TObject);
Var
  s1: String;
begin
  lblPhoneWarning.Visible := False;
  spdBtnMemSave.Enabled := True;
  s1 := dmoMemMaint.qryCard.FieldByName('PostMobile1').AsString;
  s1 := dmoMemMaint.CheckMobileNumber(s1);
  if s1 = 'Error' then
    showmessage('Invalid phone number')
  else
    dmoMemMaint.qryCard.FieldByName('PostMobile1').AsString := s1;
end;

procedure TfCardMaint.dbePostMobile2Enter(Sender: TObject);
begin
  lblPhoneWarning.Left := 165;
  lblPhoneWarning.Top := dbePostMobile2.Top - 6;
  lblPhoneWarning.Visible := True;
  spdBtnMemSave.Enabled := False;
end;

procedure TfCardMaint.dbePostMobile2Exit(Sender: TObject);
Var
  s1: String;
begin
  lblPhoneWarning.Visible := False;
  spdBtnMemSave.Enabled := True;
  s1 := dmoMemMaint.qryCard.FieldByName('PostMobile2').AsString;
  s1 := dmoMemMaint.CheckMobileNumber(s1);
  if s1 = 'Error' then
    showmessage('Invalid phone number')
  else
    dmoMemMaint.qryCard.FieldByName('PostMobile2').AsString := s1;
end;

// procedure TfMemMaint.dbCheckIsInactiveClick(Sender: TObject);
// begin
// if dbCheckIsInactive.Checked then
// Begin
// dbCheckIsInactive.Checked:= False;
// End
// Else
// Begin
// dbCheckIsInactive.Checked:= True;
// End;
// end;
//
// procedure TfMemMaint.dbCheckIsPersonClick(Sender: TObject);
// begin
// if dbCheckIsPerson.Checked then
// Begin
// dbCheckIsPerson.Checked= False
// End
// Else
// Begin
// dbCheckIsPerson.Checked:= True;
// End;
// end;

procedure TfCardMaint.dbeDelivLandLineEnter(Sender: TObject);
begin
  lblPhoneWarning.Left := 465;
  lblPhoneWarning.Top := dbeDelivLandLine.Top - 6;
  lblPhoneWarning.Visible := True;
  spdBtnMemSave.Enabled := False;
end;

procedure TfCardMaint.dbeDelivLandLineExit(Sender: TObject);
Var
  s1: String;
begin
  lblPhoneWarning.Visible := False;
  spdBtnMemSave.Enabled := True;
  s1 := dmoMemMaint.qryCard.FieldByName('DelivLandLine').AsString;
  s1 := dmoMemMaint.CheckLandLineNumber(s1);
  if s1 = 'Error' then
    showmessage('Invalid phone number')
  else
    dmoMemMaint.qryCard.FieldByName('DelivLandLine').AsString := s1;
end;

procedure TfCardMaint.dbePostLandLineEnter(Sender: TObject);
begin
  lblPhoneWarning.Left := 165;
  lblPhoneWarning.Top := dbePostLandLine.Top - 6;
  lblPhoneWarning.Visible := True;
  spdBtnMemSave.Enabled := False;
end;

procedure TfCardMaint.dbePostLandLineExit(Sender: TObject);
Var
  s1: String;
begin
  lblPhoneWarning.Visible := False;
  spdBtnMemSave.Enabled := True;
  s1 := dmoMemMaint.qryCard.FieldByName('PostLandLine').AsString;
  s1 := dmoMemMaint.CheckLandLineNumber(s1);
  if s1 = 'Error' then
    showmessage('Invalid phone number')
  else
    dmoMemMaint.qryCard.FieldByName('PostLandLine').AsString := s1;
end;

procedure TfCardMaint.dbgSearchDblClick(Sender: TObject);
begin
  spdBtnMemAdd.Enabled := False;
  gAddSelected := False;
//  showmessage(IntToStr(dmoMemMaint.dstCardSearch.FieldByName('CardID').AsInteger));
  dmoMemMaint.SelectThisCard;
  dmoMemMaint.qryCard.Edit;
  edtCode.Text := dmoMemMaint.qryCard.FieldByName('CardCode').AsString;
  edtSurname.Text := dmoMemMaint.qryCard.FieldByName('Surname').AsString;
  edtFirstName.Text := dmoMemMaint.qryCard.FieldByName('Firstname').AsString;
  pnlDataEntry.Visible := True;
End;

procedure TfCardMaint.DBLookupComboBoxMemCategoryClick(Sender: TObject);
begin
  dmoMemMaint.AddCategory;
end;

procedure TfCardMaint.DBLookupListBox1DblClick(Sender: TObject);
begin
  dmoMemMaint.DelCategory;
end;

procedure TfCardMaint.edtCodeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  dmoMemMaint.FilterSearchGrid('CardCode', edtCode.Text);
end;

procedure TfCardMaint.edtFirstNameExit(Sender: TObject);
begin
  gFirstName := MyStripout(edtFirstName.Text);
  if gFirstName > '' then
  Begin
    CheckCardNames;
  End;
end;

procedure TfCardMaint.edtSurnameExit(Sender: TObject);
Var
  s1: String;
begin
  s1 := MyStripout(edtSurname.Text);
  if Length(s1) = 0 then
  Begin
    if gAddSelected then
    Begin
      Error('Surname must not be empty');
      edtSurname.SetFocus;
    End;
  End
  Else
  Begin
    gSurname := s1;
    CheckCardNames;
  End;
end;

procedure TfCardMaint.edtSurnameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if NOT gAddSelected then
  Begin
    dmoMemMaint.FilterSearchGrid('SurName', edtSurname.Text);
  End;
end;

procedure TfCardMaint.StaticText1Click(Sender: TObject);
begin
  dmoMemMaint.CopyPostalToDelivery;
end;

procedure TfCardMaint.spdBtnMemAddClick(Sender: TObject);
begin
  dmoMemMaint.AddNewCard;
  gAddSelected := True;
  edtCode.Text := '';
  edtSurname.Text := '';
  edtFirstName.Text := '';
  pnlDataEntry.Visible := False;
  dbgSearch.Visible := True;
  spdBtnMemAdd.Enabled := False;
end;

procedure TfCardMaint.DoAfterCancel;
begin
  If gAddSelected then
  Begin
    gAddSelected := False;
    if dmoMemMaint.qryCard.State IN [dsEdit, dsInsert] then
    Begin
      dmoMemMaint.qryCard.Cancel;
    End;
  End;
  pnlDataEntry.Visible := False;
  dbgSearch.Visible := True;
end;

procedure TfCardMaint.spdBtnmemCancelClick(Sender: TObject);
begin
  spdBtnMemAdd.Enabled := True;
  DoAfterCancel;
End;

procedure TfCardMaint.spdBtnmemExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfCardMaint.spdBtnMemSaveClick(Sender: TObject);
begin
  dmoMemMaint.qryCard.Post;
  pnlDataEntry.Visible := False;
  if gAddSelected then
  Begin
    gAddSelected := False;
  End;
  dbgSearch.Visible := True;
  dmoMemMaint.RefreshData(cbxShowInactive.Checked);
  spdBtnMemAdd.Enabled := True;
End;

End.
