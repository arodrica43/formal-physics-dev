{-# OPTIONS --cubical #-}

module Main where

open import Cubical.Foundations.Prelude
open import Cubical.Data.Bool

boolRefl : Path Bool true true
boolRefl i = true

exTransportId :
  (A : Set) (x : A) →
  transport (λ _ → A) (λ _ → x) ≡ x
exTransportId A x = refl
