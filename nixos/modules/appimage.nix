{ config, pkgs, ... }:

{
  # Habilita AppImage
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  hardware.graphics = {
    enable = true;      # ativa suporte a OpenGL
    enable32Bit = true; # útil para jogos 32-bit (Wine/Steam/etc)
    extraPackages = with pkgs; [
      mesa
      libGLU
      libx11
    ];
  };

  # Multilib / libs adicionais
  environment.systemPackages = with pkgs; [
    fuse
    fuse2
    fuse3

    mesa
    libGLU
    libx11
  ];
}

