{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    ruby
    bundler
    nodejs
    yarn
    postgresql
    sqlite
    gnumake
    gcc
    libyaml
  ];

  shellHook = ''
    export PATH="${pkgs.postgresql}/bin:$PATH"
    export LD_LIBRARY_PATH="${pkgs.postgresql}/lib:$LD_LIBRARY_PATH"
  '';
}
