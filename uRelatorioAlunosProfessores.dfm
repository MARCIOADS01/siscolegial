inherited frmRelatorioAlunosProfessores: TfrmRelatorioAlunosProfessores
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relatorio professores por alunos'
  ClientHeight = 107
  ClientWidth = 333
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  ExplicitWidth = 339
  ExplicitHeight = 136
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 185
    Height = 19
    Caption = 'Professores por alunos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object plnbotoes: TPanel
    Left = 0
    Top = 42
    Width = 333
    Height = 65
    Align = alBottom
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 72
    ExplicitWidth = 323
    object btnVisualizar: TButton
      Left = 22
      Top = 13
      Width = 131
      Height = 41
      Caption = 'Visualizar'
      TabOrder = 0
      OnClick = btnVisualizarClick
    end
    object btnImprimir: TButton
      Left = 175
      Top = 13
      Width = 135
      Height = 41
      Caption = 'Imprimir'
      TabOrder = 1
      OnClick = btnVisualizarClick
    end
  end
end
