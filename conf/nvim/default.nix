{ config, lib, pkgs, home-manager, ... }:

let
  neotest-go = pkgs.vimUtils.buildVimPlugin {
    name = "neotest-go";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-neotest";
      repo = "neotest-go";
      rev = "756edf3dddcb3b430110f9582e10b7e730428341";
      sha256 = "sha256-McofCzxPFksPqrT+Pka9syOgLLwYci3k1EQGx4JzjQ4=";
    };
  };

  cfg = config.conf.nvim;

  lsp = with pkgs.vimPlugins; [
    nvim-lspconfig
    neodev-nvim
  ];

  dap = with pkgs.vimPlugins; [
    nvim-dap
    nvim-dap-virtual-text
  ];

  test = with pkgs.vimPlugins; [
    neotest
    neotest-go
  ];

  autocomplete = with pkgs.vimPlugins; [
    luasnip
    nvim-cmp
    cmp-nvim-lsp
    cmp-nvim-lsp-signature-help
    cmp_luasnip
    cmp-path
  ];

  telescope = with pkgs.vimPlugins; [
    telescope-nvim
    telescope-fzf-native-nvim
    telescope-file-browser-nvim
    telescope-manix
    telescope-github-nvim
    telescope-dap-nvim
  ];

  treesitter = with pkgs.vimPlugins; [
    nvim-treesitter-context
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
      tree-sitter-markdown
    ]))
  ];

  misc = with pkgs.vimPlugins; [
    nord-nvim
    nerdcommenter
    lualine-nvim
    indent-blankline-nvim
    editorconfig-nvim
    nvim-web-devicons
    nvim-colorizer-lua
    gitsigns-nvim
    nvim-autopairs
    leap-nvim
    harpoon
  ];
in
{
  options.conf.nvim.enable = lib.mkEnableOption "neovim";
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      ripgrep
      fd
      tree-sitter
      gh
      editorconfig-checker
      gnumake
      gcc
      rnix-lsp
      manix
      luajit
      lua-language-server
      go
      gopls
      delve
      golangci-lint
    ];

    home-manager.sharedModules = [{
      programs.neovim = {
        enable = true;
        viAlias = true;
        vimAlias = true;
        defaultEditor = true;
        extraLuaConfig = builtins.readFile ./init.lua;
        plugins = lsp ++ dap ++ test ++
          autocomplete ++ telescope ++ treesitter ++ misc;
      };

      xdg.configFile = {
        "nvim/lua/mz/lib.lua".source = ./lua/mz/lib.lua;
        "nvim/lua/mz/options.lua".source = ./lua/mz/options.lua;
        "nvim/lua/mz/keymap.lua".source = ./lua/mz/keymap.lua;
        "nvim/lua/mz/treesitter.lua".source = ./lua/mz/treesitter.lua;
        "nvim/lua/mz/colorscheme.lua".source = ./lua/mz/colorscheme.lua;
        "nvim/lua/mz/lualine.lua".source = ./lua/mz/lualine.lua;
        "nvim/lua/mz/telescope.lua".source = ./lua/mz/telescope.lua;
        "nvim/lua/mz/lsp.lua".source = ./lua/mz/lsp.lua;
        "nvim/lua/mz/dap.lua".source = ./lua/mz/dap.lua;
        "nvim/lua/mz/test.lua".source = ./lua/mz/test.lua;
        "nvim/lua/mz/nerdcommenter.lua".source = ./lua/mz/nerdcommenter.lua;
        "nvim/lua/mz/indent_blankline.lua".source = ./lua/mz/indent_blankline.lua;
        "nvim/lua/mz/web_devicons.lua".source = ./lua/mz/web_devicons.lua;
        "nvim/lua/mz/gitsigns.lua".source = ./lua/mz/gitsigns.lua;
        "nvim/lua/mz/colorizer.lua".source = ./lua/mz/colorizer.lua;
        "nvim/lua/mz/autopairs.lua".source = ./lua/mz/autopairs.lua;
        "nvim/lua/mz/leap.lua".source = ./lua/mz/leap.lua;
        "nvim/lua/mz/harpoon.lua".source = ./lua/mz/harpoon.lua;
      };
    }];
  };
}
