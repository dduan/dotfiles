{ stdenv, gh, fzy, fetchFromGitHub, ... }:
stdenv.mkDerivation rec {
  pname = "git-pile";
  version = "0.2.3.0";
  buildInputs = [
    gh
    fzy
  ];
  src = fetchFromGitHub {
    owner = "dduan";
    repo = "git-pile";
    rev = "e66fcf94fb7f578565f05b8b80949c851ee7a663";
    sha256 = "sha256-281haWgvqG72w/vYetAK7HjBZ27KHRG3R+pLriLkOco=";
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
