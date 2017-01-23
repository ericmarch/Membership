unit MyGlobals;

interface
uses sysutils, strUtils;
  Type TActiveWindow = Class(Tobject)
  Private
    //
  Public
    //
  End;

  Function  MyStripout(s1: String):String;

Var
  gAddSelected, gObsolete: Boolean;
  gPopMenuItem: Integer;
  gCatCode, gDescription: String;
  gCardID, gCatID: Integer;
  gCardCode, gSurname, gFirstName: String;
  gArrCatInc, gArrCatExc, gArrActiveCards: Array of String;
  gArrCatIDInc, gArrCatIDExc: Array of Integer;
  gArrCatIDIncSelected, gArrCatIDExcSelected: Array of byte;

Implementation

Function MyStripout(s1: String):String;
Const
  cInvdComma = #39;
Var
  s2: String;
Begin
  s2:= AnsiReplaceStr(s1, ' ', '');
  s1:= AnsiReplaceStr(s2, ',', '');
  s2:= AnsiReplaceStr(s1, '"', '');
  s2:= AnsiReplaceStr(s2, cInvdComma, '');
  Result:= s2;
End;



End.
