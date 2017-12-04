inherited frmCadastroProfessor: TfrmCadastroProfessor
  Caption = 'Cadastro de professores'
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
          FocusControl = dbeCodigoProfessor
        end
        object Label2: TLabel
          Left = 6
          Top = 48
          Width = 91
          Height = 13
          Caption = 'Nome do professor'
          FocusControl = dbeNomeProfessor
        end
        object dbeCodigoProfessor: TDBEdit
          Left = 6
          Top = 24
          Width = 50
          Height = 21
          DataField = 'ID'
          Enabled = False
          TabOrder = 0
        end
        object dbeNomeProfessor: TDBEdit
          Left = 6
          Top = 64
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
    DataSet = dmPrincipal.cdsProfessores
  end
end
