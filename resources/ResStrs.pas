unit ResStrs;

interface

{$INCLUDE 'Language.inc'}

{$IFDEF LanguageEnglish}
const
  resProductName      = 'Whitespace Filename Replacer';
resourcestring
  resTfrMain_Caption  = resProductName;
  resTfrmAbout_Caption  = 'About '+ resProductName;
  resTfrmHelp_Caption   =
    'Changes the source substring in the filename, '
    'for the destination substring';

  resbtnOK_Caption      = 'OK';
  resbtnCancel_Caption  = 'Cancel';
  resbtnExit_Caption    = 'E&xit';
  resbtnAbout_Caption   = '&About';
  resbtnOptions_Caption = '&Options';
  resbtnHelp_Caption    = 'Help';
  resbtnSelectALL_Caption  = 'Select &All;
  resbtnSelectNone_Caption = 'Select &None;

  resbtnFileReplace_Caption = 'Replace';
  resbtnFileSearch_Caption  = 'Search';

  reschbConfirmReplaced_Caption = 'Confirm Files Replaced';

  reslblFilePath_Caption    = 'File Path:';
  reslblSourceFileName_Caption   = 'Source FileName:';

  reslblProductName_Caption = resProductName;
  reslblVersion_Caption     = '2.0 Version';
  reslblCopyright_Caption   = 'star-dev (c)';
  reslblComments_Caption    = 'star-dev.com';

  resConfirmReplacement = 'Are you sure you want to replace "%s" by "%s" ?';
  resReplaced           = ' replaced.';
  resNotFound           = 'Files not Found.';
  resUnderConstruction  = 'Under Construction';
  resFileAlreadyExists  = 'Error: Destination filename already exists.';
{$ENDIF}

{$IFDEF LanguageSpanish}
const
  resProductName      = 'Reemplazador de Espacios en Nombre de Fichero';
resourcestring
  resTfrMain_Caption  = resProductName;
  resTfrmAbout_Caption  = 'Acerca de ' + resProductName;
  resTfrmHelp_Caption   =
    'Changes the source substring in the filename, '
    'for the destination substring';

  resbtnOK_Caption      = 'Aceptar';
  resbtnCancel_Caption  = 'Cancelar';
  resbtnExit_Caption    = 'Salir';
  resbtnAbout_Caption   = '&Acerca';
  resbtnOptions_Caption = '&Opciones';
  resbtnHelp_Caption    = 'Ayuda';
  resbtnSelectALL_Caption  = 'Seleccionar To&dos';
  resbtnSelectNone_Caption = 'Seleccionar &Ninguno';

  resbtnFileReplace_Caption = 'Reemplazar';
  resbtnFileSearch_Caption  = 'Buscar';

  reschbConfirmReplaced_Caption = 'Confirmar Ficheros Reemplazados';

  reslblFilePath_Caption    = 'Ruta de Acceso:';
  reslblSourceFileName_Caption   = 'Nombre Fichero Fuente:';

  reslblProductName_Caption = resProductName;
  reslblVersion_Caption     = 'Version 2.0';
  reslblCopyright_Caption   = 'star-dev (c)';
  reslblComments_Caption    = 'star-dev.com';

  resConfirmReplacement = 'Esta seguro que quiere reemplazar "%s" por "%s" ?';
  resReplaced           = ' reemplazado.';
  resNotFound           = 'No se encontraron Ficheros.';
  resUnderConstruction  = 'Bajo Construccion';
  resFileAlreadyExists  = 'Error: Fichero destino ya existe.';
{$ENDIF}

{$IFDEF LanguageLatam}
const
  resProductName      = 'Reemplazador de Espacios en Nombre de Archivo';
resourcestring
  resTfrMain_Caption  = resProductName;
  resTfrmAbout_Caption  = 'Acerca de ' + resProductName;
  resTfrmHelp_Caption   =
    'Changes the source substring in the filename, ' +
    'for the destination substring';

  resbtnOK_Caption      = 'Aceptar';
  resbtnCancel_Caption  = 'Cancelar';
  resbtnExit_Caption    = 'Salir';
  resbtnAbout_Caption   = '&Acerca';
  resbtnOptions_Caption = '&Opciones';
  resbtnHelp_Caption    = 'Ayuda';
  resbtnSelectALL_Caption  = 'Seleccionar To&dos';
  resbtnSelectNone_Caption = 'Seleccionar &Ninguno';

  resbtnFileReplace_Caption = 'Reemplazar';
  resbtnFileSearch_Caption  = 'Buscar';

  reschbConfirmReplaced_Caption = 'Confirmar Archivos Reemplazados';

  reslblFilePath_Caption    = 'Ruta de Acceso:';
  reslblSourceFileName_Caption   = 'Nombre Archivo Fuente:';

  reslblProductName_Caption = resProductName;
  reslblVersion_Caption     = 'Version 2.0';
  reslblCopyright_Caption   = 'star-dev (c)';
  reslblComments_Caption    = 'star-dev.com';

  resConfirmReplacement = 'Esta seguro que quiere reemplazar "%s" por "%s" ?';
  resReplaced           = ' reemplazado.';
  resNotFound           = 'No se encontraron archivos.';
  resUnderConstruction  = 'Bajo Construccion';
  resFileAlreadyExists  = 'Error: Archivo destino ya existe.';
{$ENDIF}

{$IFDEF LanguageFrench}
const
  resProductName      = 'Reemplazateur par Blancks dans Nom d*Archives';
resourcestring
  resTfrMain_Caption  = resProductName;
  resTfrmAbout_Caption  = 'Sur ' + resProductName;
  resTfrmHelp_Caption   =
    'Changes the source substring in the filename, ' +
    'for the destination substring';

  resbtnOK_Caption      = 'OK';
  resbtnCancel_Caption  = 'Annuler';
  resbtnExit_Caption    = 'Sortir';
  resbtnAbout_Caption   = '&Sur...';
  resbtnOptions_Caption = '&Options';
  resbtnHelp_Caption    = 'Aide';
  resbtnSelectALL_Caption  = 'Choisir To&us;
  resbtnSelectNone_Caption = 'Choisir &Aucun';

  resbtnFileReplace_Caption = 'Remplacez';
  resbtnFileSearch_Caption  = 'Chercher';

  reschbConfirmReplaced_Caption = 'Confirmer des Archives Remplacés';

  reslblFilePath_Caption    = 'Acces Chemin:';
  reslblSourceFileName_Caption   = 'Nom Archive du Source:';

  reslblProductName_Caption = resProductName;
  reslblVersion_Caption     = 'Version 2.0';
  reslblCopyright_Caption   = 'star-dev (c)';
  reslblComments_Caption    = 'star-dev.com';

  resConfirmReplacement = 'Il est sûr qu*il veut reemplazer "%s" par "%s" ?';
  resReplaced           = ' remplacé.';
  resNotFound           = 'On n*a pas trouvé d*archives.';
  resUnderConstruction  = 'Sous Construction';
  resFileAlreadyExists  = 'Error: Il*ya le archive du destination.';
{$ENDIF}

{$IFDEF LanguageGerman}
const
  resProductName      = 'Reemplazateur pour Nom d*Archives';
resourcestring
  resTfrMain_Caption  = resProductName;
  resTfrmAbout_Caption  = 'Sur ' + resProductName;
  resTfrmHelp_Caption   =
    'Changes the source substring in the filename, ' +
    'for the destination substring';

  resbtnOK_Caption      = 'OK';
  resbtnCancel_Caption  = 'Annuler';
  resbtnExit_Caption    = 'Sortir';
  resbtnAbout_Caption   = '&Sur...';
  resbtnOptions_Caption = '&Options';
  resbtnHelp_Caption    = 'Aide';
  resbtnSelectALL_Caption  = 'Choisir To&us;
  resbtnSelectNone_Caption = 'Choisir &Aucun';

  resbtnFileReplace_Caption = 'Remplacez';
  resbtnFileSearch_Caption  = 'Chercher';

  reschbConfirmReplaced_Caption = 'Confirmer des Archives Remplacés';

  reslblFilePath_Caption    = 'Acces Chemin:';
  reslblSourceFileName_Caption   = 'Nom Archive du Source:';

  reslblProductName_Caption = resProductName;
  reslblVersion_Caption     = 'Version 2.0';
  reslblCopyright_Caption   = 'star-dev (c)';
  reslblComments_Caption    = 'star-dev.com';

  resConfirmReplacement = 'Il est sûr qu*il veut reemplazer "%s" par "%s" ?';
  resReplaced           = ' remplacé.';
  resNotFound           = 'On n*a pas trouvé d*archives.';
  resUnderConstruction  = 'Sous Construction';
  resFileAlreadyExists  = 'Error: Il*ya le archive du destination.';
{$ENDIF}

implementation

end.
