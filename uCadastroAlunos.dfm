inherited frmCadastroAluno: TfrmCadastroAluno
  Caption = 'Cadastro de alunos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TPageControl
    inherited tsDados: TTabSheet
      inherited pnlDados: TPanel
        object Label1: TLabel
          Left = 6
          Top = 8
          Width = 33
          Height = 13
          Caption = 'Codigo'
          FocusControl = dbeCodigoAluno
        end
        object Label2: TLabel
          Left = 6
          Top = 48
          Width = 71
          Height = 13
          Caption = 'Nome do aluno'
          FocusControl = dbeNomeAluno
        end
        object dbeCodigoAluno: TDBEdit
          Left = 6
          Top = 24
          Width = 50
          Height = 21
          DataField = 'ID'
          DataSource = dsDados
          Enabled = False
          TabOrder = 0
        end
        object dbeNomeAluno: TDBEdit
          Left = 6
          Top = 67
          Width = 400
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NOME'
          DataSource = dsDados
          TabOrder = 1
        end
      end
    end
  end
  inherited dsDados: TDataSource
    DataSet = dmPrincipal.cdsAlunos
  end
end
