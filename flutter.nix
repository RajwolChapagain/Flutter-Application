let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-unstable";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
    flutter
    which
    bash
    file
    coreutils
    curl
    git
    unzip
    xz
    zip
    libGLU
    google-chrome
  ];
}
