{ config, pkgs, ... }:

{
  # Ativa o serviço Docker (dockerd)
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    autoPrune.enable = true;
  };

  # Adiciona docker + docker-compose aos pacotes do sistema
  environment.systemPackages = with pkgs; [
    docker
    docker-compose
  ];

  # Garante que o usuário 'ego' tenha permissão para usar o Docker
  users.users.ego.extraGroups = [ "docker" ];
}

