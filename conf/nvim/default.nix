{ config, lib, pkgs, home-manager, ... }:

let
  cfg = config.conf.nvim;
in {
  options.conf.nvim.enable = lib.mkEnableOption "Neovim";
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      ripgrep
      fd
      tree-sitter
    ];
    home-manager.sharedModules = [{
      programs.neovim = {
        enable = true;
        viAlias = true;
        vimAlias = true;
        defaultEditor = true;
        extraLuaConfig = builtins.readFile ./init.lua;
        plugins = with pkgs.vimPlugins; [
          nord-nvim
          telescope-nvim
          telescope-fzf-native-nvim
          telescope-project-nvim
          telescope-file-browser-nvim
          nerdcommenter
          lualine-nvim
          indent-blankline-nvim
          editorconfig-nvim
          nvim-web-devicons
          nvim-colorizer-lua
          gitsigns-nvim
          (nvim-treesitter.withPlugins (p: with p; [
            tree-sitter-nix
            tree-sitter-make
            tree-sitter-bash
            tree-sitter-dockerfile
            tree-sitter-go
            tree-sitter-rust
            tree-sitter-lua
            tree-sitter-python
            tree-sitter-html
            tree-sitter-css
            tree-sitter-javascript
            tree-sitter-json
            tree-sitter-toml
            tree-sitter-yaml
            # misc
            tree-sitter-markdown
          ]))
        ];
      };
      xdg.configFile = {
        "nvim/lua/conf/options.lua".source = ./lua/conf/options.lua;
        "nvim/lua/conf/keymap.lua".source = ./lua/conf/keymap.lua;
        "nvim/lua/conf/treesitter.lua".source = ./lua/conf/treesitter.lua;
        "nvim/lua/conf/colorscheme.lua".source = ./lua/conf/colorscheme.lua;
        "nvim/lua/conf/lualine.lua".source = ./lua/conf/lualine.lua;
        "nvim/lua/conf/telescope.lua".source = ./lua/conf/telescope.lua;
        "nvim/lua/conf/nerdcommenter.lua".source = ./lua/conf/nerdcommenter.lua;
        "nvim/lua/conf/indent_blankline.lua".source = ./lua/conf/indent_blankline.lua;
        "nvim/lua/conf/web_devicons.lua".source = ./lua/conf/web_devicons.lua;
        "nvim/lua/conf/gitsigns.lua".source = ./lua/conf/gitsigns.lua;
        "nvim/lua/conf/colorizer.lua".source = ./lua/conf/colorizer.lua;
      };
    }];
  };
}
