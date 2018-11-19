import nimbioseq, os, strutils

proc checkFastq(input: string, total = false) =
    if input != "":
      for s in readSeqs(input):
        if s.sequence.len != s.quality.len:
          echo "Problem with " & s.id

when isMainModule: import cligen;dispatch(checkFastq)
