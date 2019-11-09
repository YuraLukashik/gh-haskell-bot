module PREvents where
import GitHub
import Control.Monad.IO.Class
import PRLabels
import Logs

prId prEvent = unIssueNumber $ pullRequestNumber $ pullRequestEventPullRequest prEvent

reactToEvent :: (MonadIO m) => PullRequestEvent -> m()
reactToEvent event = react (pullRequestEventAction event) event

react :: (MonadIO m) => PullRequestEventType -> PullRequestEvent -> m()
react PullRequestOpened event = addWIP (prId event)
react PullRequestReopened event = addWIP (prId event)
