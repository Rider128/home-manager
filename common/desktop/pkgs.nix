{ pkgs, ... }:
{
        nixpkgs.config.permittedInsecurePackages = [ "electron-39.8.10" ];
        home.packages = [
                pkgs.bitwarden-desktop
                pkgs.drawio
                pkgs.kitty
                pkgs.obsidian
        ];
}
