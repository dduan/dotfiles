{ stdenv, fzy, fetchFromGitHub, ... }:
stdenv.mkDerivation rec {
  pname = "git-pile";
  version = "0.7.0";
  buildInputs = [
    fzy
  ];
  src = fetchFromGitHub {
    owner = "keith";
    repo = "git-pile";
    rev = version;
    sha256 = "sha256-7Ek+7r7HYdV9Gs3meADIgn4gxemYTLyeYeqKNwzKems=";
    name = "git-pile-${version}-src";
  };
  patchPhase = ''
    patchShebangs bin/*
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp bin/* $out/bin/
    chmod +x $out/bin/*
  '';
}
