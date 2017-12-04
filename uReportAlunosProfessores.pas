unit uReportAlunosProfessores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormBase, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  RLReport, Data.DB, Datasnap.DBClient, Datasnap.Provider, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmReportAlunosProfessores = class(TfrmFormBase)
    dsRelAlunosProfessores: TDataSource;
    dspRelAlunosProfessores: TDataSetProvider;
    cdsRelAlunosProfessores: TClientDataSet;
    rlAlunosProfessores: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    qrRelAlunosProfessores: TFDQuery;
    cdsRelAlunosProfessoresNOME: TStringField;
    cdsRelAlunosProfessoresNOME_1: TStringField;
    cdsRelAlunosProfessoresNOME_2: TStringField;
    RLGroup1: TRLGroup;
    RLBand3: TRLBand;
    RLBand2: TRLBand;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText1: TRLDBText;
    procedure rlAlunosProfessoresBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportAlunosProfessores: TfrmReportAlunosProfessores;

implementation

{$R *.dfm}

uses udmPrincipal;

procedure TfrmReportAlunosProfessores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmReportAlunosProfessores := nil;
end;

procedure TfrmReportAlunosProfessores.rlAlunosProfessoresBeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
  inherited;
  cdsRelAlunosProfessores.Open;
end;

end.
