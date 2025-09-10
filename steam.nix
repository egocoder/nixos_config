{ config, pkgs, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # libera portas pro Remote Play
    dedicatedServer.openFirewall = true; # libera portas para servidores dedicados
  };

  environment.systemPackages = with pkgs; [
    # OpenGL / Vulkan (64-bit)
    libdrm
    mesa
    vulkan-loader
    vulkan-tools

    # OpenGL / Vulkan (32-bit)
    pkgsi686Linux.mesa
    pkgsi686Linux.vulkan-loader
  ];

   environment.variables = {
  PRESSURE_VESSEL_FILESYSTEMS_RW = "/run/opengl-driver";
  PRESSURE_VESSEL_FILESYSTEMS_RO = "/run/opengl-driver-32";
  __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  LIBGL_DRIVERS_PATH = "/run/opengl-driver/lib/dri";
  # Adicione para evitar múltiplos diretórios libdrm
  MESA_DRIVERS_PATH = "/run/opengl-driver/lib/dri";
};

}
