{ ripgrep }:
rec {
  enable = true;
  defaultCommand = "${ripgrep}/bin/rg --files -S --hidden --follow --glob '!tags' --glob '!.git/*' --glob '!build/' --glob '!.build/' --glob '!.DS_Store' --glob '!build.noindex' --glob '!Pods' --glob '!deps' --glob '!bazel-ios' --glob '!.vscode' --glob '!.clangd'";
  defaultOptions = [
    "--height 37.5%"
    "--reverse"
    "--preview 'file {}'"
    "--preview-window down:1"
  ];
  fileWidgetCommand = defaultCommand;
}
