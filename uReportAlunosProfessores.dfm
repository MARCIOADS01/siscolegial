inherited frmReportAlunosProfessores: TfrmReportAlunosProfessores
  Caption = 'frmReportAlunosProfessores'
  ClientHeight = 542
  ClientWidth = 795
  OnClose = FormClose
  ExplicitWidth = 811
  ExplicitHeight = 581
  PixelsPerInch = 96
  TextHeight = 13
  object rlAlunosProfessores: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dsRelAlunosProfessores
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    BeforePrint = rlAlunosProfessoresBeforePrint
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 51
      BandType = btTitle
      object RLLabel1: TRLLabel
        Left = 104
        Top = 13
        Width = 458
        Height = 19
        Caption = 'SISCOLEGIAL - RELAT'#211'RIO PROFESSORES POR ALUNOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 89
      Width = 718
      Height = 88
      DataFields = 'NOME'
      object RLBand3: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 41
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Color = clBtnFace
        ParentColor = False
        Transparent = False
        object RLDBText1: TRLDBText
          Left = 14
          Top = 14
          Width = 48
          Height = 16
          DataField = 'NOME'
          DataSource = dsRelAlunosProfessores
          Text = ''
          Transparent = False
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 41
        Width = 718
        Height = 56
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLLabel3: TRLLabel
          Left = 14
          Top = 6
          Width = 66
          Height = 14
          Caption = 'PROFESSOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel4: TRLLabel
          Left = 230
          Top = 6
          Width = 63
          Height = 14
          Caption = 'DISCIPLINA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLDBText3: TRLDBText
          Left = 230
          Top = 28
          Width = 74
          Height = 16
          DataField = 'NOME_2'
          DataSource = dsRelAlunosProfessores
          Text = ''
          Transparent = False
        end
        object RLDBText2: TRLDBText
          Left = 14
          Top = 28
          Width = 86
          Height = 16
          DataField = 'NOME_1'
          DataSource = dsRelAlunosProfessores
          Text = ''
          Transparent = False
        end
      end
    end
  end
  object dsRelAlunosProfessores: TDataSource
    DataSet = cdsRelAlunosProfessores
    Left = 712
    Top = 496
  end
  object dspRelAlunosProfessores: TDataSetProvider
    DataSet = qrRelAlunosProfessores
    Left = 712
    Top = 392
  end
  object cdsRelAlunosProfessores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelAlunosProfessores'
    Left = 712
    Top = 448
    object cdsRelAlunosProfessoresNOME: TStringField
      DisplayLabel = 'ALUNO'
      FieldName = 'NOME'
      Required = True
      Size = 100
    end
    object cdsRelAlunosProfessoresNOME_1: TStringField
      DisplayLabel = 'PROFESSOR'
      FieldName = 'NOME_1'
      Required = True
      Size = 100
    end
    object cdsRelAlunosProfessoresNOME_2: TStringField
      DisplayLabel = 'DISCIPLINA'
      FieldName = 'NOME_2'
      Required = True
      Size = 100
    end
  end
  object qrRelAlunosProfessores: TFDQuery
    Connection = dmPrincipal.FDConexao
    SQL.Strings = (
      'SELECT AL.NOME,'
      '       PROF.NOME ,       '
      '       DISCI.NOME '
      'FROM DISCIPLINAS_ALUNOS AS DISCA'
      
        'INNER JOIN DISCIPLINAS_PROFESSORES AS DISCP ON DISCP.ID = DISCA.' +
        'ID_DISCIPLINA_PROFESSOR'
      'INNER JOIN PROFESSORES AS PROF  ON PROF.ID = DISCP.ID_PROFESSOR'
      
        'INNER JOIN DISCIPLINAS AS DISCI ON DISCI.ID = DISCP.ID_DISCIPLIN' +
        'A'
      'INNER JOIN ALUNOS AS AL ON AL.ID = DISCA.ID_ALUNO'
      'ORDER BY AL.NOME')
    Left = 712
    Top = 344
  end
end
