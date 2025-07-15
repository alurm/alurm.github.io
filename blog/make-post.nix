src:
{
  pkgs,
  pandoc,
  jq,
}:
pkgs.stdenv.mkDerivation {
  inherit src;

  name = "${builtins.baseNameOf (builtins.toString src)}.html";

  nativeBuildInputs = [
    pandoc
    jq
  ];

  buildPhase = ''
    runHook preBuild

    cat << heredoc > it.html
      ${import ../html-template.nix {
        title = "it.title";
        style = "../style.css";
        post = "it.md";
      }}
    heredoc

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mv "it.html" "$out"

    runHook postInstall
  '';
}
