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

      overlay = final: prev: {
        pandocResume.buildResume =
          {
            inDir
          , stylesDir ? null
          , style ? null
          }@args: let
            overrides = prev.lib.filterAttrs (_: value: value != null) args;

            arg2env = {
              inDir = "IN_DIR";
              stylesDir = "STYLES_DIR";
              style = "STYLE";
            };

            env =
              let
                quoteIfNecessary = value: if builtins.isPath value then value else prev.lib.escapeShellArg value;
                assign = name: "${arg2env.${name}}=${quoteIfNecessary overrides.${name}}";
              in builtins.foldl' (a: name: a ++ [ (assign name) ]) [] (builtins.attrNames overrides);

          in final.runCommand "build-resume" {
            nativeBuildInputs = with final; [ pandoc texlive.combined.scheme-context ];
          } ''
            cd ${self}
            make OUT_DIR="$out" ${toString env}
          '';
      };

      perSystem = nixpkgs.lib.genAttrs supportedSystems;
      pkgsFor = system: import nixpkgs { inherit system; overlays = [ self.overlays.default ]; };
    in {
      overlays = {
        pandocResume = overlay;
        default = overlay;
      };

      packages = perSystem (system:
        let
          pkgs = pkgsFor system;
          resume = pkgs.pandocResume.buildResume { inDir = "${self}/markdown"; };
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
