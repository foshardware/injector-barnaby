
module SomeService where

import Program

data SomeService = SomeService

instance SomeInterface SomeService where
  someMethod SomeService = putStrLn "some service"
