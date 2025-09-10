{
  home.packages = with pkgs; [
    # Ambiente FHS para rodar jogos/aplicativos fora do nixpkgs
    steam-run

    # OpenGL
    libGL
    libGLU

    # X11 (pacotes ficam dentro de pkgs.xorg)
    xorg.libX11
    xorg.libXext
    xorg.libXi
    xorg.libXrandr
    xorg.libXcursor
    xorg.libXinerama
  ];
}
