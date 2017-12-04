inherited frmRelatorioNotasLancadas: TfrmRelatorioNotasLancadas
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relatorio das notas'
  ClientHeight = 161
  ClientWidth = 235
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  ExplicitWidth = 241
  ExplicitHeight = 190
  PixelsPerInch = 96
  TextHeight = 13
  object plnBotoes: TPanel
    Left = 0
    Top = 120
    Width = 235
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitWidth = 234
    object btnVisualizar: TButton
      Left = 14
      Top = 8
      Width = 100
      Height = 25
      Caption = 'Visualizar'
      TabOrder = 0
      OnClick = btnVisualizarClick
    end
    object btnImprimir: TButton
      Left = 120
      Top = 8
      Width = 100
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 1
      OnClick = btnVisualizarClick
    end
  end
  object rdgSituacao: TRadioGroup
    Left = 8
    Top = 8
    Width = 218
    Height = 105
    Caption = 'Situa'#231#227'o dos Alunos'
    ItemIndex = 0
    Items.Strings = (
      'Todos'
      'Aprovados'
      'Reprovados')
    TabOrder = 1
  end
end
