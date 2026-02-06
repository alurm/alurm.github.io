{
  typst,
  runCommand,
}:
runCommand "resume.alurm.github.io" {} ''
  mkdir "$out"
  ${typst}/bin/typst compile ${./cv.typ} $out/cv.pdf
  cp ${./42-yerevan-certificate.pdf} $out/42-yerevan-certificate.pdf
''
