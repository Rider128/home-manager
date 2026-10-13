{
  description = "Home Manager configuration of matthieu";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      # You can override the input nixpkgs to follow your system's
      # instance of nixpkgs. This is safe to do as nvf does not depend on a binary cache.
      inputs.nixpkgs.follows = "nixpkgs";
    };
    epnix.url = "github:epics-extensions/epnix/nixos-25.11";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    colmena = {
      url = "github:zhaofengli/colmena";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nvf,
      epnix,
      sops-nix,
      colmena,
      ...
    }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [ epnix.overlays.default ];
        epnix = epnix.x86_64-linux.default;
      };
      pkgsDarwin = import nixpkgs {
        system = "aarch64-darwin";
      };
      # Base modules communs à tous les profils Linux
      linuxBase = [
        nvf.homeManagerModules.default
        sops-nix.homeManagerModules.default
        ./common
        ./linux
        ./secrets/secret.nix
      ];

      # Arguments supplémentaires passés à tous les modules
      colmenaPkg = colmena.packages.${pkgs.stdenv.hostPlatform.system}.colmena;
      colmenaPkgDarwin = colmena.packages.aarch64-darwin.colmena;
      specialArgs = {
        colmena = colmenaPkg;
      };
    in
    {
      homeConfigurations = {
        pro = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = linuxBase ++ [ ./pro ];
          extraSpecialArgs = specialArgs;
        };

        perso = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = linuxBase ++ [ ./perso ];
          extraSpecialArgs = specialArgs;
        };

        mac-matthieu = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsDarwin;
          modules = [
            nvf.homeManagerModules.default
            sops-nix.homeManagerModules.default
            ./common
            ./darwin
            ./secrets/secret.nix
          ];
          extraSpecialArgs = {
            colmena = colmenaPkgDarwin;
          };
        };
      };

      formatter = {
        x86_64-linux = pkgs.nixfmt;
        aarch64-darwin = pkgsDarwin.nixfmt;
      };

      devShells = {
        x86_64-linux.default = pkgs.mkShell {
          packages = [
            pkgs.nixfmt
            pkgs.sops
            pkgs.age
          ];
        };
        aarch64-darwin.default = pkgsDarwin.mkShell {
          packages = [
            pkgsDarwin.nixfmt
            pkgsDarwin.sops
            pkgsDarwin.age
          ];
        };
      };
    };
}
