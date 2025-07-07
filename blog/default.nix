{pandoc, pkgs}: pkgs.stdenv.mkDerivation {
  name = "blog.alurm.github.io";
  src = builtins.path {path = ./.;};
  nativeBuildInputs = [pandoc];
  
  buildPhase = ''
    runHook preBuild
    for i in *.md; do
      cat << end > "''${i%.md}.html"
        <html>
          <head>
            <link rel="stylesheet" href="../style.css"/>
          </head>
          <body>
            $(pandoc -i "$i")
          </body>
        </html>
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