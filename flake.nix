{
  description = "terraform in action";
  inputs = { nixpkgs.url = "github:nixos/nixpkgs/23.05"; };
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

    in {
      devShells.${system} = {
        default = with pkgs;
          mkShell rec {
            name = "terraforming";
            buildInputs = [ terraform terraform-ls ];
          };
      };
    };
}
