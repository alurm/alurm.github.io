{
  lib,

  runCommand,
  pandoc,
}:
runCommand "extensions.alurm.github.io" { } ''
  mkdir "$out"

  mkdir "$out/remove-content-disposition"

  cp ${
    builtins.path { path = ./remove-content-disposition/extension.xpi; }
  } "$out/remove-content-disposition/extension.xpi"

  cat << heredoc > "$out/index.html"
    ${import ../html-template.nix { inherit pandoc lib; } {
      style = "../style.css";
      content = ./index.md;
      title = "Alan Urmancheev's web extensions";
      need-table-of-contents = false;
    }}
  heredoc
''
