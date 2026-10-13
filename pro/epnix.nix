{
  pkgs,
  ...
}:
{
  home.packages = [
    pkgs.epnix.epics-base
    pkgs.epnix.phoebus

  ];
}
