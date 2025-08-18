{
  lib,

  runCommandLocal,
  pandoc,
}:
runCommandLocal "extensions.alurm.github.io" { } ''
  mkdir "$out"

  mkdir "$out/remove-content-disposition"

  cp ${
    builtins.path { path = ./remove-content-disposition/extension.xpi; }
  } "$out/remove-content-disposition/extension.xpi"

  cat << heredoc > "$out/index.html"
    ${import ../html-template.nix { inherit pandoc lib; } {
      style = "../style.css";
      post = ./index.md;
      title = "Alan Urmancheev's web extensions";
    }}
  heredoc
''
