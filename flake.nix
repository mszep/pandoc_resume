{
  inputs = { nixpkgs.url = "github:nixos/nixpkgs"; };

  outputs = { self, nixpkgs }:
    let
      supportedSystems =
        let
          unsupportedSystems = [
            # GHC not supported
            "armv5tel-linux"
            "armv6l-linux"
            "powerpc64le-linux"
            "riscv64-linux"

            # "error: attribute 'busybox' missing" when building
            # `bootstrap-tools`
            "mipsel-linux"
          ];
        in nixpkgs.lib.subtractLists unsupportedSystems nixpkgs.lib.systems.flakeExposed;

      perSystem = nixpkgs.lib.genAttrs supportedSystems;
      pkgsFor = system: import nixpkgs { inherit system; };

      buildResumeFor = system:
        let pkgs = pkgsFor system;
        in pkgs.runCommand "build-resume" {
          nativeBuildInputs = with pkgs; [ pandoc texlive.combined.scheme-context ];
        } ''
          cd ${self}
          make OUT_DIR="$out"
        '';
    in {
      packages = perSystem (system:
        let
          resume = buildResumeFor system;
        in
        {
          inherit resume;
          default = resume;
        });

      devShells = perSystem (system: {
        default = import ./shell.nix { pkgs = pkgsFor system; };
      });

      devShell = perSystem (system: self.devShells.${system}.default);

      defaultPackage = perSystem (system: self.packages.${system}.default);
    };
}
