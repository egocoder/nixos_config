{ pkgs, ... }: {
  home.packages = with pkgs; [
    prismlauncher
    jdk17
  ];

  home.sessionVariables = {
    JAVA_HOME = "${pkgs.jdk17}";
  };
}
