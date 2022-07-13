{ config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.ripgrep ];

  home-manager.sharedModules = [{
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      extraConfig = ''
        luafile $HOME/.config/nvim/lua/settings.lua
        luafile $HOME/.config/nvim/lua/lsp.lua
        luafile $HOME/.config/nvim/lua/telescope.lua
        luafile $HOME/.config/nvim/lua/nvimtree.lua
        luafile $HOME/.config/nvim/lua/misc.lua
      '';
      plugins = with pkgs.vimPlugins; [
        # Theme
        dracula-vim

        # File tree
        nvim-web-devicons
        nvim-tree-lua

        # Utility
        mini-nvim
        nerdcommenter
        lualine-nvim
        indent-blankline-nvim
        editorconfig-nvim
        vim-hexokinase
        clever-f-vim
        gitsigns-nvim

        # LSP
        nvim-lspconfig
        nvim-cmp
        cmp-nvim-lsp
        luasnip
        cmp_luasnip

        # Telescope
        telescope-nvim
        telescope-fzf-native-nvim

        # Treesitter
        (nvim-treesitter.withPlugins (
          plugins: with plugins; [
            tree-sitter-go
            tree-sitter-lua
            tree-sitter-nix
            tree-sitter-python
            tree-sitter-html
            tree-sitter-css
            tree-sitter-javascript
            tree-sitter-bash
            tree-sitter-make
            tree-sitter-dockerfile
            tree-sitter-json
            tree-sitter-toml
            tree-sitter-yaml
            tree-sitter-markdown
            tree-sitter-regex
          ]
        )
        )
      ];
    };

    xdg.configFile = {
      "nvim/lua/settings.lua".source = ../config/nvim/lua/settings.lua;
      "nvim/lua/lsp.lua".source = ../config/nvim/lua/lsp.lua;
      "nvim/lua/telescope.lua".source = ../config/nvim/lua/telescope.lua;
      "nvim/lua/nvimtree.lua".source = ../config/nvim/lua/nvimtree.lua;
      "nvim/lua/misc.lua".source = ../config/nvim/lua/misc.lua;
    };
  }];
}
