; Script Inno Setup — génère l'installeur Windows de Codex Exobiologique.
;
; Généré et compilé via `task build:windows:installer` (voir Taskfile.yml) ;
; ne pas lancer ISCC à la main sans avoir d'abord fait un `flutter build
; windows`, sans quoi build\windows\x64\runner\Release est absent ou périmé.
;
; Nécessite Inno Setup 6 : https://jrsoftware.org/isdl.php

#define MyAppName "Codex Exobiologique"
#define MyAppPublisher "fr.benoitfontaine"
#define MyAppExeName "elite_dangerous.exe"
#define MyBuildDir "..\..\build\windows\x64\runner\Release"

; Le Taskfile passe la version via `/DMyAppVersion=x.y.z` (lue depuis
; pubspec.yaml) ; ce repli ne sert qu'à un appel ISCC direct.
#ifndef MyAppVersion
#define MyAppVersion "1.0.0"
#endif

[Setup]
; GUID fixe : ne pas régénérer, sous peine de casser la mise à jour en place
; des installations existantes (Windows les verrait comme une autre appli).
AppId={{A9C1F1B4-6E3B-4C9E-9C7D-6C6F9E9C5C11}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
LicenseFile=..\..\LICENSE
OutputDir=..\..\build\windows\installer
OutputBaseFilename=CodexExobiologique-Setup-{#MyAppVersion}
SetupIconFile=..\runner\resources\app_icon.ico
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
UninstallDisplayIcon={app}\{#MyAppExeName}

[Files]
Source: "{#MyBuildDir}\*"; DestDir: "{app}"; Flags: recursesubdirs createallsubdirs ignoreversion

[Tasks]
Name: "desktopicon"; Description: "Créer un raccourci sur le Bureau"; GroupDescription: "Raccourcis :"

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\Désinstaller {#MyAppName}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "Lancer {#MyAppName}"; Flags: nowait postinstall skipifsilent
