import nimbioseq, os, strutils, tables

proc extractFastx(input: string, list: string) =
  var seen = initTable[string, bool]()
  if list != "":
    for line in lines(list):
      seen[line] = true
  if input != "":
    for s in readSeqs(input):
      if seen.has_key s.id:
        if s.quality != "":
           echo s.to_fastq
        else:
          echo s.to_fasta
when isMainModule: import cligen;dispatch(extractFastx)
