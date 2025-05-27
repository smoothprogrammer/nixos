{ pkgs }:

let
  icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
in
{
  force = true;
  default = "google";
  order = [
    "google"
    "Brave Search"
    "ddg"
    "wikipedia"
    "Nix Packages"
    "NixOS Options"
    "NixOS Wiki"
    "Go Packages"
  ];
  engines = {
    "Learn X in Y minutes" = {
      icon = ./favicon/learnxinyminutes.ico; # https://learnxinyminutes.com/favicon.ico
      urls = [ { template = "https://learnxinyminutes.com/{searchTerms}/"; } ];
      definedAliases = [ "@xy" ];
    };
    "Brave Search" = {
      icon = ./favicon/brave.png; # https://brave.com/static-assets/images/brave-favicon.png
      urls = [ { template = "https://search.brave.com/search?q={searchTerms}"; } ];
      definedAliases = [ "@b" ];
    };
    "Go Packages" = {
      icon = ./favicon/go.ico; # https://pkg.go.dev/static/shared/icon/favicon.ico
      urls = [ { template = "https://pkg.go.dev/search?q={searchTerms}"; } ];
      definedAliases = [ "@gp" ];
    };
    "Gleam Packages" = {
      icon = ./favicon/gleam.png; # https://github.com/gleam-lang/gleam/blob/main/images/lucy.png
      urls = [ { template = "https://packages.gleam.run/?search={searchTerms}"; } ];
      definedAliases = [ "@glp" ];
    };
    "Elm Packages" = {
      icon = ./favicon/elm.ico; # https://elm-lang.org/favicon.ico
      urls = [ { template = "https://klaftertief.github.io/elm-search?q={searchTerms}"; } ];
      definedAliases = [ "@ep" ];
    };
    "Maven Packages" = {
      icon = ./favicon/sonatype.ico; # https://central.sonatype.com/favicon.ico
      urls = [ { template = "https://central.sonatype.com/search?q={searchTerms}"; } ];
      definedAliases = [ "@mp" ];
    };
    "Mongo Operators" = {
      icon = ./favicon/mongo.ico; # https://www.mongodb.com/docs/assets/favicon.ico
      urls = [ { template = "https://www.mongodb.com/docs/manual/reference/operator/{searchTerms}/"; } ];
      definedAliases = [ "@mo" ];
    };
    "Redis Commands" = {
      icon = ./favicon/redis.png; # https://redis.io/docs/latest/images/favicons/favicon-196x196.png
      urls = [ { template = "https://redis.io/docs/latest/commands/{searchTerms}/"; } ];
      definedAliases = [ "@rc" ];
    };
    "Nix Packages" = {
      inherit icon;
      urls = [ { template = "https://search.nixos.org/packages?type=packages&query={searchTerms}"; } ];
      definedAliases = [ "@np" ];
    };
    "NixOS Options" = {
      inherit icon;
      urls = [ { template = "https://search.nixos.org/options?type=packages&query={searchTerms}"; } ];
      definedAliases = [ "@no" ];
    };
    "NixOS Wiki" = {
      inherit icon;
      urls = [ { template = "https://nixos.wiki/index.php?search={searchTerms}"; } ];
      definedAliases = [ "@nw" ];
    };
    "bing".metaData.hidden = true;
    "amazondotcom-us".metaData.hidden = true;
    "google".metaData.alias = "@g";
    "ddg".metaData.alias = "@d";
    "wikipedia".metaData.alias = "@wiki";
  };
}
