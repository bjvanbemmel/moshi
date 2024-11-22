{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [
    nodejs
    go
    air
    goose
    sqlc
  ];
  name = "moshi";
  shellHook = ''
    exec zsh
  '';
}
