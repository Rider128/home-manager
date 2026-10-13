{ config, ... }:
{
  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";

    secrets = {
      atuin_key = { };
      ssh_config = { };
    };

    # Utilise la clé age dérivée de ta clé SSH
    # (même clé que ~/.ssh/id_ed25519, mais au format age natif)
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
  };
}
