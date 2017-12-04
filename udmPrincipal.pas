unit udmPrincipal;

interface

uses
  System.SysUtils, System.Classes, Data.DBXFirebird, Data.DB, Data.SqlExpr,
  Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, Vcl.Menus, Vcl.Forms,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmPrincipal = class(TDataModule)
    FDConexao: TFDConnection;
    qrAlunos: TFDQuery;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    qrProfessores: TFDQuery;
    qrDisciplinas: TFDQuery;
    qrAlunosID: TIntegerField;
    qrAlunosNOME: TStringField;
    qrProfessoresID: TIntegerField;
    qrProfessoresNOME: TStringField;
    qrDisciplinasID: TIntegerField;
    qrDisciplinasNOME: TStringField;
    dspAlunos: TDataSetProvider;
    cdsAlunos: TClientDataSet;
    dspProfessores: TDataSetProvider;
    dspDisciplinas: TDataSetProvider;
    cdsProfessores: TClientDataSet;
    cdsDisciplinas: TClientDataSet;
    cdsAlunosID: TIntegerField;
    cdsAlunosNOME: TStringField;
    cdsDisciplinasID: TIntegerField;
    cdsDisciplinasNOME: TStringField;
    cdsProfessoresID: TIntegerField;
    cdsProfessoresNOME: TStringField;
    qrDisciplinasAlunos: TFDQuery;
    qrDisciplinasProfessores: TFDQuery;
    qrNotasAlunos: TFDQuery;
    dspDisciplinasAlunos: TDataSetProvider;
    cdsDisciplinasAlunos: TClientDataSet;
    dspNotasAlunos: TDataSetProvider;
    cdsDisciplinasProfessores: TClientDataSet;
    cdsNotasAlunos: TClientDataSet;
    qrDisciplinasAlunosID: TIntegerField;
    qrDisciplinasAlunosID_ALUNO: TIntegerField;
    qrDisciplinasAlunosID_DISCIPLINA_PROFESSOR: TIntegerField;
    qrDisciplinasProfessoresID: TIntegerField;
    qrDisciplinasProfessoresID_DISCIPLINA: TIntegerField;
    qrDisciplinasProfessoresID_PROFESSOR: TIntegerField;
    cdsDisciplinasAlunosID: TIntegerField;
    cdsDisciplinasAlunosID_ALUNO: TIntegerField;
    cdsDisciplinasAlunosID_DISCIPLINA_PROFESSOR: TIntegerField;
    cdsDisciplinasProfessoresID: TIntegerField;
    cdsDisciplinasProfessoresID_DISCIPLINA: TIntegerField;
    cdsDisciplinasProfessoresID_PROFESSOR: TIntegerField;
    dspDisciplinasProfessores: TDataSetProvider;
    qrDisciplinasProfessoresDISCIPLINA: TStringField;
    qrDisciplinasProfessoresPROFESSOR: TStringField;
    cdsDisciplinasProfessoresDISCIPLINA: TStringField;
    cdsDisciplinasProfessoresPROFESSOR: TStringField;
    qrDisciplinasAlunosNOME: TStringField;
    qrDisciplinasAlunosDISCIPLINA: TStringField;
    qrDisciplinasAlunosPROFESSOR: TStringField;
    cdsDisciplinasAlunosDISCIPLINA: TStringField;
    cdsDisciplinasAlunosPROFESSOR: TStringField;
    cdsDisciplinasAlunosNOME: TStringField;
    qrNotasAlunosID: TIntegerField;
    qrNotasAlunosNOME: TStringField;
    qrNotasAlunosID_ALUNO_DISCIPLINA: TIntegerField;
    qrNotasAlunosDISCIPLINA: TStringField;
    cdsNotasAlunosID: TIntegerField;
    cdsNotasAlunosNOME: TStringField;
    cdsNotasAlunosID_ALUNO_DISCIPLINA: TIntegerField;
    cdsNotasAlunosDISCIPLINA: TStringField;
    qrNotasAlunosNOTA_PRIMEIRO_PERIODO: TCurrencyField;
    qrNotasAlunosNOTA_SEGUNDO_PERIODO: TCurrencyField;
    cdsNotasAlunosNOTA_PRIMEIRO_PERIODO: TCurrencyField;
    cdsNotasAlunosNOTA_SEGUNDO_PERIODO: TCurrencyField;
    qrNotasAlunosNOTA_TRABALHO: TCurrencyField;
    qrNotasAlunosNOTA_MEDIA: TCurrencyField;
    cdsNotasAlunosNOTA_TRABALHO: TCurrencyField;
    cdsNotasAlunosNOTA_MEDIA: TCurrencyField;
    qrNotasAlunosSITUACAO: TStringField;
    cdsNotasAlunosSITUACAO: TStringField;
    qrAuxiliar: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure cdsAlunosAfterDelete(DataSet: TDataSet);
    procedure cdsAlunosAfterPost(DataSet: TDataSet);
    procedure cdsProfessoresAfterDelete(DataSet: TDataSet);
    procedure cdsProfessoresAfterPost(DataSet: TDataSet);
    procedure cdsDisciplinasAfterDelete(DataSet: TDataSet);
    procedure cdsDisciplinasAfterPost(DataSet: TDataSet);
    procedure cdsDisciplinasProfessoresAfterDelete(DataSet: TDataSet);
    procedure cdsDisciplinasProfessoresAfterPost(DataSet: TDataSet);
    procedure cdsDisciplinasAlunosAfterDelete(DataSet: TDataSet);
    procedure cdsDisciplinasAlunosAfterPost(DataSet: TDataSet);
    procedure cdsNotasAlunosAfterPost(DataSet: TDataSet);
    procedure cdsNotasAlunosAfterDelete(DataSet: TDataSet);
    procedure cdsDisciplinasProfessoresReconcileError(
      DataSet: TCustomClientDataSet; E: EReconcileError;
      UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure cdsNotasAlunosReconcileError(
      DataSet: TCustomClientDataSet; E: EReconcileError;
       UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure cdsDisciplinasReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsProfessoresReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsAlunosReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsDisciplinasAlunosReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);

  private
   procedure Commit(aClient: Tclientdataset);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

uses
  uMensagemUtils, System.StrUtils;

const
  FK_ERROR = 'FOREIGN KEY';

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmPrincipal.cdsAlunosAfterDelete(DataSet: TDataSet);
begin
  Commit(cdsAlunos);
end;

procedure TdmPrincipal.cdsAlunosAfterPost(DataSet: TDataSet);
begin
   Commit(cdsAlunos);
end;

procedure TdmPrincipal.cdsAlunosReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  if AnsiContainsText(E.Message, FK_ERROR) then
  begin
    Showmensagewarning('Esse registro possui dependencias. Exclusão não permitida.');
    Action := Datasnap.DBClient.raCancel;
  end;
end;

procedure TdmPrincipal.cdsDisciplinasAfterDelete(DataSet: TDataSet);
begin
  Commit(cdsDisciplinas);
end;

procedure TdmPrincipal.cdsDisciplinasAfterPost(DataSet: TDataSet);
begin
  Commit(cdsDisciplinas);
end;

procedure TdmPrincipal.cdsDisciplinasAlunosAfterDelete(DataSet: TDataSet);
begin
  Commit(cdsDisciplinasAlunos);
end;

procedure TdmPrincipal.cdsDisciplinasAlunosAfterPost(DataSet: TDataSet);
begin
  Commit(cdsDisciplinasAlunos);
end;

procedure TdmPrincipal.cdsDisciplinasAlunosReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
    if AnsiContainsText(E.Message, FK_ERROR) then
  begin
    Showmensagewarning('Esse registro possui dependencias. Exclusão não permitida.');
    Action := Datasnap.DBClient.raCancel;
  end;
end;

procedure TdmPrincipal.cdsDisciplinasProfessoresAfterDelete(DataSet: TDataSet);
begin
  Commit(cdsDisciplinasProfessores);
end;

procedure TdmPrincipal.cdsDisciplinasProfessoresAfterPost(DataSet: TDataSet);
begin
  Commit(cdsDisciplinasProfessores);
end;

procedure TdmPrincipal.cdsDisciplinasProfessoresReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  if AnsiContainsText(E.Message, FK_ERROR) then
  begin
    Showmensagewarning('Esse registro possui dependencias. Exclusão não permitida.');
    Action := Datasnap.DBClient.raCancel;
  end;
end;

procedure TdmPrincipal.cdsDisciplinasReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
    if AnsiContainsText(E.Message, FK_ERROR) then
  begin
    Showmensagewarning('Esse registro possui dependencias. Exclusão não permitida.');
    Action := Datasnap.DBClient.raCancel;
  end;
end;

procedure TdmPrincipal.cdsNotasAlunosAfterDelete(DataSet: TDataSet);
begin
  Commit(cdsNotasAlunos);
end;

procedure TdmPrincipal.cdsNotasAlunosAfterPost(DataSet: TDataSet);
begin
  Commit(cdsNotasAlunos);
end;

procedure TdmPrincipal.cdsNotasAlunosReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  raise Exception.Create(E.Message);
end;

procedure TdmPrincipal.cdsProfessoresAfterDelete(DataSet: TDataSet);
begin
  Commit(cdsProfessores);
end;

procedure TdmPrincipal.cdsProfessoresAfterPost(DataSet: TDataSet);
begin
  Commit(cdsProfessores);
end;

procedure TdmPrincipal.cdsProfessoresReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  if AnsiContainsText(E.Message, FK_ERROR) then
  begin
    Showmensagewarning('Esse registro possui dependencias. Exclusão não permitida.');
    Action := Datasnap.DBClient.raCancel;
  end;
end;

procedure TdmPrincipal.Commit(aClient: Tclientdataset);
begin
  aClient.ApplyUpdates(-1);
end;

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
var
  PathDB: string;
begin
  PathDB := ExtractFilePath(Application.ExeName) + '..\..\Db\ESCOLA.FDB';
  FDConexao.Params.Values['Database'] := PathDB;
  FDConexao.Open;
end;

procedure TdmPrincipal.DataModuleDestroy(Sender: TObject);
begin
  FDConexao.Close;
end;

end.
