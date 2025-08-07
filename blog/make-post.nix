src:
{
  pandoc,
  lib,
  runCommand,
}:
runCommand "${builtins.baseNameOf (builtins.toString src)}.html" { } ''
  cat << heredoc > "$out"
    ${import ../html-template.nix { inherit lib pandoc; } {
      title = builtins.readFile "${src}/it.title";
      style = "../style.css";
      post = "${src}/it.md";
    }}
  heredoc
''
