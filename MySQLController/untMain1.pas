unit untMain1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.Objects, UniProvider,
  MySQLUniProvider, Data.DB, DBAccess, Uni, FGX.ProgressDialog;

type
  TfrmMain = class(TForm)
    Designer: TStyleBook;
    btnConnect: TButton;
    RoundRect1: TRoundRect;
    edtServer: TEdit;
    Label1: TLabel;
    RoundRect2: TRoundRect;
    edtPort: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    RoundRect3: TRoundRect;
    RoundRect4: TRoundRect;
    Label4: TLabel;
    edtPassword: TEdit;
    RoundRect5: TRoundRect;
    Label5: TLabel;
    edtDatabase: TEdit;
    Label6: TLabel;
    edtUserName: TEdit;
    Conn: TUniConnection;
    Provider: TMySQLUniProvider;
    fgActivityDialog1: TfgActivityDialog;
    procedure btnConnectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure TfrmMain.btnConnectClick(Sender: TObject);
begin
 Conn.ProviderName := 'MySQL';
 Conn.Server := edtServer.Text;
 Conn.Port := StrToInt(edtPort.Text);
 Conn.Username := edtUserName.Text;
 Conn.Password := edtPassword.Text;
 Conn.Database := edtDatabase.Text;

 if Conn.Connected = True then
 begin
   Conn.Connected := False;
 end
 else
 begin
   fgActivityDialog1.Show;
  try
   try
    Conn.Connected := True;
    ShowMessage('The connection is successful!');
   except
    on E:Exception do
    begin
      ShowMessage('Error! ' + E.Message);
    end;
   end;
  finally
    fgActivityDialog1.Hide;
    Conn.Connected := False;
  end;
 end;

end;

end.
