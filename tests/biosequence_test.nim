import unittest, os
include "../src/nimbioseq.nim"

test "Does Reverse complement work":
  var s = Record(id: "foo", sequence:"ATGATC")
  check(s.reverseComplement.sequence == "GATCAT")

test "Does kmer frequency work":
    var s = Record(sequence:"ATGC")
    check(s.toKmerFrequency(1) == @[1,1,1,1])
    check(s.toKmerFrequency(1, true) == @[2,2,2,2])

test "Does translation work":
      var s = Record(sequence:"TTGAGCCTCGCCGTTACGCTCGCCTCTACCA")
      check(s.translate.sequence == "LSLAVTLAST")
      var s2 = Record(sequence:"CACCCTTCCCCTCCCGACCGT")
      check(s2.translate.sequence == "HPSPPDR")
test "Do alternate genetic codes work":
      var s3 = Record(sequence:"TAATAG")
      check(s3.translate(30).sequence == "EE")
test "Does loading gzip file work":
        var cmd = "echo '>foo\nAAATTTAAAAAATTTAAAT' > test.fa;gzip test.fa"
        discard os.execShellCmd(cmd)
        for s in readSeqs("test.fa.gz"):
          check(s.id=="foo")
        discard os.execShellCmd("rm test.fa.gz")
test "Does loading bzip2 file work":
        var cmd = "echo '>foo\nAAATTTAAAAAATTTAAAT' > test.fa;bzip2 test.fa"
        discard os.execShellCmd(cmd)
        for s in readSeqs("test.fa.bz2"):
          check(s.id=="foo")
        discard os.execShellCmd("rm test.fa.bz2")
