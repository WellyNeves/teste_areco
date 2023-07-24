program TesteAreco;

uses
  Vcl.Forms,
  if_Main in 'if_Main.pas' {fMain},
  uT_DataSnapREST in 'uT_DataSnapREST.pas',
  uT_Produto in 'uT_Produto.pas',
  ifCad_Produto in 'ifCad_Produto.pas' {fCad_Produto};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TfCad_Produto, fCad_Produto);
  Application.Run;
end.
