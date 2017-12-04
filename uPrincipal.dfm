object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'SisColegial - Controle de alunos e  professores'
  ClientHeight = 396
  ClientWidth = 726
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mnMenuPrincipal
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object stbInformacoes: TStatusBar
    Left = 0
    Top = 377
    Width = 726
    Height = 19
    BiDiMode = bdLeftToRight
    Panels = <
      item
        Alignment = taCenter
        Width = 50
      end
      item
        Alignment = taCenter
        Width = 50
      end
      item
        Alignment = taCenter
        Width = 50
      end
      item
        Alignment = taCenter
        Width = 50
      end>
    ParentBiDiMode = False
    OnResize = stbInformacoesResize
  end
  object mnMenuPrincipal: TMainMenu
    Left = 248
    Top = 96
    object mnCadastros: TMenuItem
      Caption = 'Cadastros'
      object mnDisciplinas: TMenuItem
        Caption = 'Disciplinas'
        OnClick = mnDisciplinasClick
      end
      object mnProfessores: TMenuItem
        Caption = 'Professores'
        OnClick = mnProfessoresClick
      end
      object mnAlunos: TMenuItem
        Caption = 'Alunos'
        OnClick = mnAlunosClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnSair: TMenuItem
        Caption = 'Sair do Sistema'
        OnClick = mnSairClick
      end
    end
    object mnMovimentacoes: TMenuItem
      Caption = 'Movimenta'#231#245'es'
      object mnProfessoresPorDisciplinas: TMenuItem
        Caption = 'Professores por disciplinas'
        OnClick = mnProfessoresPorDisciplinasClick
      end
      object mnDisciplinasDoAluno: TMenuItem
        Caption = 'Disciplinas do aluno'
        OnClick = mnDisciplinasDoAlunoClick
      end
      object mnLancamentoNota: TMenuItem
        Caption = 'Lan'#231'amento de notas'
        OnClick = mnLancamentoNotaClick
      end
    end
    object mnRelatorios: TMenuItem
      Caption = 'Relat'#243'rios'
      object mnRelatorioNotasLancadas: TMenuItem
        Caption = 'Notas lan'#231'adas'
        OnClick = mnRelatorioNotasLancadasClick
      end
      object mnRelatoriosAlunosPorProfessores: TMenuItem
        Caption = 'Alunos por professores'
        OnClick = mnRelatoriosAlunosPorProfessoresClick
      end
    end
  end
  object tmrAtualizaHora: TTimer
    OnTimer = tmrAtualizaHoraTimer
    Left = 360
    Top = 216
  end
end
