{-# LANGUAGE GADTs #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE RecordWildCards #-}

module Program where


type App = InjectorT Registrar IO


registrar = Registrar
  { someService = SomeService
  }


data Registrar where
  Registrar ::
    ( SomeInterface someService
    ) =>
    { someService :: someService
    } -> Registrar


class SomeInterface a where
  someMethod :: a -> IO ()

data SomeService = SomeService

instance SomeInterface SomeService where
  someMethod SomeService = putStrLn "some service"

