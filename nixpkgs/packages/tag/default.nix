{ stdenv, fetchFromGitHub, clang }:
stdenv.mkDerivation {
  pname = "tag";
  version = "0.8.0";
  src = fetchFromGitHub {
    owner = "keith";
    repo = "tag";
    rev = "0.8.0";
    sha256 = "132k8wh7x2y61j9j3lk646wp2dp9jakx0inc7hcbgy8li2kb03sm";
  };
  buildPhase = ''
    ${clang}/bin/clang++ -std=c++17 -O3 tag.cpp -o tag
  '';
  installPhase = ''
    mkdir -p $out/bin
    mv tag $out/bin
  '';
}
