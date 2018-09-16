{-# OPTIONS_GHC -Wno-unused-imports #-}

module Education.MakeMistakesToLearnHaskell.Exercise4Spec
  ( spec
  , main
  ) where

#include <test/imports/external.hs>

import           Education.MakeMistakesToLearnHaskell.Env
import           Education.MakeMistakesToLearnHaskell.SpecEnv
import           Education.MakeMistakesToLearnHaskell.SpecHelper

import qualified Education.MakeMistakesToLearnHaskell.Exercise as Exercise


-- `main` is here so that this module can be run from GHCi on its own.  It is
-- not needed for automatic spec discovery.
main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  baseEnv <- mkDefaultSpecEnv
  let subject = Exercise.unsafeGetById 4

  it "given the correct answer, show SUCCESS" $ do
    out <- ByteString.readFile "test/assets/4/error-messages/correct.txt"
    let e = setRunHaskellSuccessWithStdout baseEnv out
    void $ shouldSuccess =<< Exercise.verify subject e "assets/4.hs"

  itShouldFailForCaseWithMessage
    "4"
    "no-do"
    ["HINT: You seem to forget to write `do`. `do` must be put before listing `putStr`s and `getContents`."]

  itShouldFailForCaseWithMessage
    "4"
    "equal"
    ["HINT: Don't assign the result of `getContents` with `=`. Use `<-` instead."]

  itShouldFailForCaseWithMessage
    "4"
    "incornsistent-indent1"
    ["HINT: instructions in a `do` must be in a consistent width."]

  itShouldFailForCaseWithMessage
    "4"
    "incornsistent-indent2"
    ["HINT: instructions in a `do` must be in a consistent width."]

  itShouldFailForCaseWithMessage
    "4"
    "main-arrow"
    ["HINT: Don't use `<-` to define the `main` function. Use `=` instead."]

  itShouldFailForCaseWithMessage
    "4"
    "no-arrow"
    [ "HINT: Unfortunately, you have to assign the result of `getContents` with `<-` operator."
    , "HINT: You seem to forget to write `do`. `do` must be put before listing `putStr`s and `getContents`."
    ]

  itShouldFailForCaseWithMessage
    "4"
    "no-close-paren"
    ["HINT: you might have forgot to write close parenthesis"]

  itShouldFailForCaseWithMessage
    "4"
    "no-dash"
    ["HINT: So close! Don't assign the result of `getContents` with `<`, but `<-`!"]

  itShouldFailForCaseWithMessage
    "4"
    "no-main"
    ["HINT: This error indicates you haven't defined main function."]

  itShouldFailForCaseWithMessage
    "4"
    "no-open-paren1"
    ["HINT: Close! You might have forgot to write open parenthesis between `putStr` and `unlines`."]

  itShouldFailForCaseWithMessage
    "4"
    "no-open-paren2"
    ["HINT: Close! You might have forgot to write open parenthesis between `unlines` and `reverse`."]

  itShouldFailForCaseWithMessage
    "4"
    "no-open-paren3"
    ["HINT: Close! You might have forgot to write open parenthesis between `reverse` and `lines`."]

  itShouldFailForCaseWithMessage
    "4"
    "no-paren"
    ["HINT: Unfortunately, you have to surround each function calls with parentheses! E.g. (func1 (func2 input))"]

  itShouldFailForCaseWithMessage
    "4"
    "no-paren1"
    ["HINT: You might have forgot to surround `unlines` and its argument with parentheses."]

  itShouldFailForCaseWithMessage
    "4"
    "no-paren2"
    ["HINT: You might have forgot to surround `reverse` and its argument with parentheses."]

  itShouldFailForCaseWithMessage
    "4"
    "no-paren3"
    ["HINT: You might have forgot to surround `lines` and its argument with parentheses."]

  itShouldFailForCaseWithMessage
    "4"
    "thick-arrow"
    ["HINT: Close! Don't assign the result of `getContents` with `<=`, but `<-`!"]

  itShouldFailForCaseWithMessage -- TODO: better error message
    "4"
    "wrong-output"
    ["Your program's output:", "Expected output:"]