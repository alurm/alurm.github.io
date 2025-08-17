{
  pandoc,
  lib,
  runCommand,
}:
runCommand "root.alurm.github.io" { } ''
  mkdir "$out"
  cp ${./style.css} "$out/style.css"
  cat << heredoc > "$out/index.html"
    ${import ../html-template.nix { inherit pandoc lib; } {
      style = "style.css";
      post = ./index.md;
      title = "Alan Urmancheev: software engineer, systems programmer, open source contributor, public speaker";
    }}
  heredoc
''
