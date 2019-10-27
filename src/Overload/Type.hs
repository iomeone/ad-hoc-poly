{-# LANGUAGE DeriveFoldable    #-}
{-# LANGUAGE DeriveFunctor     #-}
{-# LANGUAGE DeriveTraversable #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}
module Overload.Type where

import qualified AST.Source               as S

import           Control.Lens.TH
import           Data.Functor.Foldable.TH


newtype TyVar = TV Int deriving (Show, Eq, Ord)


-- normalized type (Star kind)
data Type
  = TInt
  | TChar
  | TStr
  | TVar TyVar
  | TFun Type Type
  | TTuple [Type]
  deriving (Show, Eq)

makeBaseFunctor ''Type


-- normalized type (Constraint kind)
data Constraint
  = Constraint { _name        :: S.TypeName
               , _requirement :: TypeScheme }
  deriving (Show, Eq)


data PredType
  = PredType { _constraints :: [Constraint]
             , _type_       :: Type }
  deriving (Show, Eq)


data TypeScheme
  = Forall { _vars     :: [TyVar],
             _predType :: PredType }
  deriving (Show, Eq)


makeLenses ''TypeScheme
makeLenses ''PredType
makeLenses ''Constraint
