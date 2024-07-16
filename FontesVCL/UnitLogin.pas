unit UnitLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Loading, Vcl.Session;

type
  TFrmLogin = class(TForm)
    Image1: TImage;
    pLogin: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    Label4: TLabel;
    Panel2: TPanel;
    edtEmail: TEdit;
    Panel3: TPanel;
    edtSenha: TEdit;
    btnAcessar: TSpeedButton;
    procedure btnAcessarClick(Sender: TObject);
  private
    procedure TerminateLogin(Sender: TObject);
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses UnitPrincipal;

procedure TFrmLogin.TerminateLogin(Sender: TObject);
begin
    TLoading.Hide;

    if Sender is TThread then
        if Assigned(TThread(Sender).FatalException) then
        begin
            showmessage(Exception(TThread(sender).FatalException).Message);
            exit;
        end;

    // Dados de acesso...
    TSession.ID_USUARIO := 1;
    TSession.EMAIL := 'heber@teste.com.br';
    TSession.NOME := 'Heber Stein Mazutti';


    if NOT Assigned(FrmPrincipal) then
        Application.CreateForm(TFrmPrincipal, FrmPrincipal);

    FrmPrincipal.Show;
end;

procedure TFrmLogin.btnAcessarClick(Sender: TObject);
begin
    TLoading.Show(Self);

    TLoading.ExecuteThread(procedure
    begin
        // Criar a requisicao para o servidor...
        Sleep(1000);
    end,
    TerminateLogin);
end;

end.
