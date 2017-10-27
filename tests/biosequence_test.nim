import unittest
import ../biosequence

test "Does Reverse complement work":
  var s = Record(id: "foo", sequence:"ATGATC")
  check(s.reverseComplement.sequence == "GATCAT")

test "Does kmer frequency work":
    var s = Record(sequence:"ATGC")
    check(s.toKmerFrequency(1) == @[1,1,1,1])
    check(s.toKmerFrequency(1, true) == @[2,2,2,2])
