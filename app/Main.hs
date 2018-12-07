{-# LANGUAGE GADTs #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE RecordWildCards #-}

module Main where


import Control.Monad
import Control.Monad.IO.Class
import Injector.Barnaby

import Program

main :: IO ()
main = runInjectorT registrar program

program :: App ()
program = do
  Registrar{..} <- registry
  liftIO $ someMethod someService


