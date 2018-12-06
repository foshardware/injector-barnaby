{-# LANGUAGE GADTs #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE RecordWildCards #-}

module Main where


import Control.Monad
import Control.Monad.IO.Class
import Injector.Barnaby

type App = InjectorT Registrar IO

main :: IO ()
main = runInjectorT registrar program

program :: App ()
program = do
  Registrar{..} <- registry
  liftIO $ someMethod someService


registrar = Registrar
  { someService = SomeService
  }


data Registrar where
  Registrar ::
    ( ISomeInterface someService
    ) =>
    { someService :: someService
    } -> Registrar


class ISomeInterface a where
  someMethod :: a -> IO ()

data SomeService = SomeService

instance ISomeInterface SomeService where
  someMethod SomeService = putStrLn "some service"

