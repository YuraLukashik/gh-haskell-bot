{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module PRLabels (addWIP) where

import Web.Scotty
import Network.Wai
import Data.Monoid (mconcat)
import Control.Monad.IO.Class
import Data.Aeson
import GHC.Generics
import qualified GitHub.Data.PullRequests as Github
import GitHub.Auth
import GitHub.Data
import GitHub.Data.Id
import GitHub.Data.Name
import GitHub
import Logs

addWIP ::  (MonadIO m) => Int -> m()
addWIP prNumber = do
    let auth = GitHub.OAuth "*"
    liftIO $ executeRequest auth $ addLabelsToIssueR "yuralukashik" "test" (Id prNumber) ["WIP"]
