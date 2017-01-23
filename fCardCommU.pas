unit fCardCommU;

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
  Vcl.Buttons,
  Vcl.Menus,
  Vcl.Grids,
  Vcl.DBGrids,
  IPPeerClient,
  Vcl.StdCtrls,
  Data.DB,
  Datasnap.DBClient,
  MyClassU,
  dmoMemMaintU;

type
  TfCardComm = class(TForm)
    spdBtnComEmail: TSpeedButton;
    spdBtnComSMS: TSpeedButton;
    spdBtnComExit: TSpeedButton;
    edtModifySelection: TEdit;
    DBGrid1: TDBGrid;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    edtMessage: TEdit;
    edtNumber: TEdit;
    spdBtnSingleSMS: TSpeedButton;
    spdBtnSendMessage: TSpeedButton;
    txtMessage: TStaticText;
    txtCharCount: TStaticText;
    txtMobileNumber: TStaticText;
    txtSingleSMSClicked: TStaticText;
    procedure FormShow(Sender: TObject);
    procedure spdBtnComExitClick(Sender: TObject);
    procedure spdBtnComSMSClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CancelOut1Click(Sender: TObject);
    procedure spdBtnComEmailClick(Sender: TObject);
    procedure spdBtnSingleSMSClick(Sender: TObject);
    procedure spdBtnSendMessageClick(Sender: TObject);
    procedure edtMessageKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNumberKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    fTop: Integer;
    fLeft: Integer;
    fsmsBasePost: TsmsBaseClass;      // MyClassU
  End;

var
  fCardComm: TfCardComm;

implementation

{$R *.dfm}

uses MyGlobals, EASendMailObjLib_TLB;


procedure TfCardComm.CancelOut1Click(Sender: TObject);
begin
  Close;
end;

procedure TfCardComm.spdBtnComEmailClick(Sender: TObject);
Var
  oSMTP: TMail;
begin
  oSmtp := TMail.Create(Application);
  oSmtp.LicenseCode := 'TryIt';

  // Set your sender email address
  oSmtp.FromAddr := 'eric@adelaidebusinesssystems.com.au';
  // Add recipient email address
  oSmtp.AddRecipientEx( 'sales@ebmpl.com.au', 0);
  // Set email subject
  oSmtp.Subject := 'test HTML email from Delphi project';
  // Set HTML body format
  oSmtp.BodyFormat := 1;
  // Set HTML body text
  oSmtp.BodyText := '<font size=5>This is</font> <font color=red><b>a test</b></font>';

  // Add attachment from local disk
  if oSmtp.AddAttachment('C:\Develop\MembershipMDB\OldScreen.docx') <> 0 then
    ShowMessage( 'Failed to add OldScreen.docx with error: ' +
    oSmtp.GetLastErrDescription());

  // Add attachment from remote website
  if oSmtp.AddAttachment('http://www.emailarchitect.net/webapp/img/logo.jpg') <> 0 then
    ShowMessage( 'Failed to add Logo with error: ' +
    oSmtp.GetLastErrDescription());

  // Your SMTP server address
  oSmtp.ServerAddr := 'mail.adelaidebusinesssystems.com.au';

  // User and password for ESMTP authentication, if your server doesn't require
  // user authentication, please remove the following codes
  oSmtp.UserName := 'eric@adelaidebusinesssystems.com.au';
  oSmtp.Password := '3r!cviking';

  // If your SMTP server requires SSL connection, please add this line
   oSmtp.SSL_init();

  ShowMessage( 'start to send email ...' );
  if oSmtp.SendMail() = 0 then
    ShowMessage( 'email was sent successfully!' )
  else
    ShowMessage( 'failed to send email with the following error: '
    + oSmtp.GetLastErrDescription());
end;

procedure TfCardComm.spdBtnComExitClick(Sender: TObject);
begin
  Close;
End;

procedure TfCardComm.FormDestroy(Sender: TObject);
begin
  fsmsBasePost.Free;
  ClientDataSet1.Destroy;
  FreeAndNil(dmoMemMaint);
end;


procedure TfCardComm.FormCreate(Sender: TObject);
Begin
  dmoMemMaint:= TdmoMemMaint.Create(Self);
  fsmsBasePost:= TsmsBaseClass.Create(Self, 'https://my.smscentral.com.au/api/v3.2');

  ClientDataSet1.FieldDefs.Add('CardID', ftInteger);
  ClientDataSet1.FieldDefs.Add('CardCode', ftString, 50);
  ClientDataSet1.FieldDefs.Add('Surname', ftString, 50);
  ClientDataSet1.FieldDefs.Add('FirstName', ftString, 52);
  ClientDataSet1.FieldDefs.Add('PreferredName', ftString, 52);
  ClientDataSet1.FieldDefs.Add('IsPerson', ftBoolean);
  ClientDataSet1.FieldDefs.Add('IsInactive', ftBoolean);
  ClientDataSet1.FieldDefs.Add('CardNote', ftMemo);

  ClientDataSet1.FieldDefs.Add('CustomFieldNameKey', ftInteger);
  ClientDataSet1.FieldDefs.Add('CustomField1Name', ftString, 50);
  ClientDataSet1.FieldDefs.Add('CustomField1', ftString, 255);
  ClientDataSet1.FieldDefs.Add('CustomField2Name', ftString, 50);
  ClientDataSet1.FieldDefs.Add('CustomField2', ftString, 255);
  ClientDataSet1.FieldDefs.Add('CustomField3Name', ftString, 50);
  ClientDataSet1.FieldDefs.Add('CustomField3', ftString, 255);

  ClientDataSet1.FieldDefs.Add('Post1', ftString, 52);
  ClientDataSet1.FieldDefs.Add('Post2', ftString, 50);
  ClientDataSet1.FieldDefs.Add('PostCity', ftString, 50);
  ClientDataSet1.FieldDefs.Add('PostState', ftString, 10);
  ClientDataSet1.FieldDefs.Add('PostPostCode', ftString, 20);
  ClientDataSet1.FieldDefs.Add('PostMobile1', ftString, 20);
  ClientDataSet1.FieldDefs.Add('PostMobile1Who', ftString, 50);
  ClientDataSet1.FieldDefs.Add('PostMobile2', ftString, 20);
  ClientDataSet1.FieldDefs.Add('PostMobile2Who', ftString, 50);
  ClientDataSet1.FieldDefs.Add('PostLandLine', ftString, 20);
  ClientDataSet1.FieldDefs.Add('PostEmail', ftString, 255);

  ClientDataSet1.FieldDefs.Add('Deliv1', ftString, 52);
  ClientDataSet1.FieldDefs.Add('Deliv2', ftString, 50);
  ClientDataSet1.FieldDefs.Add('DelivCity', ftString, 50);
  ClientDataSet1.FieldDefs.Add('DelivState', ftString, 10);
  ClientDataSet1.FieldDefs.Add('DelivPostCode', ftString, 20);
  ClientDataSet1.FieldDefs.Add('DelivMobile1', ftString, 20);
  ClientDataSet1.FieldDefs.Add('DelivMobile1Who', ftString, 50);
  ClientDataSet1.FieldDefs.Add('DelivMobile2', ftString, 20);
  ClientDataSet1.FieldDefs.Add('DelivMobile2Who', ftString, 50);
  ClientDataSet1.FieldDefs.Add('DelivLandLine', ftString, 20);
  ClientDataSet1.FieldDefs.Add('DelivEmail', ftString, 150);
  ClientDataSet1.FieldDefs.Add('EmergencyContact', ftString, 50);
  ClientDataSet1.FieldDefs.Add('EmergencyPhone', ftString, 20);

  ClientDataSet1.FieldDefs.Add('IsSelected', ftBoolean);

  ClientDataSet1.CreateDataSet;
  ClientDataSet1.Active := True;
  DBGrid1.Columns.Add;
  DBGrid1.Columns[2].FieldName:= 'Surname';
  DBGrid1.Columns[2].Width:= 100;
  DBGrid1.Columns.Add;
  DBGrid1.Columns[3].FieldName:= 'FirstName';
  DBGrid1.Columns[3].Width:= 100;
  DBGrid1.Columns.Add;
  DBGrid1.Columns[4].FieldName:= 'PostCity';
  DBGrid1.Columns[4].Title.Caption:= 'City';
  DBGrid1.Columns[4].Width:= 100;
  DBGrid1.Columns.Add;
  DBGrid1.Columns[5].FieldName:= 'PostState';
  DBGrid1.Columns[5].Title.Caption:= 'State';
  DBGrid1.Columns[5].Width:= 50;
end;



procedure TfCardComm.FormShow(Sender: TObject);
begin
  Top:= fTop;
  Left:= fLeft;
  dmoMemMaint.SetCardsSelected;
  dmoMemMaint.FillCDS(ClientDataSet1);
  ClientDataSet1.First;
End;



procedure TfCardComm.spdBtnComSMSClick(Sender: TObject);
Var
  s1, sMobileNumber, sResponseMsg: String;
begin
  txtSingleSMSClicked.Caption:= '0';
  s1:= edtMessage.text;
  if (Length(s1) > 0) AND (Length(s1) < 161) then
  Begin
    sResponseMsg:= '0';
    ClientDataSet1.First;
    while NOT ClientDataSet1.EOF do
    Begin
      sMobileNumber:= MyStripout(ClientDataSet1.FieldByName('PostMobile1').AsString);
      if Length(sMobileNumber) = 10 then
      Begin
        s1:= edtMessage.Text;
        sResponseMsg:= fsmsBasePost.ExecuteRequest(sMobileNumber, s1);
        if sResponseMsg <> '0' then
          ShowMessagePos(sResponseMsg, 400, 500);
      End
      Else
      Begin
        s1:= ClientDataSet1.FieldByName('CardCode').AsString;
        ShowMessage('Mobile Number must be 10 numbers and ' + s1 + ' number is ' + sMobileNumber);
      End;
      ClientDataSet1.Next;
    End;
  End
  Else
  Begin
    ShowMessage('The message must not be empty and must not exceed 160 characters');
  End;
End;

Procedure TfCardComm.spdBtnSingleSMSClick(Sender: TObject);
Begin
  txtSingleSMSClicked.Caption:= '1';
  edtNumber.Visible:= True;
  txtCharCount.Caption:= '0';
  txtMobileNumber.Visible:= True;
End;

procedure TfCardComm.edtMessageKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  spdBtnSendMessage.Enabled:= ((Length(edtMessage.Text) > 0) AND (Length(edtMessage.Text) < 161));
  if ((txtSingleSMSClicked.Caption = '1') AND (Length(MyStripout(edtNumber.Text)) <> 10)) then
    spdBtnSendMessage.Enabled:= False;
End;

procedure TfCardComm.edtNumberKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
  iLEN: Integer;
Begin
  iLEN:= Length(MyStripout(edtNumber.Text));
  if iLEN <> 10 then
    spdBtnSendMessage.Enabled:= False
  Else
    spdBtnSendMessage.Enabled:= ((Length(edtMessage.Text) > 0) AND (Length(edtMessage.Text) < 161));
End;

Procedure TfCardComm.spdBtnSendMessageClick(Sender: TObject);
Var
  s1, sMobileNumber, sResponseMsg: String;
begin
  s1:= edtMessage.text;
  if (Length(s1) > 0) AND (Length(s1) < 161) then
  Begin
    sResponseMsg:= '0';
    if (txtSingleSMSClicked.Caption = '1') Then
      sMobileNumber:= MyStripout(edtNumber.Text)
    Else
      sMobileNumber:= MyStripout(ClientDataSet1.FieldByName('PostMobile1').AsString);
    if Length(sMobileNumber) = 10 then
    Begin
      s1:= edtMessage.Text;
      sResponseMsg:= fsmsBasePost.ExecuteRequest(sMobileNumber, s1);
      if sResponseMsg <> '0' then
        ShowMessagePos(sResponseMsg, 400, 500);
    End
    Else
    Begin
      ShowMessage('Mobile Number must be 10 numbers and number is ' + sMobileNumber);
    End;
  End;
  edtNumber.Visible:= False;
  txtMobileNumber.Visible:= True;
End;

End.
