{
  prefix,
  title,
}:
{
  pandoc,
  lib,
  runCommand,
}:
runCommand "${builtins.baseNameOf (builtins.toString prefix)}.html" { } ''
  cat << heredoc > "$out"
    ${import ../html-template.nix { inherit lib pandoc; } {
      inherit title;
      style = "../style.css";
      content = "${./. + "/${prefix}.md"}";
      need-table-of-contents = true;
    }}
  heredoc
''
