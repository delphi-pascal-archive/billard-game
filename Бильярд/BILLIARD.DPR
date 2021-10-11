program billiard;

uses
  Forms,
  billiar in 'billiar.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Billiard';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
