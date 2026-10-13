{ ... }:
{
  programs.nvf = {
    enable = true;
    # your settings need to go into the settings attribute set
    # most settings are documented in the appendix
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;

        debugMode = {
          enable = false;
          level = 16;
          logFile = "/tmp/nvim.log";
        };
        spellcheck = {
          enable = true;
        };

        lsp = {
          enable = true;
          formatOnSave = true;
          lspkind.enable = true;
          lightbulb.enable = true;
          lspsaga.enable = true;
          trouble.enable = true;
          lspSignature.enable = true;
          otter-nvim.enable = false;
          nvim-docs-view.enable = true;
        };

        debugger = {
          nvim-dap = {
            enable = true;
            ui.enable = true;
          };
        };

        # This section does not include a comprehensive list of available language modules.
        # To list all available language module options, please visit the nvf manual.
        languages = {
          enableFormat = true;
          enableTreesitter = false;
          enableExtraDiagnostics = true;

          # Languages that will be supported in default and maximal configurations.
          nix = {
            enable = true;
            format = {
              type = [ "nixfmt" ];
            };
            lsp = {
              enable = true;
              servers = [ "nixd" ];
            };
            treesitter.enable = false;
            extraDiagnostics.enable = true;
          };

          # Languages that are enabled in the maximal configuration.
          bash.enable = true;
          clang.enable = true;
          css.enable = true;
          html.enable = true;
          sql.enable = false;
          java.enable = true;
          kotlin.enable = true;
          typescript.enable = true;
          go.enable = true;
          lua.enable = true;
          zig.enable = true;
          python = {
            enable = true;
            format = {
              type = [ "ruff" ];
            };
            lsp = {
              enable = true;

            };
            treesitter.enable = false;

          };
          typst.enable = true;
          rust = {
            enable = true;
          };
          terraform = {
            enable = true;
            lsp.enable = true;
            treesitter.enable = false;
          };
          hcl = {
            enable = true;
            format.enable = true;
            lsp.enable = true;
            treesitter.enable = false;
          };

          # Language modules that are not as common.

          # Nim LSP is broken on Darwin and therefore
          # should be disabled by default. Users may still enable
          # `vim.languages.vim` to enable it, this does not restrict
          # that.
          # See: <https://github.com/PMunch/nimlsp/issues/178#issue-2128106096>
          nim.enable = false;
        };

        visuals = {
          nvim-scrollbar.enable = true;
          nvim-web-devicons.enable = true;
          nvim-cursorline.enable = true;
          cinnamon-nvim.enable = true;
          fidget-nvim.enable = true;

          highlight-undo.enable = true;
          indent-blankline.enable = true;

          # Fun
          cellular-automaton.enable = false;
        };

        statusline = {
          lualine = {
            enable = true;
            setupOpts.options.theme = "catppuccin";
            integrations.breadcrumbs = {
              nvim-navic.enable = true;
              navbuddy.enable = true;
            };
          };
        };

        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
          transparent = false;
        };

        autopairs.nvim-autopairs.enable = true;

        autocomplete.nvim-cmp.enable = true;
        snippets.luasnip.enable = true;

        filetree = {
          neo-tree = {
            enable = true;
          };
        };

        tabline = {
          nvimBufferline.enable = true;
        };

        treesitter.context.enable = false;

        binds = {
          whichKey.enable = true;
          cheatsheet.enable = true;
        };

        telescope.enable = true;

        git = {
          enable = true;
          gitsigns.enable = true;
          gitsigns.codeActions.enable = false; # throws an annoying debug message
        };

        minimap = {
          minimap-vim.enable = true;
        };

        dashboard = {
          dashboard-nvim.enable = true;
          alpha.enable = true;
        };

        notify = {
          nvim-notify.enable = true;
        };

        projects = {
          project-nvim.enable = true;
        };

        utility = {
          ccc.enable = true;
          vim-wakatime.enable = false;
          icon-picker.enable = true;
          surround.enable = true;
          diffview-nvim.enable = true;
          yanky-nvim.enable = false;
          motion = {
            hop.enable = true;
            leap.enable = true;
            precognition = {
              enable = true;
              setupOpts = {
                showBlankVirtLine = false;
              };
            };
          };

          images = {
            image-nvim.enable = false;
          };
        };

        notes = {
          todo-comments.enable = true;
        };

        terminal = {
          toggleterm = {
            enable = true;
            lazygit.enable = true;
          };
        };

        ui = {
          borders.enable = true;
          noice.enable = true;
          colorizer.enable = true;
          modes-nvim.enable = false; # the theme looks terrible with catppuccin
          illuminate.enable = true;
          smartcolumn = {
            enable = true;
            setupOpts.custom_colorcolumn = {
              # this is a freeform module, it's `buftype = int;` for configuring column position
              nix = "110";
              ruby = "120";
              java = "130";
              go = [
                "90"
                "130"
              ];
            };
          };
          fastaction.enable = true;
        };

        session = {
          nvim-session-manager.enable = true;
        };

        gestures = {
          gesture-nvim.enable = false;
        };

        comments = {
          comment-nvim.enable = true;
        };

        presence = {
          neocord.enable = true;
        };
      };
    };
  };
}
