unit uMovimentoProfessoresDisciplinas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroBase, Data.DB, Vcl.Grids, FireDAC.Stan.Param,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, udmPrincipal;

type
  TfrmProfessoresPorDisciplinas = class(TfrmCadastroBase)
    Label1: TLabel;
    dbeCodigoDisciplinaProfessor: TDBEdit;
    Label2: TLabel;
    dbeCodigoDisciplina: TDBEdit;
    Label3: TLabel;
    dbeCodigoProfessor: TDBEdit;
    dsLookupDisciplina: TDataSource;
    dsLookupProfessor: TDataSource;
    dblDisciplina: TDBLookupComboBox;
    dblProfessor: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FdmPrincipalProfessores: TdmPrincipal;
    FdmPrincipalDisciplinas: TdmPrincipal;
  protected
    function ValidaDados: Boolean; override;
    function ExisteDisciplinaProfessor: boolean;
  public
    { Public declarations }
  end;

var
  frmProfessoresPorDisciplinas: TfrmProfessoresPorDisciplinas;

implementation

{$R *.dfm}

uses
  uMensagemUtils;

procedure TfrmProfessoresPorDisciplinas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmProfessoresPorDisciplinas := nil;
end;

procedure TfrmProfessoresPorDisciplinas.FormCreate(Sender: TObject);
begin
  inherited;
  FdmPrincipalDisciplinas := TdmPrincipal.Create(Self);
  FdmPrincipalProfessores := TdmPrincipal.Create(Self);
end;

procedure TfrmProfessoresPorDisciplinas.FormShow(Sender: TObject);
begin
  inherited;
  dsLookupDisciplina.DataSet := FdmPrincipalDisciplinas.cdsDisciplinas;
  dsLookupDisciplina.DataSet.Open;

  dsLookupProfessor.DataSet  := FdmPrincipalProfessores.cdsProfessores;
  dsLookupProfessor.DataSet.Open;
end;

function TfrmProfessoresPorDisciplinas.ValidaDados: Boolean;
begin
  Result := False;

  if (dbeCodigoDisciplina.Text = '') or
     (StrToInt(dbeCodigoDisciplina.Text) <> FdmPrincipalDisciplinas.cdsDisciplinasID.AsInteger) then
  begin
    Showmensagewarning('Codigo da disciplina incorreto ou não informado.');
    dblDisciplina.SetFocus;
    Exit;
  end;

  if (dbeCodigoProfessor.Text = '') or
     (StrToInt(dbeCodigoProfessor.Text) <> FdmPrincipalProfessores.cdsProfessoresID.AsInteger) then
  begin
    Showmensagewarning('Codigo do professor incorreto ou não informado.');
    dblProfessor.SetFocus;
    Exit;
  end;

  if ExisteDisciplinaProfessor then
  begin
    Showmensagewarning('Professor e disciplina ja cadastrados.');
    dblDisciplina.SetFocus;
    Exit;
  end;

  Result := inherited ValidaDados;
end;

function TfrmProfessoresPorDisciplinas.ExisteDisciplinaProfessor: boolean;
begin
  dmPrincipal.qrAuxiliar.Close;
  try
    dmPrincipal.qrAuxiliar.SQL.Text := 'SELECT ID FROM DISCIPLINAS_PROFESSORES '+
                                       'WHERE ID_DISCIPLINA = :ID_DISCIPLINA '+
                                       'AND ID_PROFESSOR = :ID_PROFESSOR';

    dmPrincipal.qrAuxiliar.ParamByName('ID_DISCIPLINA').AsInteger :=
      FdmPrincipalDisciplinas.cdsDisciplinasID.AsInteger;
    dmPrincipal.qrAuxiliar.ParamByName('ID_PROFESSOR').AsInteger :=
      FdmPrincipalProfessores.cdsProfessoresID.AsInteger;

    dmPrincipal.qrAuxiliar.Open;

    Result := not(dmPrincipal.qrAuxiliar.IsEmpty);
  finally
    dmPrincipal.qrAuxiliar.Close;
  end;
end;

end.
