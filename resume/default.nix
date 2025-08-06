{
  pkgs,
  pandoc,
  typst,
  lib,
}:
pkgs.stdenv.mkDerivation {
  name = "resume.alurm.github.io";
  src = builtins.path { path = ./.; };
  nativeBuildInputs = [
    pandoc
    typst
  ];

  buildPhase = ''
    runHook preBuild

    typst compile alan-urmancheev.typ alan-urmancheev.pdf

    cat << heredoc > alan-urmancheev.html
      ${import ../html-template.nix lib {
        style = "../style.css";
        post = ./alan-urmancheev.typ;
        format = "typst";
      }}
    heredoc

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    mkdir "$out"

    cp ./alan-urmancheev.{html,pdf,typ} "$out"
    cp ./alan-urmancheev-42-yerevan-completion-certificate.pdf "$out"

    runHook postInstall
  '';
}
