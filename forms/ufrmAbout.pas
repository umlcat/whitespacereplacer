unit ufrmAbout;

{$MODE Delphi}

interface

uses
  LCLIntf, LCLType, LMessages, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ResStrs;

type
  TfrmAbout = class(TForm)
    pnCtrls: TPanel;
    ProgramIcon: TImage;
    lblProductName: TLabel;
    lblVersion: TLabel;
    lblCopyright: TLabel;
    lblComments: TLabel;
    btnOK: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure LoadStrings;
  end;

  procedure Ejecutar;

implementation

{$R *.lfm}

procedure Ejecutar;
var Form: TfrmAbout;
begin
  Application.CreateForm(TfrmAbout, Form);
    Form.ShowModal;
  Form.Release; Form.Free; Form := nil;
end;

procedure TfrmAbout.LoadStrings;
begin
  Self.Caption := resTfrmAbout_Caption;

  lblProductName.Caption := reslblProductName_Caption;
  lblVersion.Caption     := reslblVersion_Caption;
  lblCopyright.Caption   := reslblCopyright_Caption;
  lblComments.Caption    := reslblComments_Caption;

  btnOK.Caption := resbtnOK_Caption;
end;

procedure TfrmAbout.FormCreate(Sender: TObject);
begin
  LoadStrings;
end;

end.

