{ pkgs, ... }:

{
  # Habilita o Steam e o Gamescope
  programs.steam = {
    enable = true;
    # Habilita a sessão do Gamescope no seu login manager (ótimo para Big Picture)
    gamescopeSession.enable = true; 
  };

  # Habilita o Gamemode da Feral Interactive para otimizações de performance
  programs.gamemode.enable = true;

  # Instala pacotes e ferramentas de jogos no sistema
  environment.systemPackages = with pkgs; [
    mangohud       # Overlay para monitorar FPS, temps, etc.
    protonup-qt    # Ferramenta gráfica para baixar versões do Proton-GE (versão moderna do protonup)
  ];
  
  # Define variáveis de ambiente para toda a sessão, para que o Steam encontre
  # as versões do Proton-GE instaladas pelo ProtonUp-Qt.
  environment.sessionVariables = {
    # IMPORTANTE: Use %h em vez de ${HOME} aqui.
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "%h/.steam/root/compatibilitytools.d";
  };
}
