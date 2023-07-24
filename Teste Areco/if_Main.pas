unit if_Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uT_DataSnapREST, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, IPPeerClient, DBClient;

type
  TfMain = class(TForm)
    Pnl_Botoes: TPanel;
    GrdProdutos: TDBGrid;
    BtnNovo: TButton;
    BtnEditar: TButton;
    BtnExcluir: TButton;
    Lbl_Informação: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure GrdProdutosDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FDtSet : TClientDataSet;
    FDtSrc : TDataSource;
    FAPI   : TDataSnapRest;

    procedure GridDataBinding;
    procedure ListaProdutos;

    function Confirmacao(pMsg: String) : Boolean;
  end;

var
  fMain: TfMain;

implementation

uses uT_Produto, ifCad_Produto;

{$R *.dfm}

procedure TfMain.GridDataBinding;
begin
  FDtSet.FieldDefs.Add('id'            , ftInteger);
  FDtSet.FieldDefs.Add('descricao'     , ftString, 100);
  FDtSet.FieldDefs.Add('data_cadastro' , ftDateTime);
  FDtSet.FieldDefs.Add('valor_unitario', ftCurrency);
  FDtSet.FieldDefs.Add('observacao'    , ftString, 300);
  FDtSet.CreateDataSet;
  FDtSet.StoreDefs := True;

  FDtSrc.DataSet := FDtSet;

  GrdProdutos.DataSource := FDtSrc;
  GrdProdutos.Columns[0].FieldName := 'id';
  GrdProdutos.Columns[1].FieldName := 'descricao';
  GrdProdutos.Columns[2].FieldName := 'data_cadastro';
end;

procedure TfMain.ListaProdutos;
var
  vProdutos: TArray<TProduto>;
  vProduto : TProduto;
begin
  try
    vProdutos := FAPI.ListaProdutos;

    FDtSet.EmptyDataSet;
    if(Length(vProdutos) > 0) then
    begin
      for vProduto in vProdutos do
      begin
        FDtSet.Append;
        FDtSet.FieldByName('id')            .AsInteger  := vProduto.ID;
        FDtSet.FieldByName('descricao')     .AsString   := vProduto.Descricao;
        FDtSet.FieldByName('data_cadastro') .AsDateTime := vProduto.DataCadastro;
        FDtSet.FieldByName('valor_unitario').AsCurrency := vProduto.ValorUnitario;
        FDtSet.FieldByName('observacao')    .AsString   := vProduto.Observacao;
        FDtSet.Post;
        FDtSet.First;
      end;
    end;
  except
    ShowMessage('Não foi possível se conectar ao servidor!');
  end;

end;

procedure TfMain.BtnNovoClick(Sender: TObject);
var
  vForm : TfCad_Produto;
begin
  vForm := TfCad_Produto.Create(Self);
  try
    vForm.Caption := 'Cadastro de Produto - [ESC] para sair';
    vForm.DataCadastro := Now;
    vForm.ShowModal;

    if(vForm.ModalResult = mrOk)
    then ListaProdutos;
  finally
    vForm.Free;
  end;
end;

function TfMain.Confirmacao(pMsg: String): Boolean;
begin
  Result := (Application.MessageBox(PChar(pMsg), 'Confirmação', MB_YESNO + MB_ICONQUESTION) = idYes);
end;

procedure TfMain.GrdProdutosDblClick(Sender: TObject);
begin
  BtnEditarClick(BtnEditar);
end;

procedure TfMain.BtnExcluirClick(Sender: TObject);
begin
  if(FDtSet.IsEmpty)
  then Exit;

  if(Confirmacao('Deseja realmente excluir o registro selecionado?')) then
  begin
    if(FAPI.DeleteProduto(FDtSet.FieldByName('id').AsInteger))
    then ListaProdutos;
  end;
end;

procedure TfMain.BtnEditarClick(Sender: TObject);
var
  vForm : TfCad_Produto;
begin
  if(FDtSet.IsEmpty)
  then Exit;

  vForm := TfCad_Produto.Create(Self);
  try
    vForm.Caption       := 'Dados do Produto - ' + FDtSet.FieldByName('descricao').AsString + ' - [ESC] para sair';
    vForm.ID            := FDtSet.FieldByName('id')            .AsInteger;
    vForm.Descricao     := FDtSet.FieldByName('descricao')     .AsString;
    vForm.DataCadastro  := FDtSet.FieldByName('data_cadastro') .AsDateTime;
    vForm.ValorUnitario := FDtSet.FieldByName('valor_unitario').AsCurrency;
    vForm.Observacao    := FDtSet.FieldByName('observacao')    .AsString;
    vForm.ShowModal;

    if(vForm.ModalResult = mrOk)
    then ListaProdutos;
  finally
    vForm.Free;
  end;
end;

procedure TfMain.FormCreate(Sender: TObject);
begin
  FDtSet := TClientDataSet.Create(Self);
  FDtSrc := TDataSource.Create(Self);
  FAPI   := TDataSnapRest.Create;

  GridDataBinding;
end;

procedure TfMain.FormDestroy(Sender: TObject);
begin
  FDtSet.Free;
  FDtSrc.Free;
  FAPI  .Free;
end;

procedure TfMain.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if(Key = VK_F2)
  then BtnNovoClick(BtnNovo);

  if(Key = VK_F3)
  then BtnEditarClick(BtnEditar);

  if(Key = VK_F4)
  then BtnExcluirClick(BtnExcluir);

  if(Key = VK_F5)
  then ListaProdutos;
end;

procedure TfMain.FormShow(Sender: TObject);
begin
  ListaProdutos;
end;

end.
