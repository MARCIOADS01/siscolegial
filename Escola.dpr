program Escola;

uses
  Vcl.Forms,
  uFormBase in 'uFormBase.pas' {frmFormBase},
  udmPrincipal in 'udmPrincipal.pas' {dmPrincipal: TDataModule},
  uMensagemUtils in 'uMensagemUtils.pas',
  uCadastroBase in 'uCadastroBase.pas' {frmCadastroBase},
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uCadastroAlunos in 'uCadastroAlunos.pas' {frmCadastroAluno},
  uCadastroProfessores in 'uCadastroProfessores.pas' {frmCadastroProfessor},
  uCadastroDisciplinas in 'uCadastroDisciplinas.pas' {frmCadastroDisciplina},
  uMovimentoProfessoresDisciplinas in 'uMovimentoProfessoresDisciplinas.pas' {frmProfessoresPorDisciplinas},
  uMovimentoAlunosDisciplinas in 'uMovimentoAlunosDisciplinas.pas' {frmDisciplinasDoAluno},
  uLancamentoNotas in 'uLancamentoNotas.pas' {frmLancamentoDeNotas},
  uRelatorioNotasLancada in 'uRelatorioNotasLancada.pas' {frmRelatorioNotasLancadas},
  uRelatorioAlunosProfessores in 'uRelatorioAlunosProfessores.pas' {frmRelatorioAlunosProfessores},
  uReportAlunosProfessores in 'uReportAlunosProfessores.pas' {frmReportAlunosProfessores},
  uReportNotasLancadas in 'uReportNotasLancadas.pas' {frmReportNotasLancadas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'SisColegial';
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
