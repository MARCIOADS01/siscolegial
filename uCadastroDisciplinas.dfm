inherited frmCadastroDisciplina: TfrmCadastroDisciplina
  Caption = 'Cadastro de disciplinas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TPageControl
    inherited tsDados: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 654
      ExplicitHeight = 372
      inherited pnlDados: TPanel
        object Label1: TLabel
          Left = 6
          Top = 8
          Width = 33
          Height = 13
          Caption = 'Codigo'
          FocusControl = dbeCodigoDisciplina
        end
        object Label2: TLabel
          Left = 6
          Top = 48
          Width = 87
          Height = 13
          Caption = 'Nome da disciplina'
          FocusControl = dbeNomeDisciplina
        end
        object dbeCodigoDisciplina: TDBEdit
          Left = 6
          Top = 21
          Width = 50
          Height = 21
          DataField = 'ID'
          DataSource = dsDados
          Enabled = False
          TabOrder = 0
        end
        object dbeNomeDisciplina: TDBEdit
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
    DataSet = dmPrincipal.cdsDisciplinas
  end
end
