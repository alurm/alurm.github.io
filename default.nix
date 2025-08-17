{
  pkgs,

  blog,
  root,
  resume,
  extensions,
}:
pkgs.stdenv.mkDerivation {
  name = "alurm.github.io";
  src = builtins.path { path = ./.; };
  nativeBuildInputs = with pkgs; [
    treefmt
    nixfmt-rfc-style
  ];

  doCheck = true;

  checkPhase = ''
    runHook preCheck

    treefmt --ci

    runHook postCheck
  '';

  buildPhase = ''
    runHook preBuild
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir "$out"

    cp -r "${root}/." "$out"
    cp -r "${blog}/." "$out/blog"
    cp -r "${extensions}/." "$out/extensions"

    cp -r "${resume}/." "$out/resume"

    ln -s resume/alan-urmancheev.html "$out/cv.html"
    ln -s resume/alan-urmancheev.pdf "$out/cv.pdf"

    runHook postInstall
  '';
}
