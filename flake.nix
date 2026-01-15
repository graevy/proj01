{
  description = "csc143 java dev flake, pinned to openjdk22 nixpkgs version";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/d7c54882e62c9c9ecc524aa3f0b4cb2768478d1a";
    flake-utils.url = "github:numtide/flake-utils";
  };

	outputs = { self, nixpkgs, flake-utils }:
	  flake-utils.lib.eachDefaultSystem (system:
		 let
			pkgs = nixpkgs.legacyPackages.${system};
		 in {
			devShells.default = pkgs.mkShell {
			  buildInputs = [
			    pkgs.javaPackages.compiler.openjdk22
				 pkgs.jdt-language-server
				 pkgs.maven
				 pkgs.gtk3
             pkgs.xorg.libXrender
				 pkgs.xorg.libXtst
				 pkgs.xorg.libXi
				 pkgs.mesa
			  ];
			};
		 }
	  );
}

