{
  pandoc,
  lib,
  runCommand,
}:
runCommand "root.alurm.github.io" { } ''
  mkdir "$out"
  cp ${./style.css} "$out/style.css"
  cp ${./favicon.ico} "$out/favicon.ico"
  cat << heredoc > "$out/index.html"
    ${import ../html-template.nix { inherit pandoc lib; } {
      style = "style.css";
      content = "${./index.md} <(cat ${../blog/index.md} | sed 's:\./:./blog/:')";
      title = "Alan Urmancheev";
      need-table-of-contents = false;
    }}
  heredoc
''
