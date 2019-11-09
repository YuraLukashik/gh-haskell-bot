module Logs(logIt) where
import Control.Monad.IO.Class
import PRLabels

logIt x = liftIO $ putStrLn $ show x
