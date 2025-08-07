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
      title = builtins.readFile ./index.title;
    }}
  heredoc
''
