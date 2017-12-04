unit uRelatorioNotasLancada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormBase, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmRelatorioNotasLancadas = class(TfrmFormBase)
    plnBotoes: TPanel;
    btnVisualizar: TButton;
    btnImprimir: TButton;
    rdgSituacao: TRadioGroup;
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioNotasLancadas: TfrmRelatorioNotasLancadas;

implementation

{$R *.dfm}

uses
  uReportNotasLancadas;

procedure TfrmRelatorioNotasLancadas.btnVisualizarClick(Sender: TObject);
begin
  inherited;

  frmReportNotasLancadas := TfrmReportNotasLancadas.Create(Self);
  frmReportNotasLancadas.ItemSelecionado := rdgSituacao.ItemIndex;

  try
    if Sender = btnVisualizar then
      frmReportNotasLancadas.rlNotasLancadas.Preview
    else
      frmReportNotasLancadas.rlNotasLancadas.Print;
  finally
    frmReportNotasLancadas.Free;
  end;
end;

procedure TfrmRelatorioNotasLancadas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  inherited;
  frmRelatorioNotasLancadas := nil;
end;

end.
