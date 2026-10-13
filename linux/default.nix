{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./chromium.nix
    ./dunst.nix
    ./pkgs.nix
  ];

  # Generic Linux compatibility (non-NixOS)
  targets.genericLinux.enable = true;
  xdg.enable = true;
  xdg.mime.enable = true;
  xdg.systemDirs.data = [ "${config.home.homeDirectory}/.nix-profile/share/applications" ];

  # Chromium is only installed on Linux
  home.sessionVariables = {
    BROWSER = "chromium";
  };
}
