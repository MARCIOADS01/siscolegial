inherited frmDisciplinasDoAluno: TfrmDisciplinasDoAluno
  Caption = 'Disciplinas do aluno'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TPageControl
    ActivePage = tsGrid
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
          Left = 8
          Top = 8
          Width = 33
          Height = 13
          Caption = 'Codigo'
          FocusControl = dbeCodigoAlunoDisciplina
        end
        object Label2: TLabel
          Left = 8
          Top = 48
          Width = 78
          Height = 13
          Caption = 'Codigo do Aluno'
          FocusControl = dbeCodigoAluno
        end
        object pnlDisciplinaAluno: TPanel
          Left = 6
          Top = 91
          Width = 535
          Height = 281
          BevelOuter = bvLowered
          ParentBackground = False
          TabOrder = 5
          object Label3: TLabel
            Left = 2
            Top = 1
            Width = 93
            Height = 13
            Caption = 'Codigo da disciplina'
            FocusControl = dbeCodigoDisciplinaProfessor
          end
        end
        object dbeCodigoAlunoDisciplina: TDBEdit
          Left = 8
          Top = 24
          Width = 50
          Height = 21
          DataField = 'ID'
          DataSource = dsDados
          Enabled = False
          TabOrder = 0
        end
        object dbeCodigoAluno: TDBEdit
          Left = 8
          Top = 64
          Width = 50
          Height = 21
          DataField = 'ID_ALUNO'
          DataSource = dsDados
          TabOrder = 1
        end
        object dbeCodigoDisciplinaProfessor: TDBEdit
          Left = 8
          Top = 110
          Width = 50
          Height = 21
          DataField = 'ID_DISCIPLINA_PROFESSOR'
          DataSource = dsDados
          TabOrder = 2
        end
        object dblAluno: TDBLookupComboBox
          Left = 64
          Top = 64
          Width = 200
          Height = 21
          DataField = 'ID_ALUNO'
          DataSource = dsDados
          KeyField = 'ID'
          ListField = 'NOME'
          ListSource = dsLookupAluno
          TabOrder = 3
        end
        object dbgDisciplinasProfessores: TDBGrid
          Left = 6
          Top = 137
          Width = 529
          Height = 224
          DataSource = dsLookupDisciplinaProfessor
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgTitleClick, dgTitleHotTrack]
          ReadOnly = True
          TabOrder = 4
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
        object dblDisciplinaProfessor: TDBLookupComboBox
          Left = 64
          Top = 110
          Width = 200
          Height = 21
          DataField = 'ID_DISCIPLINA_PROFESSOR'
          DataSource = dsDados
          KeyField = 'ID'
          ListField = 'DISCIPLINA'
          ListSource = dsLookupDisciplinaProfessor
          TabOrder = 6
        end
      end
    end
  end
  inherited dsDados: TDataSource
    DataSet = dmPrincipal.cdsDisciplinasAlunos
    Left = 552
    Top = 328
  end
  object dsLookupAluno: TDataSource
    Left = 552
    Top = 216
  end
  object dsLookupDisciplinaProfessor: TDataSource
    Left = 552
    Top = 272
  end
end
