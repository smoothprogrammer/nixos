{ config, pkgs, ... }:

let
  nvim-dap-go = pkgs.vimUtils.buildVimPlugin {
    pname = "nvim-dap-go";
    version = "2022-02-07";
    src = pkgs.fetchFromGitHub {
      owner = "leoluz";
      repo = "nvim-dap-go";
      rev = "fca8bf90bf017e8ecb3a3fb8c3a3c05b60d1406d";
      sha256 = "sha256-ZbQw4244BLiSoBipiPc1eEF2aV3BJLT7W8LmBl8xH4Q=";
    };
    meta.homepage = "https://github.com/leoluz/nvim-dap-go/";
  };

  cmp-nvim-lsp-signature-help = pkgs.vimUtils.buildVimPlugin {
    pname = "cmp-nvim-lsp-signature-help";
    version = "2022-07-20";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp-signature-help";
      rev = "57c4db7d3a663bd31ef60c4b5ed32683301247e9";
      sha256 = "sha256-LKtMrxm9i+yoLYh1NuZsENSScB7MQZrjTFpD9wdpz1M=";
    };
    meta.homepage = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help/";
  };
in
{
  environment.systemPackages = with pkgs; [ ripgrep tree-sitter ];

  home-manager.sharedModules = [{
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      extraConfig = ''
        luafile $HOME/.config/nvim/lua/settings.lua
        luafile $HOME/.config/nvim/lua/lsp.lua
        luafile $HOME/.config/nvim/lua/dap.lua
        luafile $HOME/.config/nvim/lua/telescope.lua
        luafile $HOME/.config/nvim/lua/colorscheme.lua
        luafile $HOME/.config/nvim/lua/misc.lua
      '';
      plugins = with pkgs.vimPlugins; [
        # Theme
        nord-nvim

        # Utility
        mini-nvim
        nerdcommenter
        lualine-nvim
        indent-blankline-nvim
        editorconfig-nvim
        nvim-colorizer-lua
        clever-f-vim
        gitsigns-nvim
        nvim-web-devicons
        nvim-tree-lua

        # LSP
        nvim-lspconfig
        nvim-cmp
        cmp-nvim-lsp
        cmp-nvim-lsp-signature-help
        cmp_luasnip
        cmp-path
        luasnip

        # DAP
        nvim-dap
        nvim-dap-ui
        nvim-dap-virtual-text
        nvim-dap-go

        # Telescope
        telescope-nvim
        telescope-fzf-native-nvim

        # Treesitter
        (nvim-treesitter.withPlugins (
          plugins: with plugins; [
            # systems
            tree-sitter-nix
            tree-sitter-make
            tree-sitter-bash
            tree-sitter-dockerfile
            # neovim plugins
            tree-sitter-lua
            # main language
            tree-sitter-c
            tree-sitter-cpp
            tree-sitter-go
            tree-sitter-python
            tree-sitter-html
            tree-sitter-css
            tree-sitter-javascript
            # configuration
            tree-sitter-json
            tree-sitter-toml
            tree-sitter-yaml
            # misc
            tree-sitter-markdown
          ]
        ))
      ];
    };

    xdg.configFile = {
      "nvim/lua/settings.lua".source = ../config/nvim/lua/settings.lua;
      "nvim/lua/lsp.lua".source = ../config/nvim/lua/lsp.lua;
      "nvim/lua/dap.lua".source = ../config/nvim/lua/dap.lua;
      "nvim/lua/telescope.lua".source = ../config/nvim/lua/telescope.lua;
      "nvim/lua/colorscheme.lua".source = ../config/nvim/lua/colorscheme.lua;
      "nvim/lua/misc.lua".source = ../config/nvim/lua/misc.lua;
    };
  }];
}
