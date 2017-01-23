unit dmoMemMaintU;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  Data.Win.ADODB,
  Dialogs,
  Datasnap.DBClient,
  Datasnap.Provider;

type
  TdmoMemMaint = class(TDataModule)
    dst1: TADODataSet;
    dstCategory: TADODataSet;
    cmd1: TADOCommand;
    qryMemCat: TADOQuery;
    dstReportCard: TADODataSet;
    dstCustomFieldnames: TADODataSet;
    dstReportCardCat: TADODataSet;
    dstCardSearch: TADODataSet;
    qryCard: TADOQuery;
    dstSelectCat1: TADODataSet;
    dstSelectCat2: TADODataSet;
    cds1: TClientDataSet;
    qryMembership: TADOQuery;
    dstMembership: TADODataSet;
    dstMemType: TADODataSet;
    dstMemStatus: TADODataSet;
    dstMemOccupation: TADODataSet;
    dstMemGender: TADODataSet;
    procedure OpenData;
    procedure CloseData;
    procedure SetCardsSelected;
    procedure RefreshData(bIncludeInactive: Boolean);
    function  GetLastCode(sTestCode: String):String;
    Procedure FilterSearchGrid(sColumn, sTestCode: String);
    Procedure CopyPostalToDelivery;
    Procedure AddNewCard;
    Procedure ChangeCardCode(sCardCode, sSurname, sFirstName: String);
    Function  CheckLandLineNumber(sTheNumber: String):String;
    Function  CheckMobileNumber(sTheNumber: String):String;
    Procedure UpdateCard;
    Procedure AddCategory;
    Procedure DelCategory;
    procedure dstReportCardAfterScroll(DataSet: TDataSet);
    procedure SelectUsedCats;
    procedure SelectCatsThisMember(bIncludeInactive: Boolean);
    procedure SelectThisCard;
    Function  CreateMergeFile:String;
    procedure DataModuleDestroy(Sender: TObject);
    procedure FillCDS(cds1: TClientDataSet);

    procedure SetDstMembershipCommand;
    procedure OpenMemberData;
    procedure CloseMemberData;
    procedure SelectThisMember;
    procedure qryMembershipCancel;
    procedure SaveMembership(DOB, DJoined: tDateTime);
    procedure OpenCardSearch;
    procedure NewMember;
    procedure DataModuleCreate(Sender: TObject);
    private
    { Private declarations }
    Function  GetLastCardID: Integer;
    procedure RefreshCategory(iCardID: Integer);
    procedure ReOpenMembership;
  public
    { Public declarations }
    sMemCommandText: String;
  end;

var
  dmoMemMaint: TdmoMemMaint;
  MergeFile: TextFile;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses MyGlobals, dmoConnectionU;

{$R *.dfm}

{ TdmoMemMaint }

//---------------------fMemMaint -----------------------------------

procedure TdmoMemMaint.SetDstMembershipCommand;
begin
  sMemCommandText:= dstMembership.CommandText;
end;

procedure TdmoMemMaint.OpenMemberData;
var
  s1: String;
begin
  qryMembership.Active:= True;
  s1:= sMemCommandText
              + ' Order By Card.SurName, Card.PreferredName';
  dstMembership.CommandText:= s1;
  dstMembership.Active:= True;
  dst1.Active:= True;
  dstMemType.Active:= True;
  dstMemStatus.Active:= True;
  dstMemOccupation.Active:= True;
  dstMemGender.Active:= True;
end;

procedure TdmoMemMaint.CloseMemberData;
begin
  qryMembership.Active:= False;
  dstMembership.Active:= False;
  dstCardSearch.Active:= False;
  dst1.Active:= False;
  dstMemType.Active:= False;
  dstMemStatus.Active:= False;
  dstMemOccupation.Active:= False;
  dstMemGender.Active:= False;
end;

procedure TdmoMemMaint.OpenCardSearch;
begin
  dstCardSearch.Active:= False;
  dstCardSearch.CommandText:= 'SELECT CardCode, SurName, FirstName, PreferredName, Post1, PostCity, '
              + 'PostMobile1, IsInactive,  CardID '
              + 'FROM Card '
              + 'WHERE Card.IsInactive = False '
              + 'ORDER BY SurName, FirstName';
  dstCardSearch.Active:= True;
end;

procedure TdmoMemMaint.NewMember;
Var
  iNN: Integer;
begin
  iNN:= dstCardSearch.FieldByName('CardID').AsInteger;
  qryMembership.Insert;
  qryMembership.FieldByName('CardID').AsInteger:= iNN;
end;

procedure TdmoMemMaint.ReOpenMembership;
var
  iLN: Integer;
  s1: String;
begin
  dstMembership.Active:= False;
  iLN:= Length(sMemCommandText);
  dstMembership.CommandText:= sMemCommandText + ' Order by Card.SurName, Card.PreferredName';
  dstMembership.Active:= True;
end;

procedure TdmoMemMaint.qryMembershipCancel;
begin
  qryMembership.Cancel;
  ReOpenMembership;
end;

procedure TdmoMemMaint.SelectThisMember;
Var
  iNN, iLn: Integer;
  s1: String;
begin
  iNN:= dstMembership.FieldByName('CardID').AsInteger;
  qryMembership.Active:= False;
  qryMembership.SQL.Clear;
  s1:= 'Select * FROM Member Where CardID = ' + IntToStr(iNN);
  qryMembership.SQL.Add(s1);
  qryMembership.Active:= True;
  qryMembership.Edit;

  dstMembership.Active:= False;
  iLn:= Length(sMemCommandText);
  s1:= sMemCommandText
              + ' WHERE  Member.CardID = '  + IntToStr(iNN)
              + ' Order By Card.SurName, Card.PreferredName';
  dstMembership.CommandText:= s1;
  dstMembership.Active:= True;
  dstCardSearch.Active:= False;
  s1:= 'Select PreferredName, Surname, IsInactive, Post1, PostCity, PostMobile1 '
              + 'FROM Card Where CardID = ' + IntToStr(iNN);
  dstCardSearch.CommandText:= s1;
  dstCardSearch.Active:= True;
end;

procedure TdmoMemMaint.SaveMembership(DOB, DJoined: tDateTime);
begin
  If (qryMembership.State in [dsInsert, dsEdit]) Then
  Begin
    qryMembership.FieldByName('DOB').AsDateTime:= DOB;
    qryMembership.FieldByName('Accepted').AsDateTime:= DJoined;
    qryMembership.Post;
  End;
  ReOpenMembership;
end;

//---------------------fCardMaint -----------------------------------

procedure TdmoMemMaint.CloseData;
begin
  qryCard.Active:= False;
  dstCardSearch.Active:= False;
  dstCustomFieldnames.Active:= False;
  dstCategory.Active:= False;
  qryMemCat.Active:= False;
end;

procedure TdmoMemMaint.OpenData;
begin
  qryCard.Active:= True;
  dstCardSearch.Active:= True;
  dstCustomFieldnames.Active:= True;
  dstCategory.Active:= True;
  qryMemCat.Active:= True;
end;

procedure TdmoMemMaint.SetCardsSelected;
Var
  bORneeded,bExtraBracket, bInc, bexc: Boolean;
  iNN, i2NN: Integer;
  s1: String;
begin
  dstReportCard.Active:= False;
  s1:= 'Select * from Card as c1 where exists '
            + '(Select * FROM CardCat as c2 where ';
  bInc:= False;
  bORneeded:= False;
  For iNN := 1 to Length(gArrCatIDIncSelected)-1 Do
  Begin
    if gArrCatIDIncSelected[iNN] = 1 then
    Begin
      if bInc= True then
        bORNeeded:= True;
      bInc:= True;
    End;
  End;
  if NOT bInc then
  Begin
    s1:= s1 + ' c1.cardID = c2.CardID';
  End
  Else
  Begin
    if bORneeded then
      s1 := s1 + '(';
    s1 := s1 + '(c1.cardID = c2.CardID) AND ';
    if bORneeded then
      s1:= s1 + '(';
    bORneeded:= False;
    bExtraBracket:= False;
    For iNN := 1 to Length(gArrCatIDIncSelected)-1 Do
    Begin
      if gArrCatIDIncSelected[iNN] = 1 then
      Begin
        if bORNeeded then
        Begin
          s1:= s1 + ' OR ';
          bExtraBracket:= True;
        End
        else
        Begin
          bORNeeded:= True;
        End;
        s1:= s1 + '(c2.catID = ' + IntToStr(gArrCatIDInc[iNN]) + ')';
      End;
    End;
    if bExtraBracket then
      s1:= s1 + '))';
  End;
  bORneeded:= False;
  bexc:= False;
  i2NN:= 0;
  For iNN := 0 to Length(gArrCatIDExcSelected)-1 Do
  Begin
    if gArrCatIDExcSelected[iNN] = 1 then
    Begin
      bexc:= True;
      i2NN:= i2NN + 1;
    End;
  End;
  If bexc then
  begin
    s1 := s1 + ' AND (NOT ';
    If i2NN > 1 Then
      s1:= s1 + '(';
    For iNN := 0 to Length(gArrCatIDExcSelected)-1 Do
    Begin
      if gArrCatIDExcSelected[iNN] = 1 then
      Begin
        if bORneeded then
          s1:= s1 + ' OR ';
        s1:= s1 + '(c2.catID = ' + IntToStr(gArrCatIDInc[iNN]) + ')';
        bORneeded:= True;
      End;
    End;
    s1:= s1 + ')';
    if i2NN > 1 then
      s1:= s1 + ')';
  End;
  s1:= s1 + ')';
//  ShowMessagePos(s1, 100, 100);
  s1:= s1 + ' ORDER BY Surname, FirstName';
  dstReportCard.CommandText:= s1;
  dstReportCard.Active:= True;
End;



procedure TdmoMemMaint.CopyPostalToDelivery;
begin
  qryCard.FieldByName('Deliv1').AsString:= qryCard.FieldByName('Post1').AsString;
  qryCard.FieldByName('Deliv2').AsString:= qryCard.FieldByName('Post2').AsString;
  qryCard.FieldByName('DelivCity').AsString:= qryCard.FieldByName('PostCity').AsString;
  qryCard.FieldByName('DelivState').AsString:= qryCard.FieldByName('PostState').AsString;
  qryCard.FieldByName('DelivPostCode').AsString:= qryCard.FieldByName('PostPostCode').AsString;
end;

Function  TdmoMemMaint.CreateMergeFile:String;
var
  strList:TStringList;
  s1, s2: String;
begin
  if fileexists('evConfig.txt') then
  Begin
    strList:=TStringList.Create;
    strList.LoadFromFile('evConfig.txt');
    s1:=strList.Strings[1];
    s2:= s1 + strList.Strings[2];
    freeandnil(strList);
    if DirectoryExists(s1) Then
    Begin
      if FileExists(s2) then
      Begin
        AssignFile(MergeFile, s2);
        ReWrite(MergeFile);
        Result:= 'OK';
      End;
    End
    Else
    Begin
      Result:= 'Directory ' + s1 + ' Does not exist';
    End;
  End
  Else
  Begin
    Result:= 'evConfig.txt Does not exist';
  End;
End;

procedure TdmoMemMaint.RefreshCategory(iCardID: Integer);
var
  s1: String;
begin
  qryMemCat.Active:= False;
  qryMemCat.SQL.Clear;
  s1:= 'SELECT Card.CardID, CardCat.CardID, '
                  + 'Category.CatID, Category.Obsolete, Category.Code, Category.Description '
                  + 'FROM Category INNER JOIN '
                  + '(Card INNER JOIN CardCat ON Card.CardID = CardCat.CardID) '
                  + 'ON Category.CatID = CardCat.CatID '
                  + 'WHERE (((CardCat.CardID)=' + IntToStr(iCardID) + ') AND ((Category.Obsolete)=False)) '
                  + 'ORDER BY Category.Description';
  qryMemCat.SQL.Add(s1);
  qryMemCat.Active:= True;
  dstCategory.Active:= False;   //  Select all categories that are NOT allocated to iCardID
  dstCategory.CommandText:= 'SELECT * '
                  + 'FROM Category AS tbl1 WHERE NOT EXISTS '
                  + '(Select * FROM CardCat AS tbl2 '
                  + 'WHERE tbl2.CatID = tbl1.CatID '
                  + 'AND '
                  + 'tbl2.CardID = '
                  + IntToStr(iCardID)
                  + ')' + 'Order by Description';
  dstCategory.Active:= True;
End;

procedure TdmoMemMaint.RefreshData(bIncludeInactive: Boolean);
Var
  s1: string;
begin
  if dstCardSearch.State in [dsEdit, dsInsert ]  then
    dstCardSearch.Cancel;
  dstCardSearch.Active:= False;
  if bIncludeInactive then
  Begin
    s1:= 'SELECT * '
                  + 'FROM Card '
                  + 'ORDER BY SurName, FirstName';
  End
  Else
  Begin
    s1:= 'SELECT * '
                  + 'FROM Card '
                  + 'WHERE IsInactive = False '
                  + 'ORDER BY SurName, FirstName';
  End;
  dstCardSearch.CommandText:= s1;
  dstCardSearch.Active:= True;
  If qryMemCat.Active = False then
    qryMemCat.Active:= True;
end;

procedure TdmoMemMaint.SelectCatsThisMember(bIncludeInactive: Boolean);
Var
  s1: string;
begin
  if qryCard.State in [dsEdit, dsInsert ]  then
    qryCard.Cancel;
  qryCard.Active:= False;
  qryCard.SQL.Clear;
  if bIncludeInactive then
  Begin
    s1:= 'SELECT SurName, FirstName, IsInactive, Card.* '
                  + 'FROM Card '
                  + 'ORDER BY SurName, FirstName';
  End
  Else
  Begin
    s1:= 'SELECT * '
                  + 'FROM Card '
                  + 'WHERE IsInactive = False '
                  + 'ORDER BY SurName, .FirstName';
  End;
  qryCard.SQL.Add(s1);
  qryCard.Active:= True;
  If qryMemCat.Active = False then
    qryMemCat.Active:= True;
end;

procedure TdmoMemMaint.SelectUsedCats;
Var
  s1: String;
begin
  dstSelectCat1.Active:= False;
  s1:= 'SELECT *  FROM Category AS t1 '
     + 'WHERE EXISTS (Select * FROM CardCat AS t2 '
     + 'WHERE t2.CatID = t1.CatID) '
     + 'ORDER BY Description';
  dstSelectCat1.CommandText:= s1;
  dstSelectCat1.Active:= True;
End;

procedure TdmoMemMaint.SelectThisCard;
Var
  iCardID: Integer;
  s1: String;
begin
  iCardID:= dstCardSearch.FieldByName('CardID').AsInteger;
  qryCard.Active:= False;
  qryCard.SQL.Clear;
  s1:= 'SELECT * FROM Card '
                  + 'WHERE CardID = ' + IntToStr(iCardID) + ' '
                  + 'ORDER BY SurName, FirstName';
  qryCard.SQL.Add(s1);
  qryCard.Active:= True;
  qryMemCat.Active:= False;
  qryMemCat.SQL.Clear;
  s1:= 'SELECT c2.CardID, c1.CatID, c1.Obsolete, c1.Code, c1.Description '
          + 'FROM Category as c1 INNER JOIN CardCat as c2 ON c1.CatID = c2.CatID '
          + 'WHERE (((c2.CardID)= ' + IntToStr(iCardID) + '))';
  qryMemCat.SQL.Add(s1);
  qryMemCat.Active:= True;
  RefreshCategory(iCardID);
end;

procedure TdmoMemMaint.AddCategory;
Var
  iCardID, iCatID: Integer;
begin
  iCardID:= qryCard.FieldByName('CardID').AsInteger;
  iCatID:= dstCategory.FieldByName('CatID').AsInteger;
  dst1.Active:= False;
  dst1.CommandText:= 'Select catID From CardCat Where CardID = '
                  + IntToStr(iCardID)
                  + ' AND CatID = ' + IntToStr(iCatID);
  dst1.Active:= True;
  if dst1.RecordCount = 0 then
  Begin
    cmd1.CommandText:= 'Insert Into CardCat Values ('
                  + IntToStr(iCardID) + ', '
                  + IntToStr(iCatID) + ')';
    cmd1.Execute;
  End;
   RefreshCategory(iCardID);
End;

procedure TdmoMemMaint.DataModuleCreate(Sender: TObject);
begin
  SetDstMembershipCommand;
  OpenData;
  OpenMemberData;
end;

procedure TdmoMemMaint.DataModuleDestroy(Sender: TObject);
begin
  cds1.Destroy;
  CloseData;
  CloseMemberData;
end;

procedure TdmoMemMaint.DelCategory;
Var
  iCardID, iCatID: Integer;
begin
  iCatID:= qryMemCat.FieldByName('CatID').AsInteger;
  iCardID:= qryCard.FieldByName('CardID').AsInteger;
  cmd1.CommandText:= 'Delete from CardCat WHERE '
                  + 'CatID = ' + IntToStr(iCatID)
                  + ' AND '
                  + 'CardID = ' + IntToStr(iCardID);
    cmd1.Execute;
  RefreshCategory(iCardID);
End;


procedure TdmoMemMaint.dstReportCardAfterScroll(DataSet: TDataSet);
Var
  iAnID: Integer;
begin
  iAnID:= dstReportCard.FieldByName('CardID').AsInteger;
  dstReportCardCat.Active:= False;
  dstReportCardCat.CommandText:= 'SELECT CardCat.CardID, Category.CatID, '
              + 'Category.Obsolete, Category.Code, Category.Description '
              + 'FROM Category INNER JOIN CardCat ON Category.CatID = CardCat.CatID '
              + 'WHERE (((CardCat.CardID)= ' + IntToStr(iAnID) + ') '
              + 'AND ((Category.Obsolete)=False)) '
              + 'ORDER BY Category.Description';
  dstReportCardCat.Active:= True;
end;

procedure TdmoMemMaint.AddNewCard;
Var
  iCardID: Integer;
begin
  iCardID:= GetLastCardID + 1;
  qryCard.Append;
  qryCard.FieldByName('CardID').AsInteger:= iCardId;
end;

procedure TdmoMemMaint.ChangeCardCode(sCardCode, sSurname, sFirstName: String);
begin
  qryCard.FieldByName('CardCode').AsString:= sCardCode;
  qryCard.FieldByName('Surname').AsString:= sSurname;
  qryCard.FieldByName('FirstName').AsString:= sFirstName;
end;

Function  TdmoMemMaint.CheckLandLineNumber(sTheNumber: String):String;
var
  s1: String;
begin
  s1:= MyStripout(sTheNumber);
  If s1 > '' Then
    Begin
    Case Length(s1) of
       8 : Result:= Copy(s1, 1, 4) + ' ' + Copy(s1, 5, 4);   // No area code
      10 : Result:= Copy(s1, 1, 2) + ' ' + Copy(s1, 3, 4) + ' ' + Copy(s1, 7, 4);  // Area code
      11 : Result:= Copy(s1, 1, 3) + ' ' + Copy(s1, 4, 4) + ' ' + Copy(s1, 8, 4);  // International
    else Result:= 'Error';
    End;
  End;
End;

Function  TdmoMemMaint.CheckMobileNumber(sTheNumber: String):String;
Var
  s1: String;
begin
  s1:= MyStripout(sTheNumber);
  if s1 > '' then
  Begin
    Case Length(s1) of
      10 : Result:= Copy(s1, 1, 4) + ' ' + Copy(s1, 5, 3) + ' ' + Copy(s1, 8, 3);  // No International Code
      11 : Result:= Copy(s1, 1, 2) + ' ' + Copy(s1, 3, 3) + ' ' + Copy(s1, 6, 3) + ' ' + Copy(s1, 9, 3);   // International Code
    else Result:= 'Error';
    End;
  End;
End;

procedure TdmoMemMaint.UpdateCard;
begin
  qryCard.Post;
end;

procedure TdmoMemMaint.FillCDS(cds1: TClientDataSet);
Var
  iNN, iNew: Integer;
  sName1, sName2, sName3: String;
begin
  iNN:= dstReportCard.FieldByName('CustomFieldNameKey').AsInteger;
  dstCustomFieldnames.Active:= False;
  dstCustomFieldnames.CommandText:= 'Select * From CustomFieldNames Where ID = ' + IntToStr(iNN);
  dstCustomFieldnames.Active:= True;
  sName1:= dstCustomFieldnames.FieldByName('1Description').AsString;
  sName2:= dstCustomFieldnames.FieldByName('2Description').AsString;
  sName3:= dstCustomFieldnames.FieldByName('3Description').AsString;
  //  While ( NOT dstReprtCard.Eof) AND (iNN < 10) Do
  While NOT dstReportCard.Eof Do
  Begin
    cds1.Append;
    cds1.Fields[0].Value:= dstReportCard.FieldByName('CardID').AsInteger;
    cds1.Fields[1].Value:= dstReportCard.FieldByName('CardCode').AsString;
    cds1.Fields[2].Value:= dstReportCard.FieldByName('Surname').AsString;
    cds1.Fields[3].Value:= dstReportCard.FieldByName('FirstName').AsString;
    cds1.Fields[4].Value:= dstReportCard.FieldByName('PreferredName').AsString;
    cds1.Fields[5].Value:= dstReportCard.FieldByName('IsPerson').AsBoolean;
    cds1.Fields[6].Value:= dstReportCard.FieldByName('IsInActive').AsBoolean;
    cds1.Fields[7].Value:= dstReportCard.FieldByName('CardNote').Value;

    iNew:=dstReportCard.FieldByName('CustomFieldNameKey').AsInteger;
    cds1.Fields[8].Value:= iNew;
    if iNN <> iNew then
    Begin
      iNN:= iNew;
      dstCustomFieldnames.Active:= False;
      dstCustomFieldnames.CommandText:= 'Select * From CustomFieldNames Where ID = ' + IntToStr(iNN);
      dstCustomFieldnames.Active:= True;
      sName1:= dstCustomFieldnames.FieldByName('1Description').AsString;
      sName2:= dstCustomFieldnames.FieldByName('2Description').AsString;
      sName3:= dstCustomFieldnames.FieldByName('3Description').AsString;
    End;

    cds1.Fields[9].Value:= sName1;
    cds1.Fields[10].Value:= dstReportCard.FieldByName('CustomField1').AsString;
    cds1.Fields[11].Value:= sName2;
    cds1.Fields[12].Value:= dstReportCard.FieldByName('CustomField2').AsString;
    cds1.Fields[13].Value:= sName3;
    cds1.Fields[14].Value:= dstReportCard.FieldByName('CustomField3').AsString;

    cds1.Fields[15].Value:= dstReportCard.FieldByName('Post1').AsString;
    cds1.Fields[16].Value:= dstReportCard.FieldByName('Post2').AsString;
    cds1.Fields[17].Value:= dstReportCard.FieldByName('PostCity').AsString;
    cds1.Fields[18].Value:= dstReportCard.FieldByName('PostState').AsString;
    cds1.Fields[19].Value:= dstReportCard.FieldByName('PostPostCode').AsString;
    cds1.Fields[20].Value:= dstReportCard.FieldByName('PostMobile1').AsString;
    cds1.Fields[21].Value:= dstReportCard.FieldByName('PostMobile1Who').AsString;
    cds1.Fields[22].Value:= dstReportCard.FieldByName('PostMobile2').AsString;
    cds1.Fields[23].Value:= dstReportCard.FieldByName('PostMobile2Who').AsString;
    cds1.Fields[24].Value:= dstReportCard.FieldByName('PostLandline').AsString;
    cds1.Fields[25].Value:= dstReportCard.FieldByName('PostEmail').AsString;

    cds1.Fields[26].Value:= dstReportCard.FieldByName('Deliv1').AsString;
    cds1.Fields[27].Value:= dstReportCard.FieldByName('Deliv2').AsString;
    cds1.Fields[28].Value:= dstReportCard.FieldByName('DelivCity').AsString;
    cds1.Fields[29].Value:= dstReportCard.FieldByName('DelivState').AsString;
    cds1.Fields[30].Value:= dstReportCard.FieldByName('DelivPostCode').AsString;
    cds1.Fields[31].Value:= dstReportCard.FieldByName('DelivMobile1').AsString;
    cds1.Fields[32].Value:= dstReportCard.FieldByName('DelivMobile1Who').AsString;
    cds1.Fields[33].Value:= dstReportCard.FieldByName('DelivMobile2').AsString;
    cds1.Fields[34].Value:= dstReportCard.FieldByName('DelivMobile2Who').AsString;
    cds1.Fields[35].Value:= dstReportCard.FieldByName('DelivLandLine').AsString;
    cds1.Fields[36].Value:= dstReportCard.FieldByName('DelivEmail').AsString;
    cds1.Fields[37].Value:= dstReportCard.FieldByName('EmergencyContact').AsString;
    cds1.Fields[38].Value:= dstReportCard.FieldByName('EmergencyPhone').AsString;

    cds1.Fields[39].Value:= True;

    dstReportCard.Next;
  End;
End;

procedure TdmoMemMaint.FilterSearchGrid(sColumn, sTestCode: String);
Var
  s1: String;
begin
  qryCard.Active:= False;
  qryCard.SQL.Clear;
  if Length(sTestCode) > 0 then
  Begin
    if sColumn = 'CardCode' then
      sColumn:= 'CardCode LIKE '
    Else
      sColumn:= 'Surname LIKE ';
    sTestCode:= sTestCode + '%';
    s1:= 'Select * From Card '
                 + 'Where ' + sColumn + QuotedStr(sTestCode)
                 + ' Order By Surname, FirstName';
    qryCard.SQL.Add(s1);
  End
  Else
  Begin
    s1:= 'Select CardCode, Surname, FirstName, PostCity, '
                 + 'PostMobile1, CardID, IsInactive From Card '
                 + 'Order By Surname, FirstName';
    qryCard.SQL.Add(s1);
  End;
  qryCard.Active:= True;
end;

function TdmoMemMaint.GetLastCardID: Integer;
begin
  dst1.Active:= False;
  dst1.CommandText:= 'Select Top 1 CardID FROM Card Order By CardId Desc';
  dst1.Active:= True;
  if dst1.RecordCount = 1 then
    Result:= dst1.FieldByName('CardID').AsInteger
  Else
    Result:= 0;
  dst1.Active:= False;
end;

function TdmoMemMaint.GetLastCode(sTestCode: String): String;
Var
  s1: String;
begin
  dst1.Active:= False;
  s1:= sTestCode + '%';
  dst1.CommandText:= 'Select Top 1 CardCode FROM Card where CardCode LIKE '
                  + quotedStr(s1)
                  + 'Order By CardCode';
  dst1.Active:= True;
  if dst1.RecordCount = 1 then
    Result:= dst1.FieldByName('CardCode').AsString
  Else
    Result:= '';
  dst1.Active:= False;
End;


end.
