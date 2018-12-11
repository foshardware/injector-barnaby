{-# LANGUAGE GADTs      #-}
{-# LANGUAGE RankNTypes #-}

module Program where

import Injector.Barnaby

type App = InjectorT Registrar IO

data Registrar where
  Registrar ::
    ( SomeInterface someService
    ) =>
    { someService :: someService
    } -> Registrar


class SomeInterface a where
  someMethod :: a -> IO ()
