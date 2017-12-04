unit uLancamentoNotas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroBase, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, FireDAC.Stan.Param, udmPrincipal;

type
  TfrmLancamentoDeNotas = class(TfrmCadastroBase)
    Label1: TLabel;
    dbeCodigoNotaAluno: TDBEdit;
    Label3: TLabel;
    dsLookupDisciplinaAluno: TDataSource;
    plnLancamentoNotas: TPanel;
    dbeCodigoDisciplinaAluno: TDBEdit;
    dblDisciplinaAluno: TDBLookupComboBox;
    dbeNota2: TDBEdit;
    dbeNota1: TDBEdit;
    dbeNotaTrabalho: TDBEdit;
    dbeMedia: TDBEdit;
    dbeSituacao: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dbgDisciplinasAlunos: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    FdmPrincipalDisciplinasAlunos: TdmPrincipal;
    procedure HandleAfterScroll(DataSet: TDataSet);
  protected
   function ValidaDados: Boolean; override;
   function ExisteNotaDisciplina: boolean;

  public
    { Public declarations }
  end;

var
  frmLancamentoDeNotas: TfrmLancamentoDeNotas;

implementation

{$R *.dfm}

uses uMensagemUtils;

procedure TfrmLancamentoDeNotas.btnSalvarClick(Sender: TObject);
var
  Nota1, Nota2, NotaTrabalho, Media : double;
begin
  if (dbeNota1.text <> '')and (dbeNota2.text <> '') and (dbeNotaTrabalho.text <> '') then
  begin
    Nota1 := StrToFloat(dbeNota1.Text);
    Nota2 := StrToFloat(dbeNota1.Text);
    NotaTrabalho := StrToFloat(dbeNota1.Text);
    Media := (Nota1 + Nota2 + NotaTrabalho)/3;
    dbeMedia.Text := FloatToStr(Media);

    if (((StrToFloat(dbeMedia.Text) >= 1) and
    (StrToFloat(dbeMedia.Text) < 7))) then
    begin
      dbeSituacao.Text := 'REPROVADO';
    end
    else if (StrToFloat(dbeMedia.Text) >= 7) then
    begin
      dbeSituacao.Text := 'APROVADO';
    end;
  end;
  inherited;
end;

procedure TfrmLancamentoDeNotas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmLancamentoDeNotas := nil;
end;

procedure TfrmLancamentoDeNotas.FormCreate(Sender: TObject);
begin
  inherited;
  FdmPrincipalDisciplinasAlunos   := TdmPrincipal.Create(self);
end;

procedure TfrmLancamentoDeNotas.FormShow(Sender: TObject);
begin
  inherited;
  dsLookupDisciplinaAluno.DataSet := FdmPrincipalDisciplinasAlunos.cdsDisciplinasAlunos;
  dsLookupDisciplinaAluno.DataSet.Open;

  FdmPrincipalDisciplinasAlunos.cdsDisciplinasAlunos.AfterScroll := HandleAfterScroll;
end;

procedure TfrmLancamentoDeNotas.HandleAfterScroll(DataSet: TDataSet);
begin
    dsDados.DataSet.FieldByName('ID_ALUNO_DISCIPLINA').AsInteger :=
    dsLookupDisciplinaAluno.DataSet.FieldByName('ID').AsInteger;
end;

function TfrmLancamentoDeNotas.ValidaDados: Boolean;
begin
  Result := False;

  if (dbeCodigoDisciplinaAluno.Text = '') or
     (StrToInt(dbeCodigoDisciplinaAluno.Text) <> FdmPrincipalDisciplinasAlunos.cdsDisciplinasAlunosID.AsInteger) then
  begin
    Showmensagewarning('Codigo da disciplina incorreto ou não informado.');
    dblDisciplinaAluno.SetFocus;
    Exit;
  end;
  if ExisteNotaDisciplina then
  begin
    Showmensagewarning('Disciplina ja cadastrada.');
    dblDisciplinaAluno.SetFocus;
    Exit;
  end;
  Result := inherited ValidaDados;
end;
function TfrmLancamentoDeNotas.ExisteNotaDisciplina: boolean;
begin
 dmPrincipal.qrAuxiliar.Close;
  try
    dmPrincipal.qrAuxiliar.SQL.Text := 'SELECT ID FROM NOTAS_ALUNOS '+
                                       'WHERE ID_ALUNO_DISCIPLINA = :ID_ALUNO_DISCIPLINA ';

    dmPrincipal.qrAuxiliar.ParamByName('ID_ALUNO_DISCIPLINA').AsInteger :=
      FdmPrincipalDisciplinasAlunos.cdsDisciplinasAlunosID.AsInteger;

    dmPrincipal.qrAuxiliar.Open;

    Result := not(dmPrincipal.qrAuxiliar.IsEmpty);
  finally
    dmPrincipal.qrAuxiliar.Close;
  end;
end;
end.
