(set-logic BV)
(synth-fun f ( (x (BitVec 64)) ) (BitVec 64)
((Start (BitVec 64)
((bvnot Start)
(bvxor Start Start)
(bvand Start Start)
(bvor Start Start)
(bvneg Start)
(bvadd Start Start)
(bvmul Start Start)
(bvudiv Start Start)
(bvurem Start Start)
(bvlshr Start Start)
(bvashr Start Start)
(bvshl Start Start)
(bvsdiv Start Start)
(bvsrem Start Start)
(bvsub Start Start)
x
#x0000000000000000
#x0000000000000001
#x0000000000000002
#x0000000000000003
#x0000000000000004
#x0000000000000005
#x0000000000000006
#x0000000000000007
#x0000000000000008
#x0000000000000009
#x0000000000000009
#x0000000000000009
#x000000000000000A
#x000000000000000B
#x000000000000000C
#x000000000000000D
#x000000000000000E
#x000000000000000F
#x0000000000000010
(ite StartBool Start Start)
))
(StartBool Bool
((= Start Start)
(not StartBool)
(and StartBool StartBool)
(or StartBool StartBool)
))))
(constraint (= (f #x7B876DD1AFE65456) #xC23C4917280CD5D4))
(constraint (= (f #xBEC03F359B29EDCB) #xA09FE065326B091A))
(constraint (= (f #x27261235DB5F4B43) #xEC6CF6E512505A5E))
(constraint (= (f #xEA2A045DAE9752D8) #x8AEAFDD128B45693))
(constraint (= (f #x5D75032EECE39B8A) #xD1457E68898E323A))
(constraint (= (f #x8000000000000000) #xBFFFFFFFFFFFFFFF))
(constraint (= (f #x0000000000000000) #xFFFFFFFFFFFFFFFF))
(constraint (= (f #x0000000000000001) #xFFFFFFFFFFFFFFFF))
(constraint (= (f #xAA87754D3E75BBEB) #xFF1FFFBEFDFFFFFE))
(constraint (= (f #x5EE084D5CE03D0F1) #xFFC31BFFBC0FE3E6))
(constraint (= (f #x87956B56289AC8FC) #x1F7FFFFCF37FB3F8))
(constraint (= (f #xDBD9C2E04C0FE37B) #xFFF78FC1B83FCFFE))
(constraint (= (f #xB84281C031AE2F63) #xF18F0780E7FCFFCE))
(constraint (= (f #xFFFFFFFFFFFFFFFF) #x8000000000000000))
(constraint (= (f #xF0F0F0F0F0F0F0F2) #xE3E3E3E3E3E3E3EC))
(constraint (= (f #xE8E00AFF4F2F1D5A) #x8B8FFA8058687152))
(constraint (= (f #xBC6C33B8EE97DD5F) #xA1C9E62388B41150))
(constraint (= (f #xA87D36C5D96BC8CF) #xABC1649D134A1B98))
(constraint (= (f #x24677E8CFE551CF9) #xD9DFFF3BFDFE7BF6))
(constraint (= (f #x45CF3AA017840F30) #x9FBEFFC07F183EE0))
(constraint (= (f #x9457B0C5B8D75442) #xB5D4279D239455DE))
(constraint (= (f #xAD22D1525B545064) #xFECFE7EDFFF9E1D8))
(constraint (= (f #x49CE5EDDA88A4B13) #xDB18D0912BBADA76))
(constraint (= (f #x36423CFB2BF7D674) #xFD8CFBFEFFFFFDF8))
(constraint (= (f #x91FEBF2C2BE475A8) #x67FFFEF8FFD9FFF0))
(constraint (= (f #x0000000000000001) #xFFFFFFFFFFFFFFFF))
(constraint (= (f #xFFFFFFFFFFFFFFFF) #x8000000000000000))
(constraint (= (f #x7FFFFFFFFFFFFFFF) #xFFFFFFFFFFFFFFFE))
(constraint (= (f #xFFFFFFFFFFFFFFFE) #xFFFFFFFFFFFFFFFC))
(constraint (= (f #x07454DBBCE2295B3) #x1F9FBFFFBCCF7FEE))
(constraint (= (f #xF0F0F0F0F0F0F0F2) #xE3E3E3E3E3E3E3EC))
(check-synth)
