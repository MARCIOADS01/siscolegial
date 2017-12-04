unit uRelatorioAlunosProfessores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormBase, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmRelatorioAlunosProfessores = class(TfrmFormBase)
    plnbotoes: TPanel;
    btnVisualizar: TButton;
    btnImprimir: TButton;
    Label1: TLabel;
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioAlunosProfessores: TfrmRelatorioAlunosProfessores;

implementation

{$R *.dfm}

uses
  uReportAlunosProfessores;

procedure TfrmRelatorioAlunosProfessores.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  frmReportAlunosProfessores := TfrmReportAlunosProfessores.Create(Self);
  try
    if Sender = btnVisualizar then
      frmReportAlunosProfessores.rlAlunosProfessores.Preview
    else
      frmReportAlunosProfessores.rlAlunosProfessores.Print;
   finally
     frmReportAlunosProfessores.Free;
  end;
end;
procedure TfrmRelatorioAlunosProfessores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  inherited;
  frmRelatorioAlunosProfessores := nil;
end;

end.
