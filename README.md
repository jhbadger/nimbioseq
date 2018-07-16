Nim routines for processing DNA/RNA/Protein sequences

[Imports](#6){.toc-backref}
===========================

[sequtils](sequtils.html){.reference .external},
[strutils](strutils.html){.reference .external},
[math](math.html){.reference .external},
[tables](tables.html){.reference .external},
[osproc](osproc.html){.reference .external},
[streams](streams.html){.reference .external}


[Types](#7){.toc-backref}
=========================

[]{#Record}
    Record = object
      id*: string
      description*: string
      quality*: string
      sequence*: string

This type represents a genetic sequence with optional quality


[Procs](#12){.toc-backref}
==========================

[]{#reverseComplement,Record}
    proc reverseComplement(self: Record): Record {.raises: [], tags: [].}

[]{#toFasta,Record,int}
    proc toFasta(self: Record; lineLength = 60): string {.raises: [], tags: [].}

returns FASTA formatted string of sequence record
[]{#qualToChar,int}
    proc qualToChar(q: int): char {.raises: [], tags: [].}

returns character for a given Illumina quality score
[]{#charToQual,char}
    proc charToQual(c: char): int {.raises: [], tags: [].}

returns Illumina quality score for a given character
[]{#toFastq,Record,int}
    proc toFastq(self: Record; qualityValue = 30): string {.raises: [], tags: [].}

returns FASTQ formatted string of sequence record with given quality
value to be applied to sequence
[]{#length,Record}
    proc length(self: Record): int {.raises: [], tags: [].}

returns length of sequence
[]{#kmer2num,string}
    proc kmer2num(kmer: string): int {.raises: [], tags: [].}

converts a kmer string into an integer 0..4\^(len-1)
[]{#num2kmer,int,int}
    proc num2kmer(num, klen: int): string {.raises: [KeyError], tags: [].}

converts an integer into a kmer string given the number and length of
kmer
[]{#toKmerFrequency,Record,int}
    proc toKmerFrequency(self: Record; klen: int; includeComplement = false): seq[int] {.
        raises: [], tags: [].}

returns (overlapping) kmer frequencies of a nucleotide sequence
[]{#gc,Record}
    proc gc(self: Record): int {.raises: [], tags: [].}

returns the number of bases that are G or C
[]{#ambiguous,Record}
    proc ambiguous(self: Record): int {.raises: [], tags: [].}

returns the number of bases that are not AGCTU
[]{#translate,Record,int}
    proc translate(self: Record; code = 1): Record {.raises: [], tags: [].}

translates a nucleotide sequence with the given genetic code number


[Iterators](#15){.toc-backref}
==============================

[]{#compressedLines.i,string}
    iterator compressedLines(filename: string): string {.
        raises: [Exception, IOError, IOError, OSError, AssertionError],
        tags: [ReadIOEffect, ExecIOEffect, ReadEnvEffect, RootEffect].}

iterator to read lines of a (maybe) compressed text file transparently
[]{#readFasta.i,string}
    iterator readFasta(filename: string): Record {.
        raises: [Exception, IOError, IOError, OSError, AssertionError],
        tags: [ReadIOEffect, ExecIOEffect, ReadEnvEffect, RootEffect].}

iterator to iterate over the FASTA records in a file
[]{#readFastq.i,string}
    iterator readFastq(filename: string): Record {.
        raises: [Exception, IOError, IOError, OSError, AssertionError],
        tags: [ReadIOEffect, ExecIOEffect, ReadEnvEffect, RootEffect].}

iterator to iterate over the FASTQ records in a file
[]{#readSeqs.i,string}
    iterator readSeqs(filename: string): Record {.raises: [Exception, IOError, IOError,
        Exception, IOError, OSError, AssertionError, IOError, IOError, IOError],
        tags: [ReadIOEffect, ExecIOEffect, ReadEnvEffect, RootEffect].}

Made with Nim. Generated: 2018-07-16 15:45:38 UTC

