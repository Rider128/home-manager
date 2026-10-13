{ pkgs, ... }:
{
  home.packages = [
    # Linux-specific CLI
    pkgs.picocom
    pkgs.nerd-fonts.jetbrains-mono

    # Linux-specific desktop
    pkgs.copyq
    pkgs.remmina
    pkgs.endeavour
    pkgs.thunar
    pkgs.flameshot
    pkgs.pavucontrol
    pkgs.fractal
    pkgs.baobab

    # Heavy graphics apps (Linux only)
    pkgs.wireshark
    pkgs.inkscape
    pkgs.gimp
    pkgs.filezilla
  ];
}
