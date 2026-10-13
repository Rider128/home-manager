{
  pkgs,
  ...
}:
{
  nixpkgs.config.allowUnfreePredicate = _: true;

  home.username = "matthieu";
  home.homeDirectory = "/home/matthieu";

  programs.jujutsu.settings.user = {
    name = "Matthieu Daniel-Thomas";
    email = "matthieu.daniel.thomas.2@gmail.com";
  };

  home.packages = [
    pkgs.vesktop
    pkgs.gnome-disk-utility
    pkgs.mission-center
    pkgs.discord
    pkgs.ludusavi
    pkgs.osu-lazer-bin
    pkgs.obs-studio
    pkgs.godot
    pkgs.vlc
  ];
}
