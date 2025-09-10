{ homeStateVersion, user, inputs, ... }: {
  imports = [
    ./modules            
    ./home_packages.nix    
    
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };
}

