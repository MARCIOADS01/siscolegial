unit uMovimentoAlunosDisciplinas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroBase, Data.DB, Vcl.Grids, FireDAC.Stan.Param,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, udmPrincipal,uMensagemUtils;

type
  TfrmDisciplinasDoAluno = class(TfrmCadastroBase)
    Label1: TLabel;
    dbeCodigoAlunoDisciplina: TDBEdit;
    Label2: TLabel;
    dbeCodigoAluno: TDBEdit;
    dbeCodigoDisciplinaProfessor: TDBEdit;
    dsLookupAluno: TDataSource;
    dsLookupDisciplinaProfessor: TDataSource;
    dblAluno: TDBLookupComboBox;
    dbgDisciplinasProfessores: TDBGrid;
    pnlDisciplinaAluno: TPanel;
    Label3: TLabel;
    dblDisciplinaProfessor: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FdmPrincipalAlunos: TdmPrincipal;
    FdmPrincipalDisciplinasProfessores: TdmPrincipal;

    procedure HandleAfterScroll(DataSet: TDataSet);
  protected
   function ValidaDados: Boolean; override;
   function ExisteAlunoDisciplina: boolean;
  public
    { Public declarations }
  end;

var
  frmDisciplinasDoAluno: TfrmDisciplinasDoAluno;

implementation

{$R *.dfm}

procedure TfrmDisciplinasDoAluno.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    frmDisciplinasDoAluno := nil;
end;

procedure TfrmDisciplinasDoAluno.FormCreate(Sender: TObject);
begin
  inherited;
  FdmPrincipalAlunos        := TdmPrincipal.Create(self);
  FdmPrincipalDisciplinasProfessores   := TdmPrincipal.Create(self);
end;

procedure TfrmDisciplinasDoAluno.FormShow(Sender: TObject);
begin
  inherited;
  dsLookupAluno.DataSet := FdmPrincipalAlunos.cdsAlunos;
  dsLookupAluno.DataSet.Open;

  dsLookupDisciplinaProfessor.DataSet := FdmPrincipalDisciplinasProfessores.cdsDisciplinasProfessores;
  dsLookupDisciplinaProfessor.DataSet.Open;
  FdmPrincipalDisciplinasProfessores.cdsDisciplinasProfessores.AfterScroll := HandleAfterScroll;
end;

procedure TfrmDisciplinasDoAluno.HandleAfterScroll(DataSet: TDataSet);
begin
  dsDados.DataSet.FieldByName('ID_DISCIPLINA_PROFESSOR').AsInteger :=
    dsLookupDisciplinaProfessor.DataSet.FieldByName('ID').AsInteger;
end;

function TfrmDisciplinasDoAluno.ValidaDados: Boolean;
begin
  Result := False;

  if (dbeCodigoAluno.Text = '') or
     (StrToInt(dbeCodigoAluno.Text) <> FdmPrincipalAlunos.cdsAlunosID.AsInteger) then
  begin
    Showmensagewarning('Codigo do aluno incorreto ou não informado.');
    dblAluno.SetFocus;
    Exit;
  end;

  if (dbeCodigoDisciplinaProfessor.Text = '') or
     (StrToInt(dbeCodigoDisciplinaProfessor.Text) <> FdmPrincipalDisciplinasProfessores.cdsDisciplinasProfessoresID.AsInteger) then
  begin
    Showmensagewarning('Codigo da disciplina incorreto ou não informado.');
    dblDisciplinaProfessor.SetFocus;
    Exit;
  end;

  if ExisteAlunoDisciplina then
  begin
    Showmensagewarning('Aluno e disciplina ja cadastrados.');
    dblAluno.SetFocus;
    Exit;
  end;

  Result := inherited ValidaDados;
end;

function TfrmDisciplinasDoAluno.ExisteAlunoDisciplina: boolean;
begin
 dmPrincipal.qrAuxiliar.Close;
  try
    dmPrincipal.qrAuxiliar.SQL.Text := 'SELECT ID FROM DISCIPLINAS_ALUNOS '+
                                       'WHERE ID_ALUNO = :ID_ALUNO '+
                                       'AND ID_DISCIPLINA_PROFESSOR = :ID_DISCIPLINA_PROFESSOR';

    dmPrincipal.qrAuxiliar.ParamByName('ID_ALUNO').AsInteger :=
      FdmPrincipalAlunos.cdsAlunosID.AsInteger;
    dmPrincipal.qrAuxiliar.ParamByName('ID_DISCIPLINA_PROFESSOR').AsInteger :=
      FdmPrincipalDisciplinasProfessores.cdsDisciplinasProfessoresID.AsInteger;

    dmPrincipal.qrAuxiliar.Open;

    Result := not(dmPrincipal.qrAuxiliar.IsEmpty);
  finally
    dmPrincipal.qrAuxiliar.Close;
  end;
end;

end.
