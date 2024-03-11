unit projetosimpleorm.model.Interfaces;

interface

uses
  Data.DB;

type
  iConexao = interface
    function Connect : TCustomConnection;
  end;

  iConfiguracao = interface
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

end.
