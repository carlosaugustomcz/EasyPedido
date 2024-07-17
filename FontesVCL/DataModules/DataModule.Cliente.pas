unit DataModule.Cliente;

interface

uses
  System.SysUtils, System.Classes, DataSet.Serialize.Config,
  RESTRequest4D,
  DataSet.Serialize.Adapter.RESTRequest4D, FireDAC.Comp.Client;

type
  TDmCliente = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private

  public
    procedure ListarClientes(MemTable: TFDMemTable; filtro: string);
  end;

var
  DmCliente: TDmCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDmCliente.DataModuleCreate(Sender: TObject);
begin
    TDataSetSerializeConfig.GetInstance.CaseNameDefinition := cndLower;
    TDataSetSerializeConfig.GetInstance.Import.DecimalSeparator := '.';
end;

procedure TDmCliente.ListarClientes(MemTable: TFDMemTable;
                                     filtro: string);
var
    resp: IResponse;
begin
    resp := TRequest.New.BaseURL('http://localhost:3000')
                    .Resource('/clientes')
                    .AddParam('filtro', filtro)
                    .Accept('application/json')
                    .Adapters(TDataSetSerializeAdapter.New(MemTable))
                    .Get;

    if resp.StatusCode <> 200 then
        raise Exception.Create(resp.Content);
end;

end.
