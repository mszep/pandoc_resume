{ pkgs ? import <nixpkgs> { } }:
with pkgs;
mkShell { buildInputs = [ pandoc texlive.combined.scheme-context gnumake ]; }
