{
  prefix,
  title,
}:
{
  pandoc,
  lib,
  runCommandLocal,
}:
runCommandLocal "${builtins.baseNameOf (builtins.toString prefix)}.html" { } ''
  cat << heredoc > "$out"
    ${import ../html-template.nix { inherit lib pandoc; } {
      inherit title;
      style = "../style.css";
      post = "${./. + "/${prefix}.md"}";
      need-table-of-contents = true;
    }}
  heredoc
''
