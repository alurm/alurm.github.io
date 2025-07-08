{pandoc, pkgs}: pkgs.stdenv.mkDerivation {
  name = "root.alurm.github.io";
  src = builtins.path {path = ./.;};
  nativeBuildInputs = [pandoc];
  
  buildPhase = ''
    runHook preBuild

    cat << end > index.html
      ${import ../html-template.nix {
        style = "style.css";
        post = "index.md";
      }}
    end

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    mkdir "$out"
    cp index.{html,md} style.css "$out"
    runHook postInstall
  '';
}