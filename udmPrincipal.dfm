object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 444
  Width = 796
  object FDConexao: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 248
    Top = 16
  end
  object qrAlunos: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'SELECT * FROM ALUNOS')
    Left = 16
    Top = 87
    object qrAlunosID: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qrAlunosNOME: TStringField
      DisplayLabel = 'Nome do aluno'
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 336
    Top = 16
  end
  object qrProfessores: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'SELECT * FROM PROFESSORES')
    Left = 96
    Top = 87
    object qrProfessoresID: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qrProfessoresNOME: TStringField
      DisplayLabel = 'Nome do professor'
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
  end
  object qrDisciplinas: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'SELECT * FROM DISCIPLINAS')
    Left = 176
    Top = 87
    object qrDisciplinasID: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qrDisciplinasNOME: TStringField
      DisplayLabel = 'Nome da disciplina'
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
  end
  object dspAlunos: TDataSetProvider
    DataSet = qrAlunos
    Options = [poIncFieldProps, poPropogateChanges, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 16
    Top = 144
  end
  object cdsAlunos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAlunos'
    AfterPost = cdsAlunosAfterPost
    AfterDelete = cdsAlunosAfterDelete
    OnReconcileError = cdsAlunosReconcileError
    Left = 16
    Top = 200
    object cdsAlunosID: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object cdsAlunosNOME: TStringField
      DisplayLabel = 'Nome do aluno'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
  end
  object dspProfessores: TDataSetProvider
    DataSet = qrProfessores
    Options = [poIncFieldProps, poPropogateChanges, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 144
  end
  object dspDisciplinas: TDataSetProvider
    DataSet = qrDisciplinas
    Options = [poIncFieldProps, poPropogateChanges, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 176
    Top = 144
  end
  object cdsProfessores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProfessores'
    AfterPost = cdsProfessoresAfterPost
    AfterDelete = cdsProfessoresAfterDelete
    OnReconcileError = cdsProfessoresReconcileError
    Left = 96
    Top = 200
    object cdsProfessoresID: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object cdsProfessoresNOME: TStringField
      DisplayLabel = 'Nome do professor'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
  end
  object cdsDisciplinas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDisciplinas'
    AfterPost = cdsDisciplinasAfterPost
    AfterDelete = cdsDisciplinasAfterDelete
    OnReconcileError = cdsDisciplinasReconcileError
    Left = 176
    Top = 200
    object cdsDisciplinasID: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object cdsDisciplinasNOME: TStringField
      DisplayLabel = 'Nome da disciplina'
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
  end
  object qrDisciplinasAlunos: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'SELECT DISCA.ID,'
      '       DISCA.ID_ALUNO,'
      '       AL.NOME,'
      '       DISCA.ID_DISCIPLINA_PROFESSOR,'
      '       DISCI.NOME AS DISCIPLINA,'
      '       PROF.NOME AS PROFESSOR'
      'FROM DISCIPLINAS_ALUNOS AS DISCA'
      
        'INNER JOIN DISCIPLINAS_PROFESSORES AS DISCP ON DISCP.ID = DISCA.' +
        'ID_DISCIPLINA_PROFESSOR'
      'INNER JOIN PROFESSORES AS PROF  ON PROF.ID = DISCP.ID_PROFESSOR'
      
        'INNER JOIN DISCIPLINAS AS DISCI ON DISCI.ID = DISCP.ID_DISCIPLIN' +
        'A'
      'INNER JOIN ALUNOS AS AL ON AL.ID = DISCA.ID_ALUNO'
      'ORDER BY AL.NOME')
    Left = 408
    Top = 88
    object qrDisciplinasAlunosID: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qrDisciplinasAlunosID_ALUNO: TIntegerField
      DisplayLabel = 'Codigo do aluno'
      FieldName = 'ID_ALUNO'
      Origin = 'ID_ALUNO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qrDisciplinasAlunosNOME: TStringField
      DisplayLabel = 'Aluno'
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 30
    end
    object qrDisciplinasAlunosID_DISCIPLINA_PROFESSOR: TIntegerField
      DisplayLabel = 'Codigo da disciplina'
      FieldName = 'ID_DISCIPLINA_PROFESSOR'
      Origin = 'ID_DISCIPLINA_PROFESSOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qrDisciplinasAlunosDISCIPLINA: TStringField
      DisplayLabel = 'Disciplina'
      FieldName = 'DISCIPLINA'
      Origin = 'DISCIPLINA'
      ProviderFlags = []
      Size = 30
    end
    object qrDisciplinasAlunosPROFESSOR: TStringField
      DisplayLabel = 'Professor'
      FieldName = 'PROFESSOR'
      Origin = 'PROFESSOR'
      ProviderFlags = []
      Size = 30
    end
  end
  object qrDisciplinasProfessores: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'SELECT DISCP.ID,'
      '       '#9'DISCP.ID_DISCIPLINA,'
      '       '#9'DISCI.NOME AS DISCIPLINA,'
      '       '#9'DISCP.ID_PROFESSOR,'
      '      '#9'PROF.NOME AS PROFESSOR'
      'FROM DISCIPLINAS_PROFESSORES AS  DISCP'
      'INNER JOIN PROFESSORES AS PROF  ON PROF.ID = DISCP.ID_PROFESSOR'
      
        'INNER JOIN DISCIPLINAS AS DISCI ON DISCI.ID = DISCP.ID_DISCIPLIN' +
        'A '
      'ORDER BY DISCP.ID'
      '')
    Left = 288
    Top = 88
    object qrDisciplinasProfessoresID: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qrDisciplinasProfessoresID_DISCIPLINA: TIntegerField
      DisplayLabel = 'Codigo da disciplina'
      FieldName = 'ID_DISCIPLINA'
      Origin = 'ID_DISCIPLINA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object qrDisciplinasProfessoresDISCIPLINA: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Disciplina'
      FieldName = 'DISCIPLINA'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qrDisciplinasProfessoresID_PROFESSOR: TIntegerField
      DisplayLabel = 'Codigo do professor'
      FieldName = 'ID_PROFESSOR'
      Origin = 'ID_PROFESSOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object qrDisciplinasProfessoresPROFESSOR: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Professor'
      FieldName = 'PROFESSOR'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object qrNotasAlunos: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'SELECT NOTA.ID,'
      '       AL.NOME,'
      '       NOTA.ID_ALUNO_DISCIPLINA,'
      '       DISCI.NOME AS DISCIPLINA,'
      '       NOTA.NOTA_PRIMEIRO_PERIODO,'
      '       NOTA.NOTA_SEGUNDO_PERIODO,'
      '       NOTA.NOTA_TRABALHO,'
      '       NOTA.NOTA_MEDIA,'
      '       NOTA.SITUACAO'
      'FROM NOTAS_ALUNOS AS NOTA'
      
        'INNER JOIN DISCIPLINAS_ALUNOS AS DISCA ON DISCA.ID = NOTA.ID_ALU' +
        'NO_DISCIPLINA'
      
        'INNER JOIN DISCIPLINAS_PROFESSORES AS DISCP ON DISCP.ID = DISCA.' +
        'ID_DISCIPLINA_PROFESSOR'
      'INNER JOIN PROFESSORES AS PROF  ON PROF.ID = DISCP.ID_PROFESSOR'
      
        'INNER JOIN DISCIPLINAS AS DISCI ON DISCI.ID = DISCP.ID_DISCIPLIN' +
        'A'
      'INNER JOIN ALUNOS AS AL ON AL.ID = DISCA.ID_ALUNO'
      'ORDER BY AL.NOME')
    Left = 520
    Top = 88
    object qrNotasAlunosID: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qrNotasAlunosID_ALUNO_DISCIPLINA: TIntegerField
      DisplayLabel = 'Codigo da disciplina'
      FieldName = 'ID_ALUNO_DISCIPLINA'
      Origin = 'ID_ALUNO_DISCIPLINA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qrNotasAlunosNOME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Aluno'
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qrNotasAlunosDISCIPLINA: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Disciplina'
      FieldName = 'DISCIPLINA'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qrNotasAlunosNOTA_SEGUNDO_PERIODO: TCurrencyField
      DisplayLabel = 'N2'
      FieldName = 'NOTA_SEGUNDO_PERIODO'
      Origin = 'NOTA_SEGUNDO_PERIODO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,0.00'
    end
    object qrNotasAlunosNOTA_PRIMEIRO_PERIODO: TCurrencyField
      DisplayLabel = 'N1'
      FieldName = 'NOTA_PRIMEIRO_PERIODO'
      Origin = 'NOTA_PRIMEIRO_PERIODO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,0.00'
    end
    object qrNotasAlunosNOTA_TRABALHO: TCurrencyField
      DisplayLabel = 'Nota Trabalho'
      FieldName = 'NOTA_TRABALHO'
      Origin = 'NOTA_TRABALHO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,0.00'
    end
    object qrNotasAlunosNOTA_MEDIA: TCurrencyField
      DisplayLabel = 'Media'
      FieldName = 'NOTA_MEDIA'
      Origin = 'NOTA_MEDIA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,0.00'
    end
    object qrNotasAlunosSITUACAO: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
  end
  object dspDisciplinasAlunos: TDataSetProvider
    DataSet = qrDisciplinasAlunos
    Options = [poIncFieldProps, poPropogateChanges, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 408
    Top = 144
  end
  object cdsDisciplinasAlunos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDisciplinasAlunos'
    AfterPost = cdsDisciplinasAlunosAfterPost
    AfterDelete = cdsDisciplinasAlunosAfterDelete
    OnReconcileError = cdsDisciplinasAlunosReconcileError
    Left = 408
    Top = 200
    object cdsDisciplinasAlunosID: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object cdsDisciplinasAlunosID_ALUNO: TIntegerField
      DisplayLabel = 'Codigo do aluno'
      FieldName = 'ID_ALUNO'
      Origin = 'ID_ALUNO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsDisciplinasAlunosNOME: TStringField
      DisplayLabel = 'Aluno'
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 30
    end
    object cdsDisciplinasAlunosID_DISCIPLINA_PROFESSOR: TIntegerField
      DisplayLabel = 'Codigo da disciplina'
      FieldName = 'ID_DISCIPLINA_PROFESSOR'
      Origin = 'ID_DISCIPLINA_PROFESSOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsDisciplinasAlunosDISCIPLINA: TStringField
      DisplayLabel = 'Disciplina'
      FieldName = 'DISCIPLINA'
      Origin = 'DISCIPLINA'
      ProviderFlags = []
      Size = 30
    end
    object cdsDisciplinasAlunosPROFESSOR: TStringField
      DisplayLabel = 'Professor'
      FieldName = 'PROFESSOR'
      Origin = 'PROFESSOR'
      ProviderFlags = []
      Size = 30
    end
  end
  object dspNotasAlunos: TDataSetProvider
    DataSet = qrNotasAlunos
    Options = [poIncFieldProps, poPropogateChanges, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 520
    Top = 144
  end
  object cdsDisciplinasProfessores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDisciplinasProfessores'
    AfterPost = cdsDisciplinasProfessoresAfterPost
    AfterDelete = cdsDisciplinasProfessoresAfterDelete
    OnReconcileError = cdsDisciplinasProfessoresReconcileError
    Left = 288
    Top = 200
    object cdsDisciplinasProfessoresID: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object cdsDisciplinasProfessoresID_DISCIPLINA: TIntegerField
      DisplayLabel = 'Codigo da disciplina'
      FieldName = 'ID_DISCIPLINA'
      Origin = 'ID_DISCIPLINA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object cdsDisciplinasProfessoresDISCIPLINA: TStringField
      DisplayLabel = 'Disciplina'
      FieldName = 'DISCIPLINA'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object cdsDisciplinasProfessoresID_PROFESSOR: TIntegerField
      DisplayLabel = 'Codigo do professor'
      FieldName = 'ID_PROFESSOR'
      Origin = 'ID_PROFESSOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      Visible = False
    end
    object cdsDisciplinasProfessoresPROFESSOR: TStringField
      DisplayLabel = 'Professor'
      FieldName = 'PROFESSOR'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object cdsNotasAlunos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNotasAlunos'
    AfterPost = cdsNotasAlunosAfterPost
    AfterDelete = cdsNotasAlunosAfterDelete
    OnReconcileError = cdsNotasAlunosReconcileError
    Left = 520
    Top = 200
    object cdsNotasAlunosID: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object cdsNotasAlunosID_ALUNO_DISCIPLINA: TIntegerField
      DisplayLabel = 'Codigo da disciplina'
      FieldName = 'ID_ALUNO_DISCIPLINA'
      Origin = 'ID_ALUNO_DISCIPLINA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsNotasAlunosNOME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Aluno'
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object cdsNotasAlunosDISCIPLINA: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Disciplina'
      FieldName = 'DISCIPLINA'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object cdsNotasAlunosNOTA_PRIMEIRO_PERIODO: TCurrencyField
      FieldName = 'NOTA_PRIMEIRO_PERIODO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,0.00'
    end
    object cdsNotasAlunosNOTA_SEGUNDO_PERIODO: TCurrencyField
      FieldName = 'NOTA_SEGUNDO_PERIODO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,0.00'
    end
    object cdsNotasAlunosNOTA_TRABALHO: TCurrencyField
      DisplayLabel = 'Nota Trabalho'
      FieldName = 'NOTA_TRABALHO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,0.00'
    end
    object cdsNotasAlunosNOTA_MEDIA: TCurrencyField
      DisplayLabel = 'Nota Media'
      FieldName = 'NOTA_MEDIA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,0.00'
    end
    object cdsNotasAlunosSITUACAO: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
  end
  object dspDisciplinasProfessores: TDataSetProvider
    DataSet = qrDisciplinasProfessores
    Options = [poIncFieldProps, poPropogateChanges, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 288
    Top = 144
  end
  object qrAuxiliar: TFDQuery
    Connection = FDConexao
    Left = 16
    Top = 264
  end
end
