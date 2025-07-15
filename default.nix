{
  pkgs,
  blog,
  root,
  resume,
  ft-yerevan-unofficial-guide,
}:
pkgs.stdenv.mkDerivation {
  name = "alurm.github.io";
  src = builtins.path { path = ./.; };
  nativeBuildInputs = with pkgs; [
    treefmt
    nixfmt-rfc-style
    rsync
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

    rsync -vh "${blog}/" "$out/blog"
    rsync -vh "${resume}/" "$out/resume"
    rsync -vh "${root}/" "$out/"
    rsync -vh "${ft-yerevan-unofficial-guide}/index.html" "$out/42-yerevan-unofficial-guide/"

    runHook postInstall
  '';
}
