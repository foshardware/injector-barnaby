
module Injector.Barnaby where

import Control.Monad.Reader

type InjectorT = ReaderT

runInjectorT :: InjectorT r m a -> r -> m a
runInjectorT = runReaderT

registry :: Monad m => InjectorT r m r
registry = ask
