{
  blog,
  root,
  resume,
  extensions,
  runCommand,
}:
runCommand "alurm.github.io" {} ''
  mkdir $out

  cp -r ${root}/. $out
  cp -r ${blog}/. $out/blog
  cp -r ${extensions}/. $out/extensions

  cp ${resume}/cv.pdf $out
  cp ${resume}/42-yerevan-certificate.pdf $out

  # Zix. Need a proper build step here.
  cp -r ${./zix} $out/zix
''
