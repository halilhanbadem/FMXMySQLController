program MySQLController;

uses
  System.StartUpCopy,
  FMX.Forms,
  untMain1 in 'untMain1.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
