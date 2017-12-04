unit uCadastrobase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormBase, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB, Vcl.DBCtrls,uMensagemUtils;

type
  TfrmCadastroBase = class(TfrmFormBase)
    pcPrincipal: TPageControl;
    tsGrid: TTabSheet;
    tsDados: TTabSheet;
    grDados: TDBGrid;
    pnlBotoesGrid: TPanel;
    btnInserir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    pnlBotoesDados: TPanel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    pnlDados: TPanel;
    dsDados: TDataSource;
    pnlGrid: TPanel;
    pnlNavigator: TPanel;
    pnlAlignNavigator: TPanel;
    nvgGrid: TDBNavigator;
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  procedure doCancel;

  protected
    function ValidaDados: Boolean; virtual;
  public
    { Public declarations }
  end;

var
  frmCadastroBase: TfrmCadastroBase;

implementation

{$R *.dfm}

procedure TfrmCadastroBase.btnAlterarClick(Sender: TObject);
begin
  inherited;
  if dsDados.DataSet.IsEmpty then
    ShowmensageInformation('Não há registros.')
  else
  begin
    pcPrincipal.ActivePage := tsDados;
    dsDados.DataSet.edit;
  end;
end;

procedure TfrmCadastroBase.btnCancelarClick(Sender: TObject);
begin
  inherited;
  doCancel;
end;

procedure TfrmCadastroBase.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if dsDados.DataSet.RecordCount = 0 then
    ShowmensageInformation('Não há registros.')
  else
  if ShowmensageConfirm('Confirme a exclusão do registro selecionado?') then
    dsDados.DataSet.Delete;
end;

procedure TfrmCadastroBase.btnInserirClick(Sender: TObject);
begin
  inherited;
  pcPrincipal.ActivePage := tsDados;
  dsDados.DataSet.Insert;
end;

procedure TfrmCadastroBase.btnSalvarClick(Sender: TObject);
begin
  inherited;
  if ValidaDados then
  begin
    pcPrincipal.ActivePage := tsGrid;
    dsDados.DataSet.Post;
    dsDados.DataSet.Close;
    dsDados.DataSet.Open;
  end;
end;
procedure TfrmCadastroBase.doCancel;
begin
  pcPrincipal.ActivePage := tsGrid;
  dsDados.DataSet.Cancel;
end;

procedure TfrmCadastroBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  inherited;
end;

procedure TfrmCadastroBase.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
    if dsDados.State in [dsInsert,dsedit] then
    begin
      CanClose := False;

      if ShowmensageConfirm ('Deseja cancelar o registro atual?') then
        doCancel;
    end
    else
      CanClose := True;
end;

procedure TfrmCadastroBase.FormShow(Sender: TObject);
begin
  inherited;
  tsGrid.TabVisible := False;
  tsDados.TabVisible := False;

  pcPrincipal.ActivePage := tsGrid;
  dsDados.DataSet.Open;
end;

function TfrmCadastroBase.ValidaDados: Boolean;
begin
  Result := True
end;

end.
