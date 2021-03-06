{-# LANGUAGE DataKinds #-}
module Overload.GlobalInfer where

import qualified AST.Intermediate          as S
import qualified AST.Target                as T
import           Overload.Env
import           Overload.Type
import           Reporting.Error

import           Control.Eff
import           Control.Eff.Exception
import           Control.Eff.Fresh
import           Control.Eff.Reader.Strict
import           Control.Eff.State.Strict


processWaitList :: Type -> T.Expr -> WaitList -> Eff '[Fresh, Reader Env, State Constraints, Exc Error] (PredType, T.Expr)
globalInfer :: S.Expr -> Eff '[Fresh, Reader Env, State Constraints, Exc Error] (PredType, T.Expr)
