# Package

version       = "0.3.20181119"
author        = "Jonathan Badger"
description   = "Nim Library for sequence (protein/nucleotide) bioinformatics"
license       = "BSD-3"
srcDir        = "src"
skipFiles     = @["checkFastq.nim", "extractFastx.nim", "kmerCount.nim",
                  "seqSummary.nim"]

# Dependencies

requires "nim >= 0.17.2", "zip >= 0.2.1"
