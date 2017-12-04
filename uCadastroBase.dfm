inherited frmCadastroBase: TfrmCadastroBase
  Caption = 'frmCadastroBase'
  ClientHeight = 400
  ClientWidth = 662
  FormStyle = fsMDIChild
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  ExplicitWidth = 678
  ExplicitHeight = 439
  PixelsPerInch = 96
  TextHeight = 13
  object pcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 662
    Height = 400
    ActivePage = tsDados
    Align = alClient
    TabOrder = 0
    object tsGrid: TTabSheet
      Caption = 'tsGrid'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnlBotoesGrid: TPanel
        Left = 0
        Top = 0
        Width = 113
        Height = 372
        Align = alLeft
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        object btnInserir: TButton
          Left = 12
          Top = 0
          Width = 93
          Height = 25
          Hint = 'Inserir registro'
          Caption = 'Inserir'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = btnInserirClick
        end
        object btnAlterar: TButton
          Left = 12
          Top = 31
          Width = 93
          Height = 25
          Hint = 'Alterar registro atual'
          Caption = 'Alterar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnAlterarClick
        end
        object btnExcluir: TButton
          Left = 12
          Top = 62
          Width = 93
          Height = 25
          Hint = 'Excluir registro atual'
          Caption = 'Excluir'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btnExcluirClick
        end
      end
      object pnlGrid: TPanel
        Left = 113
        Top = 0
        Width = 541
        Height = 372
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object pnlNavigator: TPanel
          Left = 0
          Top = 344
          Width = 541
          Height = 28
          Align = alBottom
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object pnlAlignNavigator: TPanel
            Left = 356
            Top = 0
            Width = 185
            Height = 28
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object nvgGrid: TDBNavigator
              Left = 0
              Top = 0
              Width = 185
              Height = 28
              DataSource = dsDados
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
              Align = alClient
              Hints.Strings = (
                'Primeiro registro'
                'Registro anterior'
                'Pr'#243'ximo registro'
                #218'ltimo registro')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
          end
        end
        object grDados: TDBGrid
          Left = 0
          Top = 0
          Width = 541
          Height = 344
          Align = alClient
          DataSource = dsDados
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgTitleClick, dgTitleHotTrack]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
    end
    object tsDados: TTabSheet
      Caption = 'tsDados'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnlBotoesDados: TPanel
        Left = 0
        Top = 0
        Width = 113
        Height = 372
        Align = alLeft
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 1
        object btnSalvar: TButton
          Left = 12
          Top = 3
          Width = 93
          Height = 25
          Hint = 'Salvar registro'
          Caption = 'Salvar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = btnSalvarClick
        end
        object btnCancelar: TButton
          Left = 12
          Top = 31
          Width = 93
          Height = 25
          Hint = 'Cancelar registro'
          Caption = 'Cancelar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnCancelarClick
        end
      end
      object pnlDados: TPanel
        Left = 113
        Top = 0
        Width = 541
        Height = 372
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
      end
    end
  end
  object dsDados: TDataSource
    AutoEdit = False
    Left = 328
    Top = 208
  end
end
