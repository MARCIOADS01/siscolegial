unit uCadastroAlunos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroBase, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask;

type
  TfrmCadastroAluno = class(TfrmCadastroBase)
    Label1: TLabel;
    dbeCodigoAluno: TDBEdit;
    Label2: TLabel;
    dbeNomeAluno: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  protected
    function ValidaDados: Boolean; override;

  public
    { Public declarations }
  end;

var
  frmCadastroAluno: TfrmCadastroAluno;

implementation

{$R *.dfm}

uses udmPrincipal, uMensagemUtils;

{ TfrmCadastroAluno }

procedure TfrmCadastroAluno.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmCadastroAluno := nil;
end;

function TfrmCadastroAluno.ValidaDados: Boolean;
begin
  Result := False;

  if dbeNomeAluno.text = '' then
  begin
    Showmensagewarning('Informe o Nome do aluno.');
    dbeNomeAluno.SetFocus;
    Exit;
  end;

  Result := inherited ValidaDados;
end;

end.
