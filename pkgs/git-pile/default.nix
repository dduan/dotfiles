{ stdenv, gh, fzy, fetchFromGitHub, ... }:
stdenv.mkDerivation rec {
  pname = "git-pile";
  version = "0.2.0";
  buildInputs = [
    gh
    fzy
  ];
  src = fetchFromGitHub {
    owner = "dduan";
    repo = "git-pile";
    rev = "88830a8af75fcb2d6e927f9a9b69334f62ee6420";
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
