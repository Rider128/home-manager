{ config, ... }:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    settings."*" = {
      addKeysToAgent = "yes";
      setEnv = "TERM=xterm-256color";
      sendEnv = [
        "COLORTERM"
        "TERM_PROGRAM"
        "TERM_PROGRAM_VERSION"
      ];
    };

    extraConfig = ''
      Include ${config.sops.secrets.ssh_config.path}
    '';
  };
}
