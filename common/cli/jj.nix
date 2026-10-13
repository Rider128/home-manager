{ ... }:
{
  programs.jujutsu = {
    enable = true;
    settings = {
      ui.default-command = "log";
    };
  };
}
