unit uCadastroProfessores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroBase, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask;

type
  TfrmCadastroProfessor = class(TfrmCadastroBase)
    Label1: TLabel;
    dbeCodigoProfessor: TDBEdit;
    Label2: TLabel;
    dbeNomeProfessor: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  protected
    function ValidaDados: Boolean; override;
  public
    { Public declarations }
  end;

var
  frmCadastroProfessor: TfrmCadastroProfessor;

implementation

{$R *.dfm}

uses udmPrincipal, uMensagemUtils;

{ TfrmCadastroProfessor }

procedure TfrmCadastroProfessor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmCadastroProfessor := nil;
end;

function TfrmCadastroProfessor.ValidaDados: Boolean;
begin
  Result := False;

  if dbeNomeProfessor.text = '' then
  begin
    Showmensagewarning('Informe o Nome do professor.');
    dbeNomeProfessor.SetFocus;
    Exit;
  end;

  Result := inherited ValidaDados;
end;

end.
