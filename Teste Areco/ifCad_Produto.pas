unit ifCad_Produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfCad_Produto = class(TForm)
    Pnl_Principal: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Ed_Descricao: TEdit;
    Pnl_Botoes: TPanel;
    BtnGravar: TButton;
    BtnCancelar: TButton;
    Ed_ID: TEdit;
    Label3: TLabel;
    Ed_DataCadastro: TEdit;
    Label4: TLabel;
    Ed_ValorUnitario: TEdit;
    Label5: TLabel;
    Mm_Observacao: TMemo;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    function Confirmacao(pMsg: String) : Boolean;
  private
    FID           : Integer;
    FDataCadastro : TDateTime;
    FDescricao    : String;
    FValorUnitario: Currency;
    FObservacao   : String;
  public
    property ID           : Integer   read FID            write FID;
    property DataCadastro : TDateTime read FDataCadastro  write FDataCadastro;
    property Descricao    : String    read FDescricao     write FDescricao;
    property ValorUnitario: Currency  read FValorUnitario write FValorUnitario;
    property Observacao   : String    read FObservacao    write FObservacao;
  end;

var
  fCad_Produto: TfCad_Produto;

implementation

uses uT_DataSnapREST, uT_Produto;

{$R *.dfm}

procedure TfCad_Produto.BtnCancelarClick(Sender: TObject);
begin
  if(Confirmacao('Deseja realmente cancelar a inclus�o/edi��o do registro selecionado?'))
  then ModalResult := mrCancel;
end;

procedure TfCad_Produto.BtnGravarClick(Sender: TObject);
var
  vAPI : TDataSnapRest;
  vProduto : TProduto;
begin
  if(Ed_Descricao.Text = '')
  then raise Exception.Create('Por favor preencha a descri��o!');

  if(Ed_ValorUnitario.Text = '')
  then raise Exception.Create('Por favor preencha o valor unit�rio!');

  vAPI := TDataSnapRest.Create;
  try
    vProduto := TProduto.Create(StrToInt(Ed_ID.Text), StrToDateTime(Ed_DataCadastro.Text), Ed_Descricao.Text, StrToCurr(Ed_ValorUnitario.Text), Mm_Observacao.Lines.Text);

    if(vProduto.ID = 0) then
    begin
      if(vAPI.InsertProduto(vProduto))
      then ModalResult := mrOk;
    end
    else
    begin
      if(vAPI.UpdateProduto(vProduto))
      then ModalResult := mrOk;
    end;
  finally
    vProduto.Free;
    vAPI.Free;
  end;
end;

function TfCad_Produto.Confirmacao(pMsg: String): Boolean;
begin
  Result := (Application.MessageBox(PChar(pMsg), 'Confirma��o', MB_YESNO + MB_ICONQUESTION) = idYes);
end;

procedure TfCad_Produto.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if(Key = VK_ESCAPE)
  then ModalResult := mrCancel;

  if(Key = VK_F10)
  then BtnGravarClick(BtnGravar);

  if(Key = VK_F9)
  then BtnCancelarClick(BtnCancelar);
end;

procedure TfCad_Produto.FormShow(Sender: TObject);
begin
  Ed_ID.Text            := IntToStr(FID);
  Ed_DataCadastro.Text  := DateTimeToStr(FDataCadastro);
  Ed_Descricao.Text     := FDescricao;
  Ed_ValorUnitario.Text := FormatFloat('#,##0.00', FValorUnitario);

  Mm_Observacao.Lines.Clear;

  if(FObservacao <> '')
  then Mm_Observacao.Lines.Add(FObservacao);
end;

end.
