; Instalador de Mecanografía Feliz (Inno Setup 6).
; No se compila a mano: lo hace "npm run construir".

#ifndef Version
  #define Version "1.0.0"
#endif

[Setup]
AppId={{6E0B7C51-4F7A-4C3E-9B2D-3A1F5C8E9D21}
AppName=Mecanografía Feliz
AppVersion={#Version}
AppPublisher=Leonardo Caripa
AppPublisherURL=https://github.com/caripadev
AppSupportURL=https://github.com/lans757
AppContact=leonardocaripadev@gmail.com
AppCopyright=© 2026 Leonardo Caripa · Licencia MIT
LicenseFile=LICENSE
DefaultDirName={autopf}\Mecanografia Feliz
DefaultGroupName=Mecanografía Feliz
DisableProgramGroupPage=yes
; Por defecto se instala solo para el usuario actual (no pide administrador).
; Quien tenga permisos puede elegir instalarlo para todos los usuarios.
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog
OutputDir=salida
OutputBaseFilename=Instalar-MecanografiaFeliz
SetupIconFile=recursos\icono.ico
UninstallDisplayIcon={app}\MecanografiaFeliz.exe
UninstallDisplayName=Mecanografía Feliz
Compression=lzma2/max
SolidCompression=yes
WizardStyle=modern
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible

[Languages]
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"

[Tasks]
Name: "escritorio"; Description: "Crear un acceso directo en el escritorio"; GroupDescription: "Accesos directos:"

[Files]
Source: "salida\MecanografiaFeliz-portable\MecanografiaFeliz.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "salida\MecanografiaFeliz-portable\resources.neu"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{autoprograms}\Mecanografía Feliz"; Filename: "{app}\MecanografiaFeliz.exe"; WorkingDir: "{app}"
Name: "{autodesktop}\Mecanografía Feliz"; Filename: "{app}\MecanografiaFeliz.exe"; WorkingDir: "{app}"; Tasks: escritorio

[Run]
Filename: "{app}\MecanografiaFeliz.exe"; WorkingDir: "{app}"; Description: "Abrir Mecanografía Feliz"; Flags: nowait postinstall skipifsilent

[Code]
// El programa usa WebView2 (el motor de Edge). Viene con Windows 11 y con
// Windows 10 actualizado; si falta, se avisa antes de instalar.
function TieneWebView2(): Boolean;
var v: String;
begin
  Result :=
    (RegQueryStringValue(HKLM, 'SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate\Clients\{F3017226-FE2A-4295-8BDF-00C3A9A7E4C5}', 'pv', v) and (v <> '') and (v <> '0.0.0.0')) or
    (RegQueryStringValue(HKCU, 'Software\Microsoft\EdgeUpdate\Clients\{F3017226-FE2A-4295-8BDF-00C3A9A7E4C5}', 'pv', v) and (v <> '') and (v <> '0.0.0.0'));
end;

function InitializeSetup(): Boolean;
begin
  Result := True;
  if not TieneWebView2() then
    Result := MsgBox('Este equipo no tiene "Microsoft Edge WebView2", que Mecanografía Feliz necesita para abrirse.' + #13#10 + #13#10 +
      'Puedes descargarlo gratis en: https://go.microsoft.com/fwlink/p/?LinkId=2124703' + #13#10 + #13#10 +
      '¿Quieres continuar con la instalación de todas formas?', mbConfirmation, MB_YESNO) = IDYES;
end;
