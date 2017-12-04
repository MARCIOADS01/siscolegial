unit uMensagemUtils;

interface

uses
  Vcl.forms, winapi.windows;

function ShowmensageConfirm(amsg: string) : Boolean;
procedure  Showmensagewarning(amsg: string);
procedure  ShowmensageInformation(amsg: string);

implementation

function ShowmensageConfirm(aMsg: string) : Boolean;
begin
  Result:= Application.MessageBox(PwideChar(aMsg), PwideChar(Application.Title),MB_ICONQUESTION + MB_YESNO) = IDYES;
end;

Procedure ShowmensageWarning(aMsg: string);
begin
 Application.MessageBox(PwideChar(aMsg), PwideChar(Application.Title), MB_ICONWARNING + MB_OK);
end;

Procedure ShowmensageInformation(aMsg: string);
begin
 Application.MessageBox(PwideChar(aMsg), PwideChar(Application.Title), MB_ICONINFORMATION + MB_OK);
end;
end.
