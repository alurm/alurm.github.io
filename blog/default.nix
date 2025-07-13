{pandoc, pkgs}: pkgs.stdenv.mkDerivation {
  name = "blog.alurm.github.io";
  src = builtins.path {path = ./.;};
  nativeBuildInputs = [pandoc];
  
  buildPhase = ''
    runHook preBuild
    for post in *.md; do
      base=''${post%.md}
      cat << end > "$base.html"
        ${import ../html-template.nix {
          title = "$base.title";
          style = "../style.css";
          post = "$post";
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
