{ pkgs, config, ... }:
{
  programs = {
    zsh = {
      enable = true;
      dotDir = config.home.homeDirectory;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      history = {
        size = 5000;
        path = "${config.home.homeDirectory}/.zsh_history";

      };

      initContent = ''
        bindkey "^[[1;5C" forward-word
        bindkey "^[[1;5D" backward-word
        source ${pkgs.nix-index}/etc/profile.d/command-not-found.sh
        # History
        SAVEHIST=$HISTSIZE
        HISTDUP=erase
        setopt appendhistory
        setopt sharehistory
        setopt hist_ignore_space
        setopt hist_ignore_all_dups
        setopt hist_save_no_dups
        setopt hist_ignore_dups
        setopt hist_find_no_dups
        # Completion styling
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
        zstyle ':completion:*' menu no
        zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
        zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
        eval "$(fzf --zsh)"
        if [ -z "$IN_NIX_SHELL" ] && [ -z "$IN_NIX_DEVELOP" ] && [ "$TERM" != "dumb" ]; then
          eval "$(${pkgs.starship}/bin/starship init zsh)"
        fi
        # Use bitwarden
        ${
          if pkgs.stdenv.isDarwin then
            "export SSH_AUTH_SOCK=$HOME/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock"
          else
            "export SSH_AUTH_SOCK=$HOME/.bitwarden-ssh-agent.sock"
        }
        export SOPS_AGE_KEY_FILE="$HOME/.config/sops/age/keys.txt"

      '';
      shellAliases = {
        ll = "ls -lh";
        la = "ls -la";
        l = "${pkgs.eza}/bin/eza --icons=always";

        ls = "${pkgs.eza}/bin/eza --icons=always";

        grep = "grep --color=auto";
        egrep = "egrep --color=auto";
        fgrep = "fgrep --color=auto";
        rg = "${pkgs.ripgrep}/bin/rg";
        mkdir = "mkdir -p";
        ssha = "ssh -o \"UserKnownHostsFile=/dev/null\" -o \"StrictHostKeyChecking=no\"";
        loadd = "autorandr -l";
        mkt = "cd $(mktemp -d)";
        v = "vim";
      };
      oh-my-zsh.plugins = [
        "git"
        "sudo"
        "kubectl"
      ];
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      historyWidgetOptions = [
        "--sort"
        "--exact"
      ];
    };
    zoxide = {
      enable = true;
    };
    starship = {
      enable = true;
      # fix nix shell error
      enableZshIntegration = false;
    };

    zsh.oh-my-zsh.enable = true;
  };
}
