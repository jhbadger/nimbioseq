import biosequence, os, strutils

proc mbp(length: int):string = formatFloat(float(length)/1e6, 
                                           ffDecimal,
                                           precision = 1)

proc percent(num, length:int):string = formatFloat(float(num*100/length),
                                                   ffDecimal,
                                                   precision = 1)

proc seqSummary(input: string, total = false) =
  let progName = split(getAppFilename(), "/")[getAppFileName().count("/")]
  if input != nil:
    var totalLength, totalGC, totalAmbig, numSeq, maxLen, minLen = 0
    for s in readSeqs(input):
      if total:
        totalLength += s.length
        totalGC += s.gc
        totalAmbig += s.ambiguous
        numSeq += 1
        if minLen == 0:
          minLen = s.length
        minLen = min(s.length, minLen)
        maxLen = max(s.length, maxLen)
      else:
        echo "--" & s.id & "--"
        echo "Length: ", s.length, " (" & mbp(s.length) & " mbp)"
        echo "GC: ", percent(s.gc, s.length) & "%"
        echo "Ambiguous: ", percent(s.ambiguous, s.length) & "%"
    if total:
      echo "Total Sequences: ", numSeq
      echo "Minimum Length: ", minLen, " (" & mbp(minLen) & " mbp)"
      var meanLen = int(totalLength/numSeq)
      echo "Mean Length: ", meanLen, " (" & mbp(meanLen) & " mbp)"
      echo "Maximum Length: ", maxLen, " (" & mbp(maxLen) & " mbp)"
      echo "Total Length: ", totalLength, " (" & mbp(totalLength) & " mbp)"
      echo "GC: ", percent(totalGC, totalLength) & "%"
      echo "Ambiguous: ", percent(totalAmbig, totalLength) & "%"
  else:
    echo progName & ": need file name"

when isMainModule: import cligen;dispatch(seqSummary)
