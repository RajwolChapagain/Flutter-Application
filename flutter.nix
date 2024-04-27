let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-unstable";
  pkgs = import nixpkgs { config = {allowUnfree=true;}; overlays = []; };
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

  shellHook = ''
    export CHROME_EXECUTABLE=$(which google-chrome-stable);
  '';
}
