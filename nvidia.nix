{ pkgs, config, lib, ... }: {
  environment.systemPackages = [
    config.boot.kernelPackages.nvidiaPackages.stable
    pkgs.cudaPackages.cudatoolkit
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  environment.variables.LD_LIBRARY_PATH =
    lib.mkBefore "/run/opengl-driver/lib:/run/opengl-driver-32/lib";

  programs.nix-ld.enable = true;
}
