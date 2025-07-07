{pandoc, pkgs}: pkgs.stdenv.mkDerivation {
  name = "root.alurm.github.io";
  src = builtins.path {path = ./.;};
  nativeBuildInputs = [pandoc];
  
  buildPhase = ''
    runHook preBuild

    cat << end > index.html
      <html>
        <head>
          <link rel="stylesheet" href="style.css"/>
        </head>
        <body>
          $(pandoc -i index.md)
        </body>
      </html>
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