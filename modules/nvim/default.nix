{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.conf.nvim;

  # rest-nvim = pkgs.vimUtils.buildVimPlugin {
  #   name = "rest-nvim";
  #   src = pkgs.fetchFromGitHub {
  #     owner = "rest-nvim";
  #     repo = "rest.nvim";
  #     rev = "v1.2.1";
  #     sha256 = "sha256-fX4KIazW7iKO157cQdfBoz7g+eyOSQIFje8ZB7SeAx8=";
  #   };
  # };

  # TODO: update config and keymap
  # hurl-nvim = pkgs.vimUtils.buildVimPlugin {
  #   name = "hurl-nvim";
  #   src = pkgs.fetchFromGitHub {
  #     owner = "jellydn";
  #     repo = "hurl.nvim";
  #     rev = "v2.0.0";
  #     sha256 = "sha256-rnNkWe4zRTIozBJ8iweQWYX4DH84fsjAch+/kGgAj/g=";
  #   };
  # };

  colorscheme = with pkgs.vimPlugins; [
    solarized-nvim
  ];

  treesitter = with pkgs.vimPlugins; [
    (nvim-treesitter.withPlugins (
      p: with p; [
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
        tree-sitter-gleam
        tree-sitter-elm
        tree-sitter-html
        tree-sitter-css
        tree-sitter-javascript
        tree-sitter-http
        tree-sitter-json
        tree-sitter-toml
        tree-sitter-yaml
        tree-sitter-xml
        tree-sitter-markdown
        tree-sitter-regex
        hurl
      ]
    ))
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
    # rest-nvim
    # hurl-nvim
  ];

  telescope = with pkgs.vimPlugins; [
    telescope-nvim
    telescope-fzf-native-nvim
    telescope-live-grep-args-nvim
    telescope-manix
    telescope-github-nvim
    telescope-dap-nvim
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
    editorconfig-nvim
    nvim-autopairs
    leap-nvim
    harpoon
    oil-nvim
    markdown-preview-nvim
    noice-nvim
    nvim-notify
    dressing-nvim
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
      nixfmt-rfc-style
      manix
      luajit
      lua-language-server
      luarocks
      go
      gopls
      delve
      golangci-lint
      zig
      zls
      rustc
      cargo
      rustfmt
      rust-analyzer
      gleam
      erlang_27
      rebar3
      elmPackages.elm
      elmPackages.elm-language-server
      elmPackages.elm-test
      elmPackages.elm-format
      jdk17
      maven
      jdt-language-server
      flutter
      hurl
      http-server
    ];

    home-manager.sharedModules = [
      {
        programs.neovim = {
          enable = true;
          viAlias = true;
          vimAlias = true;
          defaultEditor = true;
          extraLuaConfig = builtins.readFile ./init.lua;
          extraLuaPackages = ps: [ ps.luarocks ];
          plugins = colorscheme ++ treesitter ++ lsp ++ dap ++ test ++ telescope ++ ui ++ git ++ misc;
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
      }
    ];
  };
}
