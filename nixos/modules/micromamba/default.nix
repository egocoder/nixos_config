{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    micromamba
  ];

  environment.shellAliases = {
    conda = "micromamba";
  };

  environment.sessionVariables = {
    # A lógica está correta. O Nix irá gerenciar o caminho para este arquivo.
    MAMBARC = ./mambarc.yml;
  };

  programs.zsh.interactiveShellInit = ''
    export MAMBA_ROOT_PREFIX="''${MAMBA_ROOT_PREFIX:-$HOME/.local/share/mamba}"
    mkdir -p "$MAMBA_ROOT_PREFIX"
    eval "$(micromamba shell hook -s zsh)"
  '';

  programs.bash.interactiveShellInit = ''
    export MAMBA_ROOT_PREFIX="''${MAMBA_ROOT_PREFIX:-$HOME/.local/share/mamba}"
    mkdir -p "$MAMBA_ROOT_PREFIX"
    eval "$(micromamba shell hook -s bash)"
  '';
}

