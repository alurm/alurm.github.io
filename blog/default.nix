{
  callPackage,
  linkFarmFromDrvs,
}:
let
  paths = [
    ./2024-08-18-c-scripting-with-tcc-and-bash
    ./2024-09-17-an-argument-for-having-trailing-slashes-in-canonical-directory-paths
  ];

  makePost = path: callPackage (import ./make-post.nix path) { };

  posts = map makePost paths;
in
linkFarmFromDrvs "blog.alurm.github.io" posts
