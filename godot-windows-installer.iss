; Copyright © 2022 Sean "rioki" Farrell <sean.farrell@rioki.org>
; This work is free. You can redistribute it and/or modify it under the
; terms of the Do What The Fuck You Want To Public License, Version 2,
; as published by Sam Hocevar. See the COPYING.txt file for more details.

#define MyAppName "Godot"
#define MyAppVersion "3.4.2"
#define MyAppPublisher "Godot Developers"
#define MyAppURL "https://godotengine.org/"
#define MyAppExeName   "Godot.exe"
#define MyAppExeName32 "Godot_v3.4.3-stable_win32.exe"
#define MyAppExeName64 "Godot_v3.4.3-stable_win64.exe"
#define MyAppAssocName MyAppName + " Project"
#define MyAppAssocExt ".godot"
#define MyAppAssocKey StringChange(MyAppAssocName, " ", "") + MyAppAssocExt

[Setup]
AppId={{2543D27D-3124-411C-98F8-1BF8577C89EE}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
ChangesAssociations=yes
DisableProgramGroupPage=yes
LicenseFile=godot\License.txt
PrivilegesRequiredOverridesAllowed=dialog
OutputBaseFilename=godot
SetupIconFile=godot\icon_outlined.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern
ArchitecturesInstallIn64BitMode=x64

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "godot\{#MyAppExeName32}"; DestDir: "{app}"; Flags: ignoreversion; DestName: "Godot.exe"; Check: not Is64BitInstallMode
Source: "godot\{#MyAppExeName64}"; DestDir: "{app}"; Flags: ignoreversion; DestName: "Godot.exe"; Check: Is64BitInstallMode

[Registry]
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocExt}\OpenWithProgids"; ValueType: string; ValueName: "{#MyAppAssocKey}"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}"; ValueType: string; ValueName: ""; ValueData: "{#MyAppAssocName}"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#MyAppExeName},0"
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""
Root: HKA; Subkey: "Software\Classes\Applications\{#MyAppExeName}\SupportedTypes"; ValueType: string; ValueName: ".myp"; ValueData: ""

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

