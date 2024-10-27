{ pkgs }:
pkgs.vimUtils.buildVimPlugin {
  pname = "templ-vim";
  src = pkgs.fetchFromGitHub {
    owner = "joerdav";
    repo = "templ.vim";
    rev = "5cc48b93a4538adca0003c4bc27af844bb16ba24";
    sha256 = "sha256-YdV8ioQJ10/HEtKQy1lHB4Tg9GNKkB0ME8CV/+hlgYs=";
  };
  version = "2023-10-30";
}
