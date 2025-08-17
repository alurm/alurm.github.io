{
  pkgs,
  blog,
  root,
  resume,
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
    cp -r "${resume}/." "$out/resume"

    mkdir "$out/extensions"
    mkdir "$out/extensions/remove-content-disposition"

    cp {.,"$out"}"/extensions/remove-content-disposition/extension.xpi"

    runHook postInstall
  '';
}
