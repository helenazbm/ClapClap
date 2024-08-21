module FerramentasIO where
import System.Process(callCommand)
import Control.Concurrent (threadDelay)


limparTela :: IO()
limparTela = callCommand "clear"


delay :: IO ()
delay = threadDelay (1 * 1000000) -- 1.0 segundo
