{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Makefile
    gnumake

    # Nix
    rnix-lsp

    # C, C++, Objective-C, Fortran, Ada, Go(CGO), D
    gcc

    # Lua
    luajit
    sumneko-lua-language-server

    # Go
    go
    gopls
    delve
  ];
}
