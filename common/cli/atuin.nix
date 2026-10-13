{
  pkgs,
  config,
  lib,
  ...
}:
{
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      auto_sync = true;
      sync_frequency = "5m";
      sync_address = "https://atuin.ridercorp.org";
      search_mode = "fuzzy";

      # La clé de chiffrement est dans sops (elle ne change jamais)
      key_path = config.sops.secrets."atuin_key".path;
      # La session est gérée automatiquement par `atuin login`
      # (pas besoin de la stocker dans sops)
    };
  };
}
