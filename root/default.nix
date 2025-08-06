{
  stdenv,
  pandoc,
  lib,
}:
stdenv.mkDerivation {
  name = "root.alurm.github.io";
  src = builtins.path { path = ./.; };
  nativeBuildInputs = [
    pandoc
  ];

  buildPhase = ''
    runHook preBuild

    cat << heredoc > index.html
      ${import ../html-template.nix lib {
        style = "style.css";
        post = "index.md";
        title = "index.title";
      }}
    heredoc

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    mkdir "$out"
    cp index.{html,md} style.css "$out"
    runHook postInstall
  '';
}
