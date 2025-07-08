{pandoc, pkgs}: pkgs.stdenv.mkDerivation {
  name = "blog.alurm.github.io";
  src = builtins.path {path = ./.;};
  nativeBuildInputs = [pandoc];
  
  buildPhase = ''
    runHook preBuild
    for i in *.md; do
      cat << end > "''${i%.md}.html"
        ${import ../html-template.nix {
          style = "../style.css";
          post = "$i";
        }}
    end

    done
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    mkdir "$out"
    cp *.html *.md "$out"
    runHook postInstall
  '';
}