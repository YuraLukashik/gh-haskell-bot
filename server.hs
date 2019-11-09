{-# LANGUAGE OverloadedStrings #-}
import Web.Scotty
import Data.Aeson.Types
import GitHub
import PREvents
import Control.Monad.IO.Class

main = scotty 3333 $
    post "/" $ do
        prEvent <- jsonData :: ActionM PullRequestEvent
        reactToEvent prEvent
        Web.Scotty.json $ emptyObject
