{ pkgs, lib, ... }:
{

  # To use the good version of nix
  nix = {
    package = lib.mkForce pkgs.nixVersions.nix_2_28;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # Allow unfree packages (vscode, etc.)
  nixpkgs.config.allowUnfreePredicate = _: true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.stateVersion = "25.11";

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
