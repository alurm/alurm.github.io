{pandoc, pkgs, typst}: pkgs.stdenv.mkDerivation {
  name = "resume.alurm.github.io";
  src = builtins.path {path = ./.;};
  nativeBuildInputs = [pandoc typst];
  
  buildPhase = ''
    runHook preBuild

    typst compile alan-urmancheev.typ alan-urmancheev.pdf

    cat << end > alan-urmancheev.html
      ${import ../html-template.nix {
        style = "../style.css";
        post = ./alan-urmancheev.typ;
        format = "typst";
      }}
    end

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    mkdir "$out"

    cp alan-urmancheev.{html,pdf,typ} "$out"
    cp alan-urmancheev-42-common-core.pdf "$out"

    runHook postInstall
  '';
}
