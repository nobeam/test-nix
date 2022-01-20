{
  description = "NoBeam Flake Template";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixpkgs-unstable;
    utils.url = github:numtide/flake-utils;
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (
      system:
        with nixpkgs.legacyPackages.${system};
        {
          devShell = mkShell {
            buildInputs = [
              asciiquarium
              (python310.withPackages
                (python-packages: with python-packages; [
                  numpy
                  matplotlib
                ])
              )
            ];
          };
        }
    );
}
