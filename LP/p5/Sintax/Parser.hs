{-# OPTIONS_GHC -w #-}
module Sintax.Parser where
import Sintax.Lexer
import Sintax.Expr
import Semantic.Static.Type
import Data.Map
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6 t7 t8 t9
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,474) ([15872,38913,30792,385,8,0,0,0,0,0,0,57344,511,128,0,0,0,0,0,0,0,0,0,0,0,32768,79,4646,24670,15872,38913,30792,385,1272,8800,1505,57350,32787,33929,6167,512,0,0,0,32,0,0,8192,0,0,0,5088,35200,6020,32792,79,4646,24670,0,0,32768,0,0,0,512,57344,32787,33929,6167,20352,9728,24082,96,318,18584,33144,1,0,2048,0,0,0,32,0,65504,32769,128,8192,0,64,112,128,0,49153,1,0,8192,0,0,0,128,0,0,32768,1,0,0,0,0,0,4096,0,0,2,0,0,0,0,1,0,65024,159,8,0,0,8192,0,0,0,128,0,65534,18591,33147,63489,24580,57634,1541,5088,35200,6020,32792,79,4646,24670,15872,38913,30792,385,1272,8800,1505,57350,32787,33929,6167,20352,9728,24082,96,318,18584,33144,63489,24580,57634,1541,5088,35200,6020,32792,79,4646,24670,15872,38913,30792,385,32,0,0,0,0,16384,0,57344,255,128,0,65408,1,2,0,62,2048,0,63488,0,32,0,992,32768,0,32768,15,512,0,15872,0,8,0,0,8192,0,0,0,128,0,0,0,2,0,56,2048,0,57344,0,32,0,65520,32769,0,0,0,0,0,1272,8800,1505,57350,32787,33929,6167,20352,9728,24082,96,318,18584,33144,1,0,128,0,5088,35200,6020,24,0,0,0,2048,0,0,0,2688,16384,0,0,2,1024,1792,512,0,0,0,0,0,0,0,0,0,0,0,0,0,0,168,1024,0,0,0,64,0,0,0,256,57344,32787,33929,6167,2048,0,16,28,32,16384,28672,32768,0,256,448,0,0,24,0,0,0,0,0,0,32,0,2816,16384,0,57344,32787,33929,6167,0,0,0,0,65408,7,2,32768,0,256,448,63488,8319,32,0,65504,32785,0,49152,2047,512,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,63488,24580,57634,1541,5088,35200,6020,24,176,1024,0,49152,2047,512,0,0,0,0,0,2,1024,1792,0,0,0,0,8,0,0,0,10,64,0,0,0,0,0,128,0,0,49152,2047,512,0,32,0,0,0,0,0,64,0,0,0,0,0,0,0,0,10,64,0,0,0,0,0,0,2048,0,32768,2047,516,0,65024,31,8,0,0,0,0,2048,0,16,28,318,18584,33144,1,8190,2048,32,10240,0,1,32768,79,4646,31838,0,0,8192,0,32,0,0,0,32760,8192,0,20352,9728,24082,124,8,0,0,0,0,132,0,0,0,16384,32768,79,4646,24670,32768,2047,640,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","E","reglist","reg","reglistT","regT","T","num","float","var","bool","'('","')'","'+'","'-'","'*'","'/'","'%'","'=='","'>'","'<'","'>='","'<='","'&&'","'||'","not","if","then","else","let","'='","in","end","lam","'->'","':'","'{'","'}'","','","'['","']'","fst","snd","inr","inl","'_'","case","of","'=>'","'|'","Int","Float","Bool","pot","sqrt","%eof"]
        bit_start = st Prelude.* 58
        bit_end = (st Prelude.+ 1) Prelude.* 58
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..57]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (10) = happyShift action_2
action_0 (11) = happyShift action_4
action_0 (12) = happyShift action_5
action_0 (13) = happyShift action_6
action_0 (14) = happyShift action_7
action_0 (17) = happyShift action_8
action_0 (28) = happyShift action_9
action_0 (29) = happyShift action_10
action_0 (32) = happyShift action_11
action_0 (36) = happyShift action_12
action_0 (39) = happyShift action_13
action_0 (44) = happyShift action_14
action_0 (45) = happyShift action_15
action_0 (46) = happyShift action_16
action_0 (47) = happyShift action_17
action_0 (49) = happyShift action_18
action_0 (56) = happyShift action_19
action_0 (57) = happyShift action_20
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (10) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (16) = happyShift action_37
action_3 (17) = happyShift action_38
action_3 (18) = happyShift action_39
action_3 (19) = happyShift action_40
action_3 (20) = happyShift action_41
action_3 (21) = happyShift action_42
action_3 (22) = happyShift action_43
action_3 (23) = happyShift action_44
action_3 (24) = happyShift action_45
action_3 (25) = happyShift action_46
action_3 (26) = happyShift action_47
action_3 (27) = happyShift action_48
action_3 (42) = happyShift action_49
action_3 (58) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_4

action_5 _ = happyReduce_3

action_6 _ = happyReduce_2

action_7 (10) = happyShift action_2
action_7 (11) = happyShift action_4
action_7 (12) = happyShift action_5
action_7 (13) = happyShift action_6
action_7 (14) = happyShift action_7
action_7 (17) = happyShift action_8
action_7 (28) = happyShift action_9
action_7 (29) = happyShift action_10
action_7 (32) = happyShift action_11
action_7 (36) = happyShift action_12
action_7 (39) = happyShift action_13
action_7 (44) = happyShift action_14
action_7 (45) = happyShift action_15
action_7 (46) = happyShift action_16
action_7 (47) = happyShift action_17
action_7 (49) = happyShift action_18
action_7 (56) = happyShift action_19
action_7 (57) = happyShift action_20
action_7 (4) = happyGoto action_36
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (10) = happyShift action_2
action_8 (11) = happyShift action_4
action_8 (12) = happyShift action_5
action_8 (13) = happyShift action_6
action_8 (14) = happyShift action_7
action_8 (17) = happyShift action_8
action_8 (28) = happyShift action_9
action_8 (29) = happyShift action_10
action_8 (32) = happyShift action_11
action_8 (36) = happyShift action_12
action_8 (39) = happyShift action_13
action_8 (44) = happyShift action_14
action_8 (45) = happyShift action_15
action_8 (46) = happyShift action_16
action_8 (47) = happyShift action_17
action_8 (49) = happyShift action_18
action_8 (56) = happyShift action_19
action_8 (57) = happyShift action_20
action_8 (4) = happyGoto action_35
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (10) = happyShift action_2
action_9 (11) = happyShift action_4
action_9 (12) = happyShift action_5
action_9 (13) = happyShift action_6
action_9 (14) = happyShift action_7
action_9 (17) = happyShift action_8
action_9 (28) = happyShift action_9
action_9 (29) = happyShift action_10
action_9 (32) = happyShift action_11
action_9 (36) = happyShift action_12
action_9 (39) = happyShift action_13
action_9 (44) = happyShift action_14
action_9 (45) = happyShift action_15
action_9 (46) = happyShift action_16
action_9 (47) = happyShift action_17
action_9 (49) = happyShift action_18
action_9 (56) = happyShift action_19
action_9 (57) = happyShift action_20
action_9 (4) = happyGoto action_34
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (10) = happyShift action_2
action_10 (11) = happyShift action_4
action_10 (12) = happyShift action_5
action_10 (13) = happyShift action_6
action_10 (14) = happyShift action_7
action_10 (17) = happyShift action_8
action_10 (28) = happyShift action_9
action_10 (29) = happyShift action_10
action_10 (32) = happyShift action_11
action_10 (36) = happyShift action_12
action_10 (39) = happyShift action_13
action_10 (44) = happyShift action_14
action_10 (45) = happyShift action_15
action_10 (46) = happyShift action_16
action_10 (47) = happyShift action_17
action_10 (49) = happyShift action_18
action_10 (56) = happyShift action_19
action_10 (57) = happyShift action_20
action_10 (4) = happyGoto action_33
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (12) = happyShift action_32
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (14) = happyShift action_31
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (12) = happyShift action_30
action_13 (5) = happyGoto action_28
action_13 (6) = happyGoto action_29
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (10) = happyShift action_2
action_14 (11) = happyShift action_4
action_14 (12) = happyShift action_5
action_14 (13) = happyShift action_6
action_14 (14) = happyShift action_7
action_14 (17) = happyShift action_8
action_14 (28) = happyShift action_9
action_14 (29) = happyShift action_10
action_14 (32) = happyShift action_11
action_14 (36) = happyShift action_12
action_14 (39) = happyShift action_13
action_14 (44) = happyShift action_14
action_14 (45) = happyShift action_15
action_14 (46) = happyShift action_16
action_14 (47) = happyShift action_17
action_14 (49) = happyShift action_18
action_14 (56) = happyShift action_19
action_14 (57) = happyShift action_20
action_14 (4) = happyGoto action_27
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (10) = happyShift action_2
action_15 (11) = happyShift action_4
action_15 (12) = happyShift action_5
action_15 (13) = happyShift action_6
action_15 (14) = happyShift action_7
action_15 (17) = happyShift action_8
action_15 (28) = happyShift action_9
action_15 (29) = happyShift action_10
action_15 (32) = happyShift action_11
action_15 (36) = happyShift action_12
action_15 (39) = happyShift action_13
action_15 (44) = happyShift action_14
action_15 (45) = happyShift action_15
action_15 (46) = happyShift action_16
action_15 (47) = happyShift action_17
action_15 (49) = happyShift action_18
action_15 (56) = happyShift action_19
action_15 (57) = happyShift action_20
action_15 (4) = happyGoto action_26
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (48) = happyShift action_25
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (48) = happyShift action_24
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (10) = happyShift action_2
action_18 (11) = happyShift action_4
action_18 (12) = happyShift action_5
action_18 (13) = happyShift action_6
action_18 (14) = happyShift action_7
action_18 (17) = happyShift action_8
action_18 (28) = happyShift action_9
action_18 (29) = happyShift action_10
action_18 (32) = happyShift action_11
action_18 (36) = happyShift action_12
action_18 (39) = happyShift action_13
action_18 (44) = happyShift action_14
action_18 (45) = happyShift action_15
action_18 (46) = happyShift action_16
action_18 (47) = happyShift action_17
action_18 (49) = happyShift action_18
action_18 (56) = happyShift action_19
action_18 (57) = happyShift action_20
action_18 (4) = happyGoto action_23
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (10) = happyShift action_2
action_19 (11) = happyShift action_4
action_19 (12) = happyShift action_5
action_19 (13) = happyShift action_6
action_19 (14) = happyShift action_7
action_19 (17) = happyShift action_8
action_19 (28) = happyShift action_9
action_19 (29) = happyShift action_10
action_19 (32) = happyShift action_11
action_19 (36) = happyShift action_12
action_19 (39) = happyShift action_13
action_19 (44) = happyShift action_14
action_19 (45) = happyShift action_15
action_19 (46) = happyShift action_16
action_19 (47) = happyShift action_17
action_19 (49) = happyShift action_18
action_19 (56) = happyShift action_19
action_19 (57) = happyShift action_20
action_19 (4) = happyGoto action_22
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (10) = happyShift action_2
action_20 (11) = happyShift action_4
action_20 (12) = happyShift action_5
action_20 (13) = happyShift action_6
action_20 (14) = happyShift action_7
action_20 (17) = happyShift action_8
action_20 (28) = happyShift action_9
action_20 (29) = happyShift action_10
action_20 (32) = happyShift action_11
action_20 (36) = happyShift action_12
action_20 (39) = happyShift action_13
action_20 (44) = happyShift action_14
action_20 (45) = happyShift action_15
action_20 (46) = happyShift action_16
action_20 (47) = happyShift action_17
action_20 (49) = happyShift action_18
action_20 (56) = happyShift action_19
action_20 (57) = happyShift action_20
action_20 (4) = happyGoto action_21
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (42) = happyShift action_49
action_21 _ = happyReduce_20

action_22 (42) = happyShift action_49
action_22 _ = happyReduce_19

action_23 (16) = happyShift action_37
action_23 (17) = happyShift action_38
action_23 (18) = happyShift action_39
action_23 (19) = happyShift action_40
action_23 (20) = happyShift action_41
action_23 (21) = happyShift action_42
action_23 (22) = happyShift action_43
action_23 (23) = happyShift action_44
action_23 (24) = happyShift action_45
action_23 (25) = happyShift action_46
action_23 (26) = happyShift action_47
action_23 (27) = happyShift action_48
action_23 (42) = happyShift action_49
action_23 (50) = happyShift action_80
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (14) = happyShift action_74
action_24 (39) = happyShift action_75
action_24 (53) = happyShift action_76
action_24 (54) = happyShift action_77
action_24 (55) = happyShift action_78
action_24 (9) = happyGoto action_79
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (14) = happyShift action_74
action_25 (39) = happyShift action_75
action_25 (53) = happyShift action_76
action_25 (54) = happyShift action_77
action_25 (55) = happyShift action_78
action_25 (9) = happyGoto action_73
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (42) = happyShift action_49
action_26 _ = happyReduce_28

action_27 (42) = happyShift action_49
action_27 _ = happyReduce_27

action_28 (40) = happyShift action_71
action_28 (41) = happyShift action_72
action_28 _ = happyFail (happyExpListPerState 28)

action_29 _ = happyReduce_34

action_30 (33) = happyShift action_70
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (12) = happyShift action_69
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (33) = happyShift action_68
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (16) = happyShift action_37
action_33 (17) = happyShift action_38
action_33 (18) = happyShift action_39
action_33 (19) = happyShift action_40
action_33 (20) = happyShift action_41
action_33 (21) = happyShift action_42
action_33 (22) = happyShift action_43
action_33 (23) = happyShift action_44
action_33 (24) = happyShift action_45
action_33 (25) = happyShift action_46
action_33 (26) = happyShift action_47
action_33 (27) = happyShift action_48
action_33 (30) = happyShift action_67
action_33 (42) = happyShift action_49
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (42) = happyShift action_49
action_34 _ = happyReduce_17

action_35 (42) = happyShift action_49
action_35 _ = happyReduce_18

action_36 (10) = happyShift action_2
action_36 (11) = happyShift action_4
action_36 (12) = happyShift action_5
action_36 (13) = happyShift action_6
action_36 (14) = happyShift action_7
action_36 (15) = happyShift action_64
action_36 (16) = happyShift action_37
action_36 (17) = happyShift action_65
action_36 (18) = happyShift action_39
action_36 (19) = happyShift action_40
action_36 (20) = happyShift action_41
action_36 (21) = happyShift action_42
action_36 (22) = happyShift action_43
action_36 (23) = happyShift action_44
action_36 (24) = happyShift action_45
action_36 (25) = happyShift action_46
action_36 (26) = happyShift action_47
action_36 (27) = happyShift action_48
action_36 (28) = happyShift action_9
action_36 (29) = happyShift action_10
action_36 (32) = happyShift action_11
action_36 (36) = happyShift action_12
action_36 (39) = happyShift action_13
action_36 (41) = happyShift action_66
action_36 (42) = happyShift action_49
action_36 (44) = happyShift action_14
action_36 (45) = happyShift action_15
action_36 (46) = happyShift action_16
action_36 (47) = happyShift action_17
action_36 (49) = happyShift action_18
action_36 (56) = happyShift action_19
action_36 (57) = happyShift action_20
action_36 (4) = happyGoto action_63
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (10) = happyShift action_2
action_37 (11) = happyShift action_4
action_37 (12) = happyShift action_5
action_37 (13) = happyShift action_6
action_37 (14) = happyShift action_7
action_37 (17) = happyShift action_8
action_37 (28) = happyShift action_9
action_37 (29) = happyShift action_10
action_37 (32) = happyShift action_11
action_37 (36) = happyShift action_12
action_37 (39) = happyShift action_13
action_37 (44) = happyShift action_14
action_37 (45) = happyShift action_15
action_37 (46) = happyShift action_16
action_37 (47) = happyShift action_17
action_37 (49) = happyShift action_18
action_37 (56) = happyShift action_19
action_37 (57) = happyShift action_20
action_37 (4) = happyGoto action_62
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (10) = happyShift action_2
action_38 (11) = happyShift action_4
action_38 (12) = happyShift action_5
action_38 (13) = happyShift action_6
action_38 (14) = happyShift action_7
action_38 (17) = happyShift action_8
action_38 (28) = happyShift action_9
action_38 (29) = happyShift action_10
action_38 (32) = happyShift action_11
action_38 (36) = happyShift action_12
action_38 (39) = happyShift action_13
action_38 (44) = happyShift action_14
action_38 (45) = happyShift action_15
action_38 (46) = happyShift action_16
action_38 (47) = happyShift action_17
action_38 (49) = happyShift action_18
action_38 (56) = happyShift action_19
action_38 (57) = happyShift action_20
action_38 (4) = happyGoto action_61
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (10) = happyShift action_2
action_39 (11) = happyShift action_4
action_39 (12) = happyShift action_5
action_39 (13) = happyShift action_6
action_39 (14) = happyShift action_7
action_39 (17) = happyShift action_8
action_39 (28) = happyShift action_9
action_39 (29) = happyShift action_10
action_39 (32) = happyShift action_11
action_39 (36) = happyShift action_12
action_39 (39) = happyShift action_13
action_39 (44) = happyShift action_14
action_39 (45) = happyShift action_15
action_39 (46) = happyShift action_16
action_39 (47) = happyShift action_17
action_39 (49) = happyShift action_18
action_39 (56) = happyShift action_19
action_39 (57) = happyShift action_20
action_39 (4) = happyGoto action_60
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (10) = happyShift action_2
action_40 (11) = happyShift action_4
action_40 (12) = happyShift action_5
action_40 (13) = happyShift action_6
action_40 (14) = happyShift action_7
action_40 (17) = happyShift action_8
action_40 (28) = happyShift action_9
action_40 (29) = happyShift action_10
action_40 (32) = happyShift action_11
action_40 (36) = happyShift action_12
action_40 (39) = happyShift action_13
action_40 (44) = happyShift action_14
action_40 (45) = happyShift action_15
action_40 (46) = happyShift action_16
action_40 (47) = happyShift action_17
action_40 (49) = happyShift action_18
action_40 (56) = happyShift action_19
action_40 (57) = happyShift action_20
action_40 (4) = happyGoto action_59
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (10) = happyShift action_2
action_41 (11) = happyShift action_4
action_41 (12) = happyShift action_5
action_41 (13) = happyShift action_6
action_41 (14) = happyShift action_7
action_41 (17) = happyShift action_8
action_41 (28) = happyShift action_9
action_41 (29) = happyShift action_10
action_41 (32) = happyShift action_11
action_41 (36) = happyShift action_12
action_41 (39) = happyShift action_13
action_41 (44) = happyShift action_14
action_41 (45) = happyShift action_15
action_41 (46) = happyShift action_16
action_41 (47) = happyShift action_17
action_41 (49) = happyShift action_18
action_41 (56) = happyShift action_19
action_41 (57) = happyShift action_20
action_41 (4) = happyGoto action_58
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (10) = happyShift action_2
action_42 (11) = happyShift action_4
action_42 (12) = happyShift action_5
action_42 (13) = happyShift action_6
action_42 (14) = happyShift action_7
action_42 (17) = happyShift action_8
action_42 (28) = happyShift action_9
action_42 (29) = happyShift action_10
action_42 (32) = happyShift action_11
action_42 (36) = happyShift action_12
action_42 (39) = happyShift action_13
action_42 (44) = happyShift action_14
action_42 (45) = happyShift action_15
action_42 (46) = happyShift action_16
action_42 (47) = happyShift action_17
action_42 (49) = happyShift action_18
action_42 (56) = happyShift action_19
action_42 (57) = happyShift action_20
action_42 (4) = happyGoto action_57
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (10) = happyShift action_2
action_43 (11) = happyShift action_4
action_43 (12) = happyShift action_5
action_43 (13) = happyShift action_6
action_43 (14) = happyShift action_7
action_43 (17) = happyShift action_8
action_43 (28) = happyShift action_9
action_43 (29) = happyShift action_10
action_43 (32) = happyShift action_11
action_43 (36) = happyShift action_12
action_43 (39) = happyShift action_13
action_43 (44) = happyShift action_14
action_43 (45) = happyShift action_15
action_43 (46) = happyShift action_16
action_43 (47) = happyShift action_17
action_43 (49) = happyShift action_18
action_43 (56) = happyShift action_19
action_43 (57) = happyShift action_20
action_43 (4) = happyGoto action_56
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (10) = happyShift action_2
action_44 (11) = happyShift action_4
action_44 (12) = happyShift action_5
action_44 (13) = happyShift action_6
action_44 (14) = happyShift action_7
action_44 (17) = happyShift action_8
action_44 (28) = happyShift action_9
action_44 (29) = happyShift action_10
action_44 (32) = happyShift action_11
action_44 (36) = happyShift action_12
action_44 (39) = happyShift action_13
action_44 (44) = happyShift action_14
action_44 (45) = happyShift action_15
action_44 (46) = happyShift action_16
action_44 (47) = happyShift action_17
action_44 (49) = happyShift action_18
action_44 (56) = happyShift action_19
action_44 (57) = happyShift action_20
action_44 (4) = happyGoto action_55
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (10) = happyShift action_2
action_45 (11) = happyShift action_4
action_45 (12) = happyShift action_5
action_45 (13) = happyShift action_6
action_45 (14) = happyShift action_7
action_45 (17) = happyShift action_8
action_45 (28) = happyShift action_9
action_45 (29) = happyShift action_10
action_45 (32) = happyShift action_11
action_45 (36) = happyShift action_12
action_45 (39) = happyShift action_13
action_45 (44) = happyShift action_14
action_45 (45) = happyShift action_15
action_45 (46) = happyShift action_16
action_45 (47) = happyShift action_17
action_45 (49) = happyShift action_18
action_45 (56) = happyShift action_19
action_45 (57) = happyShift action_20
action_45 (4) = happyGoto action_54
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (10) = happyShift action_2
action_46 (11) = happyShift action_4
action_46 (12) = happyShift action_5
action_46 (13) = happyShift action_6
action_46 (14) = happyShift action_7
action_46 (17) = happyShift action_8
action_46 (28) = happyShift action_9
action_46 (29) = happyShift action_10
action_46 (32) = happyShift action_11
action_46 (36) = happyShift action_12
action_46 (39) = happyShift action_13
action_46 (44) = happyShift action_14
action_46 (45) = happyShift action_15
action_46 (46) = happyShift action_16
action_46 (47) = happyShift action_17
action_46 (49) = happyShift action_18
action_46 (56) = happyShift action_19
action_46 (57) = happyShift action_20
action_46 (4) = happyGoto action_53
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (10) = happyShift action_2
action_47 (11) = happyShift action_4
action_47 (12) = happyShift action_5
action_47 (13) = happyShift action_6
action_47 (14) = happyShift action_7
action_47 (17) = happyShift action_8
action_47 (28) = happyShift action_9
action_47 (29) = happyShift action_10
action_47 (32) = happyShift action_11
action_47 (36) = happyShift action_12
action_47 (39) = happyShift action_13
action_47 (44) = happyShift action_14
action_47 (45) = happyShift action_15
action_47 (46) = happyShift action_16
action_47 (47) = happyShift action_17
action_47 (49) = happyShift action_18
action_47 (56) = happyShift action_19
action_47 (57) = happyShift action_20
action_47 (4) = happyGoto action_52
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (10) = happyShift action_2
action_48 (11) = happyShift action_4
action_48 (12) = happyShift action_5
action_48 (13) = happyShift action_6
action_48 (14) = happyShift action_7
action_48 (17) = happyShift action_8
action_48 (28) = happyShift action_9
action_48 (29) = happyShift action_10
action_48 (32) = happyShift action_11
action_48 (36) = happyShift action_12
action_48 (39) = happyShift action_13
action_48 (44) = happyShift action_14
action_48 (45) = happyShift action_15
action_48 (46) = happyShift action_16
action_48 (47) = happyShift action_17
action_48 (49) = happyShift action_18
action_48 (56) = happyShift action_19
action_48 (57) = happyShift action_20
action_48 (4) = happyGoto action_51
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (12) = happyShift action_50
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (43) = happyShift action_99
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (16) = happyShift action_37
action_51 (17) = happyShift action_38
action_51 (18) = happyShift action_39
action_51 (19) = happyShift action_40
action_51 (20) = happyShift action_41
action_51 (21) = happyShift action_42
action_51 (22) = happyShift action_43
action_51 (23) = happyShift action_44
action_51 (24) = happyShift action_45
action_51 (25) = happyShift action_46
action_51 (26) = happyShift action_47
action_51 (42) = happyShift action_49
action_51 _ = happyReduce_16

action_52 (16) = happyShift action_37
action_52 (17) = happyShift action_38
action_52 (18) = happyShift action_39
action_52 (19) = happyShift action_40
action_52 (20) = happyShift action_41
action_52 (21) = happyShift action_42
action_52 (22) = happyShift action_43
action_52 (23) = happyShift action_44
action_52 (24) = happyShift action_45
action_52 (25) = happyShift action_46
action_52 (42) = happyShift action_49
action_52 _ = happyReduce_15

action_53 (16) = happyShift action_37
action_53 (17) = happyShift action_38
action_53 (18) = happyShift action_39
action_53 (19) = happyShift action_40
action_53 (20) = happyShift action_41
action_53 (21) = happyFail []
action_53 (22) = happyFail []
action_53 (23) = happyFail []
action_53 (24) = happyFail []
action_53 (25) = happyFail []
action_53 (42) = happyShift action_49
action_53 _ = happyReduce_14

action_54 (16) = happyShift action_37
action_54 (17) = happyShift action_38
action_54 (18) = happyShift action_39
action_54 (19) = happyShift action_40
action_54 (20) = happyShift action_41
action_54 (21) = happyFail []
action_54 (22) = happyFail []
action_54 (23) = happyFail []
action_54 (24) = happyFail []
action_54 (25) = happyFail []
action_54 (42) = happyShift action_49
action_54 _ = happyReduce_13

action_55 (16) = happyShift action_37
action_55 (17) = happyShift action_38
action_55 (18) = happyShift action_39
action_55 (19) = happyShift action_40
action_55 (20) = happyShift action_41
action_55 (21) = happyFail []
action_55 (22) = happyFail []
action_55 (23) = happyFail []
action_55 (24) = happyFail []
action_55 (25) = happyFail []
action_55 (42) = happyShift action_49
action_55 _ = happyReduce_12

action_56 (16) = happyShift action_37
action_56 (17) = happyShift action_38
action_56 (18) = happyShift action_39
action_56 (19) = happyShift action_40
action_56 (20) = happyShift action_41
action_56 (21) = happyFail []
action_56 (22) = happyFail []
action_56 (23) = happyFail []
action_56 (24) = happyFail []
action_56 (25) = happyFail []
action_56 (42) = happyShift action_49
action_56 _ = happyReduce_11

action_57 (16) = happyShift action_37
action_57 (17) = happyShift action_38
action_57 (18) = happyShift action_39
action_57 (19) = happyShift action_40
action_57 (20) = happyShift action_41
action_57 (21) = happyFail []
action_57 (22) = happyFail []
action_57 (23) = happyFail []
action_57 (24) = happyFail []
action_57 (25) = happyFail []
action_57 (42) = happyShift action_49
action_57 _ = happyReduce_10

action_58 (42) = happyShift action_49
action_58 _ = happyReduce_9

action_59 (42) = happyShift action_49
action_59 _ = happyReduce_8

action_60 (42) = happyShift action_49
action_60 _ = happyReduce_7

action_61 (18) = happyShift action_39
action_61 (19) = happyShift action_40
action_61 (20) = happyShift action_41
action_61 (42) = happyShift action_49
action_61 _ = happyReduce_6

action_62 (18) = happyShift action_39
action_62 (19) = happyShift action_40
action_62 (20) = happyShift action_41
action_62 (42) = happyShift action_49
action_62 _ = happyReduce_5

action_63 (15) = happyShift action_98
action_63 (16) = happyShift action_37
action_63 (17) = happyShift action_38
action_63 (18) = happyShift action_39
action_63 (19) = happyShift action_40
action_63 (20) = happyShift action_41
action_63 (21) = happyShift action_42
action_63 (22) = happyShift action_43
action_63 (23) = happyShift action_44
action_63 (24) = happyShift action_45
action_63 (25) = happyShift action_46
action_63 (26) = happyShift action_47
action_63 (27) = happyShift action_48
action_63 (42) = happyShift action_49
action_63 _ = happyFail (happyExpListPerState 63)

action_64 _ = happyReduce_21

action_65 (10) = happyShift action_2
action_65 (11) = happyShift action_4
action_65 (12) = happyShift action_5
action_65 (13) = happyShift action_6
action_65 (14) = happyShift action_7
action_65 (17) = happyShift action_8
action_65 (28) = happyShift action_9
action_65 (29) = happyShift action_10
action_65 (32) = happyShift action_11
action_65 (36) = happyShift action_12
action_65 (39) = happyShift action_13
action_65 (44) = happyShift action_14
action_65 (45) = happyShift action_15
action_65 (46) = happyShift action_16
action_65 (47) = happyShift action_17
action_65 (49) = happyShift action_18
action_65 (56) = happyShift action_19
action_65 (57) = happyShift action_20
action_65 (4) = happyGoto action_97
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (10) = happyShift action_2
action_66 (11) = happyShift action_4
action_66 (12) = happyShift action_5
action_66 (13) = happyShift action_6
action_66 (14) = happyShift action_7
action_66 (17) = happyShift action_8
action_66 (28) = happyShift action_9
action_66 (29) = happyShift action_10
action_66 (32) = happyShift action_11
action_66 (36) = happyShift action_12
action_66 (39) = happyShift action_13
action_66 (44) = happyShift action_14
action_66 (45) = happyShift action_15
action_66 (46) = happyShift action_16
action_66 (47) = happyShift action_17
action_66 (49) = happyShift action_18
action_66 (56) = happyShift action_19
action_66 (57) = happyShift action_20
action_66 (4) = happyGoto action_96
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (10) = happyShift action_2
action_67 (11) = happyShift action_4
action_67 (12) = happyShift action_5
action_67 (13) = happyShift action_6
action_67 (14) = happyShift action_7
action_67 (17) = happyShift action_8
action_67 (28) = happyShift action_9
action_67 (29) = happyShift action_10
action_67 (32) = happyShift action_11
action_67 (36) = happyShift action_12
action_67 (39) = happyShift action_13
action_67 (44) = happyShift action_14
action_67 (45) = happyShift action_15
action_67 (46) = happyShift action_16
action_67 (47) = happyShift action_17
action_67 (49) = happyShift action_18
action_67 (56) = happyShift action_19
action_67 (57) = happyShift action_20
action_67 (4) = happyGoto action_95
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (10) = happyShift action_2
action_68 (11) = happyShift action_4
action_68 (12) = happyShift action_5
action_68 (13) = happyShift action_6
action_68 (14) = happyShift action_7
action_68 (17) = happyShift action_8
action_68 (28) = happyShift action_9
action_68 (29) = happyShift action_10
action_68 (32) = happyShift action_11
action_68 (36) = happyShift action_12
action_68 (39) = happyShift action_13
action_68 (44) = happyShift action_14
action_68 (45) = happyShift action_15
action_68 (46) = happyShift action_16
action_68 (47) = happyShift action_17
action_68 (49) = happyShift action_18
action_68 (56) = happyShift action_19
action_68 (57) = happyShift action_20
action_68 (4) = happyGoto action_94
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (38) = happyShift action_93
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (10) = happyShift action_2
action_70 (11) = happyShift action_4
action_70 (12) = happyShift action_5
action_70 (13) = happyShift action_6
action_70 (14) = happyShift action_7
action_70 (17) = happyShift action_8
action_70 (28) = happyShift action_9
action_70 (29) = happyShift action_10
action_70 (32) = happyShift action_11
action_70 (36) = happyShift action_12
action_70 (39) = happyShift action_13
action_70 (44) = happyShift action_14
action_70 (45) = happyShift action_15
action_70 (46) = happyShift action_16
action_70 (47) = happyShift action_17
action_70 (49) = happyShift action_18
action_70 (56) = happyShift action_19
action_70 (57) = happyShift action_20
action_70 (4) = happyGoto action_92
action_70 _ = happyFail (happyExpListPerState 70)

action_71 _ = happyReduce_32

action_72 (12) = happyShift action_30
action_72 (6) = happyGoto action_91
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (14) = happyShift action_90
action_73 (16) = happyShift action_83
action_73 (18) = happyShift action_84
action_73 (37) = happyShift action_85
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (14) = happyShift action_74
action_74 (39) = happyShift action_75
action_74 (53) = happyShift action_76
action_74 (54) = happyShift action_77
action_74 (55) = happyShift action_78
action_74 (9) = happyGoto action_89
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (12) = happyShift action_88
action_75 (7) = happyGoto action_86
action_75 (8) = happyGoto action_87
action_75 _ = happyFail (happyExpListPerState 75)

action_76 _ = happyReduce_41

action_77 _ = happyReduce_42

action_78 _ = happyReduce_40

action_79 (14) = happyShift action_82
action_79 (16) = happyShift action_83
action_79 (18) = happyShift action_84
action_79 (37) = happyShift action_85
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (39) = happyShift action_81
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (47) = happyShift action_113
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (10) = happyShift action_2
action_82 (11) = happyShift action_4
action_82 (12) = happyShift action_5
action_82 (13) = happyShift action_6
action_82 (14) = happyShift action_7
action_82 (17) = happyShift action_8
action_82 (28) = happyShift action_9
action_82 (29) = happyShift action_10
action_82 (32) = happyShift action_11
action_82 (36) = happyShift action_12
action_82 (39) = happyShift action_13
action_82 (44) = happyShift action_14
action_82 (45) = happyShift action_15
action_82 (46) = happyShift action_16
action_82 (47) = happyShift action_17
action_82 (49) = happyShift action_18
action_82 (56) = happyShift action_19
action_82 (57) = happyShift action_20
action_82 (4) = happyGoto action_112
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (14) = happyShift action_74
action_83 (39) = happyShift action_75
action_83 (53) = happyShift action_76
action_83 (54) = happyShift action_77
action_83 (55) = happyShift action_78
action_83 (9) = happyGoto action_111
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (14) = happyShift action_74
action_84 (39) = happyShift action_75
action_84 (53) = happyShift action_76
action_84 (54) = happyShift action_77
action_84 (55) = happyShift action_78
action_84 (9) = happyGoto action_110
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (14) = happyShift action_74
action_85 (39) = happyShift action_75
action_85 (53) = happyShift action_76
action_85 (54) = happyShift action_77
action_85 (55) = happyShift action_78
action_85 (9) = happyGoto action_109
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (40) = happyShift action_107
action_86 (41) = happyShift action_108
action_86 _ = happyFail (happyExpListPerState 86)

action_87 _ = happyReduce_37

action_88 (38) = happyShift action_106
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (15) = happyShift action_105
action_89 (16) = happyShift action_83
action_89 (18) = happyShift action_84
action_89 (37) = happyShift action_85
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (10) = happyShift action_2
action_90 (11) = happyShift action_4
action_90 (12) = happyShift action_5
action_90 (13) = happyShift action_6
action_90 (14) = happyShift action_7
action_90 (17) = happyShift action_8
action_90 (28) = happyShift action_9
action_90 (29) = happyShift action_10
action_90 (32) = happyShift action_11
action_90 (36) = happyShift action_12
action_90 (39) = happyShift action_13
action_90 (44) = happyShift action_14
action_90 (45) = happyShift action_15
action_90 (46) = happyShift action_16
action_90 (47) = happyShift action_17
action_90 (49) = happyShift action_18
action_90 (56) = happyShift action_19
action_90 (57) = happyShift action_20
action_90 (4) = happyGoto action_104
action_90 _ = happyFail (happyExpListPerState 90)

action_91 _ = happyReduce_35

action_92 (16) = happyShift action_37
action_92 (17) = happyShift action_38
action_92 (18) = happyShift action_39
action_92 (19) = happyShift action_40
action_92 (20) = happyShift action_41
action_92 (21) = happyShift action_42
action_92 (22) = happyShift action_43
action_92 (23) = happyShift action_44
action_92 (24) = happyShift action_45
action_92 (25) = happyShift action_46
action_92 (26) = happyShift action_47
action_92 (27) = happyShift action_48
action_92 (42) = happyShift action_49
action_92 _ = happyReduce_36

action_93 (14) = happyShift action_74
action_93 (39) = happyShift action_75
action_93 (53) = happyShift action_76
action_93 (54) = happyShift action_77
action_93 (55) = happyShift action_78
action_93 (9) = happyGoto action_103
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (16) = happyShift action_37
action_94 (17) = happyShift action_38
action_94 (18) = happyShift action_39
action_94 (19) = happyShift action_40
action_94 (20) = happyShift action_41
action_94 (21) = happyShift action_42
action_94 (22) = happyShift action_43
action_94 (23) = happyShift action_44
action_94 (24) = happyShift action_45
action_94 (25) = happyShift action_46
action_94 (26) = happyShift action_47
action_94 (27) = happyShift action_48
action_94 (34) = happyShift action_102
action_94 (42) = happyShift action_49
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (16) = happyShift action_37
action_95 (17) = happyShift action_38
action_95 (18) = happyShift action_39
action_95 (19) = happyShift action_40
action_95 (20) = happyShift action_41
action_95 (21) = happyShift action_42
action_95 (22) = happyShift action_43
action_95 (23) = happyShift action_44
action_95 (24) = happyShift action_45
action_95 (25) = happyShift action_46
action_95 (26) = happyShift action_47
action_95 (27) = happyShift action_48
action_95 (31) = happyShift action_101
action_95 (42) = happyShift action_49
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (15) = happyShift action_100
action_96 (16) = happyShift action_37
action_96 (17) = happyShift action_38
action_96 (18) = happyShift action_39
action_96 (19) = happyShift action_40
action_96 (20) = happyShift action_41
action_96 (21) = happyShift action_42
action_96 (22) = happyShift action_43
action_96 (23) = happyShift action_44
action_96 (24) = happyShift action_45
action_96 (25) = happyShift action_46
action_96 (26) = happyShift action_47
action_96 (27) = happyShift action_48
action_96 (42) = happyShift action_49
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (15) = happyReduce_18
action_97 (16) = happyReduce_18
action_97 (17) = happyReduce_18
action_97 (18) = happyReduce_18
action_97 (19) = happyReduce_18
action_97 (20) = happyReduce_18
action_97 (21) = happyReduce_18
action_97 (22) = happyReduce_18
action_97 (23) = happyReduce_18
action_97 (24) = happyReduce_18
action_97 (25) = happyReduce_18
action_97 (26) = happyReduce_18
action_97 (27) = happyReduce_18
action_97 (42) = happyShift action_49
action_97 _ = happyReduce_6

action_98 _ = happyReduce_22

action_99 _ = happyReduce_33

action_100 _ = happyReduce_26

action_101 (10) = happyShift action_2
action_101 (11) = happyShift action_4
action_101 (12) = happyShift action_5
action_101 (13) = happyShift action_6
action_101 (14) = happyShift action_7
action_101 (17) = happyShift action_8
action_101 (28) = happyShift action_9
action_101 (29) = happyShift action_10
action_101 (32) = happyShift action_11
action_101 (36) = happyShift action_12
action_101 (39) = happyShift action_13
action_101 (44) = happyShift action_14
action_101 (45) = happyShift action_15
action_101 (46) = happyShift action_16
action_101 (47) = happyShift action_17
action_101 (49) = happyShift action_18
action_101 (56) = happyShift action_19
action_101 (57) = happyShift action_20
action_101 (4) = happyGoto action_121
action_101 _ = happyFail (happyExpListPerState 101)

action_102 (10) = happyShift action_2
action_102 (11) = happyShift action_4
action_102 (12) = happyShift action_5
action_102 (13) = happyShift action_6
action_102 (14) = happyShift action_7
action_102 (17) = happyShift action_8
action_102 (28) = happyShift action_9
action_102 (29) = happyShift action_10
action_102 (32) = happyShift action_11
action_102 (36) = happyShift action_12
action_102 (39) = happyShift action_13
action_102 (44) = happyShift action_14
action_102 (45) = happyShift action_15
action_102 (46) = happyShift action_16
action_102 (47) = happyShift action_17
action_102 (49) = happyShift action_18
action_102 (56) = happyShift action_19
action_102 (57) = happyShift action_20
action_102 (4) = happyGoto action_120
action_102 _ = happyFail (happyExpListPerState 102)

action_103 (15) = happyShift action_119
action_103 (16) = happyShift action_83
action_103 (18) = happyShift action_84
action_103 (37) = happyShift action_85
action_103 _ = happyFail (happyExpListPerState 103)

action_104 (15) = happyShift action_118
action_104 (16) = happyShift action_37
action_104 (17) = happyShift action_38
action_104 (18) = happyShift action_39
action_104 (19) = happyShift action_40
action_104 (20) = happyShift action_41
action_104 (21) = happyShift action_42
action_104 (22) = happyShift action_43
action_104 (23) = happyShift action_44
action_104 (24) = happyShift action_45
action_104 (25) = happyShift action_46
action_104 (26) = happyShift action_47
action_104 (27) = happyShift action_48
action_104 (42) = happyShift action_49
action_104 _ = happyFail (happyExpListPerState 104)

action_105 _ = happyReduce_47

action_106 (14) = happyShift action_74
action_106 (39) = happyShift action_75
action_106 (53) = happyShift action_76
action_106 (54) = happyShift action_77
action_106 (55) = happyShift action_78
action_106 (9) = happyGoto action_117
action_106 _ = happyFail (happyExpListPerState 106)

action_107 _ = happyReduce_46

action_108 (12) = happyShift action_88
action_108 (8) = happyGoto action_116
action_108 _ = happyFail (happyExpListPerState 108)

action_109 (16) = happyShift action_83
action_109 (18) = happyShift action_84
action_109 (37) = happyShift action_85
action_109 _ = happyReduce_43

action_110 _ = happyReduce_44

action_111 (18) = happyShift action_84
action_111 _ = happyReduce_45

action_112 (15) = happyShift action_115
action_112 (16) = happyShift action_37
action_112 (17) = happyShift action_38
action_112 (18) = happyShift action_39
action_112 (19) = happyShift action_40
action_112 (20) = happyShift action_41
action_112 (21) = happyShift action_42
action_112 (22) = happyShift action_43
action_112 (23) = happyShift action_44
action_112 (24) = happyShift action_45
action_112 (25) = happyShift action_46
action_112 (26) = happyShift action_47
action_112 (27) = happyShift action_48
action_112 (42) = happyShift action_49
action_112 _ = happyFail (happyExpListPerState 112)

action_113 (12) = happyShift action_114
action_113 _ = happyFail (happyExpListPerState 113)

action_114 (51) = happyShift action_124
action_114 _ = happyFail (happyExpListPerState 114)

action_115 _ = happyReduce_29

action_116 _ = happyReduce_38

action_117 (16) = happyShift action_83
action_117 (18) = happyShift action_84
action_117 (37) = happyShift action_85
action_117 _ = happyReduce_39

action_118 _ = happyReduce_30

action_119 (38) = happyShift action_123
action_119 _ = happyFail (happyExpListPerState 119)

action_120 (16) = happyShift action_37
action_120 (17) = happyShift action_38
action_120 (18) = happyShift action_39
action_120 (19) = happyShift action_40
action_120 (20) = happyShift action_41
action_120 (21) = happyShift action_42
action_120 (22) = happyShift action_43
action_120 (23) = happyShift action_44
action_120 (24) = happyShift action_45
action_120 (25) = happyShift action_46
action_120 (26) = happyShift action_47
action_120 (27) = happyShift action_48
action_120 (35) = happyShift action_122
action_120 (42) = happyShift action_49
action_120 _ = happyFail (happyExpListPerState 120)

action_121 (16) = happyShift action_37
action_121 (17) = happyShift action_38
action_121 (18) = happyShift action_39
action_121 (19) = happyShift action_40
action_121 (20) = happyShift action_41
action_121 (21) = happyShift action_42
action_121 (22) = happyShift action_43
action_121 (23) = happyShift action_44
action_121 (24) = happyShift action_45
action_121 (25) = happyShift action_46
action_121 (26) = happyShift action_47
action_121 (27) = happyShift action_48
action_121 (42) = happyShift action_49
action_121 _ = happyReduce_23

action_122 _ = happyReduce_24

action_123 (14) = happyShift action_74
action_123 (39) = happyShift action_75
action_123 (53) = happyShift action_76
action_123 (54) = happyShift action_77
action_123 (55) = happyShift action_78
action_123 (9) = happyGoto action_126
action_123 _ = happyFail (happyExpListPerState 123)

action_124 (10) = happyShift action_2
action_124 (11) = happyShift action_4
action_124 (12) = happyShift action_5
action_124 (13) = happyShift action_6
action_124 (14) = happyShift action_7
action_124 (17) = happyShift action_8
action_124 (28) = happyShift action_9
action_124 (29) = happyShift action_10
action_124 (32) = happyShift action_11
action_124 (36) = happyShift action_12
action_124 (39) = happyShift action_13
action_124 (44) = happyShift action_14
action_124 (45) = happyShift action_15
action_124 (46) = happyShift action_16
action_124 (47) = happyShift action_17
action_124 (49) = happyShift action_18
action_124 (56) = happyShift action_19
action_124 (57) = happyShift action_20
action_124 (4) = happyGoto action_125
action_124 _ = happyFail (happyExpListPerState 124)

action_125 (16) = happyShift action_37
action_125 (17) = happyShift action_38
action_125 (18) = happyShift action_39
action_125 (19) = happyShift action_40
action_125 (20) = happyShift action_41
action_125 (21) = happyShift action_42
action_125 (22) = happyShift action_43
action_125 (23) = happyShift action_44
action_125 (24) = happyShift action_45
action_125 (25) = happyShift action_46
action_125 (26) = happyShift action_47
action_125 (27) = happyShift action_48
action_125 (42) = happyShift action_49
action_125 (52) = happyShift action_128
action_125 _ = happyFail (happyExpListPerState 125)

action_126 (16) = happyShift action_83
action_126 (18) = happyShift action_84
action_126 (37) = happyShift action_127
action_126 _ = happyFail (happyExpListPerState 126)

action_127 (10) = happyShift action_2
action_127 (11) = happyShift action_4
action_127 (12) = happyShift action_5
action_127 (13) = happyShift action_6
action_127 (14) = happyShift action_131
action_127 (17) = happyShift action_8
action_127 (28) = happyShift action_9
action_127 (29) = happyShift action_10
action_127 (32) = happyShift action_11
action_127 (36) = happyShift action_12
action_127 (39) = happyShift action_132
action_127 (44) = happyShift action_14
action_127 (45) = happyShift action_15
action_127 (46) = happyShift action_16
action_127 (47) = happyShift action_17
action_127 (49) = happyShift action_18
action_127 (53) = happyShift action_76
action_127 (54) = happyShift action_77
action_127 (55) = happyShift action_78
action_127 (56) = happyShift action_19
action_127 (57) = happyShift action_20
action_127 (4) = happyGoto action_130
action_127 (9) = happyGoto action_109
action_127 _ = happyFail (happyExpListPerState 127)

action_128 (46) = happyShift action_129
action_128 _ = happyFail (happyExpListPerState 128)

action_129 (12) = happyShift action_134
action_129 _ = happyFail (happyExpListPerState 129)

action_130 (16) = happyShift action_37
action_130 (17) = happyShift action_38
action_130 (18) = happyShift action_39
action_130 (19) = happyShift action_40
action_130 (20) = happyShift action_41
action_130 (21) = happyShift action_42
action_130 (22) = happyShift action_43
action_130 (23) = happyShift action_44
action_130 (24) = happyShift action_45
action_130 (25) = happyShift action_46
action_130 (26) = happyShift action_47
action_130 (27) = happyShift action_48
action_130 (42) = happyShift action_49
action_130 _ = happyReduce_25

action_131 (10) = happyShift action_2
action_131 (11) = happyShift action_4
action_131 (12) = happyShift action_5
action_131 (13) = happyShift action_6
action_131 (14) = happyShift action_131
action_131 (17) = happyShift action_8
action_131 (28) = happyShift action_9
action_131 (29) = happyShift action_10
action_131 (32) = happyShift action_11
action_131 (36) = happyShift action_12
action_131 (39) = happyShift action_132
action_131 (44) = happyShift action_14
action_131 (45) = happyShift action_15
action_131 (46) = happyShift action_16
action_131 (47) = happyShift action_17
action_131 (49) = happyShift action_18
action_131 (53) = happyShift action_76
action_131 (54) = happyShift action_77
action_131 (55) = happyShift action_78
action_131 (56) = happyShift action_19
action_131 (57) = happyShift action_20
action_131 (4) = happyGoto action_36
action_131 (9) = happyGoto action_89
action_131 _ = happyFail (happyExpListPerState 131)

action_132 (12) = happyShift action_133
action_132 (5) = happyGoto action_28
action_132 (6) = happyGoto action_29
action_132 (7) = happyGoto action_86
action_132 (8) = happyGoto action_87
action_132 _ = happyFail (happyExpListPerState 132)

action_133 (33) = happyShift action_70
action_133 (38) = happyShift action_106
action_133 _ = happyFail (happyExpListPerState 133)

action_134 (51) = happyShift action_135
action_134 _ = happyFail (happyExpListPerState 134)

action_135 (10) = happyShift action_2
action_135 (11) = happyShift action_4
action_135 (12) = happyShift action_5
action_135 (13) = happyShift action_6
action_135 (14) = happyShift action_7
action_135 (17) = happyShift action_8
action_135 (28) = happyShift action_9
action_135 (29) = happyShift action_10
action_135 (32) = happyShift action_11
action_135 (36) = happyShift action_12
action_135 (39) = happyShift action_13
action_135 (44) = happyShift action_14
action_135 (45) = happyShift action_15
action_135 (46) = happyShift action_16
action_135 (47) = happyShift action_17
action_135 (49) = happyShift action_18
action_135 (56) = happyShift action_19
action_135 (57) = happyShift action_20
action_135 (4) = happyGoto action_136
action_135 _ = happyFail (happyExpListPerState 135)

action_136 (16) = happyShift action_37
action_136 (17) = happyShift action_38
action_136 (18) = happyShift action_39
action_136 (19) = happyShift action_40
action_136 (20) = happyShift action_41
action_136 (21) = happyShift action_42
action_136 (22) = happyShift action_43
action_136 (23) = happyShift action_44
action_136 (24) = happyShift action_45
action_136 (25) = happyShift action_46
action_136 (26) = happyShift action_47
action_136 (27) = happyShift action_48
action_136 (40) = happyShift action_137
action_136 (42) = happyShift action_49
action_136 _ = happyFail (happyExpListPerState 136)

action_137 _ = happyReduce_31

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn4
		 (Int happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyTerminal (TokenBool happy_var_1))
	 =  HappyAbsSyn4
		 (Bool happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  4 happyReduction_3
happyReduction_3 (HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn4
		 (Var happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  4 happyReduction_4
happyReduction_4 (HappyTerminal (TokenFloat happy_var_1))
	 =  HappyAbsSyn4
		 (Float happy_var_1
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_3  4 happyReduction_5
happyReduction_5 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (BinaryOp (ArithOp Plus) happy_var_1 happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  4 happyReduction_6
happyReduction_6 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (BinaryOp (ArithOp Minus) happy_var_1 happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  4 happyReduction_7
happyReduction_7 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (BinaryOp (ArithOp Times) happy_var_1 happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  4 happyReduction_8
happyReduction_8 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (BinaryOp (ArithOp Div) happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  4 happyReduction_9
happyReduction_9 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (BinaryOp (ArithOp Mod) happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  4 happyReduction_10
happyReduction_10 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (BinaryOp (CompOp Eq) happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  4 happyReduction_11
happyReduction_11 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (BinaryOp (CompOp Gt) happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  4 happyReduction_12
happyReduction_12 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (BinaryOp (CompOp Lt) happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  4 happyReduction_13
happyReduction_13 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (BinaryOp (CompOp Geq) happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  4 happyReduction_14
happyReduction_14 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (BinaryOp (CompOp Leq) happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  4 happyReduction_15
happyReduction_15 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (BinaryOp (LogicalOp And) happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  4 happyReduction_16
happyReduction_16 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (BinaryOp (LogicalOp Or) happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_2  4 happyReduction_17
happyReduction_17 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (UnaryOp Not happy_var_2
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_2  4 happyReduction_18
happyReduction_18 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (UnaryOp Negate happy_var_2
	)
happyReduction_18 _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_2  4 happyReduction_19
happyReduction_19 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (UnaryOp Pot happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_2  4 happyReduction_20
happyReduction_20 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (UnaryOp Sqrt happy_var_2
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  4 happyReduction_21
happyReduction_21 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (happy_var_2
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happyReduce 4 4 happyReduction_22
happyReduction_22 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (App happy_var_2 happy_var_3
	) `HappyStk` happyRest

happyReduce_23 = happyReduce 6 4 happyReduction_23
happyReduction_23 ((HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (If happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_24 = happyReduce 7 4 happyReduction_24
happyReduction_24 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Let happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_25 = happyReduce 10 4 happyReduction_25
happyReduction_25 ((HappyAbsSyn4  happy_var_10) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Lambda happy_var_3 happy_var_5 happy_var_8 happy_var_10
	) `HappyStk` happyRest

happyReduce_26 = happyReduce 5 4 happyReduction_26
happyReduction_26 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Pair happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_27 = happySpecReduce_2  4 happyReduction_27
happyReduction_27 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Fst happy_var_2
	)
happyReduction_27 _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_2  4 happyReduction_28
happyReduction_28 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Snd happy_var_2
	)
happyReduction_28 _ _  = notHappyAtAll 

happyReduce_29 = happyReduce 6 4 happyReduction_29
happyReduction_29 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Inl happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_30 = happyReduce 6 4 happyReduction_30
happyReduction_30 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Inr happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_31 = happyReduce 14 4 happyReduction_31
happyReduction_31 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_13) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_11)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_6)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Case happy_var_2 happy_var_6 happy_var_8 happy_var_11 happy_var_13
	) `HappyStk` happyRest

happyReduce_32 = happySpecReduce_3  4 happyReduction_32
happyReduction_32 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Record happy_var_2
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happyReduce 4 4 happyReduction_33
happyReduction_33 (_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Prj happy_var_3 happy_var_1
	) `HappyStk` happyRest

happyReduce_34 = happySpecReduce_1  5 happyReduction_34
happyReduction_34 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_1]
	)
happyReduction_34 _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  5 happyReduction_35
happyReduction_35 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_3 : happy_var_1
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  6 happyReduction_36
happyReduction_36 (HappyAbsSyn4  happy_var_3)
	_
	(HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn6
		 ((happy_var_1 , happy_var_3)
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  7 happyReduction_37
happyReduction_37 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  7 happyReduction_38
happyReduction_38 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_3 : happy_var_1
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  8 happyReduction_39
happyReduction_39 (HappyAbsSyn9  happy_var_3)
	_
	(HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn8
		 ((happy_var_1 , happy_var_3)
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  9 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn9
		 (TBool
	)

happyReduce_41 = happySpecReduce_1  9 happyReduction_41
happyReduction_41 _
	 =  HappyAbsSyn9
		 (TInt
	)

happyReduce_42 = happySpecReduce_1  9 happyReduction_42
happyReduction_42 _
	 =  HappyAbsSyn9
		 (TFloat
	)

happyReduce_43 = happySpecReduce_3  9 happyReduction_43
happyReduction_43 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (TFunc happy_var_1 happy_var_3
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_3  9 happyReduction_44
happyReduction_44 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (TProd happy_var_1 happy_var_3
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  9 happyReduction_45
happyReduction_45 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (TSum happy_var_1 happy_var_3
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_3  9 happyReduction_46
happyReduction_46 _
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (TRecord happy_var_2
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_3  9 happyReduction_47
happyReduction_47 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (happy_var_2
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 58 58 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenInt happy_dollar_dollar -> cont 10;
	TokenFloat happy_dollar_dollar -> cont 11;
	TokenVar happy_dollar_dollar -> cont 12;
	TokenBool happy_dollar_dollar -> cont 13;
	TokenOB -> cont 14;
	TokenCB -> cont 15;
	TokenPlus -> cont 16;
	TokenMinus -> cont 17;
	TokenTimes -> cont 18;
	TokenDiv -> cont 19;
	TokenMod -> cont 20;
	TokenEq -> cont 21;
	TokenGt -> cont 22;
	TokenLt -> cont 23;
	TokenGeq -> cont 24;
	TokenLeq -> cont 25;
	TokenAnd -> cont 26;
	TokenOr -> cont 27;
	TokenNot -> cont 28;
	TokenIf -> cont 29;
	TokenThen -> cont 30;
	TokenElse -> cont 31;
	TokenLet -> cont 32;
	TokenAssign -> cont 33;
	TokenIn -> cont 34;
	TokenEnd -> cont 35;
	TokenLam -> cont 36;
	TokenArrow -> cont 37;
	TokenTypeOf -> cont 38;
	TokenOK -> cont 39;
	TokenCK -> cont 40;
	TokenComma -> cont 41;
	TokenOC -> cont 42;
	TokenCC -> cont 43;
	TokenFst -> cont 44;
	TokenSnd -> cont 45;
	TokenInr -> cont 46;
	TokenInL -> cont 47;
	TokenUnderS -> cont 48;
	TokenCase -> cont 49;
	TokenOf -> cont 50;
	TokenBigArrow -> cont 51;
	TokenPipe -> cont 52;
	TokenTInt -> cont 53;
	TokenTFloat -> cont 54;
	TokenTBool -> cont 55;
	TokenPot -> cont 56;
	TokenSqrt -> cont 57;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 58 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parser tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError ts = error ("Parse error" ++ (show ts))
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
