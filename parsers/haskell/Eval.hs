module Eval (Val(..),eval) where

import Expr

data Val = FunVal Env Id Expr
         | NumVal Int

instance Show Val where
  show (FunVal _ _ _) = "<fun>"
  show (NumVal n) = show n

type Env = Id -> Val

extend :: Env -> Id -> Val -> Env
extend e x v = \y -> if x == y then v else e y

empty :: Env
empty = \_ -> error "Not found!"

evalOp :: Op -> (Int -> Int -> Int)
evalOp Add = (+)
evalOp Sub = (-)
evalOp Mul = (*)

evalIn :: Env -> Expr -> Val
evalIn env (Abs x e) = FunVal env x e
evalIn env (App e1 e2) =
  case evalIn env e1 of
    FunVal env' x e3 ->
      let v2 = evalIn env e2 in
      evalIn (extend env' x v2) e3
    _ -> error "Cannot apply value"
evalIn env (Var x) = env x
evalIn _ (Num n) = NumVal n
evalIn env (Binop op e1 e2) =
  let v1 = evalIn env e1
      v2 = evalIn env e2
      x = evalOp op in
  case (v1,v2) of
    (NumVal n1,NumVal n2) -> NumVal (n1 `x` n2)
    _ -> error "Not a number"

eval :: Expr -> Val
eval = evalIn empty
