{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_Complex (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\jmfig\\AppData\\Roaming\\cabal\\bin"
libdir     = "C:\\Users\\jmfig\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.0.1\\Complex-0.1.0.0-6usmc9kr6646qhKKAhLp7g"
datadir    = "C:\\Users\\jmfig\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.0.1\\Complex-0.1.0.0"
libexecdir = "C:\\Users\\jmfig\\AppData\\Roaming\\cabal\\Complex-0.1.0.0-6usmc9kr6646qhKKAhLp7g"
sysconfdir = "C:\\Users\\jmfig\\AppData\\Roaming\\cabal\\etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Complex_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Complex_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "Complex_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Complex_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Complex_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
