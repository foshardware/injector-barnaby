{-# LANGUAGE RecordWildCards #-}

module Main where

import Injector.Barnaby

import Control.Monad
import Control.Monad.IO.Class

import Program

import SomeService

main :: IO ()
main = do
  runInjectorT program $ Registrar
    { someService = SomeService
    }

program :: App ()
program = do
  Registrar{..} <- registry
  liftIO $ someMethod someService

