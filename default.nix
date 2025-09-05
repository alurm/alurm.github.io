{
  blog,
  root,
  resume,
  extensions,

  runCommand,
}:
runCommand "alurm.github.io" { } ''
  mkdir "$out"

  cp -r "${root}/." "$out"
  cp -r "${blog}/." "$out/blog"
  cp -r "${extensions}/." "$out/extensions"

  cp ${resume}/cv.html $out
  cp ${resume}/cv.pdf $out
  cp ${resume}/42-yerevan-certificate.pdf $out

  # Deprecated.
  mkdir resume
  ln -s ../cv.pdf resume/alan-urmancheev.pdf
  ln -s ../cv.html resume/alan-urmancheev.html
''
