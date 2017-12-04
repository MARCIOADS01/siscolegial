inherited frmLancamentoDeNotas: TfrmLancamentoDeNotas
  Caption = 'Lan'#231'amento de notas'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TPageControl
    inherited tsGrid: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 654
      ExplicitHeight = 372
      inherited pnlBotoesGrid: TPanel
        inherited btnInserir: TButton
          Top = 3
          ExplicitTop = 3
        end
      end
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
          FocusControl = dbeCodigoNotaAluno
        end
        object Label3: TLabel
          Left = 8
          Top = 51
          Width = 93
          Height = 13
          Caption = 'Codigo da disciplina'
          FocusControl = dbeCodigoDisciplinaAluno
        end
        object plnLancamentoNotas: TPanel
          Left = 6
          Top = 94
          Width = 523
          Height = 46
          ParentBackground = False
          TabOrder = 9
          object Label5: TLabel
            Left = 4
            Top = 0
            Width = 13
            Height = 13
            Caption = 'N1'
          end
          object Label6: TLabel
            Left = 71
            Top = 0
            Width = 13
            Height = 13
            Caption = 'N2'
          end
          object Label7: TLabel
            Left = 137
            Top = 0
            Width = 42
            Height = 13
            Caption = 'Trabalho'
          end
          object Label8: TLabel
            Left = 202
            Top = 0
            Width = 28
            Height = 13
            Caption = 'Media'
          end
          object Label9: TLabel
            Left = 269
            Top = 0
            Width = 41
            Height = 13
            Caption = 'Situa'#231#227'o'
          end
        end
        object dbeCodigoNotaAluno: TDBEdit
          Left = 8
          Top = 24
          Width = 50
          Height = 21
          DataField = 'ID'
          DataSource = dsDados
          Enabled = False
          TabOrder = 0
        end
        object dbeCodigoDisciplinaAluno: TDBEdit
          Left = 8
          Top = 67
          Width = 50
          Height = 21
          DataField = 'ID_ALUNO_DISCIPLINA'
          DataSource = dsDados
          TabOrder = 1
        end
        object dbgDisciplinasAlunos: TDBGrid
          Left = 6
          Top = 146
          Width = 529
          Height = 225
          DataSource = dsLookupDisciplinaAluno
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgTitleClick, dgTitleHotTrack]
          TabOrder = 8
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
        object dblDisciplinaAluno: TDBLookupComboBox
          Left = 64
          Top = 67
          Width = 145
          Height = 21
          DataField = 'ID_ALUNO_DISCIPLINA'
          DataSource = dsDados
          KeyField = 'ID'
          ListField = 'DISCIPLINA'
          ListSource = dsLookupDisciplinaAluno
          TabOrder = 2
        end
        object dbeNota2: TDBEdit
          Left = 76
          Top = 111
          Width = 60
          Height = 21
          DataField = 'NOTA_SEGUNDO_PERIODO'
          DataSource = dsDados
          TabOrder = 4
        end
        object dbeNota1: TDBEdit
          Left = 10
          Top = 111
          Width = 60
          Height = 21
          DataField = 'NOTA_PRIMEIRO_PERIODO'
          DataSource = dsDados
          TabOrder = 3
        end
        object dbeNotaTrabalho: TDBEdit
          Left = 142
          Top = 111
          Width = 60
          Height = 21
          DataField = 'NOTA_TRABALHO'
          DataSource = dsDados
          TabOrder = 5
        end
        object dbeMedia: TDBEdit
          Left = 208
          Top = 111
          Width = 60
          Height = 21
          DataField = 'NOTA_MEDIA'
          DataSource = dsDados
          TabOrder = 6
        end
        object dbeSituacao: TDBEdit
          Left = 276
          Top = 111
          Width = 100
          Height = 21
          DataField = 'SITUACAO'
          DataSource = dsDados
          TabOrder = 7
        end
      end
    end
  end
  inherited dsDados: TDataSource
    DataSet = dmPrincipal.cdsNotasAlunos
    Left = 568
    Top = 288
  end
  object dsLookupDisciplinaAluno: TDataSource
    Left = 568
    Top = 224
  end
end
