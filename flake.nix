{
  description = "Flakes demo";
  nixConfig.bash-prompt = "[flake]:$(basename $(pwd))> ";
  inputs = { flake-utils.url = "github:numtide/flake-utils"; };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        userPackages = with pkgs; [ hello cowsay ];
      in {
        devShell = with pkgs;
          mkShell {
            name = "env";
            buildInputs = userPackages;
          };
        defaultPackage = with pkgs;
          buildEnv {
            name = "hello";
            paths = userPackages;
          };
      });
}
