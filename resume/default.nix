{
  pandoc,
  typst,
  lib,
  runCommand,
}:
runCommand "resume.alurm.github.io" { } ''
  mkdir "$out"

  ${typst}/bin/typst compile --features html ${./alan-urmancheev.typ} "$out/alan-urmancheev.pdf"

  cat << heredoc > "$out/alan-urmancheev.html"
  ${import ../html-template.nix { inherit lib pandoc; } {
    style = "../style.css";
    content = ./alan-urmancheev.typ;
    format = "typst";
    need-table-of-contents = false;
  }}
  heredoc

  cp ${./alan-urmancheev-42-yerevan-completion-certificate.pdf} "$out/alan-urmancheev-42-yerevan-completion-certificate.pdf"
''
