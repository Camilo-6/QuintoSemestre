{-# OPTIONS_GHC -w #-}
module While.Parser where

import Data.Char
import While.Expr
import While.Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,138) ([128,18712,3,128,0,0,0,0,8,0,64,2048,0,49152,144,512,2316,8192,128,18712,3,0,32768,6144,841,0,16392,0,32896,61440,112,0,96,16,0,0,0,0,0,0,49152,144,512,2316,8192,24576,512,0,512,49152,0,512,32776,13457,0,0,61440,0,49152,0,512,12,8192,37056,0,3074,9,32800,6144,841,28912,16384,24576,0,4,0,32768,6144,841,12,8192,192,0,3074,0,49184,0,512,12,8192,192,0,3074,0,32800,6144,841,0,0,0,0,61440,0,0,15,0,240,0,0,0,0,0,0,0,0,224,0,0,9344,0,0,0,0,0,0,72,0,0,0,0,0,15,0,240,16384,0,0,0,0,32768,6144,841,0,72,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","C","A","B","num","var","'+'","'*'","'%'","'/'","bln","and","or","not","'>'","'<'","'=='","skip","'new'","'='","':='","';'","'while'","'do'","'end'","'if'","'then'","'else'","'try'","'catch'","'error'","'('","')'","%eof"]
        bit_start = st Prelude.* 36
        bit_end = (st Prelude.+ 1) Prelude.* 36
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..35]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (8) = happyShift action_4
action_0 (20) = happyShift action_2
action_0 (21) = happyShift action_5
action_0 (25) = happyShift action_6
action_0 (28) = happyShift action_7
action_0 (31) = happyShift action_8
action_0 (33) = happyShift action_9
action_0 (34) = happyShift action_10
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (20) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (24) = happyShift action_23
action_3 (36) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (23) = happyShift action_22
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (8) = happyShift action_21
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (7) = happyShift action_15
action_6 (8) = happyShift action_16
action_6 (13) = happyShift action_17
action_6 (16) = happyShift action_18
action_6 (34) = happyShift action_19
action_6 (5) = happyGoto action_13
action_6 (6) = happyGoto action_20
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (7) = happyShift action_15
action_7 (8) = happyShift action_16
action_7 (13) = happyShift action_17
action_7 (16) = happyShift action_18
action_7 (34) = happyShift action_19
action_7 (5) = happyGoto action_13
action_7 (6) = happyGoto action_14
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (8) = happyShift action_4
action_8 (20) = happyShift action_2
action_8 (21) = happyShift action_5
action_8 (25) = happyShift action_6
action_8 (28) = happyShift action_7
action_8 (31) = happyShift action_8
action_8 (33) = happyShift action_9
action_8 (34) = happyShift action_10
action_8 (4) = happyGoto action_12
action_8 _ = happyFail (happyExpListPerState 8)

action_9 _ = happyReduce_9

action_10 (8) = happyShift action_4
action_10 (20) = happyShift action_2
action_10 (21) = happyShift action_5
action_10 (25) = happyShift action_6
action_10 (28) = happyShift action_7
action_10 (31) = happyShift action_8
action_10 (33) = happyShift action_9
action_10 (34) = happyShift action_10
action_10 (4) = happyGoto action_11
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (24) = happyShift action_23
action_11 (35) = happyShift action_43
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (24) = happyShift action_23
action_12 (32) = happyShift action_42
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (9) = happyShift action_35
action_13 (10) = happyShift action_36
action_13 (11) = happyShift action_37
action_13 (12) = happyShift action_38
action_13 (17) = happyShift action_39
action_13 (18) = happyShift action_40
action_13 (19) = happyShift action_41
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (14) = happyShift action_28
action_14 (15) = happyShift action_29
action_14 (29) = happyShift action_34
action_14 _ = happyFail (happyExpListPerState 14)

action_15 _ = happyReduce_12

action_16 _ = happyReduce_11

action_17 _ = happyReduce_18

action_18 (7) = happyShift action_15
action_18 (8) = happyShift action_16
action_18 (13) = happyShift action_17
action_18 (16) = happyShift action_18
action_18 (34) = happyShift action_19
action_18 (5) = happyGoto action_13
action_18 (6) = happyGoto action_33
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (7) = happyShift action_15
action_19 (8) = happyShift action_16
action_19 (13) = happyShift action_17
action_19 (16) = happyShift action_18
action_19 (34) = happyShift action_19
action_19 (5) = happyGoto action_31
action_19 (6) = happyGoto action_32
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (14) = happyShift action_28
action_20 (15) = happyShift action_29
action_20 (26) = happyShift action_30
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (22) = happyShift action_27
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (7) = happyShift action_15
action_22 (8) = happyShift action_16
action_22 (34) = happyShift action_26
action_22 (5) = happyGoto action_25
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (8) = happyShift action_4
action_23 (20) = happyShift action_2
action_23 (21) = happyShift action_5
action_23 (25) = happyShift action_6
action_23 (28) = happyShift action_7
action_23 (31) = happyShift action_8
action_23 (33) = happyShift action_9
action_23 (34) = happyShift action_10
action_23 (4) = happyGoto action_24
action_23 _ = happyFail (happyExpListPerState 23)

action_24 _ = happyReduce_4

action_25 (9) = happyShift action_35
action_25 (10) = happyShift action_36
action_25 (11) = happyShift action_37
action_25 (12) = happyShift action_38
action_25 _ = happyReduce_3

action_26 (7) = happyShift action_15
action_26 (8) = happyShift action_16
action_26 (34) = happyShift action_26
action_26 (5) = happyGoto action_59
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (7) = happyShift action_15
action_27 (8) = happyShift action_16
action_27 (34) = happyShift action_26
action_27 (5) = happyGoto action_58
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (7) = happyShift action_15
action_28 (8) = happyShift action_16
action_28 (13) = happyShift action_17
action_28 (16) = happyShift action_18
action_28 (34) = happyShift action_19
action_28 (5) = happyGoto action_13
action_28 (6) = happyGoto action_57
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (7) = happyShift action_15
action_29 (8) = happyShift action_16
action_29 (13) = happyShift action_17
action_29 (16) = happyShift action_18
action_29 (34) = happyShift action_19
action_29 (5) = happyGoto action_13
action_29 (6) = happyGoto action_56
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (8) = happyShift action_4
action_30 (20) = happyShift action_2
action_30 (21) = happyShift action_5
action_30 (25) = happyShift action_6
action_30 (28) = happyShift action_7
action_30 (31) = happyShift action_8
action_30 (33) = happyShift action_9
action_30 (34) = happyShift action_10
action_30 (4) = happyGoto action_55
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (9) = happyShift action_35
action_31 (10) = happyShift action_36
action_31 (11) = happyShift action_37
action_31 (12) = happyShift action_38
action_31 (17) = happyShift action_39
action_31 (18) = happyShift action_40
action_31 (19) = happyShift action_41
action_31 (35) = happyShift action_54
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (14) = happyShift action_28
action_32 (15) = happyShift action_29
action_32 (35) = happyShift action_53
action_32 _ = happyFail (happyExpListPerState 32)

action_33 _ = happyReduce_21

action_34 (8) = happyShift action_4
action_34 (20) = happyShift action_2
action_34 (21) = happyShift action_5
action_34 (25) = happyShift action_6
action_34 (28) = happyShift action_7
action_34 (31) = happyShift action_8
action_34 (33) = happyShift action_9
action_34 (34) = happyShift action_10
action_34 (4) = happyGoto action_52
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (7) = happyShift action_15
action_35 (8) = happyShift action_16
action_35 (34) = happyShift action_26
action_35 (5) = happyGoto action_51
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (7) = happyShift action_15
action_36 (8) = happyShift action_16
action_36 (34) = happyShift action_26
action_36 (5) = happyGoto action_50
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (7) = happyShift action_15
action_37 (8) = happyShift action_16
action_37 (34) = happyShift action_26
action_37 (5) = happyGoto action_49
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (7) = happyShift action_15
action_38 (8) = happyShift action_16
action_38 (34) = happyShift action_26
action_38 (5) = happyGoto action_48
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (7) = happyShift action_15
action_39 (8) = happyShift action_16
action_39 (34) = happyShift action_26
action_39 (5) = happyGoto action_47
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (7) = happyShift action_15
action_40 (8) = happyShift action_16
action_40 (34) = happyShift action_26
action_40 (5) = happyGoto action_46
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (7) = happyShift action_15
action_41 (8) = happyShift action_16
action_41 (34) = happyShift action_26
action_41 (5) = happyGoto action_45
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (8) = happyShift action_4
action_42 (20) = happyShift action_2
action_42 (21) = happyShift action_5
action_42 (25) = happyShift action_6
action_42 (28) = happyShift action_7
action_42 (31) = happyShift action_8
action_42 (33) = happyShift action_9
action_42 (34) = happyShift action_10
action_42 (4) = happyGoto action_44
action_42 _ = happyFail (happyExpListPerState 42)

action_43 _ = happyReduce_10

action_44 _ = happyReduce_8

action_45 (9) = happyShift action_35
action_45 (10) = happyShift action_36
action_45 (11) = happyShift action_37
action_45 (12) = happyShift action_38
action_45 _ = happyReduce_24

action_46 (9) = happyShift action_35
action_46 (10) = happyShift action_36
action_46 (11) = happyShift action_37
action_46 (12) = happyShift action_38
action_46 _ = happyReduce_23

action_47 (9) = happyShift action_35
action_47 (10) = happyShift action_36
action_47 (11) = happyShift action_37
action_47 (12) = happyShift action_38
action_47 _ = happyReduce_22

action_48 _ = happyReduce_16

action_49 _ = happyReduce_15

action_50 _ = happyReduce_14

action_51 (10) = happyShift action_36
action_51 (11) = happyShift action_37
action_51 (12) = happyShift action_38
action_51 _ = happyReduce_13

action_52 (24) = happyShift action_23
action_52 (27) = happyShift action_61
action_52 (30) = happyShift action_62
action_52 _ = happyFail (happyExpListPerState 52)

action_53 _ = happyReduce_25

action_54 _ = happyReduce_17

action_55 (24) = happyShift action_23
action_55 (27) = happyShift action_60
action_55 _ = happyFail (happyExpListPerState 55)

action_56 _ = happyReduce_20

action_57 _ = happyReduce_19

action_58 (9) = happyShift action_35
action_58 (10) = happyShift action_36
action_58 (11) = happyShift action_37
action_58 (12) = happyShift action_38
action_58 _ = happyReduce_2

action_59 (9) = happyShift action_35
action_59 (10) = happyShift action_36
action_59 (11) = happyShift action_37
action_59 (12) = happyShift action_38
action_59 (35) = happyShift action_54
action_59 _ = happyFail (happyExpListPerState 59)

action_60 _ = happyReduce_5

action_61 _ = happyReduce_6

action_62 (8) = happyShift action_4
action_62 (20) = happyShift action_2
action_62 (21) = happyShift action_5
action_62 (25) = happyShift action_6
action_62 (28) = happyShift action_7
action_62 (31) = happyShift action_8
action_62 (33) = happyShift action_9
action_62 (34) = happyShift action_10
action_62 (4) = happyGoto action_63
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (24) = happyShift action_23
action_63 (27) = happyShift action_64
action_63 _ = happyFail (happyExpListPerState 63)

action_64 _ = happyReduce_7

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 _
	 =  HappyAbsSyn4
		 (Skip
	)

happyReduce_2 = happyReduce 4 4 happyReduction_2
happyReduction_2 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (New happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_3 = happySpecReduce_3  4 happyReduction_3
happyReduction_3 (HappyAbsSyn5  happy_var_3)
	_
	(HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn4
		 (Upd happy_var_1 happy_var_3
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_3  4 happyReduction_4
happyReduction_4 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Seq happy_var_1 happy_var_3
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happyReduce 5 4 happyReduction_5
happyReduction_5 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (While happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 5 4 happyReduction_6
happyReduction_6 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (If1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_7 = happyReduce 7 4 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (If2 happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 4 4 happyReduction_8
happyReduction_8 ((HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TryC happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_9 = happySpecReduce_1  4 happyReduction_9
happyReduction_9 _
	 =  HappyAbsSyn4
		 (ErrC
	)

happyReduce_10 = happySpecReduce_3  4 happyReduction_10
happyReduction_10 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (happy_var_2
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  5 happyReduction_11
happyReduction_11 (HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn5
		 (Var happy_var_1
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  5 happyReduction_12
happyReduction_12 (HappyTerminal (TokenNum happy_var_1))
	 =  HappyAbsSyn5
		 (Num happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  5 happyReduction_13
happyReduction_13 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Plus happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  5 happyReduction_14
happyReduction_14 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Times happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  5 happyReduction_15
happyReduction_15 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Mod happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  5 happyReduction_16
happyReduction_16 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Div happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  5 happyReduction_17
happyReduction_17 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (happy_var_2
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  6 happyReduction_18
happyReduction_18 (HappyTerminal (TokenBln happy_var_1))
	 =  HappyAbsSyn6
		 (Bln happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  6 happyReduction_19
happyReduction_19 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (And happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  6 happyReduction_20
happyReduction_20 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Or happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_2  6 happyReduction_21
happyReduction_21 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Not happy_var_2
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  6 happyReduction_22
happyReduction_22 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn6
		 (Gt happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  6 happyReduction_23
happyReduction_23 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn6
		 (Lt happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  6 happyReduction_24
happyReduction_24 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn6
		 (Eq happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  6 happyReduction_25
happyReduction_25 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (happy_var_2
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 36 36 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenNum happy_dollar_dollar -> cont 7;
	TokenVar happy_dollar_dollar -> cont 8;
	TokenPlus -> cont 9;
	TokenTimes -> cont 10;
	TokenMod -> cont 11;
	TokenDiv -> cont 12;
	TokenBln happy_dollar_dollar -> cont 13;
	TokenAnd -> cont 14;
	TokenOr -> cont 15;
	TokenNot -> cont 16;
	TokenGt -> cont 17;
	TokenLt -> cont 18;
	TokenEq -> cont 19;
	TokenSkip -> cont 20;
	TokenNew -> cont 21;
	TokenIg -> cont 22;
	TokenUpd -> cont 23;
	TokenSeq -> cont 24;
	TokenWhile -> cont 25;
	TokenDo -> cont 26;
	TokenEnd -> cont 27;
	TokenIf -> cont 28;
	TokenThen -> cont 29;
	TokenElse -> cont 30;
	TokenTry -> cont 31;
	TokenCatch -> cont 32;
	TokenErr -> cont 33;
	TokenOB -> cont 34;
	TokenCB -> cont 35;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 36 tk tks = happyError' (tks, explist)
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
