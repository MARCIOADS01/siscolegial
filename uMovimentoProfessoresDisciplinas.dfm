inherited frmProfessoresPorDisciplinas: TfrmProfessoresPorDisciplinas
  Caption = 'Professores por disciplinas'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TPageControl
    inherited tsGrid: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 654
      ExplicitHeight = 372
    end
    inherited tsDados: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 654
      ExplicitHeight = 372
      inherited pnlDados: TPanel
        object Label1: TLabel
          Left = 6
          Top = 0
          Width = 33
          Height = 13
          Caption = 'Codigo'
          FocusControl = dbeCodigoDisciplinaProfessor
        end
        object Label2: TLabel
          Left = 6
          Top = 43
          Width = 94
          Height = 13
          Caption = 'Codigo da Disciplina'
          FocusControl = dbeCodigoDisciplina
        end
        object Label3: TLabel
          Left = 6
          Top = 83
          Width = 97
          Height = 13
          Caption = 'Codigo do professor'
          FocusControl = dbeCodigoProfessor
        end
        object dbeCodigoDisciplinaProfessor: TDBEdit
          Left = 6
          Top = 19
          Width = 50
          Height = 21
          DataField = 'ID'
          DataSource = dsDados
          Enabled = False
          TabOrder = 0
        end
        object dbeCodigoDisciplina: TDBEdit
          Left = 6
          Top = 59
          Width = 50
          Height = 21
          DataField = 'ID_DISCIPLINA'
          DataSource = dsDados
          TabOrder = 1
        end
        object dbeCodigoProfessor: TDBEdit
          Left = 6
          Top = 99
          Width = 50
          Height = 21
          DataField = 'ID_PROFESSOR'
          DataSource = dsDados
          TabOrder = 2
        end
        object dblDisciplina: TDBLookupComboBox
          Left = 61
          Top = 59
          Width = 200
          Height = 21
          DataField = 'ID_DISCIPLINA'
          DataSource = dsDados
          KeyField = 'ID'
          ListField = 'NOME'
          ListSource = dsLookupDisciplina
          TabOrder = 3
        end
        object dblProfessor: TDBLookupComboBox
          Left = 61
          Top = 99
          Width = 200
          Height = 21
          DataField = 'ID_PROFESSOR'
          DataSource = dsDados
          KeyField = 'ID'
          ListField = 'NOME'
          ListSource = dsLookupProfessor
          TabOrder = 4
        end
      end
    end
  end
  inherited dsDados: TDataSource
    DataSet = dmPrincipal.cdsDisciplinasProfessores
    Left = 584
    Top = 344
  end
  object dsLookupDisciplina: TDataSource
    Left = 584
    Top = 232
  end
  object dsLookupProfessor: TDataSource
    Left = 584
    Top = 288
  end
end
