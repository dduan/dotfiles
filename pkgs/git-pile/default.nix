{ stdenv, fzy, fetchFromGitHub, ... }:
stdenv.mkDerivation rec {
  pname = "git-pile";
  version = "0.2.0";
  buildInputs = [
    fzy
  ];
  src = fetchFromGitHub {
    owner = "keith";
    repo = "git-pile";
    rev = version;
    sha256 = "sha256-M7A2xdUTrwc6xSEns2W4qTCMk6WnEN8mUtDBfHQNsH0=";
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
