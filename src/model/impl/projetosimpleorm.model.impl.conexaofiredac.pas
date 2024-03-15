unit projetosimpleorm.model.impl.conexaofiredac;

interface

uses
  FireDAC.Comp.Client,
  FireDAC.Comp.UI,
  FireDAC.Phys,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Async,
  FireDAC.Stan.Def,
  FireDAC.Stan.Error,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.stan.Pool,
  FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait,

  FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLCli,
  FireDAC.Phys.MySQLDef,
  FireDAC.Phys.MySQLMeta,
  FireDAC.Phys.MySQLWrapper,

  projetosimpleorm.model.Interfaces,
  Data.DB,
  System.SysUtils;

type
  TConexao = class(TInterfacedObject, iConexao)
    private
      FConfiguracao : iConfiguracao;
      FConn : TFDConnection;
    public
      constructor create(configuracao : iConfiguracao);
      destructor destroy; override;
      class function New(configuracao : iConfiguracao) : iConexao;
      function Connect : TCustomConnection;
  end;

implementation

{ TConexao }

function TConexao.Connect: TCustomConnection;
begin
  try    
    FConn.Params.DriverID := FConfiguracao.DriverID;
    FConn.Params.DataBase := FConfiguracao.DataBase;
    FConn.Params.UserName := FConfiguracao.UserName;
    FConn.Params.Password := FConfiguracao.Password;
    Fconn.Params.Add('Port='+FConfiguracao.Port);
    FConn.Params.Add('Server='+FConfiguracao.Server);

    if not FConfiguracao.Schema.IsEmpty then
    begin
      FConn.Params.Add('MetaCurSchema='+FConfiguracao.schema);
      FConn.Params.Add('MetaDefSchema='+FConfiguracao.schema);
    end;

    if not FConfiguracao.Locking.IsEmpty then
      FConn.Params.Add('LockingMode='+FConfiguracao.Locking);
    
        
    FConn.Connected := true;
    Result := FConn;
  except
    raise Exception.Create('Não foi possível realizar a conexão.');
  end;
end;

constructor TConexao.create(configuracao : iConfiguracao);
begin
  FConn := TFDConnection.Create(nil);
  FConfiguracao := Configuracao;
end;

destructor TConexao.destroy;
begin
  FreeAndNil(Fconn);
  inherited;
end;

class function TConexao.New(configuracao : iConfiguracao) : iConexao;
begin
  Result := Self.Create(Configuracao);
end;

end.
