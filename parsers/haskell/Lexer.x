{
{-# OPTIONS_GHC -w #-}
module Lexer (Token(..),scanTokens) where
import Expr
}

%wrapper "basic"

$digit = 0-9
$alpha = [a-zA-Z]
$eol   = [\n]

tokens :-

  $eol                          ;
  $white+                       ;
  "#".*                         ;
  let                           { \s -> TokenLet }
  in                            { \s -> TokenIn }
  $digit+                       { \s -> TokenNum (read s) }
  "->"                          { \s -> TokenArrow }
  \=                            { \s -> TokenEq }
  \\                            { \s -> TokenLambda }
  [\+]                          { \s -> TokenAdd }
  [\-]                          { \s -> TokenSub }
  [\*]                          { \s -> TokenMul }
  \(                            { \s -> TokenLParen }
  \)                            { \s -> TokenRParen }
  having                        { \s -> TokenHaving }
  "be the"                      { \s -> TokenBeThe}
  $alpha [$alpha $digit \_ \']* { \s -> TokenSym s }
{
data Token = TokenLet
           | TokenIn
           | TokenLambda
           | TokenNum Int
           | TokenSym String
           | TokenArrow
           | TokenEq
           | TokenAdd
           | TokenSub
           | TokenMul
           | TokenLParen
           | TokenRParen
           | TokenHaving
           | TokenBeThe
           deriving (Eq,Show)
scanTokens = alexScanTokens
}
