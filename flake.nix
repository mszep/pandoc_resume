{
  inputs = { nixpkgs.url = "github:nixos/nixpkgs"; };

  outputs = { self, nixpkgs }:
    let
      supportedSystems = nixpkgs.lib.systems.flakeExposed;
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
      packages.resume = perSystem (system: buildResumeFor system);
      devShell =
        perSystem (system: import ./shell.nix { pkgs = pkgsFor system; });
      defaultPackage = perSystem (system: self.packages.resume.${system});
    };
}
