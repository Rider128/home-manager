{ pkgs, ... }:
{
  # Tmux
  programs.tmux = {
    enable = true;
    extraConfig = "
    set-option -g default-shell ${pkgs.zsh}/bin/zsh
    set-option -g mouse on
    

    ";
    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode

      #{
      #  plugin = tmuxPlugins.resurrect;
      #  extraConfig = "
      #    set -g @resurrect-strategy-vim 'session'
      #    set -g @resurrect-strategy-nvim 'session'
      #    set -g @resurrect-capture-pane-contents 'on'

      #  ";
      #}

      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '15'
          set -g @continum-boot 'on'



          # Set new panes to open in current directory
          bind b new-window -c "#{pane_current_path}"
          bind '"' split-window -c "#{pane_current_path}"
          bind % split-window -h -c "#{pane_current_path}"
        '';
      }
      #{
      #  plugin = tmuxPlugins.catppuccin;
      #  extraConfig = ''
      #    set -g @catppuccin_window_left_separator "█"
      #    set -g @catppuccin_window_right_separator "█ "
      #    set -g @catppuccin_window_number_position "right"
      #    set -g @catppuccin_window_middle_separator "  █"
      #    set -g @catppuccin_window_default_fill "number"
      #    set -g @catppuccin_window_current_fill "number"
      #    set -g @catppuccin_window_current_text "#{pane_current_path}"
      #    set -g @catppuccin_status_modules_right "application session date_time"
      #    set -g @catppuccin_status_left_separator  ""
      #    set -g @catppuccin_status_right_separator " "
      #    set -g @catppuccin_status_right_separator_inverse "yes"
      #    set -g @catppuccin_status_fill "all"
      #    set -g @catppuccin_status_connect_separator "no"
      #  '';
      #}
    ];
  };
}
