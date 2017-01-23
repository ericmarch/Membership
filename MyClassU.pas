unit MyClassU;

interface

uses
  System.Classes,
  REST.Authenticator.Simple,
  REST.Types,
  REST.Client;


// REST authentication from http://docwiki.embarcadero.com/RADStudio/Seattle/en/REST_Client_Library


type
  TsmsBaseClass = class
  private
    fRESTClient: TRESTClient;
    fRESTRequest: TRESTRequest;
    fRESTResponse: TRESTResponse;
  public
    constructor Create(aOwner: TComponent; aAPIURL: String);
    destructor Destroy; override;
    Function  ExecuteRequest(sMobileNumber, sMessage: String):string;
  end;


implementation


{ TsmsBaseClass }

uses dmoCardComU;


Constructor TsmsBaseClass.Create(aOwner: TComponent; aAPIURL: String);
Begin
  inherited Create;
  fRESTClient := TRESTClient.Create('');
  fRESTClient.BaseURL := aAPIURL;
  fRESTRequest := TRESTRequest.Create(aOwner);
  fRESTResponse := TRESTResponse.Create(aOwner);
  fRESTRequest.Client := fRESTClient;
  fRESTRequest.Response := fRESTResponse;
End;


Destructor TsmsBaseClass.Destroy;
Begin
  fRESTClient.Free;
  fRESTRequest.Free;
  fRESTResponse.Free;
  inherited Destroy;
End;


Function  TsmsBaseClass.ExecuteRequest(sMobileNumber, sMessage: String):string;
Begin
  fRESTRequest.AddParameter('USERNAME', 'eric@adelaidebusinesssystems.com.au', TRESTRequestParameterKind.pkGETorPOST);
  fRESTRequest.AddParameter('PASSWORD', '1ntelPWD!', TRESTRequestParameterKind.pkGETorPOST);
  fRESTRequest.AddParameter('ACTION', 'send', TRESTRequestParameterKind.pkGETorPOST);
  fRESTRequest.AddParameter('ORIGINATOR', 'EricMarch', TRESTRequestParameterKind.pkGETorPOST);
  fRESTRequest.AddParameter('RECIPIENT', sMobileNumber, TRESTRequestParameterKind.pkGETorPOST);
  fRESTRequest.AddParameter('MESSAGE_TEXT', sMessage, TRESTRequestParameterKind.pkGETorPOST);
  fRESTRequest.Execute;
  result:= fRESTResponse.Content;
End;


End.
