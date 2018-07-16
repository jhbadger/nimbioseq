= Module nimbioSeq =

== Imports ==
sequtils, strutils, math, tables, osproc, streams

== Types ==
Record = object
  id*: string
  description*: string
  quality*: string
  sequence*: string
  
This type represents a genetic sequence with optional quality

== Procs ==

proc reverseComplement(self: Record): Record {..}

proc toFasta(self: Record; lineLength = 60): string {..}
returns FASTA formatted string of sequence record

proc qualToChar(q: int): char {..}
returns character for a given Illumina quality score

proc charToQual(c: char): int {..}
returns Illumina quality score for a given character

proc toFastq(self: Record; qualityValue = 30): string {..}
returns FASTQ formatted string of sequence record with given quality value to be applied to sequence

proc length(self: Record): int {..}
returns length of sequence

proc kmer2num(kmer: string): int {..}
converts a kmer string into an integer 0..4^(len-1)

proc num2kmer(num, klen: int): string {..}
converts an integer into a kmer string given the number and length of kmer

proc toKmerFrequency(self: Record; klen: int; includeComplement = false): seq[int] {..}
returns (overlapping) kmer frequencies of a nucleotide sequence

proc gc(self: Record): int {..}
returns the number of bases that are G or C

proc ambiguous(self: Record): int {..}
returns the number of bases that are not AGCTU

proc translate(self: Record; code = 1): Record {..}
translates a nucleotide sequence with the given genetic code number


=== Iterators ==
iterator compressedLines(filename: string): string {..}
iterator to read lines of a (maybe) compressed text file transparently

iterator readFasta(filename: string): Record {..}
iterator to iterate over the FASTA records in a file

iterator readFastq(filename: string): Record {..}
iterator to iterate over the FASTQ records in a file

iterator readSeqs(filename: string): Record {..}
