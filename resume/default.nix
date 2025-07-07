{pandoc, pkgs, typst}: pkgs.stdenv.mkDerivation {
  name = "resume.alurm.github.io";
  src = builtins.path {path = ./.;};
  nativeBuildInputs = [pandoc typst];
  
  buildPhase = ''
    runHook preBuild

    typst compile alan-urmancheev.typ alan-urmancheev.pdf

    cat << end > alan-urmancheev.html
      <html>
        <head>
          <link rel="stylesheet" href="../style.css"/>
        </head>
        <body>
          $(pandoc alan-urmancheev.typ)
        </body>
      </html>
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