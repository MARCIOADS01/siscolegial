unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    mnMenuPrincipal: TMainMenu;
    mnCadastros: TMenuItem;
    mnMovimentacoes: TMenuItem;
    mnRelatorios: TMenuItem;
    mnSair: TMenuItem;
    stbInformacoes: TStatusBar;
    tmrAtualizaHora: TTimer;
    mnLancamentoNota: TMenuItem;
    mnDisciplinas: TMenuItem;
    mnProfessores: TMenuItem;
    mnAlunos: TMenuItem;
    mnRelatorioNotasLancadas: TMenuItem;
    mnRelatoriosAlunosPorProfessores: TMenuItem;
    mnProfessoresPorDisciplinas: TMenuItem;
    mnDisciplinasDoAluno: TMenuItem;
    N2: TMenuItem;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mnSairClick(Sender: TObject);
    procedure stbInformacoesResize(Sender: TObject);
    procedure tmrAtualizaHoraTimer(Sender: TObject);
    procedure mnDisciplinasClick(Sender: TObject);
    procedure mnProfessoresClick(Sender: TObject);
    procedure mnAlunosClick(Sender: TObject);
    procedure mnProfessoresPorDisciplinasClick(Sender: TObject);
    procedure mnDisciplinasDoAlunoClick(Sender: TObject);
    procedure mnLancamentoNotaClick(Sender: TObject);
    procedure mnRelatoriosAlunosPorProfessoresClick(Sender: TObject);
    procedure mnRelatorioNotasLancadasClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadastroAlunos, uCadastroDisciplinas, uCadastroProfessores,
  uMovimentoProfessoresDisciplinas, uMovimentoAlunosDisciplinas,
  uLancamentoNotas, uRelatorioAlunosProfessores, uRelatorioNotasLancada;

procedure TfrmPrincipal.stbInformacoesResize(Sender: TObject);
begin
  stbInformacoes.Panels[0].Width := stbInformacoes.Width div 4;
  stbInformacoes.Panels[1].Width := stbInformacoes.Width div 4;
  stbInformacoes.Panels[2].Width := stbInformacoes.Width div 4;
  stbInformacoes.Panels[3].Width := stbInformacoes.Width div 4;
end;

procedure TfrmPrincipal.tmrAtualizaHoraTimer(Sender: TObject);
var
  KS: TKeyboardState;
begin
  stbinformacoes.Panels [2].Text := 'Data:' + ' ' + FormatDateTime ('dddd","dd" de "mmmm" de "yyyy',now);// para data
  stbinformacoes.Panels [3].Text := 'Hora:' + ' ' + FormatDateTime ('hh:mm:ss',Now);//para hora

  GetKeyboardState(Ks);

  if Odd(Ks[VK_CAPITAL]) then
  begin
    stbInformacoes.Panels[0].Text := 'CAPS LOCK'
  end
  else
    stbInformacoes.Panels[0].Text := '';

  If Odd( Ks[VK_NUMLOCK]) then
  begin
    stbInformacoes.Panels[1].Text := 'NUM LOCK'
  end
  else
    stbInformacoes.Panels[1].Text := '';
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Self.Close;
end;

procedure TfrmPrincipal.mnAlunosClick(Sender: TObject);
begin
  if frmCadastroAluno = nil then
  begin
    frmCadastroAluno := TfrmCadastroAluno.Create(Self);
    frmCadastroAluno.Show;
  end;
end;

procedure TfrmPrincipal.mnDisciplinasDoAlunoClick(Sender: TObject);
begin
if frmDisciplinasDoAluno = nil then
  begin
    frmDisciplinasDoAluno := TfrmDisciplinasDoAluno.Create(Self);
    frmDisciplinasDoAluno.Show;
  end;
end;

procedure TfrmPrincipal.mnDisciplinasClick(Sender: TObject);
begin
  if frmCadastroDisciplina = nil then
  begin
    frmCadastroDisciplina := TfrmCadastroDisciplina.Create(Self);
    frmCadastroDisciplina.Show;
  end;
end;

procedure TfrmPrincipal.mnLancamentoNotaClick(Sender: TObject);
begin
if frmLancamentoDeNotas = nil then
  begin
    frmLancamentoDeNotas := TfrmLancamentoDeNotas.Create(Self);
    frmLancamentoDeNotas.Show;
  end;
end;

procedure TfrmPrincipal.mnProfessoresClick(Sender: TObject);
begin
  if frmCadastroProfessor = nil then
  begin
    frmCadastroProfessor := TfrmCadastroProfessor.Create(Self);
    frmCadastroProfessor.Show;
  end;
end;

procedure TfrmPrincipal.mnProfessoresPorDisciplinasClick(Sender: TObject);
begin
if frmProfessoresPorDisciplinas = nil then
  begin
    frmProfessoresPorDisciplinas := TfrmProfessoresPorDisciplinas.Create(Self);
    frmProfessoresPorDisciplinas.Show;
  end;
end;

procedure TfrmPrincipal.mnRelatorioNotasLancadasClick(Sender: TObject);
begin
  if frmRelatorioNotasLancadas = nil then
  begin
    frmRelatorioNotasLancadas:= TfrmRelatorioNotasLancadas.Create(Self);
    frmRelatorioNotasLancadas.Show;
  end;
end;

procedure TfrmPrincipal.mnRelatoriosAlunosPorProfessoresClick(Sender: TObject);
begin
  if frmRelatorioAlunosProfessores = nil then
  begin
    frmRelatorioAlunosProfessores := TfrmRelatorioAlunosProfessores.Create(Self);
    frmRelatorioAlunosProfessores.Show;
  end;
end;

procedure TfrmPrincipal.mnSairClick(Sender: TObject);
begin
  Self.Close;
end;

end.
