{
  callPackage,
  linkFarmFromDrvs,
  runCommand,
  lib,
  lndir,
}:
let
  # Newest should be last.
  components-of-paths = [
    {
      date = "2024-08-18";
      rest = "c-scripting-with-tcc-and-bash";
    }
    {
      date = "2024-09-17";
      rest = "an-argument-for-having-trailing-slashes-in-canonical-directory-paths";
    }
    {
      date = "2025-08-07";
      rest = "first-class-lists-in-shells";
    }
  ];

  paths = map (
    { date, rest }:
    ./.
    + (
      "/"
      + (builtins.concatStringsSep "-" [
        date
        rest
      ])
    )
  ) components-of-paths;

  makePost = path: callPackage (import ./make-post.nix path) { };

  postsDrvs = map makePost paths;

  posts = linkFarmFromDrvs "posts.blog.alurm.github.io" postsDrvs;
in
# TODO: remove work duplication here.
runCommand "blog.alurm.github.io" { } ''
  mkdir "$out"
  cd "$out"
  ${lndir}/bin/lndir "${posts}"

  cp ${builtins.toFile "feed.xml" (import ./make-feed.nix lib components-of-paths)} "$out/feed.xml"
''
