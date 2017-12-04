unit uCadastroDisciplinas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroBase, Data.DB, Vcl.Grids, FireDAC.Stan.Param,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, udmPrincipal, uMensagemUtils;

type
  TfrmCadastroDisciplina = class(TfrmCadastroBase)
    Label1: TLabel;
    dbeCodigoDisciplina: TDBEdit;
    Label2: TLabel;
    dbeNomeDisciplina: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  protected
    function ValidaDados: Boolean; override;
    function ExisteDisciplina: boolean;
  public
    { Public declarations }
  end;

var
  frmCadastroDisciplina: TfrmCadastroDisciplina;

implementation

{$R *.dfm}

{ TfrmCadastroDisciplina }

procedure TfrmCadastroDisciplina.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmCadastroDisciplina := nil;
end;

function TfrmCadastroDisciplina.ValidaDados: Boolean;
begin
  Result := False;

  if dbeNomeDisciplina.text = '' then
  begin
    Showmensagewarning('Informe o Nome da disciplina.');
    dbeNomeDisciplina.SetFocus;
    Exit;
  end;

  if ExisteDisciplina then
  begin
    Showmensagewarning('Disciplina ja cadastrada.');
    dbeNomeDisciplina.SetFocus;
    Exit;
  end;

  Result := inherited ValidaDados;
end;

function TfrmCadastroDisciplina.ExisteDisciplina: boolean;
begin
  dmPrincipal.qrAuxiliar.Close;
  try
    dmPrincipal.qrAuxiliar.SQL.Text := 'SELECT ID FROM DISCIPLINAS '+
                                       'WHERE NOME = :NOME ';

    dmPrincipal.qrAuxiliar.ParamByName('NOME').AsString :=
      dsDados.DataSet.FieldByName('NOME').AsString;

    dmPrincipal.qrAuxiliar.Open;

    Result := not(dmPrincipal.qrAuxiliar.IsEmpty);
  finally
    dmPrincipal.qrAuxiliar.Close;
  end;
end;

end.
