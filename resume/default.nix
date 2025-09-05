{
  pandoc,
  typst,
  lib,
  runCommandLocal,
}:
runCommandLocal "resume.alurm.github.io" { } ''
  mkdir "$out"

  ${typst}/bin/typst compile --features html ${./alan-urmancheev.typ} "$out/alan-urmancheev.pdf"

  cat << heredoc > "$out/alan-urmancheev.html"
  ${import ../html-template.nix { inherit lib pandoc; } {
    style = "../style.css";
    # TODO: rename to "content".
    post = ./alan-urmancheev.typ;
    format = "typst";
    need-table-of-contents = false;
  }}
  heredoc

  cp ${./alan-urmancheev-42-yerevan-completion-certificate.pdf} "$out/alan-urmancheev-42-yerevan-completion-certificate.pdf"
''


# cat << heredoc > "$out/alan-urmancheev.html"
#   ${import ../html-template.nix { inherit lib pandoc; } {
#     style = "../style.css";
#     post = ./alan-urmancheev.typ;
#     format = "typst";
#   }}
# heredoc
