{ pkgs, lib, ... }:

let
  arcBlackestTheme = pkgs.stdenv.mkDerivation {
    pname = "Arc-BLACKEST";
    version = "1.0";
    src = ../../themes/Arc-BLACKEST;

    installPhase = ''
      mkdir -p $out/share/themes
      cp -r $src $out/share/themes/Arc-BLACKEST
    '';
  };
in {
  config = {
    home.packages = with pkgs; [
      fira-code
      miracode
      monocraft
      nerd-fonts.hack
      nerd-fonts.jetbrains-mono
      nerd-fonts.inconsolata
      nerd-fonts.terminess-ttf
      nerd-fonts.gohufont
      nerd-fonts.symbols-only
    ];

    stylix = {
      enable = true;
      polarity = "dark";

      base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

      fonts = {
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
        emoji = {
          name = "Noto Color Emoji";
          package = pkgs.noto-fonts-color-emoji;
        };
        sizes = {
          terminal = 12;
          applications = 12;
        };
      };

      image = pkgs.fetchurl {
        url = "https://codeberg.org/lunik1/nixos-logo-gruvbox-wallpaper/raw/branch/master/png/gruvbox-dark-rainbow.png";
        sha256 = "036gqhbf6s5ddgvfbgn6iqbzgizssyf7820m5815b2gd748jw8zc";
      };

      # Desativa temas do Stylix para usar temas custom
      targets = {
        gtk.enable = false;
        hyprland.enable = false;
        hyprlock.enable = false;
        waybar.enable = false;
        wofi.enable = false;
        neovim.enable = false;
      };
    };

    gtk = {
      enable = true;
      theme = {
        name = "Arc-BLACKEST";
        package = arcBlackestTheme;
      };
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
      cursorTheme = {
        name = "DMZ-Black";
        package = pkgs.vanilla-dmz;
        size = 20;
      };
    };

    home.pointerCursor = {
      name = "DMZ-Black";
      package = pkgs.vanilla-dmz;
      size = 20;
      gtk.enable = true;
      x11.enable = true;
    };
  };
}

