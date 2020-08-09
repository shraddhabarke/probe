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
(constraint (= (f #x946C19EFDD7A7F6E) #x0000000004A360CF))
(constraint (= (f #x73A35A02DBBF38BE) #x00000000039D1AD0))
(constraint (= (f #xD12639A2E8CD953E) #x00000000068931CD))
(constraint (= (f #x9B9D6ED02EE0CC36) #x0000000004DCEB76))
(constraint (= (f #x39BAD9D777B4F81B) #x0000000001CDD6CE))
(constraint (= (f #xDD746B4B9C5A0A94) #x00000000BAE8D697))
(constraint (= (f #x508C426F651B3201) #x00000000A11884DE))
(constraint (= (f #x3DE84442B252EB1D) #x000000007BD08885))
(constraint (= (f #x8B9DF9FFD8B30B31) #x00000000173BF3FF))
(constraint (= (f #xAB24284AE3B34E30) #x0000000056485095))
(constraint (= (f #x8000000000000000) #x0000000000000000))
(constraint (= (f #x0000000000000000) #x0000000000000000))
(constraint (= (f #xE817E25602EAE097) #x000000000740BF12))
(constraint (= (f #xC1CCAC97F66C19D5) #x000000008399592F))
(constraint (= (f #x4BFB887465FED51B) #x00000000025FDC43))
(constraint (= (f #x75F8C4617D13B46A) #x0000000003AFC623))
(constraint (= (f #x2854122C17EE0A1B) #x000000000142A091))
(constraint (= (f #xD8E27EE27C7B04DB) #x0000000006C713F7))
(constraint (= (f #xD39007B7C1278933) #x00000000069C803D))
(constraint (= (f #x8FAF63237F1E75A5) #x000000001F5EC646))
(constraint (= (f #x62B57438A31217C6) #x000000000315ABA1))
(constraint (= (f #x9997C0579A2AC6D8) #x00000000332F80AF))
(check-synth)
