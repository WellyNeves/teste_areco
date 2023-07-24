unit uT_Conexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Comp.Client, FireDAC.Phys.PG, FireDAC.DApt;

type
  TConexao = class(TObject)
  private
    FConnection : TFDConnection;
    FTransaction: TFDTransaction;
    FConectado  : Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Conectar;
    procedure Desconectar;
    function IsConectado: Boolean;
    function GetNewQuery: TFDQuery;
  end;

implementation

{ TConexao }

constructor TConexao.Create;
begin
  FConnection  := TFDConnection.Create(nil);
  FTransaction := TFDTransaction.Create(nil);

  FTransaction.Connection := FConnection;
  FConnection.LoginPrompt := False;

  FConectado := False;
end;

destructor TConexao.Destroy;
begin
  Desconectar;
  FTransaction.Free;
  FConnection.Free;

  inherited;
end;

procedure TConexao.Conectar;
begin
  if(FConectado)
  then Exit;

  FConnection.Params.Clear;
  FConnection.Params.Add('DriverID=PG');
  FConnection.Params.Add('Server=localhost');
  FConnection.Params.Add('Port=5432');
  FConnection.Params.Add('Database=areco');
  FConnection.Params.Add('User_Name=postgres');
  FConnection.Params.Add('Password=123456');
  try
    FConnection.Connected := True;
    FConectado := FConnection.Connected;
  except
    FConectado := False;
    raise;
  end;
end;

procedure TConexao.Desconectar;
begin
  if(FConectado) then
  begin
    FConnection.Connected := False;
    FConectado := False;
  end;
end;

function TConexao.IsConectado: Boolean;
begin
  Result := FConectado;
end;

function TConexao.GetNewQuery: TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := FConnection;
  Result.Transaction := FTransaction;
end;

end.

