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
runCommand "blog.alurm.github.io"
  {
    nativeBuildInputs = [ lndir ];
  }
  ''
    mkdir "$out"
    cd "$out"
    lndir "${posts}"

    cp ${builtins.toFile "feed.xml" (import ./make-feed.nix lib components-of-paths)} "$out/feed.xml"
  ''
