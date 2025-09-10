{ pkgs, inputs, lib, ... }:

let
  arc-blackest-theme = pkgs.stdenv.mkDerivation {
    pname = "arc-blackest-theme";
    version = "1.0";

    src = pkgs.fetchzip {
      url = "https://github.com/rtlewis88/rtl88-Themes/archive/refs/tags/1.0.zip";
      sha256 = "sha256-AWpJ7o4tW3uMz8w84Jp2d/Tr5GnO3EypeHectMhaols=";
    };

    installPhase = ''
      mkdir -p $out/share/themes
      cp -r themes/Arc-Blackest $out/share/themes/
    '';
  };
in
{
  imports = [ inputs.stylix.homeModules.stylix ];

  home.packages = with pkgs; [
    arc-blackest-theme
    nerd-fonts.terminess-ttf
    monocraft
    miracode
    hack-font
    fira-code
    nerd-fonts.gohufont
    nerd-fonts.jetbrains-mono
  ];

  stylix = {
    enable = true;
    polarity = "dark";

    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

    cursor = {
      name = "DMZ-Black";
      size = 20;
      package = pkgs.vanilla-dmz;
    };

    fonts = {
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-color-emoji;
      };
      monospace = {
        name = "GohuFont Nerd Font Mono";
        package = pkgs.nerd-fonts.gohufont;
      };
      sansSerif = {
        name = "GohuFont Nerd Font";
        package = pkgs.nerd-fonts.gohufont;
      };
      serif = {
        name = "GohuFont Nerd Font";
        package = pkgs.nerd-fonts.gohufont;
      };
      sizes = {
        terminal = 13;
        applications = 12;
      };
    };

    iconTheme = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };

    image = pkgs.fetchurl {
      url = "https://codeberg.org/lunik1/nixos-logo-gruvbox-wallpaper/raw/branch/master/png/gruvbox-dark-rainbow.png";
      sha256 = "036gqhbf6s5ddgvfbgn6iqbzgizssyf7820m5815b2gd748jw8zc";
    };

    targets = {
      neovim.enable = false;
      waybar.enable = false;
      wofi.enable = false;
      hyprland.enable = false;
      hyprlock.enable = false;
    };
  };

  gtk = {
    enable = true;
    theme = lib.mkForce {
      name = "Arc-Blackest";
      package = arc-blackest-theme;
    };
  };
}

