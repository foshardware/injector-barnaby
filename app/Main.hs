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
  { someService = SomeInterface
  }


data Registrar where
  Registrar ::
    ( ISomeInterface someInterface
    ) =>
    { someService :: someInterface
    } -> Registrar


class ISomeInterface a where
  someMethod :: a -> IO ()

data SomeInterface = SomeInterface

instance ISomeInterface SomeInterface where
  someMethod SomeInterface = putStrLn "test"

