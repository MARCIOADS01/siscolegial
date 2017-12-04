inherited frmReportNotasLancadas: TfrmReportNotasLancadas
  Caption = 'frmReportNotasLancadas'
  ClientHeight = 425
  ClientWidth = 796
  OnClose = FormClose
  ExplicitWidth = 812
  ExplicitHeight = 464
  PixelsPerInch = 96
  TextHeight = 13
  object rlNotasLancadas: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dsRelNotasAlunos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    BeforePrint = rlNotasLancadasBeforePrint
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 43
      BandType = btTitle
      object RLLabel1: TRLLabel
        Left = 136
        Top = 13
        Width = 417
        Height = 19
        Caption = 'SISCOLEGIAL - RELATORIO DE NOTAS POR ALUNOS'
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
      Top = 81
      Width = 718
      Height = 104
      DataFields = 'NOME'
      object RLBand3: TRLBand
        Left = 0
        Top = 40
        Width = 718
        Height = 65
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLLabel3: TRLLabel
          Left = 16
          Top = 16
          Width = 63
          Height = 14
          Caption = 'DISCIPLINA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          Left = 232
          Top = 15
          Width = 42
          Height = 14
          Caption = 'NOTA 1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 328
          Top = 15
          Width = 42
          Height = 14
          Caption = 'NOTA 2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel6: TRLLabel
          Left = 408
          Top = 15
          Width = 62
          Height = 14
          Caption = 'TRABALHO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel7: TRLLabel
          Left = 517
          Top = 15
          Width = 37
          Height = 14
          Caption = 'MEDIA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel8: TRLLabel
          Left = 616
          Top = 15
          Width = 59
          Height = 14
          Caption = 'SITUACAO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText3: TRLDBText
          Left = 16
          Top = 34
          Width = 74
          Height = 16
          DataField = 'DISCIPLINA'
          DataSource = dsRelNotasAlunos
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 616
          Top = 33
          Width = 69
          Height = 16
          DataField = 'SITUACAO'
          DataSource = dsRelNotasAlunos
          Text = ''
        end
        object RLDBText5: TRLDBText
          Left = 232
          Top = 33
          Width = 20
          Height = 16
          DataField = 'N1'
          DataSource = dsRelNotasAlunos
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 328
          Top = 33
          Width = 20
          Height = 16
          DataField = 'N2'
          DataSource = dsRelNotasAlunos
          Text = ''
        end
        object RLDBText7: TRLDBText
          Left = 408
          Top = 33
          Width = 73
          Height = 16
          DataField = 'TRABALHO'
          DataSource = dsRelNotasAlunos
          Text = ''
        end
        object RLDBText8: TRLDBText
          Left = 517
          Top = 33
          Width = 45
          Height = 16
          DataField = 'MEDIA'
          DataSource = dsRelNotasAlunos
          Text = ''
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 40
        BandType = btColumnHeader
        Color = clBtnFace
        ParentColor = False
        Transparent = False
        object RLDBText1: TRLDBText
          Left = 16
          Top = 18
          Width = 48
          Height = 16
          DataField = 'NOME'
          DataSource = dsRelNotasAlunos
          Text = ''
          Transparent = False
        end
      end
    end
  end
  object qrRelNotasAlunos: TFDQuery
    Connection = dmPrincipal.FDConexao
    SQL.Strings = (
      'SELECT AL.NOME,'
      '       DISCI.NOME AS DISCIPLINA,'
      '       NOTA.NOTA_PRIMEIRO_PERIODO AS N1,'
      '       NOTA.NOTA_SEGUNDO_PERIODO AS N2,'
      '       NOTA.NOTA_TRABALHO AS TRABALHO,'
      '       NOTA.NOTA_MEDIA AS MEDIA,'
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
    Left = 688
    Top = 216
  end
  object dspRelNotasAlunos: TDataSetProvider
    DataSet = qrRelNotasAlunos
    Left = 688
    Top = 264
  end
  object cdsRelNotasAlunos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelNotasAlunos'
    Left = 688
    Top = 312
    object cdsRelNotasAlunosNOME: TStringField
      DisplayLabel = 'ALUNO'
      FieldName = 'NOME'
      Required = True
      Size = 100
    end
    object cdsRelNotasAlunosDISCIPLINA: TStringField
      FieldName = 'DISCIPLINA'
      Required = True
      Size = 100
    end
    object cdsRelNotasAlunosN1: TCurrencyField
      FieldName = 'N1'
      DisplayFormat = '#,0.00'
    end
    object cdsRelNotasAlunosN2: TCurrencyField
      FieldName = 'N2'
      DisplayFormat = '#,0.00'
    end
    object cdsRelNotasAlunosTRABALHO: TCurrencyField
      FieldName = 'TRABALHO'
      DisplayFormat = '#,0.00'
    end
    object cdsRelNotasAlunosMEDIA: TCurrencyField
      FieldName = 'MEDIA'
      DisplayFormat = '#,0.00'
    end
    object cdsRelNotasAlunosSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 50
    end
  end
  object dsRelNotasAlunos: TDataSource
    DataSet = cdsRelNotasAlunos
    Left = 688
    Top = 360
  end
end
