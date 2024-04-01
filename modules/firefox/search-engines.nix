{ pkgs }:

let
  icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
in
{
  force = true;
  default = "Google";
  order = [
    "Google"
    "Brave Search"
    "DuckDuckGo"
    "Wikipedia (en)"
    "Nix Packages"
    "NixOS Options"
    "NixOS Wiki"
    "Go Packages"
  ];
  engines = {
    "Brave Search" = {
      icon = ./favicon/brave.png; # https://brave.com/static-assets/images/brave-favicon.png
      urls = [{ template = "https://search.brave.com/search?q={searchTerms}"; }];
      definedAliases = [ "@b" ];
    };
    "Go Packages" = {
      icon = ./favicon/go.ico; # https://pkg.go.dev/static/shared/icon/favicon.ico
      urls = [{ template = "https://pkg.go.dev/search?q={searchTerms}"; }];
      definedAliases = [ "@gp" ];
    };
    "Maven Packages" = {
      icon = ./favicon/sonatype.ico; # https://central.sonatype.com/favicon.ico
      urls = [{ template = "https://central.sonatype.com/search?q={searchTerms}"; }];
      definedAliases = [ "@mp" ];
    };
    "Nix Packages" = {
      inherit icon;
      urls = [{ template = "https://search.nixos.org/packages?type=packages&query={searchTerms}"; }];
      definedAliases = [ "@np" ];
    };
    "NixOS Options" = {
      inherit icon;
      urls = [{ template = "https://search.nixos.org/options?type=packages&query={searchTerms}"; }];
      definedAliases = [ "@no" ];
    };
    "NixOS Wiki" = {
      inherit icon;
      urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
      definedAliases = [ "@nw" ];
    };
    "Bing".metaData.hidden = true;
    "Amazon.com".metaData.hidden = true;
    "Google".metaData.alias = "@g";
    "DuckDuckGo".metaData.alias = "@d";
    "Wikipedia (en)".metaData.alias = "@wiki";
  };
}
