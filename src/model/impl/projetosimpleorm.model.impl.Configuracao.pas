unit projetosimpleorm.model.impl.configuracao;

interface

uses
  System.SysUtils,
  LocalCache4D,
  projetosimpleorm.model.Interfaces;

type
  TConfiguracao = class(TInterfacedObject, iConfiguracao)
    private
    public
      constructor create;
      destructor destroy; override;
      class function New : iConfiguracao;
      function DriverID(value : string) :  iConfiguracao; overload;
      function DriverID : string; overload;
      function DataBase(value : string) :  iConfiguracao; overload;
      function DataBase : string; overload;
      function UserName(value : string) :  iConfiguracao; overload;
      function UserName : string; overload;
      function Password(value : string) :  iConfiguracao; overload;
      function Password : string; overload;
      function Port(value : string) :  iConfiguracao; overload;
      function Port : string; overload;
      function Server(value : string) :  iConfiguracao; overload;
      function Server : string; overload;
      function Schema(value : string) :  iConfiguracao; overload;
      function Schema : string; overload;
      function Locking(value : string) :  iConfiguracao; overload;
      function Locking : string; overload;
  end;

implementation

constructor TConfiguracao.Create;
begin
  if not FileExists('simpleorm.lc4') then
    LocalCache.SaveToStorage('simpleorm.lc4');

  LocalCache.LoadDatabase('simpleorm.lc4');
  LocalCache.Instance('configuracao');

end;


function TConfiguracao.DataBase: string;
begin
  Result := LocalCache.GetItem('DataBase');
end;

function TConfiguracao.DataBase(value: string): iConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('Database', value);
end;

destructor TConfiguracao.Destroy;
begin
  LocalCache.SaveToStorage('simpleorm.lc4');
  inherited
end;

function TConfiguracao.DriverID: string;
begin
  Result := LocalCache.GetItem('DriveID');
end;

function TConfiguracao.DriverID(value: string): iConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('DriveID', value);
end;

function TConfiguracao.Locking: string;
begin
  Result := LocalCache.GetItem('Locking');
end;

function TConfiguracao.Locking(value: string): iConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('Locking', value);
end;

class function TConfiguracao.New : iConfiguracao;
begin
  Result := Self.Create;
end;


function TConfiguracao.Password: string;
begin
  Result := LocalCache.GetItem('Password');
end;

function TConfiguracao.Password(value: string): iConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('Password', value);
end;

function TConfiguracao.Port(value: string): iConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('Port', value);
end;

function TConfiguracao.Port: string;
begin
  Result := LocalCache.GetItem('Port');
end;

function TConfiguracao.Schema: string;
begin
  Result := LocalCache.GetItem('Schema');
end;

function TConfiguracao.Schema(value: string): iConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('Schema', value);
end;

function TConfiguracao.Server(value: string): iConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('Server', value);
end;

function TConfiguracao.Server: string;
begin
  Result := LocalCache.GetItem('Server');
end;

function TConfiguracao.UserName(value: string): iConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('UserName', value);
end;

function TConfiguracao.UserName: string;
begin
  Result := LocalCache.GetItem('UserName');
end;

end.
