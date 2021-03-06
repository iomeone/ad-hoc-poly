{-# LANGUAGE DeriveFoldable    #-}
{-# LANGUAGE DeriveFunctor     #-}
{-# LANGUAGE DeriveTraversable #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}
module AST.Target where

import           AST.Literal
import           AST.Name

import           Data.Functor.Foldable.TH


type PlaceholderId = Int

data Expr
  = Lit Literal
  | Var Name
  | App Expr Expr
  | Lam Name Expr
  | Nth Int Int Expr
  | Tuple [Expr]
  | Let Name Expr Expr
  | Placeholder PlaceholderId
  deriving (Show, Eq)

makeBaseFunctor ''Expr
