{ config, pkgs, ... }:

{
  programs.ssh = {
  enable = true;
  extraConfig = ''
    Host github.com
      User git
      IdentityFile ~/.ssh/id_ed25519_github
      IdentitiesOnly yes
  '';
    };
  };

  # Opcional: garantir que a chave exista
  home.file.".ssh/id_ed25519".source = /caminho/para/sua/chave/id_ed25519;
  home.file.".ssh/id_ed25519.pub".source = /caminho/para/sua/chave/id_ed25519.pub;

  # Opcional: permissões seguras
  home.activation.ensureSSHKeyPermissions = ''
    chmod 700 ~/.ssh
    chmod 600 ~/.ssh/id_ed25519
    chmod 644 ~/.ssh/id_ed25519.pub
  '';
}

