{
  pandoc,
  typst,
  lib,
  runCommand,
}:
runCommand "resume.alurm.github.io" { } ''
  mkdir "$out"

  ${typst}/bin/typst compile --features html ${./cv.typ} "$out/cv.pdf"

  cat << heredoc > "$out/cv.html"
  ${import ../html-template.nix { inherit lib pandoc; } {
    style = "style.css";
    content = ./cv.typ;
    format = "typst";
    need-table-of-contents = false;
  }}
  heredoc

  cp ${./42-yerevan-certificate.pdf} "$out/42-yerevan-certificate.pdf"
''
