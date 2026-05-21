{ stdenv, fzy, fetchFromGitHub, ... }:
stdenv.mkDerivation rec {
  pname = "git-pile";
  version = "0.8.0";
  buildInputs = [
    fzy
  ];
  src = fetchFromGitHub {
    owner = "keith";
    repo = "git-pile";
    rev = version;
    sha256 = "sha256-txfvov1ZM0gauWBY37t3HRGaOeigDZ6fIShQcOa45NI=";
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
