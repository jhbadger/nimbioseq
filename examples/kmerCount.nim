import nimbioseq, future, tables, sequtils, strutils, os, math

proc seqSummary(input: string, kmer = 8, complement = false,
                                      relAbund = false) =
  let progName = split(getAppFilename(), "/")[getAppFileName().count("/")]
  var counts:seq[int]
  var freqs:seq[float]
  var i = 0
  let maxNum = 4^kmer
  if input != nil:
    stdout.write "Name"
    while i < maxNum:
      stdout.write "\t"
      stdout.write num2kmer(i, kmer)
      i += 1
    stdout.write "\n"
    for s in readSeqs(input):
      counts = s.toKmerFrequency(kmer, complement)
      if relAbund:
        var sum = counts.foldl(a + b)
        freqs = counts.map(x => (float)x / sum)
      stdout.write s.id
      i = 0
      while i < maxNum:
        stdout.write "\t"
        if relAbund:
          stdout.write freqs[i]
        else:
          stdout.write counts[i]
        i += 1
      stdout.write "\n"
  else:
    echo progName & ": need file name"

when isMainModule: import cligen;dispatch(seqSummary)
