{
  pkgs,
  config,
  lib,
  ...
}:
{
  #Chromium
  programs.chromium = {
    enable = true;
    commandLineArgs = [
      #if the host have a policy to disable sandboxing
      #"--no-sandbox"
      "--ignore-certificate-errors"
    ];

    #extraOpts = {
    #  "BrowserSignin" = 0;
    #  "SyncDisabled" = true;
    #  "PasswordManagerEnabled" = false;
    #};

    extensions = [
      { id = "heflipieckodmcppbnembejjmabajjjj"; } # Buttercup
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # Ublock origin
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
      { id = "oldceeleldhonbafppcapldpdifcinji"; } # Drawio
      { id = "gphhapmejobijbbhgpjhcjognlahblep"; } # Gnome Extensions
      { id = "efobhjmgoddhfdhaflheioeagkcknoji"; } # Vertical Tabs
    ];
  };
}
