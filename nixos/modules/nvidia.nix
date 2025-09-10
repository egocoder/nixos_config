# Em: nixos/modules/nvidia.nix
{ config, lib, pkgs, ... }:

{
  # Configuração gráfica base e driver
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  services.xserver.videoDrivers = [ "nvidia" ];

  # Configurações do driver proprietário da NVIDIA
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false; # Geralmente melhor para performance
    open = false; # Use o driver proprietário, não o open-source
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    # Configuração PRIME para notebooks com GPU híbrida (Nvidia + AMD/Intel)
    # Offload é o modo moderno e flexível
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true; # Permite usar o comando `prime-run`
      };
      # GPU Integrada (seu AMD)
      amdgpuBusId = "PCI:6:0:0";
      # GPU Dedicada (sua Nvidia)
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  # (Opcional, mas recomendado) Adiciona a especialização "gaming-time"
  # para forçar o modo "sync" quando necessário.
  # Você pode iniciar nela a partir do menu do boot.
  specialisation = {
    gaming-time.configuration = {
      system.nixos.label = "NixOS-Gaming-Mode"; # Muda o nome no menu de boot
      hardware.nvidia.prime = {
        sync.enable = lib.mkForce true;
        offload = {
          enable = lib.mkForce false;
          enableOffloadCmd = lib.mkForce false;
        };
      };
    };
  };

  # Instala pacotes relacionados à GPU
  environment.systemPackages = with pkgs; [
    cudaPackages.cudatoolkit
    # glxinfo # Útil para debug
  ];
}
