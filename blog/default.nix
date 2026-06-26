{
  callPackage,
  linkFarmFromDrvs,
  runCommand,
  lib,
  pandoc,
}: let
  # Newest should be first.
  metadatas = [
    {
      date = "2026-06-26";
      rest = "tacosprint";
      title = "TacoSprint 2026: making Nix more relocatable, fixing shebangs and sending my first kernel patch";
    }
    {
      date = "2026-06-17";
      rest = "generic-dynamic-array-in-c-with-no-capacity";
      title = "A generic dynamic array in C that stores no capacity and needs no struct";
    }
    {
      date = "2025-08-07";
      rest = "first-class-lists-in-shells";
      title = "More shell tricks: first class lists, jq, and the es shell";
    }
    {
      date = "2024-09-17";
      rest = "an-argument-for-having-trailing-slashes-in-canonical-directory-paths";
      title = "An argument for having trailing slashes in canonical directory paths";
    }
    {
      date = "2024-08-18";
      rest = "c-scripting-with-tcc-and-bash";
      title = "C scripting with TCC and Bash";
    }
  ];

  makePost = metadata:
    callPackage (import ./make-post.nix {
      inherit (metadata) title;
      prefix = lib.concatStringsSep "-" (
        with metadata; [
          date
          rest
        ]
      );
    }) {};

  postsDrvs = map makePost metadatas;

  posts = linkFarmFromDrvs "posts.blog.alurm.github.io" postsDrvs;
in
  # TODO: remove work duplication here.
  runCommand "blog.alurm.github.io" {} ''
    mkdir "$out"
    cd "$out"

    cp "${posts}"/* "$out"

    # Assets.
    cp ${./2026-06-26-attention-nix-and-tacos-is-all-you-need.pdf} "$out/2026-06-26-attention-nix-and-tacos-is-all-you-need.pdf"

    cp ${builtins.toFile "feed.xml" (import ./make-feed.nix lib metadatas)} "$out/feed.xml"

    cat << heredoc > "$out/index.html"
      ${import ../html-template.nix {inherit pandoc lib;} {
      style = "../style.css";
      content = ./index.md;
      title = "Alan Urmancheev's blog";
      need-table-of-contents = false;
    }}
    heredoc
  ''
