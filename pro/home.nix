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
    pkgs.bluetui
    pkgs.element-desktop
  ];
}
