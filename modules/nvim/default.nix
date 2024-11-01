{ config, lib, pkgs, ... }:

let
  cfg = config.conf.nvim;

  telescope-cmdline-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "telescope-cmdline-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "jonarrien";
      repo = "telescope-cmdline.nvim";
      rev = "0.2.1";
      sha256 = "sha256-huL3BI3YKSvQtk/9PTf4108CWlR+olid515RhkXRGoA=";
    };
  };

  cmp-go-pkgs = pkgs.vimUtils.buildVimPlugin {
    name = "cmp-go-pkgs";
    src = pkgs.fetchFromGitHub {
      owner = "Snikimonkd";
      repo = "cmp-go-pkgs";
      rev = "7a76e1f9c8d5f40fe27b8d6fcac04de4456875bb";
      sha256 = "sha256-pB7hz/md/5NVYE2FJLNcFkVfUkIxfqr1bJrCtlnIW7w=";
    };
  };

  rest-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "rest-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "rest-nvim";
      repo = "rest.nvim";
      rev = "v1.2.1";
      sha256 = "sha256-fX4KIazW7iKO157cQdfBoz7g+eyOSQIFje8ZB7SeAx8=";
    };
  };

  # TODO:
  # 1. this is canary version, once v2 is stable, change it.
  # 1. update config and keymap
  hurl-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "hurl-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "jellydn";
      repo = "hurl.nvim";
      rev = "canary";
      sha256 = "sha256-RSMEInn2yUfufcHM6SKgD1EmmW2vt57o+kvTYrI/jTo=";
    };
  };

  colorscheme = with pkgs.vimPlugins; [
    solarized-nvim
  ];

  treesitter = with pkgs.vimPlugins; [
    (nvim-treesitter.withPlugins (p: with p; [
      tree-sitter-nix
      tree-sitter-make
      tree-sitter-bash
      tree-sitter-dockerfile
      tree-sitter-go
      tree-sitter-zig
      tree-sitter-dart
      tree-sitter-rust
      tree-sitter-c
      tree-sitter-cpp
      tree-sitter-java
      tree-sitter-lua
      tree-sitter-python
      tree-sitter-html
      tree-sitter-css
      tree-sitter-javascript
      tree-sitter-http
      tree-sitter-json
      tree-sitter-toml
      tree-sitter-yaml
      tree-sitter-markdown
      hurl
    ]))
    nvim-treesitter-context
    nvim-treesitter-textobjects
    playground
  ];

  lsp = with pkgs.vimPlugins; [
    nvim-lspconfig
    neodev-nvim
    luasnip
    nvim-cmp
    cmp-nvim-lsp
    cmp-nvim-lsp-signature-help
    cmp_luasnip
    cmp-path
  ];

  dap = with pkgs.vimPlugins; [
    nvim-dap
    nvim-dap-virtual-text
  ];

  test = with pkgs.vimPlugins; [
    neotest
    neotest-go
    nvim-coverage
    rest-nvim
    hurl-nvim
  ];

  telescope = with pkgs.vimPlugins; [
    telescope-nvim
    telescope-fzf-native-nvim
    telescope-file-browser-nvim
    telescope-live-grep-args-nvim
    telescope-manix
    telescope-github-nvim
    telescope-dap-nvim
    telescope-cmdline-nvim
  ];

  ui = with pkgs.vimPlugins; [
    lualine-nvim
    nvim-web-devicons
    nvim-colorizer-lua
    nui-nvim
  ];

  git = with pkgs.vimPlugins; [
    vim-fugitive
    gitsigns-nvim
    git-worktree-nvim
  ];

  misc = with pkgs.vimPlugins; [
    nerdcommenter
    editorconfig-nvim
    nvim-autopairs
    leap-nvim
    harpoon
    oil-nvim
    markdown-preview-nvim
    cmp-calc
    cmp-go-pkgs
    cmp-nvim-lua
  ];
in
{
  options.conf.nvim.enable = lib.mkEnableOption "neovim";
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      ripgrep
      fd
      curl
      jq
      tree-sitter
      editorconfig-checker
      gnumake
      gcc
      nixd
      nixfmt-classic
      nixpkgs-fmt
      manix
      luajit
      lua-language-server
      luarocks
      go
      gopls
      delve
      golangci-lint
      zig_0_12
      zls
      rustc
      cargo
      rustfmt
      rust-analyzer
      jdk17
      maven
      jdt-language-server
      flutter
      ast-grep
      hurl
    ];

    home-manager.sharedModules = [{
      programs.neovim = {
        enable = true;
        viAlias = true;
        vimAlias = true;
        defaultEditor = true;
        extraLuaConfig = builtins.readFile ./init.lua;
        extraLuaPackages = ps: [ ps.luarocks ];
        plugins =
          colorscheme ++
          treesitter ++
          lsp ++
          dap ++
          test ++
          telescope ++
          ui ++
          git ++
          misc;
      };

      xdg.configFile = {
        "nvim/lua" = {
          recursive = true;
          source = ./lua;
        };
        "nvim/ftplugin" = {
          recursive = true;
          source = ./ftplugin;
        };
      };
    }];
  };
}
