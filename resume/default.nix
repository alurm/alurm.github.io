{
  pandoc,
  typst,
  lib,
  runCommand,
}:
runCommand "resume.alurm.github.io" { } ''
  mkdir "$out"

  ${typst}/bin/typst compile ${./alan-urmancheev.typ} "$out/alan-urmancheev.pdf"

  cp ${./alan-urmancheev-42-yerevan-completion-certificate.pdf} "$out/alan-urmancheev-42-yerevan-completion-certificate.pdf"
''

# ${typst}/bin/typst compile --features html --format html ${./alan-urmancheev.typ} "$out/alan-urmancheev.html"

# cat << heredoc > "$out/alan-urmancheev.html"
#   ${import ../html-template.nix { inherit lib pandoc; } {
#     style = "../style.css";
#     post = ./alan-urmancheev.typ;
#     format = "typst";
#   }}
# heredoc
