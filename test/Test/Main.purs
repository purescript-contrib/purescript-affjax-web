module Test.Main where

import Prelude

import Affjax.ResponseFormat as ResponseFormat
import Affjax.Web as AX
import Control.Monad.Error.Class (throwError)
import Data.Either (Either(..))
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Class (class MonadEffect)
import Effect.Class.Console (log)
import Effect.Exception (error)
import Test.Spec (it)
import Test.Spec.Assertions (fail)
import Test.Spec.Mocha (runMocha)
import Unsafe.Coerce (unsafeCoerce)

logAny' :: forall a m. MonadEffect m => a -> m Unit
logAny' = log <<< unsafeCoerce

assertRight :: forall a b. Either a b -> Aff b
assertRight = case _ of
  Left y -> logAny' y *> throwError (error "Expected a Right value")
  Right y -> pure y

assertLeft :: forall a b. Either a b -> Aff a
assertLeft x = case x of
  Right y -> logAny' y *> throwError (error "Expected a Left value")
  Left y -> pure y

main :: Effect Unit
main = runMocha do
  it "Testing invalid url" do
    res <- AX.get ResponseFormat.string "/фіва шхххх"
    assertLeft res >>= case _ of
      AX.RequestFailedError -> pure unit
      other -> logAny' other *> fail "Expected a RequestFailedError"
