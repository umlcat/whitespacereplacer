unit ufrmMain;

interface

uses
  LCLIntf, LCLType, LMessages,
  Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, Buttons, ExtCtrls, ComCtrls,
  {$IFDEF FPC}
  MaskEdit,
  {$ENDIF}
  //ToolEdit,
  CheckLst, EditBtn,
  uktossys, uktossearchfiles,
  uktstrings, uktfilesbyname,
  uktmsgdlgtypes,
  uktmsgdlgs,
  uktmsgdlgsmemos,
  ResStrs, ufrmAbout;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    btnHelp: TBitBtn;
    sbStatusBar: TStatusBar;
    pnTop: TPanel;
    btnExit: TBitBtn;
    chbConfirmReplacement: TCheckBox;
    btnAbout: TBitBtn;
    btnOptions: TBitBtn;
    pnCtrls: TPanel;
    deedFilePath: TDirectoryEdit;
    btnFileSearch: TBitBtn;
    btnFileReplace: TBitBtn;
    chlbDestination: TCheckListBox;
    lblFilePath: TLabel;
    lblSourceFileName: TLabel;
    btnSelectNone: TBitBtn;
    btnSelectALL: TBitBtn;
    edSourceFileName: TEdit;
    procedure btnHelpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnFileSearchClick(Sender: TObject);
    procedure btnFileReplaceClick(Sender: TObject);
    procedure deedFilePathChange(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure btnSelectALLClick(Sender: TObject);
    procedure btnSelectNoneClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    FilePath: string;

    SourceFileName: string;
    DestFileName: string;

    Wildcard: string;

    procedure LoadValues();
    procedure LoadStrings();

    procedure FileSearch();
    procedure FileReplace();
  end;

var
  frmMain: TfrmMain;

implementation

{$IFDEF FPC}
{$R *.LFM}
{$ENDIF}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  LoadValues();
  LoadStrings();
end;

procedure TfrmMain.btnHelpClick(Sender: TObject);
begin
  uktmsgdlgsmemos.ShowMessage('Hello World');
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
//
end;

procedure TfrmMain.LoadValues();
var AppPath, ConfigFilename: string; F: TextFile;
begin
  AppPath := ParamStr(0);
  //@to-do: folder sep.
  ConfigFilename := ExtractFileDir(AppPath) + DirectorySeparator + 'ExtReplacer.txt';

  if (uktossys.FileFound(ConfigFilename)) then
  begin
    System.Assign(F, ConfigFilename);
    System.Reset(F);

//    if not System.EoF(F)
//      then System.ReadLn(F, WindowsFolder);

    System.Close(F);
  end else
  begin
//    WindowsFolder := 'C:\WINDOWS\SYSTEM';
  end
end;

procedure TfrmMain.LoadStrings();
begin
  Self.Caption := resTfrMain_Caption;
  Application.Title := resTfrMain_Caption;
  
  chbConfirmReplacement.Caption := reschbConfirmReplaced_Caption;

  btnFileReplace.Caption := resbtnFileReplace_Caption;
  btnFileSearch.Caption  := resbtnFileSearch_Caption;

  btnExit.Caption    := resbtnExit_Caption;
  btnHelp.Caption    := resbtnHelp_Caption;
  btnAbout.Caption   := resbtnAbout_Caption;
  btnOptions.Caption := resbtnOptions_Caption;
  btnSelectALL.Caption  := resbtnSelectALL_Caption;
  btnSelectNone.Caption := resbtnSelectNone_Caption;

  lblSourceFileName.Caption := reslblSourceFileName_Caption;
  lblFilePath.Caption  := reslblFilePath_Caption;
  deedFilePath.Text := '';
end;

procedure TfrmMain.FileSearch();
var SearchRecord: TSearchFilesRecord;
    FileRecord: TFileRecord; ACount: Integer; Path: string;
begin
  with chlbDestination.Items do
  begin
    Clear();

    // obtener subcadena a buscar
    SourceFileName := edSourceFileName.Text;

    Wildcard := '*' + SourceFileName + '*.*';

    //@ to-do: folder sep.
    Path := FilePath + DirectorySeparator + Wildcard;
    FileSearchInit(SearchRecord, Path, faArchive);

    ACount := 0;
    while (FileSearchNext(SearchRecord, FileRecord)) do
    begin
      if (
        (not FileRecord.IsOwnFolder) and
        (not FileRecord.IsParentFolder)) then
      begin
        Add(FileRecord.FileName + FileRecord.FileExt);
        Inc(ACount);
      end;
    end;

    FileSearchDone(SearchRecord);
  end;

  if (ACount = 0) then
  begin
    ShowMessage(resNotFound);
  end;
end;

procedure TfrmMain.FileReplace();
var I: Integer; Msg, Extension,
    Sourcename, Destname, Tempname: string;
    FullSourcename, FullDestname, FullTempname: string;
begin
  with chlbDestination, Items do
  begin
    for I := 0 to Pred(Count) do
    begin
      if (Checked[i]) then
      begin
        Sourcename := Items[i];
        // obtain file-extension without file-name
        Extension  := SysUtils.ExtractFileExt(Sourcename);
        // remove file-extension, obtain file-name
        Sourcename := SysUtils.ChangeFileExt(Sourcename, '');
        // replace the text in the sourcefilename,
        // indicated by "SourceFilename"
        // to "DestFilename"

        // first, detect, already existing hyphens
        Destname :=
          uktstrings.ReplaceCharByStringCopy(Sourcename, '-', '--');
        // second, replace underscores
        Destname :=
          uktstrings.ReplaceCharByCharCopy(Destname, '_', '-');
        // third, replace blanks
        Destname :=
          uktstrings.ReplaceCharByCharCopy(Destname, ' ', '-');

        Tempname :=
          uktfilesbyname.FileNameRandomByPath(FilePath, Extension);

        // do not use "ChangeFileExt" with multiple "."
        Sourcename := Sourcename + Extension;
        Destname   := Destname + Extension;
        // add extension, again
        // agregar extension, de nuevo

        // add full path
        FullSourcename := FilePath + DirectorySeparator + Sourcename;
        FullDestname   := FilePath + DirectorySeparator + Destname;
        FullTempname   := FilePath + DirectorySeparator + Tempname;

        Msg := Format(resConfirmReplacement, [Sourcename, Destname]);
        if (MessageDlg(Msg, mtConfirmation, [mbYes, mbNo]) = mbYes) then
        begin
          uktfilesbyname.FileNameRename(FullSourcename, FullTempname);
          Application.ProcessMessages();

          uktfilesbyname.FileNameRename(FullTempname, FullDestname);
          Application.ProcessMessages();
          // rename filename in filesystem
          // renombrar nombrearchivo en sistemaarchivos

          if (chbConfirmReplacement.Checked) then
          begin
            ShowMessage(#39 + Sourcename + #39 + resReplaced);
          end;
        end;
        // perform filename replacement
        // realizar reemplazo de nombrearchivo
      end;
    end;
  end;
end;

procedure TfrmMain.btnFileSearchClick(Sender: TObject);
begin
  FileSearch();
end;

procedure TfrmMain.btnFileReplaceClick(Sender: TObject);
begin
  FileReplace();
  FileSearch();
end;

procedure TfrmMain.deedFilePathChange(Sender: TObject);
begin
  FilePath := deedFilePath.Text;
end;

procedure TfrmMain.btnAboutClick(Sender: TObject);
begin
  ufrmAbout.Ejecutar();
end;

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  Self.Close();
end;

procedure TfrmMain.btnOptionsClick(Sender: TObject);
begin
//
end;

procedure TfrmMain.btnSelectALLClick(Sender: TObject);
var I: Integer;
begin
  with chlbDestination, Items do
  begin
    for I := 0 to Pred(Count) do
    begin
      Checked[i] := TRUE;
    end;
  end;
end;

procedure TfrmMain.btnSelectNoneClick(Sender: TObject);
var I: Integer;
begin
  with chlbDestination, Items do
  begin
    for I := 0 to Pred(Count) do
    begin
      Checked[i] := FALSE;
    end;
  end;
end;

end.
