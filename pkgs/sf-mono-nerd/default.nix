{ stdenv }:
stdenv.mkDerivation {
  name = "SF-Mono-Nerd";
  src = ./.;
  installPhase = ''mkdir -p $out/share/fonts/opentype/ && cp *.otf "$_"'';
}
