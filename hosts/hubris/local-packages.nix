{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
  neovim
  gcc
  kdePackages.kdenlive
  ];
}
