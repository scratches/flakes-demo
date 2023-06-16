{
  description = "Flakes demo";
  nixConfig.bash-prompt = "\[flakes-demo\]> ";
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in {
        devShell = with pkgs; mkShell {
          name = "env";
          buildInputs = [ hello cowsay ];
        };
      });
}
