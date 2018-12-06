{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleInstances #-}

module Injector.Barnaby where

import Control.Monad.Reader


type InjectorT r m = ReaderT r m


runInjectorT :: r -> InjectorT r m a -> m a
runInjectorT = flip runReaderT

transient :: Monad m => (r -> a) -> InjectorT r m a
transient f = f <$> registry

registry :: Monad m => InjectorT r m r
registry = ask

