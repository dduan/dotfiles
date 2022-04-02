{ stdenv }:
stdenv.mkDerivation {
  name = "SF-Mono-Ligaturized";
  src = ./.;
  installPhase = ''mkdir -p $out/share/fonts/opentype/ && cp *.otf "$_"'';
}
