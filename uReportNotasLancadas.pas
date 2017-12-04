unit uReportNotasLancadas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.StrUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormBase, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  RLReport, Data.DB, Datasnap.DBClient, Datasnap.Provider, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, udmPrincipal, uRelatorioNotasLancada;

type
  TfrmReportNotasLancadas = class(TfrmFormBase)
    rlNotasLancadas: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    qrRelNotasAlunos: TFDQuery;
    dspRelNotasAlunos: TDataSetProvider;
    cdsRelNotasAlunos: TClientDataSet;
    dsRelNotasAlunos: TDataSource;
    cdsRelNotasAlunosNOME: TStringField;
    cdsRelNotasAlunosDISCIPLINA: TStringField;
    cdsRelNotasAlunosN1: TCurrencyField;
    cdsRelNotasAlunosN2: TCurrencyField;
    cdsRelNotasAlunosTRABALHO: TCurrencyField;
    cdsRelNotasAlunosMEDIA: TCurrencyField;
    cdsRelNotasAlunosSITUACAO: TStringField;
    RLGroup1: TRLGroup;
    RLBand3: TRLBand;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    procedure rlNotasLancadasBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FItemSelecionado: integer;
    { Private declarations }
  public
    property ItemSelecionado: integer read FItemSelecionado write FItemSelecionado;
    { Public declarations }
  end;

var
  frmReportNotasLancadas: TfrmReportNotasLancadas;

implementation

{$R *.dfm}

const
  SQL_REL = 'SELECT AL.NOME,' +
                  ' DISCI.NOME AS DISCIPLINA,' +
                  ' NOTA.NOTA_PRIMEIRO_PERIODO AS N1,' +
                  ' NOTA.NOTA_SEGUNDO_PERIODO AS N2,' +
                  ' NOTA.NOTA_TRABALHO AS TRABALHO,' +
                  ' NOTA.NOTA_MEDIA AS MEDIA,' +
                  ' NOTA.SITUACAO' +
' FROM NOTAS_ALUNOS AS NOTA' +
' INNER JOIN DISCIPLINAS_ALUNOS AS DISCA ON DISCA.ID = NOTA.ID_ALUNO_DISCIPLINA' +
' INNER JOIN DISCIPLINAS_PROFESSORES AS DISCP ON DISCP.ID = DISCA.ID_DISCIPLINA_PROFESSOR' +
' INNER JOIN PROFESSORES AS PROF  ON PROF.ID = DISCP.ID_PROFESSOR' +
' INNER JOIN DISCIPLINAS AS DISCI ON DISCI.ID = DISCP.ID_DISCIPLINA' +
' INNER JOIN ALUNOS AS AL ON AL.ID = DISCA.ID_ALUNO';



procedure TfrmReportNotasLancadas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmReportNotasLancadas := nil;
end;

procedure TfrmReportNotasLancadas.rlNotasLancadasBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
const
  TODOS = 0;
  APROVADOS = 1;
  REPROVADOS = 2;
begin
  inherited;

  case ItemSelecionado of
    TODOS:
    begin
      cdsRelNotasAlunos.close;
      qrRelNotasAlunos.SQL.Clear;
      qrRelNotasAlunos.SQL.Text := SQL_REL;
      qrRelNotasAlunos.SQL.Text := qrRelNotasAlunos.SQL.Text;
    end;

    APROVADOS:
    begin
      cdsRelNotasAlunos.close;
      qrRelNotasAlunos.SQL.Clear;
      qrRelNotasAlunos.SQL.Text := SQL_REL +
      ' WHERE NOTA.SITUACAO = ' + QuotedStr('APROVADO');
    end;

    REPROVADOS:
    begin
      cdsRelNotasAlunos.close;
      qrRelNotasAlunos.SQL.Clear;
      qrRelNotasAlunos.SQL.Text := SQL_REL +
      ' WHERE NOTA.SITUACAO = ' + QuotedStr('REPROVADO');
    end;
  end;

  qrRelNotasAlunos.SQL.Text := qrRelNotasAlunos.SQL.Text + ' ORDER BY AL.NOME';
  cdsRelNotasAlunos.Open;
end;

end.
