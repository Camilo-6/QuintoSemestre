{-# OPTIONS_GHC -w #-}
module MiniHs.Parser where
--definir parser en happy

import Data.Char
import MiniHs.Expr
import MiniHs.Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,274) ([6624,38400,8,1,0,0,0,0,63872,127,0,0,0,0,0,0,0,0,30720,32774,549,6624,38400,32776,103,8792,40448,24577,137,1656,9600,16386,0,0,256,0,0,32,0,0,0,64,58880,8703,32768,65535,8831,0,0,0,0,0,0,0,0,26496,22528,34,414,35168,30720,32774,549,6624,38400,32776,103,8792,40448,24577,137,1656,9600,57346,25,2198,26496,22528,34,414,35168,30720,32774,549,6624,38400,32776,103,8792,40448,24577,137,0,31,0,31744,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8134,0,6144,127,0,64608,1,0,2032,0,49152,31,32768,32760,0,57856,511,0,65432,39,0,0,0,1656,9600,57346,25,2198,0,4096,1664,0,0,1,0,26625,0,1024,416,0,0,0,0,0,63872,32895,0,65510,65,0,0,0,414,35168,30720,32774,549,0,0,80,0,16416,40448,24577,6793,63872,127,0,0,0,26496,22528,1698,0,0,0,0,26625,0,0,0,65432,4103,0,8190,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","E","T","num","var","bool","'[]'","'::'","'++'","'head'","'tail'","'+'","'-'","'*'","'/'","'%'","'=='","'<='","'>='","'<'","'>'","'&&'","'||'","'not'","'('","')'","'if'","'then'","'else'","'let'","'='","'in'","'end'","'lam'","'->'","'['","']'","'Nat'","'Bool'","%eof"]
        bit_start = st Prelude.* 42
        bit_end = (st Prelude.+ 1) Prelude.* 42
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..41]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (6) = happyShift action_4
action_0 (7) = happyShift action_2
action_0 (8) = happyShift action_5
action_0 (9) = happyShift action_6
action_0 (12) = happyShift action_7
action_0 (13) = happyShift action_8
action_0 (26) = happyShift action_9
action_0 (27) = happyShift action_10
action_0 (29) = happyShift action_11
action_0 (32) = happyShift action_12
action_0 (36) = happyShift action_13
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (7) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (10) = happyShift action_21
action_3 (11) = happyShift action_22
action_3 (14) = happyShift action_23
action_3 (15) = happyShift action_24
action_3 (16) = happyShift action_25
action_3 (17) = happyShift action_26
action_3 (18) = happyShift action_27
action_3 (19) = happyShift action_28
action_3 (20) = happyShift action_29
action_3 (21) = happyShift action_30
action_3 (22) = happyShift action_31
action_3 (23) = happyShift action_32
action_3 (24) = happyShift action_33
action_3 (25) = happyShift action_34
action_3 (42) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_2

action_5 _ = happyReduce_3

action_6 _ = happyReduce_4

action_7 (6) = happyShift action_4
action_7 (7) = happyShift action_2
action_7 (8) = happyShift action_5
action_7 (9) = happyShift action_6
action_7 (12) = happyShift action_7
action_7 (13) = happyShift action_8
action_7 (26) = happyShift action_9
action_7 (27) = happyShift action_10
action_7 (29) = happyShift action_11
action_7 (32) = happyShift action_12
action_7 (36) = happyShift action_13
action_7 (4) = happyGoto action_20
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (6) = happyShift action_4
action_8 (7) = happyShift action_2
action_8 (8) = happyShift action_5
action_8 (9) = happyShift action_6
action_8 (12) = happyShift action_7
action_8 (13) = happyShift action_8
action_8 (26) = happyShift action_9
action_8 (27) = happyShift action_10
action_8 (29) = happyShift action_11
action_8 (32) = happyShift action_12
action_8 (36) = happyShift action_13
action_8 (4) = happyGoto action_19
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (6) = happyShift action_4
action_9 (7) = happyShift action_2
action_9 (8) = happyShift action_5
action_9 (9) = happyShift action_6
action_9 (12) = happyShift action_7
action_9 (13) = happyShift action_8
action_9 (26) = happyShift action_9
action_9 (27) = happyShift action_10
action_9 (29) = happyShift action_11
action_9 (32) = happyShift action_12
action_9 (36) = happyShift action_13
action_9 (4) = happyGoto action_18
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (6) = happyShift action_4
action_10 (7) = happyShift action_2
action_10 (8) = happyShift action_5
action_10 (9) = happyShift action_6
action_10 (12) = happyShift action_7
action_10 (13) = happyShift action_8
action_10 (26) = happyShift action_9
action_10 (27) = happyShift action_10
action_10 (29) = happyShift action_11
action_10 (32) = happyShift action_12
action_10 (36) = happyShift action_13
action_10 (4) = happyGoto action_17
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (6) = happyShift action_4
action_11 (7) = happyShift action_2
action_11 (8) = happyShift action_5
action_11 (9) = happyShift action_6
action_11 (12) = happyShift action_7
action_11 (13) = happyShift action_8
action_11 (26) = happyShift action_9
action_11 (27) = happyShift action_10
action_11 (29) = happyShift action_11
action_11 (32) = happyShift action_12
action_11 (36) = happyShift action_13
action_11 (4) = happyGoto action_16
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (7) = happyShift action_15
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (7) = happyShift action_14
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (10) = happyShift action_53
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (33) = happyShift action_52
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (10) = happyShift action_21
action_16 (11) = happyShift action_22
action_16 (14) = happyShift action_23
action_16 (15) = happyShift action_24
action_16 (16) = happyShift action_25
action_16 (17) = happyShift action_26
action_16 (18) = happyShift action_27
action_16 (19) = happyShift action_28
action_16 (20) = happyShift action_29
action_16 (21) = happyShift action_30
action_16 (22) = happyShift action_31
action_16 (23) = happyShift action_32
action_16 (24) = happyShift action_33
action_16 (25) = happyShift action_34
action_16 (30) = happyShift action_51
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (6) = happyShift action_4
action_17 (7) = happyShift action_2
action_17 (8) = happyShift action_5
action_17 (9) = happyShift action_6
action_17 (10) = happyShift action_21
action_17 (11) = happyShift action_22
action_17 (12) = happyShift action_7
action_17 (13) = happyShift action_8
action_17 (14) = happyShift action_23
action_17 (15) = happyShift action_24
action_17 (16) = happyShift action_25
action_17 (17) = happyShift action_26
action_17 (18) = happyShift action_27
action_17 (19) = happyShift action_28
action_17 (20) = happyShift action_29
action_17 (21) = happyShift action_30
action_17 (22) = happyShift action_31
action_17 (23) = happyShift action_32
action_17 (24) = happyShift action_33
action_17 (25) = happyShift action_34
action_17 (26) = happyShift action_9
action_17 (27) = happyShift action_10
action_17 (28) = happyShift action_50
action_17 (29) = happyShift action_11
action_17 (32) = happyShift action_12
action_17 (36) = happyShift action_13
action_17 (4) = happyGoto action_49
action_17 _ = happyFail (happyExpListPerState 17)

action_18 _ = happyReduce_19

action_19 _ = happyReduce_21

action_20 _ = happyReduce_20

action_21 (6) = happyShift action_4
action_21 (7) = happyShift action_2
action_21 (8) = happyShift action_5
action_21 (9) = happyShift action_6
action_21 (12) = happyShift action_7
action_21 (13) = happyShift action_8
action_21 (26) = happyShift action_9
action_21 (27) = happyShift action_10
action_21 (29) = happyShift action_11
action_21 (32) = happyShift action_12
action_21 (36) = happyShift action_13
action_21 (4) = happyGoto action_48
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (6) = happyShift action_4
action_22 (7) = happyShift action_2
action_22 (8) = happyShift action_5
action_22 (9) = happyShift action_6
action_22 (12) = happyShift action_7
action_22 (13) = happyShift action_8
action_22 (26) = happyShift action_9
action_22 (27) = happyShift action_10
action_22 (29) = happyShift action_11
action_22 (32) = happyShift action_12
action_22 (36) = happyShift action_13
action_22 (4) = happyGoto action_47
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (6) = happyShift action_4
action_23 (7) = happyShift action_2
action_23 (8) = happyShift action_5
action_23 (9) = happyShift action_6
action_23 (12) = happyShift action_7
action_23 (13) = happyShift action_8
action_23 (26) = happyShift action_9
action_23 (27) = happyShift action_10
action_23 (29) = happyShift action_11
action_23 (32) = happyShift action_12
action_23 (36) = happyShift action_13
action_23 (4) = happyGoto action_46
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (6) = happyShift action_4
action_24 (7) = happyShift action_2
action_24 (8) = happyShift action_5
action_24 (9) = happyShift action_6
action_24 (12) = happyShift action_7
action_24 (13) = happyShift action_8
action_24 (26) = happyShift action_9
action_24 (27) = happyShift action_10
action_24 (29) = happyShift action_11
action_24 (32) = happyShift action_12
action_24 (36) = happyShift action_13
action_24 (4) = happyGoto action_45
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (6) = happyShift action_4
action_25 (7) = happyShift action_2
action_25 (8) = happyShift action_5
action_25 (9) = happyShift action_6
action_25 (12) = happyShift action_7
action_25 (13) = happyShift action_8
action_25 (26) = happyShift action_9
action_25 (27) = happyShift action_10
action_25 (29) = happyShift action_11
action_25 (32) = happyShift action_12
action_25 (36) = happyShift action_13
action_25 (4) = happyGoto action_44
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (6) = happyShift action_4
action_26 (7) = happyShift action_2
action_26 (8) = happyShift action_5
action_26 (9) = happyShift action_6
action_26 (12) = happyShift action_7
action_26 (13) = happyShift action_8
action_26 (26) = happyShift action_9
action_26 (27) = happyShift action_10
action_26 (29) = happyShift action_11
action_26 (32) = happyShift action_12
action_26 (36) = happyShift action_13
action_26 (4) = happyGoto action_43
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (6) = happyShift action_4
action_27 (7) = happyShift action_2
action_27 (8) = happyShift action_5
action_27 (9) = happyShift action_6
action_27 (12) = happyShift action_7
action_27 (13) = happyShift action_8
action_27 (26) = happyShift action_9
action_27 (27) = happyShift action_10
action_27 (29) = happyShift action_11
action_27 (32) = happyShift action_12
action_27 (36) = happyShift action_13
action_27 (4) = happyGoto action_42
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (6) = happyShift action_4
action_28 (7) = happyShift action_2
action_28 (8) = happyShift action_5
action_28 (9) = happyShift action_6
action_28 (12) = happyShift action_7
action_28 (13) = happyShift action_8
action_28 (26) = happyShift action_9
action_28 (27) = happyShift action_10
action_28 (29) = happyShift action_11
action_28 (32) = happyShift action_12
action_28 (36) = happyShift action_13
action_28 (4) = happyGoto action_41
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (6) = happyShift action_4
action_29 (7) = happyShift action_2
action_29 (8) = happyShift action_5
action_29 (9) = happyShift action_6
action_29 (12) = happyShift action_7
action_29 (13) = happyShift action_8
action_29 (26) = happyShift action_9
action_29 (27) = happyShift action_10
action_29 (29) = happyShift action_11
action_29 (32) = happyShift action_12
action_29 (36) = happyShift action_13
action_29 (4) = happyGoto action_40
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (6) = happyShift action_4
action_30 (7) = happyShift action_2
action_30 (8) = happyShift action_5
action_30 (9) = happyShift action_6
action_30 (12) = happyShift action_7
action_30 (13) = happyShift action_8
action_30 (26) = happyShift action_9
action_30 (27) = happyShift action_10
action_30 (29) = happyShift action_11
action_30 (32) = happyShift action_12
action_30 (36) = happyShift action_13
action_30 (4) = happyGoto action_39
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (6) = happyShift action_4
action_31 (7) = happyShift action_2
action_31 (8) = happyShift action_5
action_31 (9) = happyShift action_6
action_31 (12) = happyShift action_7
action_31 (13) = happyShift action_8
action_31 (26) = happyShift action_9
action_31 (27) = happyShift action_10
action_31 (29) = happyShift action_11
action_31 (32) = happyShift action_12
action_31 (36) = happyShift action_13
action_31 (4) = happyGoto action_38
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (6) = happyShift action_4
action_32 (7) = happyShift action_2
action_32 (8) = happyShift action_5
action_32 (9) = happyShift action_6
action_32 (12) = happyShift action_7
action_32 (13) = happyShift action_8
action_32 (26) = happyShift action_9
action_32 (27) = happyShift action_10
action_32 (29) = happyShift action_11
action_32 (32) = happyShift action_12
action_32 (36) = happyShift action_13
action_32 (4) = happyGoto action_37
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (6) = happyShift action_4
action_33 (7) = happyShift action_2
action_33 (8) = happyShift action_5
action_33 (9) = happyShift action_6
action_33 (12) = happyShift action_7
action_33 (13) = happyShift action_8
action_33 (26) = happyShift action_9
action_33 (27) = happyShift action_10
action_33 (29) = happyShift action_11
action_33 (32) = happyShift action_12
action_33 (36) = happyShift action_13
action_33 (4) = happyGoto action_36
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (6) = happyShift action_4
action_34 (7) = happyShift action_2
action_34 (8) = happyShift action_5
action_34 (9) = happyShift action_6
action_34 (12) = happyShift action_7
action_34 (13) = happyShift action_8
action_34 (26) = happyShift action_9
action_34 (27) = happyShift action_10
action_34 (29) = happyShift action_11
action_34 (32) = happyShift action_12
action_34 (36) = happyShift action_13
action_34 (4) = happyGoto action_35
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (19) = happyShift action_28
action_35 (20) = happyShift action_29
action_35 (21) = happyShift action_30
action_35 (22) = happyShift action_31
action_35 (23) = happyShift action_32
action_35 _ = happyReduce_18

action_36 (19) = happyShift action_28
action_36 (20) = happyShift action_29
action_36 (21) = happyShift action_30
action_36 (22) = happyShift action_31
action_36 (23) = happyShift action_32
action_36 _ = happyReduce_17

action_37 _ = happyReduce_15

action_38 _ = happyReduce_13

action_39 _ = happyReduce_16

action_40 _ = happyReduce_14

action_41 _ = happyReduce_12

action_42 (14) = happyShift action_23
action_42 (15) = happyShift action_24
action_42 (19) = happyShift action_28
action_42 (20) = happyShift action_29
action_42 (21) = happyShift action_30
action_42 (22) = happyShift action_31
action_42 (23) = happyShift action_32
action_42 (24) = happyShift action_33
action_42 (25) = happyShift action_34
action_42 _ = happyReduce_11

action_43 (14) = happyShift action_23
action_43 (15) = happyShift action_24
action_43 (19) = happyShift action_28
action_43 (20) = happyShift action_29
action_43 (21) = happyShift action_30
action_43 (22) = happyShift action_31
action_43 (23) = happyShift action_32
action_43 (24) = happyShift action_33
action_43 (25) = happyShift action_34
action_43 _ = happyReduce_10

action_44 (14) = happyShift action_23
action_44 (15) = happyShift action_24
action_44 (19) = happyShift action_28
action_44 (20) = happyShift action_29
action_44 (21) = happyShift action_30
action_44 (22) = happyShift action_31
action_44 (23) = happyShift action_32
action_44 (24) = happyShift action_33
action_44 (25) = happyShift action_34
action_44 _ = happyReduce_9

action_45 (19) = happyShift action_28
action_45 (20) = happyShift action_29
action_45 (21) = happyShift action_30
action_45 (22) = happyShift action_31
action_45 (23) = happyShift action_32
action_45 (24) = happyShift action_33
action_45 (25) = happyShift action_34
action_45 _ = happyReduce_8

action_46 (19) = happyShift action_28
action_46 (20) = happyShift action_29
action_46 (21) = happyShift action_30
action_46 (22) = happyShift action_31
action_46 (23) = happyShift action_32
action_46 (24) = happyShift action_33
action_46 (25) = happyShift action_34
action_46 _ = happyReduce_7

action_47 (10) = happyShift action_21
action_47 (14) = happyShift action_23
action_47 (15) = happyShift action_24
action_47 (16) = happyShift action_25
action_47 (17) = happyShift action_26
action_47 (18) = happyShift action_27
action_47 (19) = happyShift action_28
action_47 (20) = happyShift action_29
action_47 (21) = happyShift action_30
action_47 (22) = happyShift action_31
action_47 (23) = happyShift action_32
action_47 (24) = happyShift action_33
action_47 (25) = happyShift action_34
action_47 _ = happyReduce_22

action_48 (10) = happyShift action_21
action_48 (14) = happyShift action_23
action_48 (15) = happyShift action_24
action_48 (16) = happyShift action_25
action_48 (17) = happyShift action_26
action_48 (18) = happyShift action_27
action_48 (19) = happyShift action_28
action_48 (20) = happyShift action_29
action_48 (21) = happyShift action_30
action_48 (22) = happyShift action_31
action_48 (23) = happyShift action_32
action_48 (24) = happyShift action_33
action_48 (25) = happyShift action_34
action_48 _ = happyReduce_5

action_49 (10) = happyShift action_21
action_49 (11) = happyShift action_22
action_49 (14) = happyShift action_23
action_49 (15) = happyShift action_24
action_49 (16) = happyShift action_25
action_49 (17) = happyShift action_26
action_49 (18) = happyShift action_27
action_49 (19) = happyShift action_28
action_49 (20) = happyShift action_29
action_49 (21) = happyShift action_30
action_49 (22) = happyShift action_31
action_49 (23) = happyShift action_32
action_49 (24) = happyShift action_33
action_49 (25) = happyShift action_34
action_49 (28) = happyShift action_61
action_49 _ = happyFail (happyExpListPerState 49)

action_50 _ = happyReduce_6

action_51 (6) = happyShift action_4
action_51 (7) = happyShift action_2
action_51 (8) = happyShift action_5
action_51 (9) = happyShift action_6
action_51 (12) = happyShift action_7
action_51 (13) = happyShift action_8
action_51 (26) = happyShift action_9
action_51 (27) = happyShift action_10
action_51 (29) = happyShift action_11
action_51 (32) = happyShift action_12
action_51 (36) = happyShift action_13
action_51 (4) = happyGoto action_60
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (6) = happyShift action_4
action_52 (7) = happyShift action_2
action_52 (8) = happyShift action_5
action_52 (9) = happyShift action_6
action_52 (12) = happyShift action_7
action_52 (13) = happyShift action_8
action_52 (26) = happyShift action_9
action_52 (27) = happyShift action_10
action_52 (29) = happyShift action_11
action_52 (32) = happyShift action_12
action_52 (36) = happyShift action_13
action_52 (4) = happyGoto action_59
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (27) = happyShift action_55
action_53 (38) = happyShift action_56
action_53 (40) = happyShift action_57
action_53 (41) = happyShift action_58
action_53 (5) = happyGoto action_54
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (37) = happyShift action_66
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (27) = happyShift action_55
action_55 (38) = happyShift action_56
action_55 (40) = happyShift action_57
action_55 (41) = happyShift action_58
action_55 (5) = happyGoto action_65
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (27) = happyShift action_55
action_56 (38) = happyShift action_56
action_56 (40) = happyShift action_57
action_56 (41) = happyShift action_58
action_56 (5) = happyGoto action_64
action_56 _ = happyFail (happyExpListPerState 56)

action_57 _ = happyReduce_27

action_58 _ = happyReduce_28

action_59 (10) = happyShift action_21
action_59 (11) = happyShift action_22
action_59 (14) = happyShift action_23
action_59 (15) = happyShift action_24
action_59 (16) = happyShift action_25
action_59 (17) = happyShift action_26
action_59 (18) = happyShift action_27
action_59 (19) = happyShift action_28
action_59 (20) = happyShift action_29
action_59 (21) = happyShift action_30
action_59 (22) = happyShift action_31
action_59 (23) = happyShift action_32
action_59 (24) = happyShift action_33
action_59 (25) = happyShift action_34
action_59 (34) = happyShift action_63
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (10) = happyShift action_21
action_60 (11) = happyShift action_22
action_60 (14) = happyShift action_23
action_60 (15) = happyShift action_24
action_60 (16) = happyShift action_25
action_60 (17) = happyShift action_26
action_60 (18) = happyShift action_27
action_60 (19) = happyShift action_28
action_60 (20) = happyShift action_29
action_60 (21) = happyShift action_30
action_60 (22) = happyShift action_31
action_60 (23) = happyShift action_32
action_60 (24) = happyShift action_33
action_60 (25) = happyShift action_34
action_60 (31) = happyShift action_62
action_60 _ = happyFail (happyExpListPerState 60)

action_61 _ = happyReduce_23

action_62 (6) = happyShift action_4
action_62 (7) = happyShift action_2
action_62 (8) = happyShift action_5
action_62 (9) = happyShift action_6
action_62 (12) = happyShift action_7
action_62 (13) = happyShift action_8
action_62 (26) = happyShift action_9
action_62 (27) = happyShift action_10
action_62 (29) = happyShift action_11
action_62 (32) = happyShift action_12
action_62 (36) = happyShift action_13
action_62 (4) = happyGoto action_74
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (6) = happyShift action_4
action_63 (7) = happyShift action_2
action_63 (8) = happyShift action_5
action_63 (9) = happyShift action_6
action_63 (12) = happyShift action_7
action_63 (13) = happyShift action_8
action_63 (26) = happyShift action_9
action_63 (27) = happyShift action_10
action_63 (29) = happyShift action_11
action_63 (32) = happyShift action_12
action_63 (36) = happyShift action_13
action_63 (4) = happyGoto action_73
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (37) = happyShift action_71
action_64 (39) = happyShift action_72
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (28) = happyShift action_70
action_65 (37) = happyShift action_71
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (6) = happyShift action_4
action_66 (7) = happyShift action_2
action_66 (8) = happyShift action_5
action_66 (9) = happyShift action_6
action_66 (12) = happyShift action_7
action_66 (13) = happyShift action_8
action_66 (26) = happyShift action_9
action_66 (27) = happyShift action_69
action_66 (29) = happyShift action_11
action_66 (32) = happyShift action_12
action_66 (36) = happyShift action_13
action_66 (38) = happyShift action_56
action_66 (40) = happyShift action_57
action_66 (41) = happyShift action_58
action_66 (4) = happyGoto action_67
action_66 (5) = happyGoto action_68
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (10) = happyShift action_21
action_67 (11) = happyShift action_22
action_67 (14) = happyShift action_23
action_67 (15) = happyShift action_24
action_67 (16) = happyShift action_25
action_67 (17) = happyShift action_26
action_67 (18) = happyShift action_27
action_67 (19) = happyShift action_28
action_67 (20) = happyShift action_29
action_67 (21) = happyShift action_30
action_67 (22) = happyShift action_31
action_67 (23) = happyShift action_32
action_67 (24) = happyShift action_33
action_67 (25) = happyShift action_34
action_67 _ = happyReduce_26

action_68 _ = happyReduce_29

action_69 (6) = happyShift action_4
action_69 (7) = happyShift action_2
action_69 (8) = happyShift action_5
action_69 (9) = happyShift action_6
action_69 (12) = happyShift action_7
action_69 (13) = happyShift action_8
action_69 (26) = happyShift action_9
action_69 (27) = happyShift action_69
action_69 (29) = happyShift action_11
action_69 (32) = happyShift action_12
action_69 (36) = happyShift action_13
action_69 (38) = happyShift action_56
action_69 (40) = happyShift action_57
action_69 (41) = happyShift action_58
action_69 (4) = happyGoto action_17
action_69 (5) = happyGoto action_65
action_69 _ = happyFail (happyExpListPerState 69)

action_70 _ = happyReduce_31

action_71 (27) = happyShift action_55
action_71 (38) = happyShift action_56
action_71 (40) = happyShift action_57
action_71 (41) = happyShift action_58
action_71 (5) = happyGoto action_68
action_71 _ = happyFail (happyExpListPerState 71)

action_72 _ = happyReduce_30

action_73 (10) = happyShift action_21
action_73 (11) = happyShift action_22
action_73 (14) = happyShift action_23
action_73 (15) = happyShift action_24
action_73 (16) = happyShift action_25
action_73 (17) = happyShift action_26
action_73 (18) = happyShift action_27
action_73 (19) = happyShift action_28
action_73 (20) = happyShift action_29
action_73 (21) = happyShift action_30
action_73 (22) = happyShift action_31
action_73 (23) = happyShift action_32
action_73 (24) = happyShift action_33
action_73 (25) = happyShift action_34
action_73 (35) = happyShift action_75
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (14) = happyShift action_23
action_74 (15) = happyShift action_24
action_74 (16) = happyShift action_25
action_74 (17) = happyShift action_26
action_74 (18) = happyShift action_27
action_74 (19) = happyShift action_28
action_74 (20) = happyShift action_29
action_74 (21) = happyShift action_30
action_74 (22) = happyShift action_31
action_74 (23) = happyShift action_32
action_74 (24) = happyShift action_33
action_74 (25) = happyShift action_34
action_74 _ = happyReduce_24

action_75 _ = happyReduce_25

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn4
		 (Var happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyTerminal (TokenNum happy_var_1))
	 =  HappyAbsSyn4
		 (Num happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  4 happyReduction_3
happyReduction_3 (HappyTerminal (TokenBool happy_var_1))
	 =  HappyAbsSyn4
		 (BoolE happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  4 happyReduction_4
happyReduction_4 _
	 =  HappyAbsSyn4
		 (Nil
	)

happyReduce_5 = happySpecReduce_3  4 happyReduction_5
happyReduction_5 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Cons happy_var_1 happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  4 happyReduction_6
happyReduction_6 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (happy_var_2
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  4 happyReduction_7
happyReduction_7 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Plus happy_var_1 happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  4 happyReduction_8
happyReduction_8 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Minus happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  4 happyReduction_9
happyReduction_9 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Times happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  4 happyReduction_10
happyReduction_10 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Div happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  4 happyReduction_11
happyReduction_11 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Mod happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  4 happyReduction_12
happyReduction_12 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Eq happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  4 happyReduction_13
happyReduction_13 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Lt happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  4 happyReduction_14
happyReduction_14 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Le happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  4 happyReduction_15
happyReduction_15 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Gt happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  4 happyReduction_16
happyReduction_16 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Ge happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  4 happyReduction_17
happyReduction_17 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (And happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  4 happyReduction_18
happyReduction_18 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Or happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_2  4 happyReduction_19
happyReduction_19 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Not happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_2  4 happyReduction_20
happyReduction_20 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Head happy_var_2
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_2  4 happyReduction_21
happyReduction_21 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Tail happy_var_2
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  4 happyReduction_22
happyReduction_22 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Append happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happyReduce 4 4 happyReduction_23
happyReduction_23 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (App happy_var_2 happy_var_3
	) `HappyStk` happyRest

happyReduce_24 = happyReduce 6 4 happyReduction_24
happyReduction_24 ((HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (If happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_25 = happyReduce 7 4 happyReduction_25
happyReduction_25 (_ `HappyStk`
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

happyReduce_26 = happyReduce 6 4 happyReduction_26
happyReduction_26 ((HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Lam happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_27 = happySpecReduce_1  5 happyReduction_27
happyReduction_27 _
	 =  HappyAbsSyn5
		 (Nat
	)

happyReduce_28 = happySpecReduce_1  5 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn5
		 (BooleaN
	)

happyReduce_29 = happySpecReduce_3  5 happyReduction_29
happyReduction_29 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Arrow happy_var_1 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  5 happyReduction_30
happyReduction_30 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (ListOf happy_var_2
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  5 happyReduction_31
happyReduction_31 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (happy_var_2
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 42 42 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenNum happy_dollar_dollar -> cont 6;
	TokenVar happy_dollar_dollar -> cont 7;
	TokenBool happy_dollar_dollar -> cont 8;
	TokenNil -> cont 9;
	TokenDoubleColon -> cont 10;
	TokenDoublePlus -> cont 11;
	TokenHead -> cont 12;
	TokenTail -> cont 13;
	TokenPlus -> cont 14;
	TokenMinus -> cont 15;
	TokenTimes -> cont 16;
	TokenDiv -> cont 17;
	TokenMod -> cont 18;
	TokenEq -> cont 19;
	TokenLe -> cont 20;
	TokenGe -> cont 21;
	TokenLt -> cont 22;
	TokenGt -> cont 23;
	TokenAnd -> cont 24;
	TokenOr -> cont 25;
	TokenNot -> cont 26;
	TokenOPar -> cont 27;
	TokenCPar -> cont 28;
	TokenIf -> cont 29;
	TokenThen -> cont 30;
	TokenElse -> cont 31;
	TokenLet -> cont 32;
	TokenEqLet -> cont 33;
	TokenIn -> cont 34;
	TokenEnd -> cont 35;
	TokenLamb -> cont 36;
	TokenArrow -> cont 37;
	TokenOBrack -> cont 38;
	TokenCBrack -> cont 39;
	TokenTyNat -> cont 40;
	TokenTyBool -> cont 41;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 42 tk tks = happyError' (tks, explist)
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


main = getContents >>= print . parser . lexer
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
