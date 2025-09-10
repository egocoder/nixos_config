# nixos/modules/steam.nix
{ pkgs, ... }:

{
  # Habilita o Steam e suas opções
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # Adiciona o pacote steam-run aos pacotes do sistema
  environment.systemPackages = [
    pkgs.steam-run
  ];
}
